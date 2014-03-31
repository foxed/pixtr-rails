class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @images = @user.images.includes(:gallery)
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserMailer.notify_on_new_activity(@user).deliver
         format.html { redirect_to(@user, notice: 'User was successfully created.') }
         format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
