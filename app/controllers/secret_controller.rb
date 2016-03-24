class SecretController < ApplicationController
  def index
  	@instagram = Instagram.user_recent_media("2486700", {:count => 1})
  end
end
