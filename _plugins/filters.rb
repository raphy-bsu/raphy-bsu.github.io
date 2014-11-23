require 'redis'
require 'open-uri'
require 'nokogiri'

require_relative 'cache'

module Jekyll
  module GithubAvatar
    def avatar(username)
      def full_name username
        page = Nokogiri::HTML(open("https://github.com/#{username}"))
        page.css('.vcard-fullname').first.text
      end

      def html username, full_name
        "<a href='https://github.com/#{username}' class='hint--left' data-hint='#{full_name}'>
          <img src='https://avatars.githubusercontent.com/#{username}' alt='#{username}'/>
        </a>"
      end

      f_name = lazy("username-#{username}") { full_name(username) }
      html username, f_name
    end
  end
end

Liquid::Template.register_filter(Jekyll::GithubAvatar)
