class AddCampusTypeToReport < ActiveRecord::Migration[5.1]
  def change
    add_column :reports, :campus_type, :string
  end
end
