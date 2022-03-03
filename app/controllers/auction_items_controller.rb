class AuctionItemsController < ApplicationController
  def show
    @auction = Auction.find(params[:auction_id])
    @auction_item = AuctionItem.find(params[:id])
    @bids = @auction_item.bids.reverse

  end
end
