# frozen_string_literal: true

class LogsController < ApplicationController
  before_action :set_current_user_log, only: %i[edit update destroy]

  def index
    @logs = current_user.logs.order(registered_on: 'DESC')
  end

  def new
    @log = Log.new(registered_on: Date.current)
    Question.active.each do |question|
      @log.answers.build(question:)
    end
  end

  def create
    @log = Log.new(create_params)

    if @log.save
      flash[:notice] = 'ログを登録しました'
      redirect_to logs_path
    else
      flash[:alert] = 'ログを登録できませんでした'
      render :new
    end
  end

  def edit; end

  def update
    if @log.update(update_params)
      flash[:notice] = 'ログを更新しました'
      redirect_to logs_path
    else
      flash[:alert] = 'ログを更新できませんでした'
      render :edit
    end
  end

  def destroy
    if @log.destroy
      flash[:notice] = 'ログを削除しました'
      redirect_to logs_path
    else
      flash[:alert] = 'ログを削除できませんでした'
    end
  end

  private

  def create_params
    params.require(:log).permit(
      :registered_on,
      answers_attributes: %i[log_id question_id is_good_habit _destroy]
    ).merge(user_id: current_user.id)
  end

  def update_params
    params.require(:log).permit(
      :registered_on,
      answers_attributes: %i[id log_id question_id is_good_habit _destroy]
    ).merge(user_id: current_user.id)
  end

  def set_current_user_log
    @log = current_user.logs.find(params[:id])
  end
end
