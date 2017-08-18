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

  class API_G1 < Grape::API
    get :test_g do # De naam is hetzelfde als hieronder!
      "test g, eerste"  
    end
  end

  class API_G2 < Grape::API
    version '2', using: :param, parameter: 'v' # bereikbaar via /test_f?v=2
    get :test_g do # De naam is hetzelfde als hierboven en hieronder!
      "test g, tweede"  
    end
  end

  class API_G3 < Grape::API
    version '3', using: :param, parameter: 'v' # bereikbaar via /test_f?v=3
    get :test_g do # De naam is hetzelfde als hierboven!
      "test g, derde"  
    end
  end

  class API_H < Grape::API
    get :test_h do
      "test h"  
    end
  end

  class API_I1 < Grape::API
    get :test_i do
      "test i, eerste"  
    end
  end

  class API_I2 < Grape::API
    get :test_i do
      "test i, tweede"  
    end
  end

  class API3 < Grape::API
    format :json # json gebruiken voor alle
    mount Rene3::API_D # bereikbaar via /D/test_d, maar alleen als deze regel BOVEN onderstaande staat, anders geheel niet bereikbaar
    #
    version 'Rene3', using: :path
    mount Rene3::API_A # version 'Rene3', using: :path is in plaats van => '/Rene3' achter elke mount
    mount Rene3::API_B # version 'Rene3', using: :path is in plaats van => '/Rene3' achter elke mount
    mount Rene3::API_C => '/anders' # bereikbaar via /anders/Rene3/test_c, dus voegt version erachteraan
    #
    version 'E', using: :path 
    mount Rene3::API_E # bereikbaar via /E/test_e, dus de version door bovenstaande opnieuw ingesteld
    mount Rene3::API_F # niet bereikbaar via /E/test_f of /F/test_f, maar via /test_f?v=F, geen conflict. Ook bereikbaar via /test_f
    mount Rene3::API_G1 # bereikbaar via /E/test_g [pas op: accepteert bovendien daarachter elke ?(iets1)=(iets2)], dus niet bereikbaar via /test_g. 
    mount Rene3::API_G2 # niet bereikbaar via E/test_g door versioning using param. Bereikbaar via /test_g?v=2 en ook via /test_g, want eerste die dit claimt
    mount Rene3::API_G3 # niet bereikbaar via E/test_g door versioning using param. Bereikbaar via /test_g?v=3
    #
    version 'yolo', using: :param, parameter: 'version' # gebruik ?version=yolo
    mount Rene3::API_H # bereikbaar via /test_h en via alle combinaties /test_h?(iets1)=(iets2) behalve (iets1 == version, iets2 != yolo).
    #
    version 'first', using: :param, parameter: 'version' # gebruik /test_(iets)?version=first
    mount Rene3::API_I1 # bereikbaar via /test_i en via alle combinaties /test_i?(iets1)=(iets2) behalve (iets1 == version, iets2 != first).
    mount Rene3::API_I2 # zo niet bereikbaar
    #
    version 'second', using: :param, parameter: 'version'
    mount Rene3::API_I2 # uitsluitend bereikbaar via /test_i?version=second
  end

end
