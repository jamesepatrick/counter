# frozen_string_literal: true

# This is the landing for a specific tally cluster
class ClusterController < ApplicationController
  before_action :only_for_unknown
  def show
    @clusters = Cluster.list
  end

  def create
    cluster = Cluster.new(params[:cluster])
    session[:cluster_uuid] = cluster.uuid;
    redirect_to root_path
  end

  private

  def only_for_unknown
    redirect_to root_path if valid_cluster?
  end
end
