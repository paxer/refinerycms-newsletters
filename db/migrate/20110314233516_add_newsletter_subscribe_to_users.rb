class AddNewsletterSubscribeToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :newsletter_subscribe, :boolean
  end

  def self.down
    remove_column :users, :newsletter_subscribe
  end
end
