class CreateTopicUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :topic_users do |t|

      t.timestamps
    end
  end
end
