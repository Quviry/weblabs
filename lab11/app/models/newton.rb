# frozen_string_literal: true

require 'json'

# cache-based model
class Newton < ApplicationRecord
  include NewtonHelper
  include ActiveModel::Serializers::Xml

  validates :key, numericality: { greater_than_or_equal_to: 0 }, uniqueness: true

  before_save :default_values

  def default_values
    self.data = get_newton_rufson_steps(key).to_json if new_record?
    puts "Added model with result #{data}"
  end
end
