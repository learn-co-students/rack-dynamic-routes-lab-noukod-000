class Application

  @@items=[Item.new("Figs",3.42),Item.new("Pears",0.99)]

  def call(env)
    resp=Rack::Response.new
    req=Rack::Request.new(env)

    if req.path.match(/items/)

      item_to_search_for=req.path.split("/items/").last
      search_results = @@items.find{|item| item.name == item_to_search_for}
      if search_results != nil
        resp.write search_results.price
      else
        resp.write "Item not found"
        resp.status=400
      end
    else
      resp.write("Route not found")
      resp.status=404
    end

    resp.finish

  end
end
