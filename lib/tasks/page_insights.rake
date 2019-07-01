namespace :page_insights do
  task :rerun => :environment do
    PageInsight.find_each do |insight|
      begin
        new_insight = insight.dup
        new_insight.ttfb = new_insight.tti = new_insight.speed_index = new_insight.ttfp = nil
        
        new_insight.process!
      rescue StandardError => e
        Rails.logger.error(e)
      end
    end
  end
end
