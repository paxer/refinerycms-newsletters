module NewsletterHelper

  def get_subscribers
    User.where("newsletter_subscribe = ?", true)
  end

  def send_newsletter(newsletter)

    number_of_sent_email = 0

    get_subscribers.each do |user|
      begin
        NewsletterMailer.newsletter_email(user,newsletter).deliver
        number_of_sent_email = number_of_sent_email + 1
      rescue
        logger.warn "There was an error delivering an newsletter .\n#{$!}\n"
      end
    end
    
    n = Newsletter.find(newsletter)
    n.emails_sent = number_of_sent_email
    n.save

  end

end