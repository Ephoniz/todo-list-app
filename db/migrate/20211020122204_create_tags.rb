class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :task, null: true, foreign_key: true

      t.timestamps
    end
  end
end