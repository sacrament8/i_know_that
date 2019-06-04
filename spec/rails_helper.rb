# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.include FactoryBot::Syntax::Methods
  config.filter_rails_from_backtrace!
  # RSpecの実行前に一度、実行
  config.before(:suite) do
    # DBを綺麗にする手段を指定、トランザクションを張ってrollbackするように指定
    DatabaseCleaner.strategy = :transaction
    # truncate table文を実行し、レコードを消す
    DatabaseCleaner.clean_with(:truncation)
  end

  # exampleが始まるごとに実行
  config.before(:each) do
    # strategyがtransactionなので、トランザクションを張る
    DatabaseCleaner.start
  end

  # exampleが終わるごとに実行
  config.after(:each) do
    # strategyがtransactionなので、rollbackする
    DatabaseCleaner.clean
  end
  
end
