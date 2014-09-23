json.array!(@adress_informations) do |adress_information|
  json.extract! adress_information, :id, :adress, :postal_code, :cell_phone, :city
  json.url adress_information_url(adress_information, format: :json)
end
