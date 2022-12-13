# frozen_string_literal: true

# Main action class
class NewtonController < ApplicationController
  before_action :load_args, only: [:create]
  def new; end

  def create; end

  private

  def argument_valid
    @error = 'Must be greather than zero' if params[:square].to_f.negative? # not negative
    @error = 'Must be correct float' if Float(params[:square], exception: false).nil? # correct float conversion
    params[:square].to_f.positive? || !Float(params[:square], exception: false)&.nonzero? # valid if zero or positive
  end

  def load_args
    params.require(:square) # fall if no argument
    @steps = helpers.get_newton_rufson_steps(params[:square].to_f) if argument_valid  # justrunit
  end
end
