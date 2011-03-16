class NewslettersController < ApplicationController

  before_filter :find_all_newsletters
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsletter in the line below:
    present(@page)
  end

  def show
    @newsletter = Newsletter.find(params[:id])

    render :text => @newsletter.email_body
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @newsletter in the line below:
    #present(@page)
  end

  def unsubscribe

    user_email = params[:email]
    unless user_email.blank?
      user = User.find_by_email(user_email)
      unless user.nil?
        user.newsletter_subscribe = false
        user.save
        # lets just increase unsubscribed field for the last newsletter (we SUM for all of them to get statistic)
        # later if needed we can add statistic for particular newsletter by adding newsletter id to url
        news_letter = Newsletter.last
        unsubscribed = news_letter.unsubscribed
        unless unsubscribed.blank?
          unsubscribed = unsubscribed + 1
          news_letter.unsubscribed = unsubscribed
        else
          news_letter.unsubscribed = 1
        end
        news_letter.save
      end
    end

  end

protected

  def find_all_newsletters
    @newsletters = Newsletter.find(:all, :order => "position ASC")
  end

  def find_page
    @page = Page.find_by_link_url("/newsletters")
  end

end
