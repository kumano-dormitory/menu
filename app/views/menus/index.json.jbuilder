json.array!(@menus) do |menu|
  json.extract! menu, :id, :day, :lunch1, :lunch2, :dinner
  json.url menu_url(menu, format: :json)
end
