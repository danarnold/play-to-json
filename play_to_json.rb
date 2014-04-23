#!/usr/bin/env ruby

# play_to_json.rb : parse a google play cards page, exporting JSON.
# Copyright (C) 2014 Daniel Arnold
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'nokogiri'
require 'json'

PAGE_PATH = ARGV[0]

file = File.open(PAGE_PATH)
page = Nokogiri::HTML(file)
apps = {}

page.css('div.details').each do |details|
  title = details.css('a.title')[0]
  app_name = title.attributes['title'].value
  app_url = "http://play.google.com#{title.attributes['href'].value}"
  apps[app_name] = app_url
end

puts JSON.pretty_generate(apps)

file.close
