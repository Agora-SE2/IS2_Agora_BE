class NotificationReminderJob < ApplicationJob
  queue_as :default

  def perform(*args)
    OpinionMailer.opinion_email(Opinion.last).deliver_later
  end
end