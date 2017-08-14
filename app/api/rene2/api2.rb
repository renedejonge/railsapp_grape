module Rene2
  # class API < Grape::API
  #   format :json # zonder dit wordt xml gebruikt
  #   get :test do
  #     "Rene" # geeft foutmelding bij xml, maar niet bij json   
  #   end

  #   get :json do
  #     {
  #       "1": {
  #         "1.1": "eerste eerste",
  #         "1.2": "eerste tweede",
  #         "1.3": "eerste derde",
  #         "1.4": [
  #         {
  #         "1.4.1a": "eerste vierde a",
  #         "1.4.1b": "eerste vierde b"
  #         }],
  #         "1.5": [
  #         {
  #         "1.5.1a": "eerste vijfde eerste a",
  #         "1.5.1b": "eerste vijfde eerste b"
  #         },
  #         {
  #         "1.5.2a": "eerste vijfde tweede a",
  #         "1.5.2b": "eerste vijfde tweede b",
  #         "1.5.2c": "eerste vijfde tweede c"
  #         }],
  #         "1.6": "eerste zesde"
  #       }
  #     }
  #   end
  # end

  class APIv1 < Grape::API
    #format :json # zonder dit wordt xml gebruikt # verplaats naar class API voor de mount
    get :test do
      "Rene" # geeft foutmelding bij xml, maar niet bij json   
    end

    get :json do
      {
        "1": {
          "1.1": "eerste eerste",
          "1.2": "eerste tweede",
          "1.3": "eerste derde",
          "1.4": [
          {
          "1.4.1a": "eerste vierde a",
          "1.4.1b": "eerste vierde b"
          }],
          "1.5": [
          {
          "1.5.1a": "eerste vijfde eerste a",
          "1.5.1b": "eerste vijfde eerste b"
          },
          {
          "1.5.2a": "eerste vijfde tweede a",
          "1.5.2b": "eerste vijfde tweede b",
          "1.5.2c": "eerste vijfde tweede c"
          }],
          "1.6": "eerste zesde"
        }
      }
    end
  end

  class APIv2 < Grape::API
    #format :json # verplaats naar class API voor de mount
    get :test do
      "Test Grape Api via test"
    end

    get :test2 do
      "Test Grap Api via test2"
    end
  end

  # class API < Grape::API
  #   mount Rene::APIv1
  #   mount Rene::APIv2
  # end

  class API2 < Grape::API
   format :json # json gebruiken voor beide
    mount Rene2::APIv1 => '/v1' # get :test nu bereikbaar via /v1/test in plaats van /test
    mount Rene2::APIv2 # /test roept nu get :test aan van APIv2 en output dus "Test Grape Api via test"
  end

end
