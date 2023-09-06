class AccountsController < ApplicationController
  def index
    @error = (params.has_key?(:error) ? params[:id] : "")
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    if @account.nil?
      redirect_to :accounts, :error => "account doesn't exists"
      return
    end
  end
end
