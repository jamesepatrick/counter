# frozen_string_literal: true

# This is the landing for a specific tally cluster
class ClusterController < ApplicationController
  before_action :only_for_unknown
  def new; end

  def create
    # TODO: This will need to modify a shared object to insert a new tally cluster.
    session[:cluster] = params[:cluster]
    redirect_to root_path
  end

  private

  def only_for_unknown
    redirect_to root_path if session[:cluster]
  end
end
