class ProductsController < ApplicationController

    def index
        products = Product.all.includes(:supplier)
        response = products.map do |product|
            {
              id: product.id,
              name: product.name,
              price: product.price,
              category: product.category,
              current_qty: product.current_qty,
              supplier: product.supplier.name
            }
          end
        render json: response, status: :ok
    end

    def show
        product = Product.find_by(id: params[:id])
        if product
            render json: product, except: ['created_at','updated_at'], status: :ok
        else
            render json: {error: 'Product not found'}
        end
    end

    def create
        product = Product.create(product_params)
        if product
            render json: product, except: ['created_at','updated_at'], status: :created
        else
            render json: {error: 'Product not created.'}
        end
    end

    def update
        product = Product.find_by(id: params[:id])
        if product
            product.update(product_params)
            render json: product, except: ['created_at','updated_at'], status: :ok
        else
            render json: {error: 'Product not found.'}
        end
    end

    def destroy
        product = Product.find_by(id: params[:id])
        if product
            product.destroy
            head :no_content
        else
            render json: {error: 'Product not found.'}
        end
    end

    def less_products
        low_quantity_products = Product.where('current_qty < ?', 10).order(current_qty: :desc)

        response = low_quantity_products.map do |product|
        {
            id: product.id,
            name: product.name,
            price: product.price,
            category: product.category,
            current_qty: product.current_qty,
            supplier: product.supplier.name
        }
        end

        render json: response, status: :ok
    end


    private 

    def product_params
        params.permit(:name, :price, :category, :current_qty, :supplier_id)
    end
end
