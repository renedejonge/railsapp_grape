module Rene
  class API < Grape::API
    get :test do
      "Rene"
    end
  end
end
