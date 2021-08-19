module ApplicationHelper

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        if session[:user_id]
          User.find(session[:user_id])
        else
          error
        end
      end
      
    def error
        render json: {error: "Must include date"}
    end

end
