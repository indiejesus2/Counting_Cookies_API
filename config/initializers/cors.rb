Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins 'localhost:3000', 'counting-cookies.herokuapp.com'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete, :options], credentials: true
    end
  end