module Rene
  class API < Grape::API
    format :json # zonder dit wordt xml gebruikt
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
end
