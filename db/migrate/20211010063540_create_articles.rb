class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|

      t.integer :user_id
      t.text :title
      t.text :body
      t.timestamps
    end
  end
end
