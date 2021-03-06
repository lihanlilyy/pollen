class CreateJournals < ActiveRecord::Migration[5.2]
  def change
    create_table :journals do |t|
      t.string :title
      t.boolean :private
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
