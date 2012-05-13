class Page < ActiveRecord::Base
  belongs_to :website

  def the_keyword
    main_keyword.titleize
  end

  def file_name
    "#{the_keyword.gsub(/\s/, '')}.#{page_extension}"
  end

  def php_plugin_code
    "<?php require_once('./phpzon/phpzon.php'); phpZonAPI('#{main_keyword}', '8'); ?>"
  end

  def file_name_absolute_path
    website.local_absolute_path + '/' + file_name
  end

  def page_extension
    'php'
  end

end
