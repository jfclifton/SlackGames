require 'slack-notifier'
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # POST /users
  # POST /users.json
  def create
    @username = params['user_name']
    @email = params['text'].slice! "makeuser"
    @email.strip
    byebug
    @user = User.new
    @user.name = @username
    @user.email = @email
    if @user.save
      render :show, status: :created, location: @user
      notifier = Slack::Notifier.new Rails.application.secrets.slack_incomingwebhook_url, channel: "#gamez",
                                                    username: "notifier"
      createdUser = @user.name
      notifier.ping "User created. Welcome %s" %createdUser
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :phone)
    end
end
