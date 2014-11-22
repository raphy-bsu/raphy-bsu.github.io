require 'redis'

module Jekyll
  module GithubAvatar
    def avatar(username)
      def full_name username
        require 'json'
        require 'net/http'
        JSON.parse(Net::HTTP.get URI("https://api.github.com/users/#{username}"))["name"]
      end

      def html username, full_name
        "<a href='https://github.com/#{username}' class='hint--left' data-hint='#{full_name}'>
          <img src='https://avatars.githubusercontent.com/#{username}' alt='#{username}'/>
        </a>"
      end

      redis = Redis.new
      f_name = redis.exists(username) ? redis.get(username) : full_name(username)
      html username, f_name
    end
  end
end

Liquid::Template.register_filter(Jekyll::GithubAvatar)
