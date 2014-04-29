class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :uid
      t.string :pub0
      t.integer :page
      t.datetime :created_at
      t.datetime :updated_at
      t.string :locale
      t.datetime :request_timestamp

      t.timestamps
    end
  end
end
