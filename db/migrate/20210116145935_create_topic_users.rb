class CreateTopicUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_users do |t|
      t.references :user,  foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
