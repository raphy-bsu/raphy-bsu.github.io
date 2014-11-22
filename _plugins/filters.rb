require 'redis'
require 'open-uri'
require 'nokogiri'

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

      redis = Redis.new
      key = "raphy-bsu-site-#{username}"
      f_name = redis.exists(key) && !redis.get(key).empty? ? redis.get(key) : full_name(username)
      puts "Full name for: #{username} is #{f_name}"
      redis.set key, f_name
      html username, f_name
    end
  end
end

Liquid::Template.register_filter(Jekyll::GithubAvatar)
