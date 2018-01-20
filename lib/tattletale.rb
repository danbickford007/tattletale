require 'net/http'
require 'uri'
require 'json'
require_relative './payload.rb'
require_relative './utils.rb'
include Utils

class Tattletale
  NOTIFY_URL = 'http://localhost:4000/api/notify?format=json'

  class << self
    def notify(exception)
      new.notify(exception)
    end
  end

  def initialize
    @uri = URI.parse(NOTIFY_URL)
    @header = {'Content-Type': 'application/json'}
  end

  def notify(exception)
    background do
      payload = Payload.new(exception).parse
      post @uri, payload
    end
  end
end
