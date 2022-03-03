class AuctionsController < ApplicationController
  def show
    @auction = Auction.find(params[:id])
  end
end
