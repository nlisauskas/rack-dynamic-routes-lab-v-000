class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split('/items/').last

      if @@items.find do |item|
        item.name == item_name
        resp.write item.price
      end



      end

    elsif req.path.match(/items/)

      resp.write "Item not found"
      resp.status = 400

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end


end
