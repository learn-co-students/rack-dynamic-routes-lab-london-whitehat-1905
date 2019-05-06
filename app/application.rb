require_relative "item.rb"

class Application

     def initialize
         @found = false
     end

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        if req.path.match(/items/)
            print req.path
            print @@items
            path = req.path.split(/items\//)
            @@items.each do |x|
                 print x.name
                 print path.last
                 if x.name == path.last
                     resp.write x.price
                     @found = true
                 end
            end
            if !@found
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end
end

