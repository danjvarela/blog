class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :body
      t.string :name

      t.timestamps
    end
  end
end
