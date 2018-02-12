class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      # table의 모양 결정
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
