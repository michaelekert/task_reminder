class ReminderMailer < ApplicationMailer
  def task_reminder(task)
    @task = task
    mail(to: task.email, subject: "Notice: #{task.title} at #{task.meeting_at}")
  end
end
