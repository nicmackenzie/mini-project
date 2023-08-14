Rails.application.routes.draw do
  get '/products/less-stock', to: 'products#less_products'
  resources :suppliers
  resources :products

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"product = Product.order(id: params[:id])
        # if product
        #     product.destroy
        #     head :no_content
        # else
        #     render json: {error: 'Product not found.'}
        # end
end
