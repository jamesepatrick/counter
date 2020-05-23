# frozen_string_literal: true

class CounterController < ApplicationController
  before_action :associate!

  def show
    @cluster = Cluster.get(session[:cluster_uuid])
  end

  private

  def associate!
    session[:cluster_uuid] = params[:uuid] if params[:uuid]
    redirect_to cluster_path unless valid_cluster?
  end
end
