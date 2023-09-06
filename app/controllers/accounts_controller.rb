class AccountsController < ApplicationController
  def index
    @error = (params.has_key?(:error) ? params[:id] : nil)
    @accounts = Account.all

    if params.has_key?(:commit)
      if params[:commit] == "filter"    
        if params.has_key?(:name) and not params[:name].empty?
          @accounts = @accounts.where(name: params[:name])
        end
        
        if params.has_key?(:surname) and not params[:surname].empty?
          @accounts = @accounts.where(surname: params[:surname])
        end
        
        if params.has_key?(:fiscalcode) and not params[:fiscalcode].empty?
          @accounts = @accounts.where(fiscalcode: params[:fiscalcode])
        end
      elsif params[:commit] == "clean"
        redirect_to :accounts
      end
    end
  end

  def show
    @account = Account.find(params[:id])
    if @account.nil?
      redirect_to :accounts, :error => "account doesn't exists"
      return
    end
  end
end
