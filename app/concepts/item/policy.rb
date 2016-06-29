class Item::Policy
  def initialize(user, item)
    # per default the params[:current_user] and the operation’s model is 
    # passed into the constructor
    @user = user
    @item = item
  end

  def create?
    !@user.nil?
  end
end