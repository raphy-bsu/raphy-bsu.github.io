require 'colorize'

def lazy(key_orig, &block)
  redis = Redis.new
  key = "raphy-bsu-site-#{key_orig}"
  if redis.exists(key) && !redis.get(key).empty?
    puts "Using cache for #{key_orig}".green
    redis.get(key)
  else
    puts "Calculating value for: #{key_orig}".yellow
    redis.set key, block.call
  end
end
