# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

executors = [
  'Андрей Иванов',
  'Пётр Сергеев',
  'Василий Петров'
]

executors.each do |e|
  Executor.create(name: e)
end

categories = %w[
  Электрика
  Покраска
  Ходовая
]

categories.each do |c|
  ServiceCategory.create(name: c)
end

unit_groups = [
  [
    'Замена лампы в фаре',
    'Замена предохранителя',
    'Установка сигнализации'
  ],
  [
    'Покраска двери',
    'Покраска бампера',
    'Покраска крыла'
  ],
  [
    'Замена амортизатора',
    'Замена шаровой опоры',
    'Замена сайлентблока'
  ]
]

unit_groups.each_with_index do |group, i|
  group.each do |unit|
    ServiceUnit.create(service_category_id: (i + 1), name: unit)
  end
end

customers = [
  'Билл Гейтс',
  'Илон Маск',
  'Виталик Бутерин',
  'Лиза Су'
]

def random_in_array(arr)
  arr[rand(arr.length)]
end

50.times do |i|
  Order.create(customer: random_in_array(customers), created_at: DateTime.now - i)
end

Order.all.each_with_index do |_, i|
  OrderPosition.create(
    executor_id: rand(executors.length) + 1,
    service_unit_id: rand(unit_groups.flatten.length) + 1,
    order_id: i + 1
  )
end
