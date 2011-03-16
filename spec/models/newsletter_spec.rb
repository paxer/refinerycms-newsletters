require 'spec_helper'

describe Newsletter do

  def reset_newsletter(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @newsletter.destroy! if @newsletter
    @newsletter = Newsletter.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_newsletter
  end

  context "validations" do
    
    it "rejects empty title" do
      Newsletter.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_newsletter
      Newsletter.new(@valid_attributes).should_not be_valid
    end
    
  end

end