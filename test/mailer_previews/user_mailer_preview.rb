# frozen_string_literal: true
class UserMailerPreview < ActionMailer::Preview
  def notify_failed_test # :nodoc:
    UserMailer.notify_failed_test(PageInsight.last.id)
  end
end