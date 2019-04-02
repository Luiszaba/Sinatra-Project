require 'pry'

class StoriesController < ApplicationController

    get '/stories/index' do
        if logged_in?
            @stories = Story.all
            erb :"/stories/index"
        else 
            redirect "/session/login"
        end
    end

    get '/stories/new' do
        if !logged_in?
            redirect "/session/login"
        else
            erb :"/stories/new"
        end
    end

    post '/stories' do
        if logged_in?
            if params.empty?
                redirect "/stories/new"
            else
                @story = Story.create(title: params[:title], content: params[:content])
                @story.user_id = session[:user_id]
                @story.save
                puts params
                redirect "/stories/#{@story.id}"
            end
        else 
            redirect "/session/login"
        end
    end

    get '/stories/:id' do
        if logged_in?
            @story = Story.find(params[:id])
            erb :"/stories/show"
        else
            redirect "/session/login"
        end
    end

    get '/stories/:id/edit' do 
        if logged_in?
            @story = Story.find(params[:id])
            if @story && @story.user_id == current_user.id
                erb :"/stories/edit"
            else
                redirect "/stories/#{@story.id}"
            end
        else 
            redirect "/session/login"
        end
    end

    patch '/stories/:id' do 
        if  !logged_in?
            redirect "/session/login"
        elsif params.empty?
            redirect "/stories/#{params[:id]}/edit"
        else
            @story = Story.find(params[:id])
            if  @story && @story.user_id == current_user.id
                params.delete("_method")
                if  @story.update(title: params[:title], content: params[:content])
                    puts params
                    redirect "stories/#{@story.id}"
                else 
                    redirect "/stories/#{params[:id]}"
                end
            else 
                redirect "/stories/#{params[:id]}"
            end
        end
    end

    delete '/stories/:id' do
        if logged_in?
            @story = Story.find_by_id(params[:id])
            if  @story && @story.user_id == current_user.id
                params.delete("_method")
                @story.destroy
                redirect to "/users/show"
            else
                redirect to "/users/show"
            end
        else
            redirect to "/session/login"
        end
    end
end