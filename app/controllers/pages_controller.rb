class PagesController < ApplicationController
  def index
    @pages = Page.all.order(:name)
  end

  def show
    @page = Page.find_by(slug: params[:slug])
    unless @page
      redirect_to pages_path, alert: "Page not found."
    end
    @employee_view = @page.page_associations.where.not(employee_view_id: nil).first&.employee_view

  end
end
