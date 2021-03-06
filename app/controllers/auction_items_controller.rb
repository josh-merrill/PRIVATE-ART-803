

class AuctionItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @auction_items = AuctionItem.where(auction_id: params[:auction_id])
    # add view page
  end

  def new
    @auction_item = AuctionItem.new
  end

  # def create
  #   # validate if artwork or auction_item is the foreign key!
  #   @auction_item = AuctionItem.new(auction_items_params)
  #   @artwork = Artwork.find(artwork_params[:artist_id])
  #   @user = @artwork.artist
  #   @auction_item.user = current_user
  #   @auction_item.artwork = @artwork
  #   @auction_item.price = @artwork.price
  #   if @auction_item.save!
  #     # where am i redirecting to? artworks or auctions?
  #     redirect_to artwork_path(current_user), notice: "Your auction item was successfully listed!"
  #   else
  #     render "artists/show" # this should go to an auctions/show page or artwork
  #   end
  # end

  def create
    @auction = Auction.find(params[:auction_id])
    @artworks = Artwork.where(id: params[:auction_item][:artwork])
    @artworks.each do |artwork|
      AuctionItem.create(artwork: artwork, auction: @auction)
    end
    redirect_to @auction
  end

  def show
    @auction = Auction.find(params[:auction_id])
    @auction_item = AuctionItem.find(params[:id])
    @bids = @auction_item.bids.reverse
    @bid = Bid.new
  end

  def destroy
    @auction_item = AuctionItem.find(params[:id])
    @auction_item.destroy
    # where am i redirecting to? artworks or auctions?
    redirect_to auction_item_path(current_user), notice: "Your auction item was successfully removed."
  end

  def finish_bid
    @auction_item = AuctionItem.find(params["id"])
    @artwork = @auction_item.artwork

    @bids = @auction_item.bids
    @highest_bid_price = @auction_item.bids.maximum(:price)
    @highest_bid = @bids.where(price: @highest_bid_price)

    @artwork.buyer_id = @highest_bid[0].user_id
    @artwork.price = @highest_bid[0].price

    @artwork.save
    render :json => { artwork: @artwork, user: @artwork.buyer }
    # user = User.find(@artwork.buyer_id)

    # BidroomChannel.broadcast_to(user, { notification: 'Test message' }
    #                             #render_to_string(partial: "shared/win")
    #   )
    # head :ok
  end

  private

  def auction_items_params
    params.require(:auction_items).permit(:artwork_id, :auction_id)
  end

  def artwork_params
    params.require(:artwork).permit(:title, :price, :description, :artist_id, :photo)
  end
end
