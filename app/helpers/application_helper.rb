# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: 'Sleeple',
      reverse: true,
      charset: 'utf-8',
      description: '良い睡眠習慣をつくるための生活改善アプリ',
      viewport: 'width=device-width, initial-scale=1.0',

      og: {
        site_name: 'Sleeple',
        title: :title,
        type: 'website',
        description: :description,
        url: request.original_url,
        image: image_url('ogp.png'),
        locale: 'ja_JP'
      },
      twitter: {
        card: 'summary_large_image',
        description: :description,
        url: request.original_url,
        image: image_url('ogp.png')
      }
    }
  end
end
