class UsersController < ApplicationController
  def new
  end

  def create
    # @group = Group.find(params[:group_id])
    # @user = User.find_by(name: params[:name])
    # if @group.users.find_by(name: params[:name]) == nil
    #   render inline: '', status: 418
    # elsif @user
    #   @group.users << @user
    # else
    #   render inline: '', status: 400
    # end
  end

  def update

  end

  def edit
  end

  def destroy
  end

  def index
    @users = []
    group = Group.find(params[:group_id])
    group.users.each do |user|
      if user.id != current_user.id
        @users << user
      end
    end
      render json: @users, status: 200
  end

  def show
    p params[:id]
    @user = User.find(params[:id])

    @user.update_attributes(latitude: params[:latitude], longitude: params[:longitude])
    p @user.latitude
  end

  def setupphone
    @user = User.find(params[:id])
  end

  def savephone
    @user = User.find(params[:id])
    @user.update_attributes(phone_number: params[:phone])
      if @user.errors.empty?
        if request.xhr?
          render json: ["Updated"]
        else
          redirect_to groups_path
        end
      else
        flash[:phone_number_errors] = @user.errors.full_messages
          if request.xhr?
            render json: @user.errors.full_messages
          else
            redirect_to :back
          end
      end
  end

  def settings
    @user = User.find(params[:id])
  end

  def enabletexting
    @user = User.find(params[:id])
      if @user.allow_texting == true
        @user.update_attributes(allow_texting: false)
      else
        @user.update_attributes(allow_texting: true)
      end
    render json: @user
    # redirect_to :back
  end

  def enablelocation
    @user = User.find(params[:id])
      if @user.allow_location == true
        @user.update_attributes(allow_location: false)
      else
        @user.update_attributes(allow_location: true)
      end
  end

end
