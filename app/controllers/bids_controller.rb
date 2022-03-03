class BidsController < ApplicationController

  def create
    @auction_item = AuctionItem.find(params[:auction_item_id])
    @bid = Bid.create(price: bids_params)
    @bid.user = current_user
    @bid.auction_item_id = params[:auction_item_id]
    if @bid.save
      BidroomChannel.broadcast_to(
        @auction_item,
        render_to_string(partial: "shared/bid", locals: { bid: @bid })
      )
      head :ok
      raise
    end
    # @bid.save
    # redirect_to auction_auction_item_path(params["auction_id"], params["auction_item_id"])

    # respond_to do |format|
    #   format.html # Follow regular flow of Rails
    #   format.text { render partial: 'movies/list', locals: { movies: @movies }, formats: [:html] }
    # end
  end

  private

  def bids_params
    params.require(:price)
  end
end
