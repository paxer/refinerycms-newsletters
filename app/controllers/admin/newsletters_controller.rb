module Admin
  class NewslettersController < Admin::BaseController
    crudify :newsletter

    def index
      search_all_newsletters if searching?
      paginate_all_newsletters

      render :partial => 'newsletters' if request.xhr?
    end


    def create
      @newsletter = Newsletter.create(params[:newsletter])

      unless params[:insert]
        if @newsletter

          if @newsletter.valid?
            # this actually should be a delayed job, but as far as client do not expect a huge amount of subscribers
            # and don't want to pay additional cost for Worker on Heroku we will leave it like this for now
            send_newsletter(@newsletter)
          else
            return render :action => 'new'
          end

          flash.notice = t('created', :scope => 'refinery.crudify', :what => "#{@newsletter.title}")
          unless from_dialog?
            redirect_to :action => 'index'
          else
            render :text => "<script>parent.window.location = '#{admin_newsletters_url}';</script>"
          end
        else
          self.new # important for dialogs
          render :action => 'new'
        end
      else
        if @newsletter
          @newsletter_id = @newsletter.detect(&:persisted?).id
          @newsletter = nil
        end

        insert
      end
    end

  end
end