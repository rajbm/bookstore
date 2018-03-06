class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :update, :destroy]

  # GET /authors
  def index
    @authors = Author.all

    render json: @authors
  end

  # GET /authors/1
  def show
    render json: @author
  end

  def search
    @authors = Author.search(params['value'])
    render json: @authors
  end

  def authors_books
    @author = Author.find(params[:id]);
    @books = @author.books
    render json: @books
    
  end

  # POST /authors
  def create
    @author = Author.new(:name=>params[:name],:email=>params[:email],:phone_number=>params[:phone_number],:country=>params[:country])
    if @author.save
      render json: @author, status: :created, location: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /authors/1
  def update
    if @author.update(author_params)
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  # DELETE /authors/1
  def destroy
    @books = @author.books
    @books.destroy_all 
    @author.destroy
    # 
    # @books.destroy_all
    # render json:  @books  
    
    # @author.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def author_params
      params.require(:author).permit(:name, :email, :phone_number, :country)
    end
end
