# frozen_string_literal: true

# phase_user controller for lead CRUD
class PhaseUsersController < ApplicationController
  before_action :set_phase, only: %i[index new create destroy]
  before_action :set_phase_user, except: %i[index new create]

  def index
    @phase_user = @phase.phase_users
  end

  def new
    @user = User.with_role :engineer
    @phase_user = @phase.phase_users.new
  end

  def create
    @phase_user = @phase.phase_users.new(phase_users_params)
    authorize @phase
    if @phase_user.save
      redirect_to phase_phase_users_path(@phase.id), notice: 'Engineer add successfully'
    else
      @user = User.with_role :engineer
      render 'new'
    end
  end

  def show; end

  def destroy
    @engineer.destroy!
    redirect_to phase_phase_users_path(params[:phase_id]), notice: 'Engineer remove successfully'
  end

  private

  def phase_users_params
    params.require(:phase_user).permit(:user_id, :description, :phase_id)
  end

  def set_phase
    @phase = Phase.find(params[:phase_id])
  end

  def set_phase_user
    @engineer = PhaseUser.find(params[:id])
  end

  def check_authorization
    authorize @phase
  end
end
