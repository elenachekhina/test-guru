# frozen_string_literal: true

module ApplicationHelper
  def cur_year
    Time.current.year
  end

  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: :_blank, rel: :noopener
  end

  def navigation
    if logged_in?
      link_to 'TestGuru', tests_path
      content_tag :p, "Welcome, #{current_user.name} Guru"
      button_to 'Exit', logout_path
    else
      link_to 'TestGuru', login_path
      button_to 'Sign up', signup_path, method: :get
    end
  end
end
