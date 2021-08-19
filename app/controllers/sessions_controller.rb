class SessionsController < ApplicationController

    wrap_parameters :user, include: [:username, :password]

    def create
        @user = User.find_by(username: user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            render json: UserSerializer.new(@user)
        else
            render json: {error: "Incorrect Username/Password"}
        end
    end

    def destroy
        session.clear
    end

    def user_params
        params.require(:user).permit(:name, :target, :username, :password)
    end

end
