class CommentsController < ApplicationController
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @comment = current_user.comments.build(comment_params)
    @blog = @comment.blog
   
    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_path(@blog), notice: 'コメントを投稿しました。' }
        
         format.js { render :index }
        
      else
        format.html { render :new }
      end
    end
  end
 
 def edit
    @comment = Comment.find(params[:id])

 end
  
  def update
    @comment = Comment.find(params[:id])
     @comment.update(comment_params)
     redirect_to blogs_path, notice: "コメントを更新しました！"
   

  end
 
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { render :new }
      end
    end
  end
 

  private
  
    def comment_params
      params.require(:comment).permit(:blog_id, :content )

    end
  
    def set_comment
    @comment = Comment.find(params[:id])
    end
  
  
end
