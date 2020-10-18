class CreateBestUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :best_users do |t|
      t.references :user, foreign_key: true
      t.references :problem, foreign_key: true
      t.timestamps
    end
  end
end
