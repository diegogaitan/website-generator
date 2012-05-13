class InfoPageController < ApplicationController
  active_scaffold :info_pages do |config|
    config.sti_children = STI_CHILDREN
  end
end
