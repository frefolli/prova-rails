class AccountsController < ApplicationController
  def index
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
    @account = Account.find_by(id: params[:id])
    @transactions = []
    if @account.nil?
      flash[:error] = "No account with id = #{id}"
      redirect_to :accounts
      return
    end

    @account.transactions.each do |t|
      from = (t.from ? t.from.fiscalcode : "")
      to = (t.to ? t.to.fiscalcode : "")
      @transactions.append({
        from: from,
        to: to,
        amount: t.amount,
        timestamp: t.timestamp
      })
    end
  end

  def destroy
    @account = Account.find_by(id: params[:id])
    if @account.nil?
      flash[:error] = "No account with id = #{id}"
      redirect_to :accounts
      return
    end

    @account.destroy_transactions
    Account.delete(@account)
    redirect_to :accounts
  end

  def create
    if ((not params.has_key?(:name)) or
        (not params.has_key?(:surname)) or
        (not params.has_key?(:fiscalcode)))
      flash[:error] = "Invalid parameters for creating Account"
      redirect_to :accounts
      return
    end

    account = Account.create(
      :name => params[:name],
      :surname => params[:name],
      :fiscalcode => params[:fiscalcode],
      :credit => 0)
    
    if not account.save
      flash[:error] = "Invalid parameters for creating Account"
      redirect_to :accounts
      return
    end

    redirect_to account_path(account), :id => account.id
  end
end
