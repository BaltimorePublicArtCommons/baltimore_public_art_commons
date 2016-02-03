class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = create_unconfirmed_user

    if user
      flash[:notice] = "Success!"
      UserMailer.invitation_email(user.id).deliver_now
    else
      flash[:notice] = "You must be missing something." +
        user.errors.full_messages
    end

    redirect_to new_user_path
  end

  def edit
    @user = User.find params[:id]
    if params[:confirmation_hash] != @user.confirmation_hash
      flash[:notice] = "It looks like you're lost - look at some art"
      redirect_to root_path
    end
  end

  def update
    user = User.find params[:id]
    user.update user_params
    flash[:notice] = "Success! Welcome to the Baltimore Public Art Commons Team!"
    log_in(user)
    redirect_to root_path
  end

  private

  def create_unconfirmed_user
    User.create user_params.merge password: RandomHash.generate,
                                  confirmed: false,
                                  confirmation_hash: RandomHash.generate
  end

  def user_params
    params.require(:user).permit :email,
                                 :role,
                                 :passowrd,
                                 :password_confirmation
  end
end
