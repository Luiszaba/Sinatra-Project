class UsersController < ApplicationController
    
    
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'users/show'
    end

    get '/session/login' do
        if !logged_in?
            erb :"/session/login"
            
        else 
             redirect "/users/#{current_user.slug}"
        end
    end

    post '/session' do 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            puts params
            redirect "/users/#{@user.slug}"

        else
            erb :"/session/login"
        end
    end

    get '/registrations/signup' do 
        if !logged_in?
            erb :"/registrations/signup"
        else 
             redirect "/users/#{current_user.slug}"

        end
    end

    post '/registrations' do
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
            redirect '/registrations/signup'
        else
            @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            puts params
            session[:user_id] = @user.id
            redirect "/users/#{@user.slug}"
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect "/session/login"
        else 
            redirect "/"
        end
    end

    
end



