# frozen_string_literal: true

module Blog
  class ArticleCategory < ActiveRecord::Base
    belongs_to :article
    belongs_to :category
  end
end
