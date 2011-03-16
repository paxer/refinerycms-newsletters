require 'refinery'
module Refinery
  module Newsletters

    class Engine < Rails::Engine
      initializer "static assets" do |app|
        app.middleware.insert_after ::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public"
      end

      initializer 'newsletter.helper' do |app|
        ActionView::Base.send :include, NewsletterHelper
        ActionController::Base.send :include, NewsletterHelper
      end

      config.after_initialize do
        Refinery::Plugin.register do |plugin|
          plugin.name = "newsletters"
          plugin.activity = {
            :class => Newsletter}
        end
      end
    end
  end
end
