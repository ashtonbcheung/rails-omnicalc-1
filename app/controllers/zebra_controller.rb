class ZebraController < ApplicationController
  def home
    render({ :template => "app_templates/square"})
  end
  
  def square
    render({ :template => "app_templates/square"})
  end

  def square_results
    @number = params["number"].to_f

    if @number == @number.to_i
      @number = @number.to_i
    end

    @result = @number.to_f ** 2

    render({ :template => "app_templates/square_results"})
  end

  def square_root
    render({ :template => "app_templates/square_root"})
  end

  def square_root_results
    @number = params["user_number"].to_f
  
    if @number == @number.to_i
      @number = @number.to_i
    end
  
    @result = @number.to_f ** 0.5
  
    render({ :template => "app_templates/square_root_results"})
  end
  
  def payment
    render({ :template => "app_templates/payment"})
  end

  def payment
    @apr = params["user_apr"].to_f.round(4)
    @years = params["user_years"].to_i
    @present_value = params["user_pv"].to_f.round(2)
  
    monthly_rate = (@apr / 100) / 12
    
    n = @years * 12
    
    numerator = monthly_rate * @present_value
    denominator = 1 - (1 + monthly_rate) ** -n
  
    if denominator.zero?
      @monthly_payment = 0
    else
      @monthly_payment = numerator / denominator
    end
    @monthly_payment = @monthly_payment.to_fs(:currency)

    render({ :template => "app_templates/payment_results"})
  end

  def random
    render({ :template => "app_templates/random"})
  end

  def random_results
    @min = params["user_min"].to_f
    @max = params["user_max"].to_f
  
    @random_number = rand(@min..@max)
  
    render({ :template => "app_templates/random"})
  end
end
