class CreateHostels < ActiveRecord::Migration[7.0]
  def change
    create_table :hostels do |t|
      t.string :name
      t.belongs_to :town, null: false, foreign_key: true
      t.belongs_to :region, null: false, foreign_key: true
      t.belongs_to :country, null: false, foreign_key: true
      t.string :contact

      t.timestamps
    end
  end
end
