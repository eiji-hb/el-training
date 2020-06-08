class Search < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :q,:select
end
