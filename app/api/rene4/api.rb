module Rene4

  class ZomaarEenNaamEerste < Grape::API
    version 'v1', using: :accept_version_header
    get :zomaar do
      "zomaar iets"
    end
  end

  class ZomaarEenNaamTweede < Grape::API # staat normaal gesproken elders
    version 'v2', using: :accept_version_header
    get :zomaar do
      "zomaar iets anders"
    end
  end

  # twee versies
  # :accept_version uitproberen
  # curl -H "Accept-Version:v1" http://localhost:3000/Rene4/zomaar
  
  class API < Grape::API # filenaam api.rb
    format :json
    mount Rene4::ZomaarEenNaamEerste
    mount Rene4::ZomaarEenNaamTweede
  end

end