require 'uri'
class Shorturl < ActiveRecord::Base
    validates_format_of :long_url, :with => URI.regexp
end
