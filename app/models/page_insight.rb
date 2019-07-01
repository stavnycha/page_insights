class PageInsight < ApplicationRecord
  validates :url, presence: true, url: true

  validates :max_ttfb,
            :max_tti,
            :max_speed_index,
            :max_ttfp,
            presence: true,
            numericality: { greater_than: 0 }

  scope :ordered, -> { order(:created_at) }
end
