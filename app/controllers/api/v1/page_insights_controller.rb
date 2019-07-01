module Api
  module V1
    class PageInsightsController < ApplicationController
      
      def create
        insight = PageInsight.new(page_insights_params)
        
        if insight.valid?
          insight.process!

          if insight.save
            render json: insight, root: false, status: 201
          else
            render json: { errors: insight.errors.messages }, status: 422
          end
        else
          render json: { errors: insight.errors.messages }, status: 422
        end
      end

      def index
        if params[:url]
          insights = PageInsight.where(url: params[:url])
          render json: insights
        else
          render json: { errors: { url: [t('errors.required')] } }, status: 422
        end
      end

      def last
        if params[:url]
          insight = PageInsight.where(url: params[:url]).ordered.last
          render json: insight
        else
          render json: { errors: { url: [t('errors.required')] } }, status: 422
        end
      end

      private

      def page_insights_params
        params.permit(:url, :max_ttfb, :max_tti, :max_speed_index, :max_ttfp)
      end
    end
  end
end
