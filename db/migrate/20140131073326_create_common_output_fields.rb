class CreateCommonOutputFields < ActiveRecord::Migration
  def change
    create_table :common_output_fields do |t|
      t.integer :merchant_id
      t.string :contract_id
      t.string :merchant_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone_no
      t.float :funded_amount
      t.integer :fico
      t.integer :sc3score
      t.boolean :nopo_flag
      t.float :annual_sales
      t.string :sic_code
      t.string :restaurant_category
      t.string :website_address
      t.string :hours
      t.string :parking
      t.integer :review_count
      t.float :average_rating
      t.string :menu_price
      t.boolean :accept_credit_card
      t.string :dress_code
      t.boolean :reservation
      t.boolean :take_out
      t.boolean :delivery
      t.boolean :caters
      t.boolean :has_tv
      t.string :noise_level
      t.string :alcohol
      t.boolean :outdoor_sitting
      t.boolean :waiter_service
      t.boolean :good_for_groups
      t.boolean :good_for_kids
      t.float :rating_median
      t.float :rating_mean
      t.integer :days_since_last_review
      t.float :last3_over_mean
      t.float :median_review_frequency
      t.integer :range_review_dates
      t.float :rating_variance
      t.integer :rating_iqr
      t.integer :review_frequency_iqr
      t.integer :rating_mad
      t.integer :review_frequency_mad
      t.float :rating_mean_30
      t.float :rating_mean_60
      t.float :rating_mean_90
      t.float :rating_mean_120
      t.float :rating_mean_150
      t.float :rating_mean_180
      t.float :rating_mean_210
      t.float :rating_mean_210_plus

      t.timestamps
    end
  end
end
