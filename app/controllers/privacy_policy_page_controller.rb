class PrivacyPolicyPageController < ApplicationController
  active_scaffold :privacy_policy_pages do |config|
    config.sti_children = STI_CHILDREN
  end
end