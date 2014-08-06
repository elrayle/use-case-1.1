class CreateVirtualCollectionItems < ActiveRecord::Migration
  def change
    create_table :virtual_collection_items do |t|

      t.timestamps
    end
  end
end
