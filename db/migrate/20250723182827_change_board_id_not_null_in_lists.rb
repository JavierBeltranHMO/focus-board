class ChangeBoardIdNotNullInLists < ActiveRecord::Migration[8.0]
  def change
    change_column_null :lists, :board_id, false
  end
end
