class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :lng
      t.integer :category_id
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :image

      t.string :seo_title
      t.string :seo_keywords
      t.string :seo_description

      t.timestamps null: false
    end
    add_index :articles,:category_id
    add_index :articles,:lng
  end
end
