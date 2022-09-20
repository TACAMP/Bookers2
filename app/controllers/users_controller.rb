class UsersController < ApplicationController

  def show
    @book=Book.new
    @user=User.find(params[:id])
    @books=Book.all
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user)
    else
    render edit
    end
  end

    def index
    @user=User.all
    end

end

 private

def user_params
  params.require(:user).permit(:name,:introduction,:image)
end


