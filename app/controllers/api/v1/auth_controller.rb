class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    wrap_parameters :user, include: [:username, :password]

    def create
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            token = issue_token(@user)
            cookies.signed[:jwt] = {value: token, httponly: true, expires: 1.hour.from_now}
            render json: {user: UserSerializer.new(@user), jwt: token}
        else
            render json: {error: "Incorrect Username/Password"}, status: 401
        end
    end

    def show
        @user = User.find_by(id: user_id)
        if logged_in?
            render json: @user
        else
            render json: {error: 'No user could be found'}, status: 401
        end
    end

    # def destroy
    #     byebug
    # end

    private

    def user_params
        params.require(:user).permit(:name, :target, :username, :password)
    end

end