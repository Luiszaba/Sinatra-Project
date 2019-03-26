class StoriesController < ApplicationController
    
    get '/stories/public_stories' do
        if logged_in?
            @stories = Story.all
            erb :"/stories/public_stories"
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
            @story = Story.find_by(params[:id])
            erb :"/stories/show_story"
        else
            redirect "/sessions/login"
        end
    end

    get '/stories/:id/edit_story' do 
        if logged_in?
            @story = Story.find(params[:id])
            if @story && @story.user_id == current_user.id
                erb :"/stories/#{params[:id]}/edit_story"
            end
            else
            redirect "/session/login"
        end
    end

    patch'/stories/:id' do 
        if !logged_in?
            redirect "/session/login"
        if params.empty?
            redirect "/stories/#{params[:id]}/edit_story"
        else
            @story = Story.find(params[:id])
            if @story && @story.user_id == current_user.id
                if @story.update(params)
                        redirect "stories/#{@story.id}/edit_story"
                end
            else 
                redirect "/stories/show_story"
            end
        end
    else 
        redirect "/session/login"
    end
end

    delete '/stories/:id/delete' do
        if logged_in?
            @story = Story.find(params[:id])
            if @story && @story.user_id == current_user.id
                @story.delete
            redirect to "/users/show"
        else
        redirect to "/session/login"
      end
    end
end
end



