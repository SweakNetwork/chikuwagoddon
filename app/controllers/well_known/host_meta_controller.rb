# frozen_string_literal: true

module WellKnown
  class HostMetaController < ActionController::Base
    include RoutingHelper

    before_action { response.headers['Vary'] = 'Accept' }

    def show
      @webfinger_template = "#{webfinger_url}?resource={uri}"

      respond_to do |format|
        format.xml { render content_type: 'application/xrd+xml' }
      end

      expires_in(3.days, public: true)
    end

    def show_json
      @webfinger_template = "#{webfinger_url}?resource={uri}"

      respond_to do |format|
        format.json { render json: {}, serializer: HostMetaSerializer, content_type: 'application/jrd+json' }
      end

      expires_in(3.days, public: true)
    end
  end
end
