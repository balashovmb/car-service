module ApplicationHelper
  def sort_types
    [
      ['От старых к новым', :date_asc],
      ['От новых к старым', :date_desc],
      ['Имя клиента: А..Я', :customers_asc],
      ['Имя клиента: Я..А', :customers_desc],
      ['Имя исполнителя: А..Я', :executors_asc],
      ['Имя исполнителя: Я..А', :executors_desc],
      ['Услуга: А..Я', :service_units_asc],
      ['Услуга: Я..А', :service_units_desc],
      ['Категория услуги: А..Я', :service_categories_asc],
      ['Категория услуги: Я..А', :service_categories_desc]
    ]
  end
end

