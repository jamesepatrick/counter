class CounterController < ApplicationController
  before_action :associate!

  def show; end

  private
  def associate!
    redirect_to cluster_path unless session[:cluster]
  end
end
