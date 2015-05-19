class CreateDailyErrCodeInsInfos < ActiveRecord::Migration
  def change
    create_table :daily_err_code_ins_infos do |t|
     
      t.string :date
      t.string :app_type
      t.string :err_code
      t.string :acq_ins
      t.string :fwd_ins
      t.decimal :err_num

      t.timestamps null: false
    end
  end
end
