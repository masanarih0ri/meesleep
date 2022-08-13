# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: 'Sleeple',
      reverse: true,
      charset: 'utf-8',
      description: '良い睡眠習慣をつくるための生活改善アプリ',
      viewport: 'width=device-width, initial-scale=1.0'

      # TODO: OGPの設定は画像ができてから別途行う
      # og: {
      #   title: :title,
      #   type: 'website',
      #   site_name: 'Sleeple',
      #   description: :description,
      #   image: 'https://sleeple.app/ogp/ogp.png',
      #   url: 'https://sleeple.app.jp'
      # },
      # twitter: {
      #   card: 'summary',
      #   site: '@sleeple_app',
      #   description: :description,
      #   image: 'https://sleeple.app/ogp/ogp.png',
      #   domain: 'https://sleeple.app'
      # }
    }
  end
end
