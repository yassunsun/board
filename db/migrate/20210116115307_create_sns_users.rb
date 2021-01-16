class CreateSnsUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :sns_users do |t|
      t.string :provider
      t.string :uid
      t.references :user,  foreign_key: true

      t.timestamps
    end
  end
end
