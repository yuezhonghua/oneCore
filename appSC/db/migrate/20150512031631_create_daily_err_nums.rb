class CreateDailyErrNums < ActiveRecord::Migration
  def change
    create_table :daily_err_nums do |t|
      t.string :date
      t.string :app_type
      t.string :host_name
      t.decimal :err_num
      t.timestamps null: false
    end
    add_index(:daily_err_nums,[:date,:app_type,:host_name])
  end
end
