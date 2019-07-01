class PageInsight < ApplicationRecord
  validates :url, presence: true, url: true

  validates :max_ttfb,
            :max_tti,
            :max_speed_index,
            :max_ttfp,
            presence: true,
            numericality: { greater_than: 0 }

  scope :ordered, -> { order(:created_at) }
  
  after_commit :notify, on: [:update]

  delegate :process!, to: :processor

  private

  def processor
    @processor ||= PageInsights::Processor.new(self)
  end

  def notify
    UserMailer.notify_failed_test(id).deliver_later if passed == false
  end
end
