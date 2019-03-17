class StoriesController < ApplicationController
    
    get '/stories' do
        @stories = Stories.all
        erb :"/stories/public_stories"
    end

    get 'stories/new' do
        if logged_in?
            erb :"/stories/new_story"
        else 
            redirect "/login"
        end
    end

    post '/stories' do
        if logged_in?
            if params[:content].empty?
                redirect '/login'
            else
                @story = current_user.stories.build(content: params[:content])
                if @story.save
                    redirect '/stories/#{@story.id}'
                else 
                    redirect '/stories/new_story'
                end
            end
        else
            redirect '/login'
        end
    end

    get '/stories/:id' do
        @stories = Stories.find(params[:id])
        erb :'/stories/show_stories'
    end

    get '/stories/:id/edit' do
        if !logged_in
            erb :"stories/edit_story"
        else 
            redirect "/login"
        end
    end

    delete '/stories/:id/delete' do 
        if logged_in?
            @story = Stories.find_by_id([:id])
            if @story && @story.user == current_user
                @story.delete
            end
            redirect '/stories/show_story'
        else 
            redirect '/login'
        end
    end
end

