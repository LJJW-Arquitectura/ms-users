class AddCreationDateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :creation_date, :date
  end
end
