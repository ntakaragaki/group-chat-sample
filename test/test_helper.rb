ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper
end

# Add more helper methods to be used by all tests here...
class ActionDispatch::IntegrationTest
  # テストユーザーとしてログインする
  def log_in_as(user)
    post login_path, params: { session: { login_id: user.login_id, password: "foobar"} }
  end
end
