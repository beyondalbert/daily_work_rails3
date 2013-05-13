class HomeController < ApplicationController
	# before_filter :authenticate_user!
	SIZE = 20

	def index

	end

	def auto_cell
		if request.request_method == "GET"
			@ca = Array.new(SIZE){Array.new(SIZE, 0)}
			@ca[1][2] = 1
			@ca[2][3] = 1
			@ca[0][3] = 1
		else
			@ca = Array.new(SIZE){Array.new(SIZE, 0)}
			i, j = 0, 0
			@ca.each do |ca|
				ca.each do |item|
					@ca[i][j] = reborn(params[:ca]["#{i}"]["#{j}"].to_i, i, j)
					j += 1
				end
				i += 1
				j = 0
			end
		end
	end

	private

	def reborn(value, x, y)
		# 确定周围的值
		if x - 1 < 0
			value_left = params[:ca]["#{SIZE-1}"]["#{y}"].to_i
		else
			value_left = params[:ca]["#{x-1}"]["#{y}"].to_i
		end
		if y - 1 < 0
			value_top = params[:ca]["#{x}"]["#{SIZE-1}"].to_i
		else
			value_top = params[:ca]["#{x}"]["#{y-1}"].to_i
		end
		if x + 1 == SIZE
			value_right = params[:ca]["#{0}"]["#{y}"].to_i
		else
			value_right = params[:ca]["#{x+1}"]["#{y}"].to_i
		end
		if y + 1 == SIZE
			value_bottom = params[:ca]["#{x}"]["#{0}"].to_i
		else
			value_bottom = params[:ca]["#{x}"]["#{y+1}"].to_i
		end

		# 确定本身的值
		index = 0
		value_around = [value_left, value_top, value_right, value_bottom]
		value_around.each do |v|
			if v == 1
				index += 1
			end
		end

		if value == 0
			if index > 2
				value = 1
			end
		else
			if index <2
				value = 0
			end
		end
		value
	end
end
