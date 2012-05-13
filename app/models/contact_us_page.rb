class ContactUsPage < InfoPage
  belongs_to :website

  def title
    self[:title] || "Contact Us information"
  end

  def description
    self[:description] || "Contact us to the email address published here."
  end

  def file_name
    'ContactUs.html'
  end

end