class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.string :name
      t.string :image
      t.string :seo_title
      t.string :seo_keywords
      t.string :seo_description
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt

      t.timestamps null: false
    end
  end
end
