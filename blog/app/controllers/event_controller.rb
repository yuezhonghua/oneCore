class EventController < ApplicationController
	def index
		gon.category = ["衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"]
        gon.data     = [5, 20, 40, 10, 10, 20]
	end
end
