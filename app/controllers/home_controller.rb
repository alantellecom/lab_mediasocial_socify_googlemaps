# Copyright (c) 2015, @sudharti(Sudharsanan Muralidharan)
# Socify is an Open source Social network written in Ruby on Rails This file is licensed
# under GNU GPL v2 or later. See the LICENSE.

class HomeController < ApplicationController
  before_action :set_user, except: :front
  respond_to :html, :js

  def index
    @post = Post.new
    @friends = @user.all_following.unshift(@user)
    @activities = PublicActivity::Activity.where(owner_id: @friends).order(created_at: :desc).paginate(page: params[:page], per_page: 10)
    load_routers
    @mapa_api_key =Rails.application.credentials[:mapa_api_key]
  end

  def front
    @activities = PublicActivity::Activity.joins("INNER JOIN users ON activities.owner_id = users.id").order(created_at: :desc).paginate(page: params[:page], per_page: 10)
  end

  def find_friends
    @friends = @user.all_following
    @users =  User.where.not(id: @friends.unshift(@user)).paginate(page: params[:page])
  end

  private
  def set_user
    @user = current_user
  end

  def load_routers
 
    @routers_default = Gmaps4rails.build_markers(Router.all) do |plot, marker|  
       marker.lat plot.latitude  
       marker.lng plot.longitude  
 
       @online = rand(1..100)  
       @onsite =   100 - @online
 
       if @onsite >= 70  
         url_bike = ActionController::Base.helpers.asset_path('bike.gif')   
         @status = "quente"  
       elsif @onsite <= 20     
         url_bike = ActionController::Base.helpers.asset_path('bike.gif')
         @staus= "frio"
       else  
         url_bike = ActionController::Base.helpers.asset_path('bike.gif')
         @staus= "morno"
       end 
 
       marker.picture({  
         "url" => url_bike,  
         "width" => 50,  
         "height" => 50  
       })  
 
       marker.infowindow render_to_string(:partial => "/routers/info",:locals => {:name => plot.name, :pessoas => @pessoas, :date => rand(1.hours.ago..Time.now), :onsite => @onsite, :online => @online })  
   
     end
     #binding.pry
   end

end
