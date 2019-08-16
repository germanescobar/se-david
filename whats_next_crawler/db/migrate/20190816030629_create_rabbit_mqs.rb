class CreateRabbitMqs < ActiveRecord::Migration[5.2]
  def change
    create_table :rabbit_mqs do |t|
      t.string :title
      t.string :string

      t.timestamps
    end
  end
end
