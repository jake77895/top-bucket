class Admin::FormTemplatesController < ApplicationController
  before_action :set_form_template, only: [:edit, :update, :destroy]

  def index
    @form_templates = FormTemplate.includes(:position_type).order(:form_context, :position_type_id)
  end

  def new
    @form_template = FormTemplate.new
  end

  def create
    @form_template = FormTemplate.new(form_template_params)
    if @form_template.save
      redirect_to admin_form_templates_path, notice: 'Form template was successfully created.'
    else
      render :new, alert: 'There was an error creating the form template.'
    end
  end

  def edit; end

  def update
    if @form_template.update(form_template_params)
      redirect_to admin_form_templates_path, notice: 'Form template was successfully updated.'
    else
      render :edit, alert: 'There was an error updating the form template.'
    end
  end

  def destroy
    @form_template.destroy
    redirect_to admin_form_templates_path, notice: 'Form template was successfully deleted.'
  end

  private

  def set_form_template
    @form_template = FormTemplate.find(params[:id])
  end

  def form_template_params
    params.require(:form_template).permit(:position_type_id, :form_context, :question_text, :response_type, :position)
  end
  
end
