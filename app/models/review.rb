class Review < ApplicationRecord
  #新しいものが上に(更新されたらまた上になる)表示されるようにする
  default_scope -> { order(updated_at: :desc) }
  belongs_to :user
end
