require 'digest/md5'
REALM = "localhost"
class HomeController < ApplicationController
  skip_before_filter :authorize
  def index
    end

  def newUser
    @username = ''
    @password = ''
    @email = ''

    if !params[:username].nil?
      @username = params[:username]
    end

    if !params[:password].nil?
      @password = params[:password]
    end

    if !params[:email].nil?
      @email = params[:email]
    end

    if !params[:username].nil?
      @newUser = nil
      @newUser = User.new
      @newUser.username = @username
      @newUser.email = @email
      @newUser.password = Digest::MD5.hexdigest([@username, REALM, @password].join(":"))
      @newUser.save
    end

    user = User.find_by_username(@username)
    if !user.nil?
      session[:user_id] = user.id
      redirect_to home_login_path, :notice => "Account created, Please sign in!"
    else
      redirect_to root_url, :notice => "User creation failed, try again."
    end
    end

  def login
    @username = ''
    @password = ''
    userhash = {}
    user = ''
    userid = session[:user_id]
    if !userid.nil?
      user = User.where('id = ?', userid)[0]
      redirect_to home_user_path, :notice => "Welcome to your page, "+user.username

    else
      if !params[:username].nil?

        if !params[:username].nil?
          @username = params[:username]
        end

        if !params[:password].nil?
          @password = params[:password]
        end

        user = User.where('username = ?', @username)[0]
        userhash.store(user.username, user.password)

        authenticate_or_request_with_http_digest(REALM) do |username|
          userhash[username]
          session[:user_id] = user.id
        end
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to home_index_path
  end

  def user
    @music = Music.all
    @myMusic = []
    @musicIds = nil

    user = User.where('id = ?', session[:user_id])[0]
    if !user.preferences.nil?
      @musicIds = eval(user.preferences)
      session[:saved_music] = @musicIds
    end

    if !@musicIds.nil?
      if @musicIds.length == 0
        @musicIds = nil
      end
      if @musicIds != nil
          @musicIds.each do |sid|
            @myMusic.push(Music.where('id = ?', sid)[0])
        end
      end
    end
  end


  def saveList
    savedArray = []
    if !session[:saved_music].nil?
      savedArray = session[:saved_music]
    end
    Music.all.each do |favorite|
      fav = params[favorite.id.to_s]
      if !fav.nil?
        savedArray.push(favorite.id)
      end
    end
    user = User.where('id = ?', session[:user_id])[0]
    user.preferences = savedArray
    user.save

    redirect_to home_user_path, :notice => "Music Saved!"
  end

  def removeMusic
    savedArray = []
    if !session[:saved_music].nil?
      savedArray = session[:saved_music]
    end
    savedArray.each do |fid|
      fav = params[fid.to_s]
      if !fav.nil?
        savedArray.delete(fid)
      end
    end
    if savedArray.length == 0
      savedArray = nil
    end
    user = User.where('id = ?', session[:user_id])[0]
    user.preferences = savedArray
    user.save

    redirect_to home_user_path, :notice => "Music Updated!"
  end

  def about
  end

  def privacy
  end
end
