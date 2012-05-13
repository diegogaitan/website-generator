class Website < ActiveRecord::Base
  include ERB::Util
  
  has_many :pages
  has_many :inner_pages
  has_many :info_pages
  has_one :home_page
  has_one :contact_us_page
  has_one :privacy_policy_page

  after_create :add_contact_us_page
  after_create :add_privacy_policy_page

  def full_address
    "http://www.#{domain}"
  end

  def no_http_full_address
    "www.#{domain}"
  end

  def local_absolute_path
    SITES_ROOT + domain
  end

  def generate
    generate_inner_pages
    generate_contact_us_page
    generate_privacy_policy_page
    copy_css
    copy_dirs
  end

  private

  def generate_inner_pages
    erb_template = read_template(MAIN_TEMPLATE)
    create_site_folder

    for page in inner_pages + [home_page]
      inject_content_to_template(page)
      create_page_file(page.file_name_absolute_path, erb_template.result(get_binding))
    end
  end

  def generate_contact_us_page
    erb_template = read_template(CONTACT_US_TEMPLATE)
    contact_us = contact_us_page

    inject_content_to_template(contact_us)
    create_page_file(contact_us.file_name_absolute_path, erb_template.result(get_binding))
  end

  def generate_privacy_policy_page
    erb_template = read_template(PRIVACY_POLICY_TEMPLATE)
    privacy_policy = privacy_policy_page
    
    inject_content_to_template(privacy_policy) 
    create_page_file(privacy_policy.file_name_absolute_path, erb_template.result(get_binding))
  end

  def read_template(template_name)
    ERB.new(File.read(template_name))
  end

  def inject_content_to_template(current_page)
    main_page = home_page
    other_pages = inner_pages

    @page_inner_html_values = {
      '#mainHeader' => current_page.the_keyword,
      '#secondHeader' => "Find The Best Options On #{main_page.the_keyword}",
      '#anchorTextPage1' => main_page.the_keyword,
      '#anchorTextPage2' => other_pages[0].the_keyword,
      '#anchorTextPage3' => other_pages[1].the_keyword,
      '#anchorTextPage4' => other_pages[2].the_keyword,
      '#anchorTextPage5' => other_pages[3].the_keyword,

      '#aSidePage1' => main_page.the_keyword,
      '#aSidePage4' => other_pages[2].the_keyword,

      '#anchorTextBottomPage1' => main_page.the_keyword,

      '#websiteName' => full_address
    }
    @page_inner_html_values.merge!({ '#anchorTextPage6' => other_pages[4].the_keyword }) if other_pages[4]  # Additional inner page

    case current_page
    when InnerPage, HomePage
      @page_inner_html_values.merge!({
        '#h2Header' => "#{current_page.the_keyword} - Products and Accesories",
        '#firstParagraph' => current_page.first_paragraph,
        '#secondParagraph' => current_page.second_paragraph,
        '#pageContent' => current_page.php_plugin_code,
      })

    when PrivacyPolicyPage
      website_address = no_http_full_address

      9.times do |i|
        @page_inner_html_values.merge!({
            "#website#{i + 1}" => website_address
        })

      end
    end

    @page_anchor_hrefs = {
      '#aPage1' => main_page.file_name,
      '#aPage2' => other_pages[0].file_name,
      '#aPage3' => other_pages[1].file_name,
      '#aPage4' => other_pages[2].file_name,
      '#aPage5' => other_pages[3].file_name,

      '#aSidePage1' => main_page.file_name,
      '#aSidePage4' => other_pages[2].file_name,

      '#aBottomPage1' => main_page.file_name,

      '#websiteName' => full_address
    }
    @page_anchor_hrefs.merge!({ '#aPage6' => other_pages[4].file_name }) if other_pages[4] # Additional inner page

    main_keyword = current_page.main_keyword

    @page_images = {
      '#image1' => { 'src' => 'images/image1.jpg', 'alt' => main_keyword },
      '#image2' => { 'src' => 'images/image2.jpg', 'alt' => main_keyword },
      '#image3' => { 'src' => 'images/image3.jpg', 'alt' => main_keyword },
      '#image4' => { 'src' => 'images/image4.jpg', 'alt' => main_keyword }
    }

    #update_inner_html_values(doc, page_inner_html_values)
    #update_anchor_hrefs(doc, page_anchor_hrefs)
    #update_image_tags(doc, page_images)
    #update_title_and_description(doc, current_page.title, current_page.description)
    @title = current_page.title
    @description = current_page.description
  end

  def update_inner_html_values(doc, page_inner_html_values)
    for span_id, value in page_inner_html_values
      node = doc.search(span_id).first
      if span_id == '#pageContent'
        node.content = value
      else # php code for amazon products
        node.inner_html = value
      end
    end
  end

  def update_anchor_hrefs(doc, page_anchor_hrefs)
    for anchor_id, value in page_anchor_hrefs
      doc.search(anchor_id).first['href'] = value
    end
  end

  def update_image_tags(doc, page_images)
    for image_id, image_attributes in page_images
      img = doc.search(image_id).first

      for attribute_name, value in image_attributes
        img[attribute_name] = value
      end
    end
  end

  def update_title_and_description(doc, title, description)
    doc.xpath('/html/head/title').first.inner_html = title
    doc.xpath('/html/head/meta').last['content'] = description
  end

  def create_page_file(file_name, content)
    File.open(file_name, 'w') {|f| f.write(content)}
  end

  def create_site_folder
    dir_path = local_absolute_path
    FileUtils.mkdir(dir_path) unless File.exist?(dir_path)
  end

  def add_contact_us_page
    self.contact_us_page = ContactUsPage.new
    self.save
  end

  def add_privacy_policy_page
    self.privacy_policy_page = PrivacyPolicyPage.new
    self.save
  end

  def copy_css
    FileUtils.copy(TEMPLATES_PATH + 'xsp_styles.css', local_absolute_path)
  end

  def copy_dirs
    dest = local_absolute_path
    FileUtils.cp_r(SITES_ROOT + 'images', dest)
    FileUtils.cp_r(SITES_ROOT + 'phpzon', dest)
  end

  def get_binding
    binding
  end

end
