class CreateDbpetCapitus < ActiveRecord::Migration[6.1]
  def change
    create_table :dbpet_capitus do |t|
      t.string :name
      t.integer :age
      t.string :breed

      t.timestamps
    end
  end
end
