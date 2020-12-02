class TransactionsController < ApplicationController
  def wallet
  	@wallet = current_user.wallet
  	@deposit = current_user.deposits.all
  	@withdraw = current_user.withdraws.all
  end

  def statements
  	@statement = Statement.all
  end

  def deposit
  	flag = true
  	current_user.deposits.all.each do |d|
			if d.status.to_s == "pending"
				flag = false
				break
			end
		end
		if flag == true
	  	@deposit = current_user.deposits.new(deposit_params)
	  	params.inspect
	    if @deposit.save
	      redirect_to transactions_wallet_path, notice: 'request for deposit is created Successfull'
	    else
	      redirect_to transactions_wallet_path, alert: 'request Failed to create'
	    end
		else
			redirect_to transactions_wallet_path, alert: 'Failed to create due to pending requests'
		end
  end

  def withdraw
  	@reqamount= params[:amount].to_i + 10
  	if @reqamount.to_i < current_user.wallet.balance.to_i	
	  	@withdraw = current_user.withdraws.new(withdraw_params)
	  	params.inspect
	    if @withdraw.save
	      redirect_to transactions_wallet_path, notice: 'request for withdraw is created Successfull'
	    else
	      redirect_to transactions_wallet_path, alert: 'request Failed to create'
	    end
		else
			redirect_to transactions_wallet_path, alert: 'Insufficient  amount'
		end
  end
  
  private
  	def deposit_params
  		params.permit(:amount)
  	end

  	def withdraw_params
  		params.permit(:amount)
  	end
end
