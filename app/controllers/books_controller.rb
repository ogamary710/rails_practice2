class BooksController < ApplicationController
  before_action :authenticate_user!,only: [:create,:edit,:update,:destroy,:index]

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @book = Book.find(params[:id])
    screen_user(@book)
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to @book
    else
      @books = Book.all
      render 'index'
    end
  end

  def createcomment
    book = Book.find(params[:id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_to book_path(book)
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

    def post_comment_params
      params.require(:post_comment).permit(:user_id,
                          :book_id,
                          :comment)
    end

    def screen_user(book)
      if book.user.id != current_user.id
        redirect_to books_path
      end
    end

end
