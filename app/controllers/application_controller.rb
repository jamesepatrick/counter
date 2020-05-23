# frozen_string_literal: true

class ApplicationController < ActionController::Base
  prepend_view_path Rails.root.join('frontend')

  def valid_cluster?
    return false unless session[:cluster_uuid]
    return false unless Cluster.get(session[:cluster_uuid])

    true
  end
end
