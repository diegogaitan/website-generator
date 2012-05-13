class InfoPage < Page
  belongs_to :website

  def main_keyword
    website.home_page.main_keyword
  end

  def keyword2
    website.home_page.keyword2
  end

  def keyword3
    website.home_page.keyword3
  end

  def page_extension
    'html'
  end

end