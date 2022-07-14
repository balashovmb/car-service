class Order::Arrange < Service
  SORT_TYPES = {
    'date_asc' => 'orders.created_at asc',
    'date_desc' => 'orders.created_at desc',
    'customers_asc' => 'customer asc',
    'customers_desc' => 'customer desc',
    'executors_asc' => 'executors.name asc',
    'executors_desc' => 'executors.name desc',
    'service_units_asc' => 'service_units.name asc',
    'service_units_desc' => 'service_units.name desc',
    'service_categories_asc' => 'service_categories.name asc',
    'service_categories_desc' => 'service_categories.name desc'
  }.freeze

  def initialize(params)
    @params = params
  end

  def call
    orders = Order.includes(order_positions: [:executor, { service_unit: :service_category }])

    customers = params['customers']&.compact_blank
    orders = orders.where(customer: customers) if customers&.any?

    executors = params['executors']&.compact_blank
    orders = orders.where(order_positions: { executors: executors }) if executors&.any?

    service_units = params['service_units']&.compact_blank
    orders = orders.where(order_positions: { service_units: service_units }) if service_units&.any?

    service_categories = params['service_categories']&.compact_blank
    if service_categories&.any?
      orders = orders.where(order_positions: { service_units: { service_categories: service_categories } })
    end

    sort_by = SORT_TYPES[params['sort_by']]
    return orders unless sort_by

    orders.order(sort_by)
  end

  private

  attr_reader :params
end
