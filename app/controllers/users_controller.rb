class UsersController < ApplicationController
  def new
    @user = User.new()
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      sign_in @user
      flash[:notice] = "Welcome to the Creative Uncommon!"
      redirect_to @user
    else
      flash[:failure] = "Could not create user!"
      render 'new'
    end
  end
  
  def get_user_image
    @user = User.find(params[:id])
    unless @user.image.nil?
      unless File.exists? Rails.root.join('public', 'uploads', @user.id.to_s)
        File.open(Rails.root.join('public', 'uploads', @user.id.to_s), 'wb') do |file|
          file.write(@user.image)
        end
      end
      
      send_file Rails.root.join('public', 'uploads', @user.id.to_s), :type => 'image/jpeg', :disposition => 'inline'
    else
      send_file Rails.root.join('public', 'generic_user_image.png'), :type => 'image/jpeg', :disposition => 'inline'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @popular = @user.works.order(read_count: :desc).first
  end
  
  def update
    @user = User.find(params[:id])
    
    uploaded = params[:user][:image]
    
    unless uploaded.nil?
      uploaded_content = uploaded.read
      @user.update_attribute(:image, uploaded_content)
      
      File.open(Rails.root.join('public', 'uploads', @user.id.to_s), 'wb') do |file|
        file.write(uploaded_content)
      end
    end
    
    redirect_to @user
  end
  
  def edit
    if signed_in?
      @user = current_user
    else
      @user = User.find(params[:id])
      redirect_to @user
    end
  end
  
  def stories
    if !signed_in?
      redirect_to search_path
    end
    
    @user = current_user
    @works = @user.works
  end
  
  private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
