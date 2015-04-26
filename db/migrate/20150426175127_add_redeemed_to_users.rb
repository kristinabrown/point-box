class AddRedeemedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :redeemed, :integer, default: 0
  end
end
