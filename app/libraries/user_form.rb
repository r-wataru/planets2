class UserForm
  include ActiveModel::Model
  
  attr_accessor :user
  delegate :persisted?, :save, to: :user
  
  def initialize(user = nil)
    @user = user
    @user ||= User.new
    @user.build_individual_competence unless @user.individual_competence
  end
end