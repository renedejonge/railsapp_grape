module Rene3
  class API_A < Grape::API
    get :test do # ook module Rene2 bevat deze nog, moet deze bereikbaar houden, bijvoorbeeld via path
      "Rene3"   
    end
    get :test_a do
      "test a"
    end
  end

  class API_B < Grape::API
    get :test_b do
      "test b"  
    end
  end

  class API_C < Grape::API
    get :test_c do
      "test c"  
    end
  end

  class API_D < Grape::API
    version 'D', using: :path # gebruik een ander pad
    get :test_d do
      "test d"  
    end
  end

  class API_E < Grape::API
    get :test_e do
      "test e"  
    end
  end

  class API_F < Grape::API
    version 'F', using: :param, parameter: 'v' # bereikbaar via /test_f?v=F
    get :test_f do
      "test f"  
    end
  end

  class API_G < Grape::API
    get :test_g do
      "test g"  
    end
  end

  class API_H < Grape::API
    get :test_h do
      "test h"  
    end
  end

  class API3 < Grape::API
    format :json # json gebruiken voor alle
    mount Rene3::API_D # bereikbaar via /D/test_d, maar alleen als deze regel BOVEN onderstaande staat, anders geheel niet beschikbaar
    #
    version 'Rene3', using: :path
    mount Rene3::API_A # version 'Rene3', using: :path is in plaats van => '/Rene3' achter elke mount
    mount Rene3::API_B # version 'Rene3', using: :path is in plaats van => '/Rene3' achter elke mount
    mount Rene3::API_C => '/anders' # bereikbaar via /anders/Rene3/test_c, dus voegt version erachteraan
    #
    version 'E', using: :path 
    mount Rene3::API_E # bereikbaar via /E/test_e, dus de version door bovenstaande opnieuw ingesteld
    #
    mount Rene3::API_F # niet bereikbaar via /E/test_f of /F/test_f, maar via /test_f?v=F, geen conflict
    #
    version 'yolo', using: :param, parameter: 'version' # bereikbaar via /test_f?version=yolo
    mount Rene3::API_G
    mount Rene3::API_H

  end

end
