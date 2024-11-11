class AjaxRequestsController < ApplicationController
  def get_equipment
    @data = '<option disabled selected hidden></option>';
    @equipment = Equipment.where(unit_name: params[:unit_name])
    @equipment.each do |equipment|
      @data = @data + "\n<option value='#{equipment.identifier}' >#{equipment.identifier}</option>"
    end
    render plain: @data
  end
end