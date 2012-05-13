class PageController < ApplicationController
  active_scaffold :pages do |config|
    config.sti_children = STI_CHILDREN
  end
end