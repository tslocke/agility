source "http://rubygems.org"

# explicit requires
gem "rails", "= 2.2.2"
gem "bluecloth", "= 2.0.7"
gem "RedCloth", "= 4.2.2", :require => "redcloth"
gem "sqlite3-ruby", "= 1.2.5", :require => "sqlite3"
gem "mongrel", "= 1.1.5"      # to prevent this bug:  http://www.ruby-forum.com/topic/206225
group :test do
  gem "webrat", "= 0.7.0"
end


# the following requirements are implied by the above requires, but we specify them to lock down older versions for testing.
gem "will_paginate", "= 2.3.12"

group :test do
  # rails 2.2.2 doesn't require rack, but webrat does
  gem "rack", "= 1.0.1"
end



# Note:  put your working repository here instead of github, and then type "bundle update hobo".   For example
# gem "hobo", :git => "/work/hobo", :branch => "master"
gem "hobo", :git => "git://github.com/tablatom/hobo.git", :branch => "1-0-stable"
