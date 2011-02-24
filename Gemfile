source "http://rubygems.org"

# this section of the Gemfile is patched by the rails patches

# for rails 2.2.2 we'll lock down some older versions just to widen our test
gem "rails", "= 2.2.2"
gem "mongrel", "= 1.1.5"      # to prevent this bug:  http://www.ruby-forum.com/topic/206225
gem "bluecloth", "= 2.0.1"
gem "RedCloth", "= 4.1.1", :require => "redcloth"
group :test do
  gem "webrat", "= 0.7.0"
  # rails 2.2.2 doesn't require rack, but webrat does
  gem "rack", "= 1.0.1"
end
gem "will_paginate", "= 2.3.12"
sql_version="= 1.2.5"
mysql_specs=["mysql", "= 2.8.1"]




# this section of the Gemfile is patched by the database patches
gem "sqlite3-ruby", sql_version, :require => "sqlite3"




# Note:  put your working repository here instead of github, and then type "bundle update hobo".   For example
# gem "hobo", :git => "/work/hobo",
gem "hobo", :git => "git://github.com/tablatom/hobo.git",




# this section of the Gemfile is patched by the Hobo patches
:branch => "1-0-stable"




