class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.text       :comment_text, null:false
      t.boolean    :checked
      t.references :user, foreign_key: true
      t.references :problem,  foreign_key: true

      t.timestamps
    end
  end
end
