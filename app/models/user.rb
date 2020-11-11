class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :rank
  belongs_to_active_hash :weekday
  belongs_to_active_hash :power
  belongs_to_active_hash :stime
  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  
  with_options presence: true do
   validates :teamname
   validates :toprank_id
   validates :jgrank_id
   validates :midrank_id
   validates :suprank_id
   validates :botrank_id
   validates :power_id
   validates :weekday_id
   validates :stime_id
   validates :detail
  end

  with_options uniqueness: true do
   validates :email
   validates :teamname
  end


  def follow(user_id)
       follower.create(followed_id: user_id)
      end
     
      def unfollow(user_id)
       follower.find_by(followed_id: user_id).destroy
      end
     
     
      def following?(user)
       following_user.include?(user)
      end
  scope :search, -> (search_params) do
       return if search_params.blank?
   
       teamname_like(search_params[:teamname])
         .power_id_from(search_params[:power_id_from])
         .power_id_to(search_params[:power_id_to])
         .stime_id_is(search_params[:stime_id])
         .weekday_id_is(search_params[:weekday_id])
     end
     scope :teamname_like, -> (teamname) { where('teamname LIKE ?', "%#{teamname}%") if name.present? }
     scope :power_id_from, -> (from) { where('? <= power_id', from) if from.present? }
     scope :power_id_to, -> (to) { where('power_id <= ?', to) if to.present? }
     scope :stime_id_is, -> (stime_id) { where(stime_id: stime_id) if stime_id.present? }
     scope :weekday_id_is, -> (weekday_id) { where(weekday_id: weekday_id) if weekday_id.present? }


     
   end
  
 

