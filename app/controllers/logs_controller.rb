# frozen_string_literal: true

class LogsController < ApplicationController
  def index
    @logs = current_user.logs.order(registered_on: 'DESC')
  end

  def new
    @log = Log.new
    Question.active.each do |question|
      @log.answers.build(question:)
    end
  end

  def create
    @log = Log.new(log_params)

    if @log.save
      flash[:notice] = 'ログを登録しました'
      redirect_to logs_path
    else
      flash[:alert] = 'ログを登録できませんでした'
      render :new
    end
  end

  private

  def log_params
    params.require(:log).permit(
      :registered_on,
      answers_attributes: %i[log_id question_id is_good_habit _destroy]
    ).merge(user_id: current_user.id)
  end
end
