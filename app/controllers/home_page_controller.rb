class HomePageController < ApplicationController
  active_scaffold :home_pages do |config|
    config.sti_children = STI_CHILDREN
  end
end