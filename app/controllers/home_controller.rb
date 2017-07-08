class HomeController < ApplicationController
  def index
  end

  def search
  	binding.pry
	@git_user = GitAccount.where(user_name: search_by.downcase).first

	if @git_user.present?
		binding.pry
		
	else
		inforamtion = user_detail
	end

  end

  private

  def user_detail
    binding.pry
    uri = URI.parse("https://api.github.com/users/"+search_by)
    # header = {"Content-Type"=> "application/json"}
    conn = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri.request_uri)
    res = conn.request(req)
    binding.pry
    res.body
    # Nokogiri::XML res.body
    # binding.pry
  end

  def user_repositories
    uri = URI.parse("https://api.github.com/users/"+search_by+"/repos")
    #header = {"Content-Type"=> "application/json"}
    conn = Net::HTTP.new(uri.host, uri.port)
    req = Net::HTTP::Get.new(uri.request_uri)
    res = conn.request(req)
    res.body
    # Nokogiri::XML res.body
    # binding.pry
  end

  def search_by
  	(params.permit!)[:user_name]
  end

end
