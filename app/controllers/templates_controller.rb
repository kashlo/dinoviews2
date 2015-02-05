class TemplatesController < ApplicationController

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(template_params)
    if @template.save
      flash[:notice] = 'Template successfully created'
      redirect_to templates_path
    else
      flash[:alert] = 'Template create error'
      render action: :new
    end
  end

  def show
    @template = Template.find(params[:id])
    render inline: @template.body, locals: { template: @template },  layout: false
  end

  def index
    @templates = Template.all
  end

  private

    def template_params
      params.require(:template).permit!
    end
end