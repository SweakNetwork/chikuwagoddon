# frozen_string_literal: true

class HostMetaSerializer < ActiveModel::Serializer
  include RoutingHelper

  attributes :links

  def links
    [
      { rel: 'http://docs.oasis-open.org/ns/xri/xrd-1.0', type: 'application/xrd+xml', template: @webfinger_template },
    ]
  end
end
