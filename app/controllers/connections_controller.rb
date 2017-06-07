class ConnectionsController < ApplicationController
  def index
    @connections = Connection.all

    render("connections/index.html.erb")
  end

  def show
    @connection = Connection.find(params[:id])

    render("connections/show.html.erb")
  end

  def new
    @connection = Connection.new

    render("connections/new.html.erb")
  end

  def create
    @connection = Connection.new

    @connection.sender_id = params[:sender_id]
    @connection.receiver_id = params[:receiver_id]
    @connection.request_accepted = params[:request_accepted]



    save_status = @connection.save


    if save_status == true
      redirect_to("/users/#{current_user.id}")
    else
      render("connections/new.html.erb")
    end
  end

  def edit
    @connection = Connection.find(params[:id])

    render("connections/edit.html.erb")
  end

  def update
    @connection = Connection.find(params[:id])

    @connection.sender_id = params[:sender_id]
    @connection.receiver_id = params[:receiver_id]
    @connection.request_accepted = params[:request_accepted]

    save_status = @connection.save

    if save_status == true
      redirect_to("/users/#{current_user.id}")
    else
      render("connections/edit.html.erb")
    end
  end

  def destroy
    @connection = Connection.find(params[:id])

    @connection.destroy

    if URI(request.referer).path == "/connections/#{@connection.id}"
      redirect_to("/", :notice => "Connection deleted.")
    else
      redirect_to(:back, :notice => "Connection deleted.")
    end
  end
end
