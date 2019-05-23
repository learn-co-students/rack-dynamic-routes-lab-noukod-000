
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
        item_title = req.path.split("/items/").last

      if !req.path.match(/items/)
        resp.write "Route not found"
        resp.status = 404
      else

          if item = @@items.find {|i| i.name == item_title }
           resp.write item.price
          #  binding.pry
          else
           resp.write "Item not found"
           resp.status = 400
          end

        end

    resp.finish
  end
end