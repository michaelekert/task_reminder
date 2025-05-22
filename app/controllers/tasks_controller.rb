class TasksController < ApplicationController

  def index
    @tasks = Task.all.order(meeting_at: :asc)
  end
  def new
    @task = Task.new
  end
def create
  @task = Task.new(task_params)
  if @task.save
    reminder_time = @task.meeting_at - 30.minutes
    ReminderJob.set(wait_until: reminder_time).perform_later(@task.id)
    redirect_to tasks_path, notice: "Zadanie zapisane – przypomnienie zostanie wysłane 30 minut przed spotkaniem."
  else
    render :new
  end
end

    private

  def task_params
    params.require(:task).permit(:title, :description, :meeting_at, :email)
  end

end
