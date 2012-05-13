class InnerPageController < ApplicationController
  active_scaffold :inner_pages do |config|
    config.sti_children = STI_CHILDREN
  end
end