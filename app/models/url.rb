class Url < ActiveRecord::Base
	validates :long_url, presence: true
	validates :short_url, presence: true, on: :create
	validates :long_url, format: {with: (URI::regexp(['http', 'https']))}

	def self.retrieve_short_url(long_url)
		url = Url.find_by_long_url(long_url)
		return url ? url.short_url : nil
	end
end
