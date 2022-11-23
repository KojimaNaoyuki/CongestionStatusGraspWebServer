class Response
    def self.success(data)
        { status: 'SUCCESS', data: data }
    end

    def self.badRequest(data=nil)
        data.nil? ? { status: 'ERROR', data: 'bad request error' } : { status: 'ERROR', data: data }
    end

    def self.unauthorized(data=nil)
        data.nil? ? { status: 'ERROR', data: 'no auth' } : { status: 'ERROR', data: data }
    end

    def self.notFound(data=nil)
        data.nil? ? { status: 'ERROR', data: '404 Not Found' } : { status: 'ERROR', data: data }
    end

    def self.serverError(data=nil)
        data.nil? ? { status: 'ERROR', data: 'Internal Server Error' } : { status: 'ERROR', data: data }
    end
end