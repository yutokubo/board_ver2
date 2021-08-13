class PostsController < ApplicationController
  
  def new
    @post = Post.new 
  end

  def create
    redirect_to :new_user_password  unless user_signed_in?
    flash[:notice] = "ログインしてください"
    @post = current_user.posts.build(post_params) #Postモデルがpostテーブルにインスタンスを生成
    if @post.save!
      redirect_to root_path(@post)
      flash[:notice] = "投稿に成功しました"
    else
      render action: :new    
    end
  end

  def show
    @post = Post.find(params[:id]) 
  end

  def edit
    redirect_to :new_user_password  unless user_signed_in?
    @post = Post.find(params[:id]) #遷移する投稿のidはlink_toの引数で指示、情報を保持する
  end
  
  def update
    @post = Post.find(params[:id]) #updateする投稿のidを取得
    if @post.update(post_params)
      redirect_to root_path(@post), notice: "更新に成功しました"
    else
      render action: :edit
    end
  end

  def destroy
    redirect_to :new_user_password  unless user_signed_in?
    @post = Post.find(params[:id]) #@postである必要がないｚ
    @post.destroy
    redirect_to :root
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end

