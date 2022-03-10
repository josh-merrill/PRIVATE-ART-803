require 'rqrcode'

class AuctionsController < ApplicationController
  protect_from_forgery except: [:show]
  before_action :enter_auctions, only: [:show]

  def index
    @auctions = Auction.all
  end

  def show
    @auction = Auction.includes(auction_items: :artwork).find(params[:id])
    @user = @auction.user
    @url = "https://www.artcollective.live/" + auction_path(@auction)
    @qr_code = RQRCode::QRCode.new(@url)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '0c0e1e',
      shape_rendering: 'crispEdges',
      standalone: true
    )
    @artworks = @user.artworks_as_artist

    @artworks.each do |artwork|
      if !artwork.auction_items.exists?
        auction_item = AuctionItem.new
        auction_item.auction = @auction
        auction_item.artwork = artwork
        auction_item.save
      end
    end
    @auction_items = @auction.auction_items
    @auction_item = AuctionItem.new
  end

  def new
    @auction = Auction.new
  end

  def create
    @auction = Auction.new(auction_params)
    @auction.user = current_user
    if @auction.save
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
    params.require(:auction).permit(:title, :description, :address, :user_id, :date, :status, :start_time, :end_time, :photo)
  end



  def enter_auctions
      #create a new QR Code (rQRCode assumes string data)
    qrcode = RQRCode::QRCode.new(auction_path)
    @qrcode_html = qrcode.as_html
  end

end
