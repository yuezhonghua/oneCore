class CreateDailyErrNumHours < ActiveRecord::Migration
  def change
    create_table :daily_err_num_hours do |t|
      t.string :date
      t.string :app_type
      t.string :hour
      t.decimal :err_num

      t.timestamps null: false
    end
    add_index(:daily_err_num_hours,[:date,:app_type,:hour])
  end
end