# frozen_string_literal: true

class LogsController < ApplicationController
  def index; end

  def new
    @user = current_user
    @log = Log.new
    @questions = Question.order(:id).where(is_active: true)
  end

  def create
    @user = current_user
    @log = Log.new(log_params)
    @questions = Question.order(:id).where(is_active: true)

    if @log.save
      puts '作成しました'
      flash[:success] = '作成しました'
      redirect_to logs_path
    else
      puts '作成できませんでした'
      flash[:danger] = '作成できませんでした'
      render :new
    end
  end

  private

  def log_params
    params.require(:log).permit(
      :user_id,
      :score,
      :registered_on,
      answers_attributes: [:log_id, :question_id, :is_good_habit, :_destroy]
    )
  end
end