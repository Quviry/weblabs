# frozen_string_literal: true

# Main action class
class NewtonController < ApplicationController
  before_action :load_args, only: [:show]
  def new; end

  def show
    respond_to do |format|
      format.xml { render xml: { steps: @error.nil? ? @steps : nil,  value: @error.nil? ? @steps&.last : nil, errors: @error} }
      format.any { render plain: 'Use xml' }
    end
  end

  private
  def argument_negative
    @error = 'Must be greather than zero' if params[:square].to_f.negative? # not negative
  end

  def argument_actual
    @error = 'Must be correct float' if Float(params[:square], exception: false).nil? # correct float conversion
  end

  def argument_valid
    argument_negative
    argument_actual
    params[:square].to_f.positive? || !Float(params[:square], exception: false)&.nonzero? # valid if zero or positive
  end

  def load_args
    params.require(:square) # fall if no argument
    @steps = helpers.get_newton_rufson_steps(params[:square].to_f) if argument_valid  # justrunit
  end
end
