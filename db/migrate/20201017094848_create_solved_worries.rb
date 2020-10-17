class CreateSolvedWorries < ActiveRecord::Migration[6.0]
  def change
    create_table :solved_worries do |t|

      t.timestamps
    end
  end
end
