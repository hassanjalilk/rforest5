class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :new
      t.string :create

      t.timestamps
    end
  end
end
