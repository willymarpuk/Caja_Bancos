class CreateFirmantes < ActiveRecord::Migration
  def change
    create_table :firmantes do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
