class Rack::Attack
	Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new 
				
	throttle('Limit1', limit: 2, period: 2.minutes) do |request|
		if request.path != '/users' and request.path != '/auth/login'
			user_id = Rack::Attack.cache.store.read("current_user")
			user = User.find_by(id: user_id)
			user_id if user and user.plan == "Standard" and request.path.include?(user.api_name)
		end	
	end

	throttle('Limit2', limit: 5, period: 2.minutes) do |request|
		if request.path != '/users' and request.path != '/auth/login'
			user_id = Rack::Attack.cache.store.read("current_user")
			user = User.find_by(id: user_id)
			user_id if user and user.plan == "Business" and request.path.include?(user.api_name)
		end	
	end

	throttle('Limit3', limit: 7, period: 2.minutes) do |request|
		if request.path != '/users' and request.path != '/auth/login'
			user_id = Rack::Attack.cache.store.read("current_user")
			user = User.find_by(id: user_id)
			user_id if user and user.plan == "Ultimate" and request.path.include?(user.api_name)
		end	
	end

	throttle('Limit4', limit: 1, period: 2.minutes) do |request|
		if request.path != '/users' and request.path != '/auth/login'
			user_id = Rack::Attack.cache.store.read("current_user")
			user = User.find_by(id: user_id)
			user_id if user and ! request.path.include?(user.api_name)
		end	
	end

end