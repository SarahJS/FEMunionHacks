class PagesController < ApplicationController

	def show
		render template: "pages/#{params[:page]}"
	end

	def hmc_title_ix
		require 'open-uri'
		require 'openssl'
		doc = Nokogiri::HTML(open('https://www.hmc.edu/student-life/title-ix-sexual-misconduct/', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

		entries = doc.css('.collapsible-content')
		@coordinator = entries.css('table')[0].css('h3')[0].text
		@email = entries.css('table')[0].css('a')[1].text
		@phone = entries.css('table')[0].css('a')[0].text
		puts @coordinator
		puts @email
		puts @phone
		render template: '/pages/hmc_resource'

		# doc = Nokogiri::HTML(open('https://www.abokifx.com/bdc_rate', :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

	   #  entries = doc.css('.lagos-market-rates')
	   #  rate = entries.css('table')[0].css('tr')[1].css('td')[1].text
	   #  @formattedrate = rate[6..8]
	end

end
