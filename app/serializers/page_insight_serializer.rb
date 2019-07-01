class PageInsightSerializer < ActiveModel::Serializer
  attributes :url, :ttfb, :ttfp, :tti, :speed_index,
             :max_ttfb, :max_tti, :max_speed_index, 
             :max_ttfp, :passed, :created_at
end
