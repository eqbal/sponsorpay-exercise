class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.string :teaser
      t.string :required_action
      t.string :link
      t.string :payout
      t.text :time_to_payout
      t.integer :offer_id
      t.datetime :created_at
      t.datetime :updated_at
      t.text :offer_types
      t.text :thumbnail

      t.timestamps
    end
  end
end
