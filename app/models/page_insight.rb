class PageInsight < ApplicationRecord
  validates :url, presence: true

  validates :max_ttfb,
            :max_tti,
            :max_speed_index,
            :max_ttfp,
            presence: true,
            numericality: { greater_than: 0 }
end
