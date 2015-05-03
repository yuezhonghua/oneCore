class CreateSwts < ActiveRecord::Migration
  def change
    create_table :swts do |t|
      t.text :daystr
      t.decimal :daynum

      t.timestamps null: false
    end
  end
end
