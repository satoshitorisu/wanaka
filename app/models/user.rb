class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :team_users
	has_many :teams, through: :team_users
	accepts_nested_attributes_for :team_users


  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['id LIKE ?', "%#{search}%"])
    else
      User.all #全て表示。
    end
  end

end
