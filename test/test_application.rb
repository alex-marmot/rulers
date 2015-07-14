require_relative "test_helper"
require 'minitest'

class TestApp < Rulers::Application
end

class RulersAppTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    TestApp.new
  end

  def test_request
    get "/"

    assert last_response.ok?
    body = last_response.body
    assert body["6"]
  end
end
