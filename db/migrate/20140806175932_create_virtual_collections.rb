class CreateVirtualCollections < ActiveRecord::Migration
  def change
    create_table :virtual_collections do |t|

      t.timestamps
    end
  end
end
