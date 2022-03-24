class UserController < ActionController::Base
    
    def logedIn
        if session[:user_id]
            @user = User.find_by_id(session[:user_id])    
            render "login_succes"  
       else
            redirect_to "/login"
       end
    end

    def login
        @user = User.new
    end

    def register
        if request.post?
            @user = User.new( 
                            :username => params[:user][:username],
                            :password => params[:user][:password],
                            :email => params[:user][:email],
                            :phone=> params[:user][:phone],
                            :mobile => params[:user][:mobile],
                            :first_name => 'test',
                            :last_name => 'test',
                            :txn_hash => 'dasdas'
                        )
            @user.save
            session[:user_id] = @user.id
            redirect_to "/"
        else
            @user = User.new
        end
    end
end