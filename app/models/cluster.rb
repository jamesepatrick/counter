# frozen_string_literal: true

require 'securerandom'

# A collective for a tally
class Cluster
  attr_reader :count, :name, :status, :uuid, :created_on
  @@clusters = {}

  def initialize(name)
    @uuid = SecureRandom.uuid
    @name = name
    @count = 0
    @status = :open
    @mutex = Mutex.new
    @created_on = Time.new
    @@clusters[@uuid] = self
  end

  def increment(var = 1)
    @mutex.synchronize do
      @count += var
    end
  end

  def decrement(var = 1)
    @mutex.synchronize do
      @count -= var
    end
  end

  class << self
    def get(uuid)
      @@clusters[uuid]
    end

    def list
      @@clusters
    end
  end
end
