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
end

