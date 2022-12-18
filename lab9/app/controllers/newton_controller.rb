# frozen_string_literal: true

# Main action class
class NewtonController < ApplicationController
  before_action :load_args, only: %i[create show]
  def new; end

  def create; end

  def show
    respond_to do |format|
      format.json { render json: { steps: @steps, errors: @error, value: @steps&.last }.to_json }
      format.any { render plain: 'Use json' }
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
