module Jekyll
  module GithubAvatar
    def avatar(username)
      def full_name
        require 'json'
        require 'net/http'
        JSON.parse(Net::HTTP.get URI('https://api.github.com/users/OrelSokolov'))["name"]
      end
      "<a href='https://github.com/#{username}' class='hint--left' data-hint='#{full_name}'>
        <img src='https://avatars.githubusercontent.com/#{username}' alt='#{username}'/>
      </a>"
    end
  end
end

Liquid::Template.register_filter(Jekyll::GithubAvatar)
