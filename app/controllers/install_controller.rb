class InstallController < ApplicationController
  def index
    logger.debug("*** ID: #{params[:id]}")
    
    render :json => {
      :name => 'mycoolstore',
      :domain => 'whatever.mybrowserbuddy.com',
      :id => 127,
      :logo => 'http://somewhere.com/on/the/web/file.jpg',
      :primary_color => '#000000',
      :secondary_color => '#FFFFFF'
    }
  end
end