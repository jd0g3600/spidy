class My::OffersController < ApplicationController
  before_action :set_offer, only: [ :decline, :accept, :complete ]

  def index
    @offers = policy_scope(Offer).where("status = ? OR status = ?", 1 , 2).order(updated_at: :desc)
  end

  def decline
    @offer.status = 0
    @offer.save

    redirect_to my_offers_path
  end

  def accept
    @offer.status = 2
    @offer.save

    redirect_to my_offers_path
  end

  def complete
    @offer.status = 3
    @offer.save

    redirect_to my_offers_path
  end

  def cobweb
    @offers = Offer.where(status: 3).order(updated_at: :desc)
    authorize @offers
  end

  def destroy
  end

  private

  def set_offer
    @offer = Offer.find(params[:id])
    authorize @offer
  end
end
