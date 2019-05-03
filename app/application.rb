class Application

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)


    if req.path.match(/items/)
      itemName = req.path.split("/items/").last
      puts itemName
      item = @@items.find{|item| item.name == itemName}
      if !item.nil?
        puts item
        resp.write "#{item.price}"
      else
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
