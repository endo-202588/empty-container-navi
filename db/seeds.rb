Port.find_or_create_by!(name: "東京港")
Port.find_or_create_by!(name: "川崎港")
Port.find_or_create_by!(name: "横浜港")
Port.find_or_create_by!(name: "神戸港")

Carrier.find_or_create_by!(name: "ONE")
Carrier.find_or_create_by!(name: "MSC")
Carrier.find_or_create_by!(name: "Maersk")

tokyo = Port.find_or_create_by!(name: "東京港")
tokyo.update!(map_x: 59, map_y: 68)

kawasaki = Port.find_or_create_by!(name: "川崎港")
kawasaki.update!(map_x: 59, map_y: 69.5)

yokohama = Port.find_or_create_by!(name: "横浜港")
yokohama.update!(map_x: 59, map_y: 71)

kobe = Port.find_or_create_by!(name: "神戸港")
kobe.update!(map_x: 40, map_y: 73)

one = Carrier.find_by!(name: "ONE")
msc = Carrier.find_by!(name: "MSC")
maersk = Carrier.find_by!(name: "Maersk")

ContainerStock.find_or_create_by!(
  port: tokyo,
  carrier: one,
  container_type: :dry
) do |stock|
  stock.quantity = 100
end

ContainerStock.find_or_create_by!(
  port: tokyo,
  carrier: msc,
  container_type: :dry
) do |stock|
  stock.quantity = 50
end

ContainerStock.find_or_create_by!(
  port: tokyo,
  carrier: one,
  container_type: :reefer
) do |stock|
  stock.quantity = 20
end

ContainerStock.find_or_create_by!(
  port: yokohama,
  carrier: one,
  container_type: :dry
) do |stock|
  stock.quantity = 80
end

ContainerStock.find_or_create_by!(
  port: yokohama,
  carrier: maersk,
  container_type: :reefer
) do |stock|
  stock.quantity = 30
end
