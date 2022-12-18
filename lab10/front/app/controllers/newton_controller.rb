# frozen_string_literal: true

# describes proxy logic
class NewtonController < ApplicationController
  def new; end

  def show
    respond_to do |format|
      format.html { pick_render }
      format.any { render plain: 'Use xml' }
    end
  end

  private

  def render_server_side
    @data = helpers.transform_to_html(helpers.get_back_source(params))
  end

  def render_client_side
    @data = helpers.add_xhtml_stylesheet(helpers.get_back_source(params))
    render plain: @data, content_type: 'application/xhtml+xml'
  end

  def render_raw
    render plain: helpers.get_back_source(params)
  end

  def render_xml
    render plain: helpers.get_back_source(params), content_type: 'application/xhtml+xml'
  end

  def pick_render
    case params[:side]
    when 'server' then render_server_side
    when 'client' then render_client_side
    when 'raw text' then render_raw
    when 'raw xml' then render_xml
    end
  end
end
