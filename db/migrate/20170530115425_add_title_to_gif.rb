class AddTitleToGif < ActiveRecord::Migration
  def change
    add_column :gifs, :title, :string
  end
end
