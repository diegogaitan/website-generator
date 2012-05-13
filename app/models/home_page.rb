class HomePage < Page
  belongs_to :website

  def file_name
    "index.#{page_extension}"
  end

end
