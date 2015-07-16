lib_path = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib_path) unless $LOAD_PATH.include?(lib_path)

require 'active_record'
require 'active_workaround'

ActiveRecord::Base.establish_connection(
  :adapter   => "sqlite3",
  :database  => "./db/test.sqlite3"
)

# in spec/support/ and its subdirectories.
Dir.glob(File.join(File.dirname(__FILE__), './models', '*.rb')).each { |f| require f}
Dir.glob(File.join(File.dirname(__FILE__), 'support', '*.rb')).each { |f| require f}
