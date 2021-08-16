class BooksController < ApplicationController

  def index
    #Bookにデータが入るということを教えるだけ
    @book = Book.new
  end

  # idの数字を受け取って、実行
  def show
    #受け取ったidを検索
    #                 URLのIDを検索
    @book = Book.find(params[:id])
  end

  def create
    # Bookテーブルに情報を入れる
    # book_paramsにデータが入っているので、引数に指定すると、代入される
    @book = Book.new(book_params)
    @book.save
    # idの数字を渡す
    redirect_to book_path(@book.id)
  end

  def edit
  end

  private
  def book_params
    # params : データの流れを見る
    # require : どのテーブルに要求されたか？
    # permit : どのデータを送ることを許可するか？
    params.require(:book).permit(:title, :body)
  end

end
