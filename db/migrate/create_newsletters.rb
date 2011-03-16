class CreateNewsletters < ActiveRecord::Migration

  def self.up
    create_table :newsletters do |t|
      t.string :title
      t.string :email_from
      t.text :email_body
      t.integer :emails_sent
      t.integer :emails_opened
      t.integer :unsubscribed
      t.integer :position

      t.timestamps
    end

    add_index :newsletters, :id

    load(Rails.root.join('db', 'seeds', 'newsletters.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "newsletters"})

    Page.delete_all({:link_url => "/newsletters"})

    drop_table :newsletters
  end

end
