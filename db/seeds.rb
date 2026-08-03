ports = {
  "東京" => [64.0, 68.9],
  "横浜" => [64.0, 72.4],
  "神戸" => [34.3, 74.5],
  "川崎" => [64.0, 70.7],
  "清水" => [55.7, 74.3],
  "大阪" => [38.0, 74.6],
  "博多" => [4.9, 82.0],
  "北九州" => [6.5, 80.3],
  "下関" => [8.7, 78.4],
  "名古屋" => [47.7, 72.1],
  "四日市" => [43.2, 73.7],
  "千葉" => [67.8, 69.7]
}

port_records = {}

ports.each do |name, (x, y)|
  port = Port.find_or_create_by!(name: name)

  port.update!(
    map_x: x,
    map_y: y
  )

  port_records[name] = port
end

one = Carrier.find_or_create_by!(name: "ONE")
msc = Carrier.find_or_create_by!(name: "MSC")
maersk = Carrier.find_or_create_by!(name: "Maersk")

ContainerStock.find_or_create_by!(
  port: port_records["東京"],
  carrier: one,
  container_type: :dry
) do |stock|
  stock.quantity = 100
end

ContainerStock.find_or_create_by!(
  port: port_records["東京"],
  carrier: msc,
  container_type: :dry
) do |stock|
  stock.quantity = 50
end

ContainerStock.find_or_create_by!(
  port: port_records["東京"],
  carrier: one,
  container_type: :reefer
) do |stock|
  stock.quantity = 20
end

ContainerStock.find_or_create_by!(
  port: port_records["横浜"],
  carrier: one,
  container_type: :dry
) do |stock|
  stock.quantity = 80
end

ContainerStock.find_or_create_by!(
  port: port_records["横浜"],
  carrier: maersk,
  container_type: :reefer
) do |stock|
  stock.quantity = 30
end
