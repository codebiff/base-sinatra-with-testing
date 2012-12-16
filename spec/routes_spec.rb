require "test/unit"
require "rack/test"
require "rspec"

APP = Rack::Builder.parse_file(File.dirname(__FILE__) + "/../config.ru").first

set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

describe "App Routes" do
  include Rack::Test::Methods

  def app
    APP
  end

  it "should find the root path" do
    get "/"
    last_response.should be_ok
  end

end

