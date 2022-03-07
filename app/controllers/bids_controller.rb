class BidsController < ApplicationController

  def create
    @auction = Auction.find(params[:auction_id])
    @auction_item = AuctionItem.find(params[:auction_item_id])
    @bid = Bid.new(bids_params)
    @bid.user = current_user
    @bid.auction_item_id = params[:auction_item_id]


    if @bid.save
      BidroomChannel.broadcast_to(
        @auction_item,
        render_to_string(partial: "shared/bid", locals: { bid: @bid })
      )
      head :ok
      #redirect_to auction_auction_item_path(@auction, @auction_item)
    else
      #redirect_to auction_auction_item_path(@auction_item), notice: "You can only place one bid"
      render 'auction_items/show'
    end

  end

  private

  def bids_params
    params.require(:bid).permit(:price)
  end
end
