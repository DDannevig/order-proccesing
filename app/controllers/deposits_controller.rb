# frozen_string_literal: true

class DepositsController < ApplicationController
  def index
    render json: Deposit.all
  end

  def create
    render json: Deposit.create!(name: params.require(:name))
  end

  def destroy
    Deposit.find(params[:id]).destroy
    render :ok
  end
end
