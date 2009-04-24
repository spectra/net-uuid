# net_uuid.rb
#
# Get a string UUID (aka GUID) from http://uuidgen.com
# Copyright (c) 2009 by Pablo Lorenzoni <pablo@propus.com.br>
# Released under the following terms:
#
# ----------------------------------------------------------------------
# "THE BEER-WARE LICENSE" (Revision 43):
# <pablo@propus.com.br> wrote this file and it's provided AS-IS, no
# warranties. As long as you retain this notice you can do whatever you
# want with this stuff. If we meet some day, and you think this stuff is
# worth it, you can buy me a beer in return."
# ----------------------------------------------------------------------

require 'open-uri'

class UUID
	private_class_method :new
	RANDOM_URI="http://uuidgen.com/r"
	TIME_URI="http://uuidgen.com/t"

	class << self
		def get_guid(url)
			guid = nil
			open(url) do |f|
				guid = f.read
			end
			return guid
		end
		private :get_guid

		def create_v1
			return get_guid(TIME_URI)
		end

		def create_v4
			return get_guid(RANDOM_URI)
		end
	end

end
