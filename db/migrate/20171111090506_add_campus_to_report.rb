class AddCampusToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :campus, :string
  end
end
