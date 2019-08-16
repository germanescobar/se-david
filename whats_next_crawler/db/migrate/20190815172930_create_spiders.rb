class CreateSpiders < ActiveRecord::Migration[5.2]
  def change
    create_table :spiders do |t|
      t.string :title
      t.string :string
      t.string :seed

      t.timestamps
    end
  end
end
