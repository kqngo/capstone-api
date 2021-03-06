# frozen_string_literal: true

class AddCategoryRefColumnToItems < ActiveRecord::Migration[5.0]
  def change
    add_reference :items, :category, index: true, foreign_key: true
  end
end
