class ApplicationController <Sinatra::Base
  set :default_content_type, 'application/json'

  # add routes

  get '/bakeries' do
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  # get '/bakeries/:id' do
  #   game = Game.find(params[:id])

  #   # include associated reviews in the JSON response
  #   game.to_json(include: :reviews)
  # end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])

    # include associated reviews in the JSON response
    bakery.to_json(include: :baked_goods)
  end
  get '/baked_goods/by_price' do
    baked_goods = BakedGood.order(price: :desc)
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_good = BakedGood.order(price: :desc).first
    baked_good.to_json
  end

  # get '/games/:id' do
  #   game = Game.find(params[:id])

  #   # include associated reviews in the JSON response
  #   game.to_json(only: [:id, :title, :genre, :price], include: {
  #     reviews: { only: [:comment, :score], include: {
  #       user: { only: [:name] }
  #     } }
  #   })
  # end

end
