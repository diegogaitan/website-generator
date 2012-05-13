module Nokogiri
  module XML
    class Node
      # Redefine the content= method to inject php code into the template
      # avoiding character escaping used by the original content= method
      def content= string_content
        RAILS_DEFAULT_LOGGER.debug("AGAIN!!!")
        self.native_content = string_content
      end
    end
  end
end