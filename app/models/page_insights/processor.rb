require 'rest-client'

module PageInsights
  class Processor
    attr_reader :insight
    
    METRICS = %i[ttfb tti speed_index ttfp]

    def initialize(insight)
      @insight = insight
    end

    def process!
      insight.attributes = page_insight_params
      insight.passed = passed?
      insight.save!
    end

    private

    def passed?
      METRICS.all? do |field|
        insight.send(field) && (insight.send(field) <= insight.send("max_#{field}"))
      end
    end

    def page_insight_params
      {
        ttfb: ttfb,
        tti: tti,
        speed_index: speed_index,
        ttfp: speed_index 
      }
    end

    def tti
      metrics[:interactive]
    end

    def speed_index
      metrics[:speedIndex]
    end

    def ttfp
      metrics[:firstMeaningfulPaint]
    end

    def ttfb
      audit_results['time-to-first-byte']['displayValue'].match(/\d+/)[0]
    end

    def metrics
      audit_results.dig('metrics', 'details', 'items')[0].with_indifferent_access
    end

    def audit_results
      @audit_results ||= response['lighthouseResult']['audits']
    end

    def response
      @response ||= JSON.parse(make_request.body) 
    end

    def make_request
      @response ||= RestClient.get(request_url)
    end

    def request_url
      "#{Settings.page_insights_url}?url=#{insight.url}&key=#{Settings.page_insights_api_token}"
    end
  end
end