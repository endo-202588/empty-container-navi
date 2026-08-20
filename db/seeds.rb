# ========================================
# Port
# ========================================

ports = {
  "東京"   => [ 64.0, 68.9 ],
  "横浜"   => [ 64.0, 72.4 ],
  "神戸"   => [ 34.3, 74.5 ],
  "川崎"   => [ 64.0, 70.7 ],
  "清水"   => [ 55.7, 74.3 ],
  "大阪"   => [ 38.0, 74.6 ],
  "博多"   => [ 4.9, 82.0 ],
  "北九州" => [ 6.5, 80.3 ],
  "下関"   => [ 8.7, 78.4 ],
  "名古屋" => [ 47.7, 72.1 ],
  "四日市" => [ 43.2, 73.7 ],
  "千葉"   => [ 67.8, 69.7 ]
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


# ========================================
# Carrier
# ========================================

one = Carrier.find_or_create_by!(name: "ONE")
msc = Carrier.find_or_create_by!(name: "MSC")
maersk = Carrier.find_or_create_by!(name: "Maersk")


# ========================================
# ContainerStock
# ========================================

stocks = [
  [ "東京", one, :dry, 100 ],
  [ "東京", msc, :dry, 50 ],
  [ "東京", one, :reefer, 20 ],
  [ "横浜", one, :dry, 80 ],
  [ "横浜", maersk, :reefer, 30 ]
]

stocks.each do |port_name, carrier, container_type, quantity|
  stock = ContainerStock.find_or_create_by!(
    port: port_records[port_name],
    carrier: carrier,
    container_type: container_type
  )

  stock.update!(
    quantity: quantity
  )
end


# ========================================
# Route
# ========================================

routes = [
  # 関東発
  [ "東京", "横浜" ],
  [ "東京", "名古屋" ],
  [ "東京", "大阪" ],
  [ "東京", "神戸" ],
  [ "東京", "博多" ],
  [ "東京", "北九州" ],

  [ "横浜", "清水" ],
  [ "横浜", "名古屋" ],
  [ "横浜", "大阪" ],
  [ "横浜", "神戸" ],
  [ "横浜", "博多" ],

  [ "千葉", "横浜" ],
  [ "千葉", "名古屋" ],
  [ "千葉", "大阪" ],
  [ "千葉", "神戸" ],

  [ "川崎", "横浜" ],
  [ "川崎", "名古屋" ],
  [ "川崎", "大阪" ],
  [ "川崎", "神戸" ],

  # 中部発
  [ "清水", "名古屋" ],
  [ "清水", "大阪" ],
  [ "清水", "神戸" ],
  [ "清水", "博多" ],

  [ "名古屋", "四日市" ],
  [ "名古屋", "大阪" ],
  [ "名古屋", "神戸" ],
  [ "名古屋", "博多" ],
  [ "名古屋", "北九州" ],

  [ "四日市", "大阪" ],
  [ "四日市", "神戸" ],
  [ "四日市", "博多" ],

  # 関西発
  [ "大阪", "神戸" ],
  [ "大阪", "博多" ],
  [ "大阪", "北九州" ],
  [ "大阪", "下関" ],

  [ "神戸", "博多" ],
  [ "神戸", "北九州" ],
  [ "神戸", "下関" ],

  # 九州・中国地方
  [ "博多", "北九州" ],
  [ "博多", "下関" ],
  [ "北九州", "下関" ]
]

routes.each do |departure_name, arrival_name|
  Route.find_or_create_by!(
    departure_port: port_records[departure_name],
    arrival_port: port_records[arrival_name]
  )
end
