json.array!(@bank_informations) do |bank_information|
  json.extract! bank_information, :id, :bank_name, :bank_account
  json.url bank_information_url(bank_information, format: :json)
end
