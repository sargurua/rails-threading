class ProductAvailability < Trailblazer::Operation
  step :read_params
  step :fetch_product_and_location_details
  step :calculate_availability
  step :persist_and_build_output
  after_commit :recalculate_availability
  after_commit :send_mail_on_banned
  
  def send_mail_on_banned
    mail_ids = JSON.parse(ENV['BANNED_PRODUCT_MAIL_IDS'])
    BannedProductMailer.send_mail(name: name, email_id:) \
          if banned_previously_changed? && banned_previous_change[1]
  end

  def recalculate_availability
    RecalculateAvailabilityJob.perform_later id \
                     if discontinued_previously_changed?

  def read_params(options)
    # logic to read the product and location id params passed 
      #if params not passed, return false (this will exit the concept and return to the caller)
  end
  def fetch_product_and_location_details(options)
    # hit db/cache to fetch location and product details
  end
  def calculate_availability(options)
    # logic to calculate availability for a product-location
  end
  def persist_and_build_output(options) 
    # store the availability calculated and return the response
  end 
end