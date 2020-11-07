class RecalculateAvailabilityJob < ApplicationJob
  def perform(id)
    ProductAvailability.call product_id: id
  end
end