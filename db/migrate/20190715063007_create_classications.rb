class CreateClassications < ActiveRecord::Migration[5.2]
  def change
    create_table :classications do |t|

      t.timestamps
    end
  end
end
