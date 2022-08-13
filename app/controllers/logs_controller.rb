# frozen_string_literal: true

class LogsController < ApplicationController
  def index; end

  def new
    @user = current_user
    @log = Log.new
    Question.order(:id).where(is_active: true).each do |question|
      @log.answers.build(question:)
    end
  end

  def create
    @user = current_user
    @log = Log.new(log_params)

    if @log.save
      flash[:notice] = '作成しました'
      redirect_to logs_path
    else
      flash[:alert] = @log.errors.full_messages
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
