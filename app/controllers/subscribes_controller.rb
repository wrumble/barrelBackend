class SubscribesController < ApplicationController
  respond_to :json

  def create
    ActiveRecord::Base.connection_pool.with_connection do
      mailchimp_list_id = Rails.application.secrets.mailchimp_list_id
      gibbon = Gibbon::Request.new
      signUpAsynchronously gibbon
    end
  end

  def signUpAsynchronously gibbon
    begin
      gibbon.lists("f8c4cbe947").members.create(body: {status: "subscribed",email_address: params[:email], merge_fields: {FNAME: "Wayne test", LNAME: "Rumble test"}})
    rescue Gibbon::MailChimpError => e
      puts "Houston, we have a problem: #{e.message} - #{e.raw_body}"
    end
  end
end
