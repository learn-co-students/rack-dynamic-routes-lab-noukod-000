class Application
  def call env
    res = Rack::Response.new
    req = Rack::Request.new env

    if req.path.match(/items/)
      item_path = req.path.split("/")[2]
      item = @@items.find {|item| item.name == item_path}

      if item.nil?
        res.write "Item not found"
        res.status = 400
      else
        res.write item.price
      end
    else
      res.write "Route not found"
      res.status = 404
    end

    res.finish
  end
end