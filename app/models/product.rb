class ProductAvailability < Trailblazer::Operation
  step :read_params
  step :fetch_product_and_location_details
  step :calculate_availability
  step :persist_and_build_output
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