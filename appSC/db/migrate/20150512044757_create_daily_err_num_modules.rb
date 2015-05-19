class CreateDailyErrNumModules < ActiveRecord::Migration
  def change
    create_table :daily_err_num_modules do |t|
      t.string :date
      t.string :app_type
      t.string :module
      t.decimal :err_num

      t.timestamps null: false
    end
    add_index(:daily_err_num_modules,[:date,:app_type,:module]) 
  end
end
