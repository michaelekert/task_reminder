class ReminderJob < ApplicationJob
  queue_as :default

  def perform(task_id)
    task = Task.find_by(id: task_id)
    return unless task

    ReminderMailer.task_reminder(task).deliver_now
  end
end
