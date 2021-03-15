class CreateRedirects < ActiveRecord::Migration[5.2]
  def change
    create_table :redirects do |t|
      t.string :shorten_url
      t.string :original_url
      t.timestamps
    end
  end
end
