class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    # @books = Book.all

    # render json: @books
    @books = Book.all
    @author  = Author.all
    render json: {:authors => @author, :books => @books}
  end

  # GET /books/1
  def show
    render json: @book
  end

  def search
    @books = Book.search(params['value'])
    render json: @books
  end

  # POST /books
  def create
    @book = Book.new(:name=>params[:name],:description=>params[:description],:author_id=>params[:author_id])

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:name, :description, :author_id)
    end
end
