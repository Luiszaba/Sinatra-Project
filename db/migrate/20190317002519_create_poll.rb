class CreatePoll < ActiveRecord::Migration[5.2]
  def change
     create_table :poll do |t|
      t.string :opinion
      t.integer :user_id
  end
  end
end
