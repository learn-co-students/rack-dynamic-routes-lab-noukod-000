class Application
  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)
    if request.path.match(/items/)
      item_name = request.path.split('/items/').last
      item = Item.all.detect {|item| item.name == item_name}
      if item
        response.write item.price
      else
        response.write 'Item not found'
        response.status = 400
      end
    else
      response.write 'Route not found'
      response.status = 404
    end
    response.finish
  end
end
