class HomeController < ApplicationController
  def index
  end

  def search
	@git_user = GitAccount.where(user_name: user_name.downcase).first

	if @git_user.present?
		
	else
		details = user_details
		if details["message"].present?
			error_message = "'#{user_name}' not exist in Gitlab "
		else
			repositories = user_repositories
			binding.pry
			@git_user = GitAccount.create(user_name: user_name.downcase, user_id: details["id"], profile_url: details["html_url"], location: details["location"])
			_rep = []
			binding.pry
			repositories.each do |repository|
				_rep << Repository.new( repository_url: repository["html_url"] )
			end
			@git_user.repositories << _rep if _rep.present?
			binding.pry
		end
	end

  end

  private

	def user_details
		result = HTTParty.get("https://api.github.com/users/#{user_name}")
		JSON.parse(result.response.body)
	end

	def user_repositories
		result = HTTParty.get("https://api.github.com/users/#{user_name}/repos")
		JSON.parse(result.response.body)
	end

	def user_name
		(params.permit!)[:user_name]
	end

end
