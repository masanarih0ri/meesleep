# frozen_string_literal: true

class LogsController < ApplicationController
  def index; end

  def new
    @user = current_user
    @log = Log.new
    @questions = Question.order(:id).where(is_active: true)
    @log.answers.build
  end

  def create
    @user = current_user
    @log = Log.new(log_params)
    @questions = Question.order(:id).where(is_active: true)

    begin
      @log.save! if @log.present?
      flash[:success] = '作成しました'
      redirect_to logs_path
    rescue StandardError => e
      logger.error(e)
      flash[:danger] = @log.errors.full_messages
      render :new
    end
  end

  private

  def log_params
    params.require(:log).permit(
      :user_id,
      :score,
      :registered_on,
      answers_attributes: %i[log_id question_id is_good_habit _destroy]
    )
  end
end
