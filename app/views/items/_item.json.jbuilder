json.extract! item, :id, :nome, :preco, :quantidade, :created_at, :updated_at
json.url item_url(item, format: :json)
