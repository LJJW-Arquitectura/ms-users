class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  attr_reader :headers

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end
  
  # GET /users/Juan/p4ss
  def findId
    if User.where(username: params[:username], password: params[:password]).exists?
      render json: User.where(username: params[:username], password: params[:password]).first
    end
  end

  # POST /users/login
  def login    
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      result = JsonWebToken.encode(user_id: user.id) if user
      render json: { id: user.id, username: user.username, email: user.email ,  token: result }
    else
      render json: { error: "invalid credentials" }, status: :unauthorized
    end
  end
  
  # POST /users/auth
  def auth
    if params[:Authorization]
      @decoded_auth_token ||= JsonWebToken.decode(params['Authorization'].split(' ').last)
      if @decoded_auth_token and params[:id].to_i == @decoded_auth_token[:user_id]
        render json: {}, status: :ok  
      else
        render json: {}, status: :unauthorized
      end
    else
      render json: {token: "Missing token"}, status: :unauthorized
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
 
  
end
