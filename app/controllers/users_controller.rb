class UsersController < ApplicationController
    
    
    get '/users/:slug' do
        @user = Users.find_by_slug(params[:slug])
        erb :'users/show'
    end

    get '/sessions/login' do
        if !logged_in?
            erb :"/sessions/login"
        else 
            redirect "/users/show"
        end
    end

    post '/sessions' do 
        user = Users.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/users/show'
        else
            erb :'/sessions/login'
        end
    end

    get '/registrations/signup' do 
        if !logged_in?
            erb :'/registrations/signup'
        else 
            redirect '/users/show'
        end
    end

    post '/registrations' do
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
            redirect '/registrations/signup'
        else
            @user = Users.new(:username => params[:username], :email => params[:email], :password => params[:password])
            @user.save
            puts params
            session[:user_id] = @user.id
            redirect '/users/show'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/sessions/login'
        else 
            redirect 'sessions/login'
        end
    end
end



