# frozen_string_literal: true

module ApplicationHelper
  def cur_year
    Time.current.year
  end

  def github_url(author:, repo:, title:)
    link_to title, "https://github.com/#{author}/#{repo}", target: :_blank, rel: :noopener
  end
end
