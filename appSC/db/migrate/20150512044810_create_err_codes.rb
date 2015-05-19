class CreateErrCodes < ActiveRecord::Migration
  def change
    create_table :err_codes do |t|
      t.string :err_code
      t.string :module_name
      t.string :desc

      t.timestamps null: false
    end
    add_index(:err_codes,[:err_code,:module_name])
  end
end
