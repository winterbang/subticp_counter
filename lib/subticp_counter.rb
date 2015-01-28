require "subticp_counter/version"

module SubticpCounter
	def times_in_100(price)
	  (100.0/price).ceil
	end

	# 在100～150之间乘坐的次数
	def times_in_150(price)
	  about_50 = 150 - times_in_100(price)*price
	  (about_50/price*0.8).ceil
	end

	def times_in_400(price)
	  about_250 = 400 - times_in_100(price)*price - times_in_150(price)*price*0.8
	  (about_250/price*0.5).ceil
	end

	def subway_price(price, total_times)
	  if total_times <= times_in_100(price)
	    total_price = price*total_times
	  elsif total_times <= times_in_100(price)+times_in_150(price)
	    total_price = price*times_in_100(price)+ price*0.8*(total_times - times_in_100(price)- times_in_150(price))
	  elsif total_times <= times_in_100(price)+times_in_150(price)+times_in_400(price)
	    total_price = price*times_in_100(price)+price
	  end
	  "total_price:#{total_price}"
	   # times_in_100(price)+times_in_150(price)
	end
	
end
