class RemoveCreationDateFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :creation_date, :string
  end
end
