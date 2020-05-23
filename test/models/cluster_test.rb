# frozen_string_literal: true

require 'test_helper'
require 'concurrent/set'

class ClusterTest < ActiveSupport::TestCase
  test 'Cluster has instance record of all cluster' do
    assert_equal 0, Cluster.list.size, 'starts off empty'
    Cluster.new('foo')
    Cluster.new('bar')
    assert_equal 2, Cluster.list.size, 'Increases as more are added'
  end

  test 'cluster are addressable by the UUID' do
    Cluster.new('bar')
    cluster = Cluster.new('foo')
    assert_equal cluster, Cluster.get(cluster.uuid)
  end

  test 'works' do
    cluster = Cluster.new('foo')
    cluster.increment
    assert_equal 1, cluster.count
    cluster.decrement
    assert_equal 0, cluster.count
  end

  test 'is thread safe' do
    cluster = Cluster.new('foo')
    threads = []
    (1..500).each { |_x| threads << Thread.new { cluster.increment } }
    threads.each(&:join)

    assert_equal 500, cluster.count
  end
end
