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
    if @comment.update(comments_params)
    redirect_to comments_path, notice: "コメントを更新しました！"
    else
      render 'edit'
 　  end
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
  
  
end
