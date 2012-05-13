class PrivacyPolicyPage < InfoPage
  belongs_to :website

  def title
    self[:title] || "Privacy Policy"
  end

  def description
    self[:description] || "Please read our privacy policy to the fullest."
  end

  def file_name
    'PrivacyPolicy.html'
  end
end