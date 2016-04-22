class Product < ActiveRecord::Base


  def sale_message
    if price <= 2
      return "Discount item!"
    elsif price > 2
      return "On sale!"
    end
  end

 

  def tax
    tax = price * 0.09
    return "#{tax} for tax"
  end

  def total
    total = price * 1.09
    return total.to_i
  end

  def stock_message
    if stock_level == nil or stock_level == 0
      return "Item will be back in stock shortly, thank your for your patience"
    elsif stock_level > 1
      return "Item is in stock!"
    else
      return "Error! Stock cannot be negative!"
    end
  end
end

