class UserMailer < ApplicationMailer
  default from: Settings.mailer.sender, to: Settings.mailer.recipient

  def notify_failed_test(page_insight_id)
    @insight = PageInsight.find(page_insight_id)

    mail(subject: default_i18n_subject)
  end
end