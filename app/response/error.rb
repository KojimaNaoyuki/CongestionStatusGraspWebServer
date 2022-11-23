class Error
    class ServerError < StandardError 
        def initialize(msg="Server Error")
            super
        end
    end
end