class EditJobs < ActiveRecord::Migration[5.0]
  def change
    change_table :jobs do |t|
      t.boolean :in_work, :default => false
    end
  end
end
