class AuctionsController < ApplicationController
  # what are artists allowed to do that buyers are not?

  #all users
  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.find(params[:id])
  end

  # artists only? if so, then add a
  # private method to verify beforehand
  def new
    @auction = Auction.new
  end

  def



  private


  def auction_params
    params.require(:auction).permit(:description, :address, :user_id, :date, :status, :start_time, :end_time)
  end
end
