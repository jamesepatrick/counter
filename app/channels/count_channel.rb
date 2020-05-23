# frozen_string_literal: true

class CountChannel < ApplicationCable::Channel
  def subscribed
    # TODO: check to make sure this is unique.
    stream_from 'chat'
  end

  def increment(_payload = 1)
    cluster = Cluster.list.values.first
    cluster.increment
    ActionCable.server.broadcast 'chat', message: render(cluster)
  end

  def decrement(_payload = 1)
    cluster = Cluster.list.values.first
    cluster.decrement
    ActionCable.server.broadcast 'chat', message: render(cluster)
  end

  private

  def render(cluster)
    ApplicationController.new.helpers.c('counter-count', cluster: cluster)
  end
end
