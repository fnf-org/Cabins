class RoleChanges < ActiveRecord::Migration[5.0]
  def change
    User.connection.execute "UPDATE users set role='volunteer' WHERE role='attendee'"
    User.connection.execute "UPDATE users set role='medical' WHERE role='planner_medical'"
  end
end
