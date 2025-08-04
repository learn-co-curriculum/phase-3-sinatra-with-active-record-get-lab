class ApplicationController < Sinatra::Base
  get '/bakeries' do
    content_type :json
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    content_type :json
    bakery = Bakery.find_by(id: params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    content_type :json
    BakedGood.order(price: :desc).to_json
  end

  get '/baked_goods/most_expensive' do
    content_type :json
    BakedGood.order(price: :desc).first.to_json
  end
end
