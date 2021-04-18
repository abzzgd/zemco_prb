json.extract! product, :id, :title, :amount, :code, :category, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
