class OfferPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def decline?
    true
  end

  def accept?
    true
  end

  def complete?
    true
  end

  def new?
    create?
  end

  def cobweb?
    true
  end

  def create?
    record.freelancer.offers.each do |offer|
      return false if offer.user == user
    end
    record.freelancer.user != user
  end
end
