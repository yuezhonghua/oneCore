class CreateDailyErrCodes < ActiveRecord::Migration
  def change
    create_table :daily_err_codes do |t|
      t.string :date
      t.string :app_type
      t.string :err_code
      t.decimal :err_num

      t.timestamps null: false
    end
    add_index(:daily_err_codes,[:date,:app_type,:err_code])

  end
end


source daily_err_code_ins_infos.sql  88
source daily_err_num_modules.sql
source daily_err_num_hours.sql
source err_codes.sql