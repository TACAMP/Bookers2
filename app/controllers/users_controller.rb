class UsersController < ApplicationController

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
    if @user!=current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    flash[:notice]='You have updated user successfully.'
    redirect_to user_path(@user)
    else
    render :edit
    end
  end

    def index
    @user=current_user
    @users=User.all
    @book=Book.new
    end

    def destroy
    @user=current_user
    @user.destroy
    redirect_to root_path
    end

end

 private

def user_params
  params.require(:user).permit(:name,:introduction,:profile_image)
end


