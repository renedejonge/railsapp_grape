module Rene5

  class ZomaarEenNaamEerste < Grape::API # staat ook in module Rene4
    version 'v3', using: :accept_version_header
    get :zomaar do
      "nog zomaar even iets anders"
    end
  end

  # twee versies Rene4 en Rene5
  # versioning met :accept_version uitproberen
  # curl -H "Accept-Version:v1" http://localhost:3000/Rene4/zomaar
  
  class API < Grape::API # filenaam api.rb
    format :json
    mount Rene5::ZomaarEenNaamEerste
  end

end