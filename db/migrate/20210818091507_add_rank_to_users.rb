class AddRankToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :sell_count, :integer, default: 0
  end
end
