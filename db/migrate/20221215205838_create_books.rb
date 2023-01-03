class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    enable_extension "pgcrypto"
    create_table :books, id: :uuid do |t|
      t.string :title
      t.timestamps
    end
  end
end
