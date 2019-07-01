class PageInsightSerializer < ActiveModel::Serializer
  attributes :url, :ttfb, :ttfp, :tti, :speed_index, :passed
end
