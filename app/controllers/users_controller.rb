class UsersController < ApplicationController

  before_filter :signed_in_user,  only: [:edit, :update]
  before_filter :correct_user,    only: [:edit, :update]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to the sample app!"
        redirect_to @user
      else
        render 'new'
      end
  end

  def edit

    # I think this is taken out in http://ruby.railstutorial.org/book/ruby-on-rails-tutorial#code-correct_user_before_filter

    @user = User.find(params[:id])

  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in." unless signed_in?
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
