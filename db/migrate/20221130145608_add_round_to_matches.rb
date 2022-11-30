class AddRoundToMatches < ActiveRecord::Migration[7.0]
  def change
    add_column :matches, :round, :integer
  end
end
