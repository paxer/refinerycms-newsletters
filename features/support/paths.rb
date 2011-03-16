module NavigationHelpers
  module Refinery
    module Newsletters
      def path_to(page_name)
        case page_name
        when /the list of newsletters/
          admin_newsletters_path

         when /the new newsletter form/
          new_admin_newsletter_path
        else
          nil
        end
      end
    end
  end
end
