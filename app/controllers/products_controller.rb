class ProductsController < ApplicationController

    def index
        products = Product.all
        render json: products,except: ['created_at','updated_at'], status: :ok
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


    private 

    def product_params
        params.permit(:name, :price, :category, :current_qty, :supplier_id)
    end
end
