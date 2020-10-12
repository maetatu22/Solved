class CreateProblems < ActiveRecord::Migration[6.0]
  def change
    create_table :problems do |t|
      t.string     :title,    null: false
      t.string     :text,     null: false
      t.integer    :genre_id, null: false
      t.references :user,     foreign_key: true
      t.timestamps
    end
  end
end
