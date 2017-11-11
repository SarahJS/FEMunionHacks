class CreateReports < ActiveRecord::Migration[5.1]
  def change
    create_table :reports do |t|
      t.string :campus
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
