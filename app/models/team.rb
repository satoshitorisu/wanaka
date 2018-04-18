class Team < ApplicationRecord
	has_many :team_users
	has_many :users, through: :team_users

	has_many :schedules
	attachment :image
	#mount_uploader :picture, PictureUploader
	geocoded_by :active_place
	after_validation :geocode, :if => :active_place_changed?

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Team.where(['team_key LIKE ?', "%#{search}%"])
      # Team.where(:team_key, "%#{search}%"])
    # else
	 # Team.all #全て表示。
    end
  end
end
