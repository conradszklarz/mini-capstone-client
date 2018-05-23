class ClientProductsController < ApplicationController
  def index
    client_params = {
                    search: params[:search],
                    sort_by: params[:sort_by],
                    sort_order: params[:sort_order]
                  }
                    
    response = Unirest.get("http://localhost:3000/api/products", paramters: client_params)
    @products = response.body
    render 'index.html.erb'
  end

  def new
  render 'new.html.erb' 
  end

  def create
    client params = {   title: params[:title],
                        name: params[:name],
                        price: params[:price],
                        image_url: params[:image_url],
                        description: params[:description]
                    }
                            response = Unirest.post(
                            "http://localhost3000/api/products", parameters: client_params
                            ) 
     product = response.body                       
     flash[:success] = "Successfully created product"            redirect_to "/client/products/#{ product["id"] }"
  end

  def show
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render 'show.html.erb'
  end 

  def edit
    product_id = params[:id]
    response = Unirest.get("http://localhost:3000/api/products/#{product_id}")
    @product = response.body
    render 'edit.html.erb'
  end

  def update
   client_params = {
                    title: params[:title],
                    name: params[:name],
                    price: params[:price],
                    image_url: params[:image_url],
                    description: params[:description]
                    } 

   response = Unirest.patch("http://localhost:3000/api/products/#{params[:id] }",parameters: client_params) 

   product = response.body
    flash[:success] = "Successfully Updated product"
   redirect_to "/client/products/#{ product["id"] }"
  end

  def destroy
    product_id = params[:id]
    response = Unirest.delete("http://localhost:3000/api/products/#{product_id} ")
    flash[:success] = "Successfully destroyed recipe"
    redirect_to "/"
  end
end
