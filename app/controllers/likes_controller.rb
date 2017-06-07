class LikesController < ApplicationController
  def index
    @likes = Like.all

    render("likes/index.html.erb")
  end

  def show
    @like = Like.find(params[:id])

    render("likes/show.html.erb")
  end

  def new
    @like = Like.new

    render("likes/new.html.erb")
  end

  def create
    @like = Like.new

    @like.user_id = params[:user_id]
    @like.post_id = params[:post_id]

    save_status = @like.save

    if save_status == true
      redirect_to("/my_posts", :notice => "Like created successfully.")
    else
      render("likes/new.html.erb")
    end
  end

  def edit
    @like = Like.find(params[:id])

    render("likes/edit.html.erb")
  end

  def update
    @like = Like.find(params[:id])

    @like.user_id = params[:user_id]
    @like.post_id = params[:post_id]

    save_status = @like.save

    if save_status == true
      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
    else
      render("likes/edit.html.erb")
    end
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy

    if URI(request.referer).path == "/likes/#{@like.id}"
      redirect_to("/", :notice => "Like deleted.")
    else
      redirect_to(:back, :notice => "Like deleted.")
    end
  end
end
