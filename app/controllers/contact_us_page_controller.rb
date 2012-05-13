class ContactUsPageController < ApplicationController
  active_scaffold :contact_us_pages do |config|
    config.sti_children = STI_CHILDREN
  end
end