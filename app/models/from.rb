class クラス名
  include ActiveModel::Model
  attr_accessor :hoge,:fuga...

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :, length: { maximum: 40 }

  def save
    # 各テーブルにデータを保存する処理を書く
  end
end
