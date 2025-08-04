class ApplicationController < Sinatra::Base
  get '/bakeries' do
    content_type :json
    # get all the bakeries from the database
    bakeries = Bakery.all
    # send them back as a JSON array
    bakeries.to_json
  end

  get '/bakeries/:id' do
    content_type :json

    bakery = Bakery.find(params[:id])

    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    content_type :json

    baked_goods = BakedGood.all.order(price: :desc)

    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    content_type :json

    most_expensive_baked_good = BakedGood.all.order(price: :desc).first

    most_expensive_baked_good.to_json
  end
end
