#
# My first junky Ruby script. Test if the DB has no users. If so seeding will be done. 
#
require './config/environment.rb' # Assuming the script is located in the root of the rails app
ActiveRecord::Base.establish_connection # Establishes connection
ActiveRecord::Base.connection # Calls connection object
got = ActiveRecord::Base.connection.execute("SELECT count(*) FROM `users`")
rval = 0
got.each do |row|
  rval = row[0]
end
exit(rval == 0)
