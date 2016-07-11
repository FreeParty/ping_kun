require "date"
class ChartsController < ApplicationController
  #csrf対策を外部apiのみarrow
  protect_from_forgery :except => [:ac]
  def index

    # get today data
    d = Date.today
    @params = Datum.all
    @hours = Datum.where("day = ?", d.day)
    gon.info = []
    @data = {}

    # get some info using inde.html.erb on template engine
    @params.each do |param|
      @data["year"] = param.year
      @data["month"] = param.month
      @data["day"] = param.day
      @data["time"] = param.time
    end

    # get ping time`s list
    @hours.each do |time|
      puts time
      gon.info.push(time["about"])
    end

    puts gon.info
    puts ("-+-+-+-+-+-+-+")
    puts @data
    return gon.info, @data
  end

  def mypost
  end

  def ac
    @data = Datum.new
    @data.year = params[:year]
    @data.month = params[:month]
    @data.day = params[:day]
    @data.time = params[:time]
    @data.about = params[:about]
    puts ("Hello Post")
    # val = params[:month]
    # puts (val)
    # puts val.is_a?(Integer)
    # puts val.is_a?(String)
    @data.save
    # viewサイトがないと怒られるので、ないと伝える
    render :nothing => true
  end
end
