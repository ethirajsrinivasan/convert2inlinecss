class PremailerController < ApplicationController
  require 'nokogumbo'
	def index
		@html = params[:html].presence
		@css = params[:css].presence
		if @html
			html_doc = Nokogiri::HTML5(@html)
			render text: "body tag not found" and return unless html_doc.at_css("body")
			style = Nokogiri::XML::Node.new "style", html_doc
			style.content = @css
			html_doc.at_css("body").add_next_sibling(style)
			@time = Benchmark.measure { @output = Premailer.new(html_doc.to_html, with_html_string:true).to_inline_css }
		end
	end
end
