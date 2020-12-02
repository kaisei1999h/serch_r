class AddUrlToRakutens < ActiveRecord::Migration[5.2]
  def change
    add_column :rakutens, :url, :text
  end
end
