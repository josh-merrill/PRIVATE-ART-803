class AuctionsController < ApplicationController
  protect_from_forgery except: [:show]

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.includes(auction_items: :artwork).find(params[:id])
    @auction_item = AuctionItem.new
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    if @auction.save!
      # where am i redirecting to?
      redirect_to auction_path(@auction), notice: "Your auction was successfully listed!"
    else
      render :new
    end
  end

  # def edit
  #   @auction = Auction.find(params[:id])
  # end

  # def update
  #   @auction = Auction.find(params[:id])
  #   @auction.update(auction_params)
  #   # where am i redirecting to?
  #   redirect_to my_auctions_path(current_user), notice: "Your auction was successfully updated!"
  # end

  # def destroy
  #   @auction = Auction.find(params[:id])
  #   @auction.destroy
  #   # where am i redirecting to?
  #   redirect_to auction_path(current_user), notice: "Your auction was successfully removed."
  # end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :address, :user_id, :date, :status, :start_time, :end_time)  end
end
