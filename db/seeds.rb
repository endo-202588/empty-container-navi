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
