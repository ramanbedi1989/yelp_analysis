class CreateReviewDetails < ActiveRecord::Migration
  def change
    create_table :review_details do |t|
      t.string :reviewer_name
      t.string :reviewer_city
      t.float :review_rating
      t.datetime :review_date
      t.text :review_description

      t.timestamps
    end
  end
end
