class Admin::ExitOpportunityMappingsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!
  before_action :set_mapping, only: [:edit, :update, :destroy]
  
  def index
    @mappings = ExitOpportunityMapping.order(created_at: :desc)

    render 'admin/exit_opportunities/index'
  end

  def new
    @mapping = ExitOpportunityMapping.new

    render 'admin/exit_opportunities/new'
  end

  def create
    @mapping = ExitOpportunityMapping.new(mapping_params)
    if @mapping.save
      redirect_to admin_exit_opportunity_mappings_path, notice: 'Exit opportunity mapping created successfully.'
    else
      render 'admin/exit_opportunities/new'
    end
  end

  def edit
    render 'admin/exit_opportunities/edit'
  end

  def update
    if @mapping.update(mapping_params)
      redirect_to admin_exit_opportunity_mappings_path, notice: 'Exit opportunity mapping updated successfully.'
    else
      render 'admin/exit_opportunities/edit'
    end
  end

  def destroy
    @mapping.destroy
    redirect_to admin_exit_opportunity_mappings_path, notice: 'Exit opportunity mapping deleted successfully.'
  end

  # Add this new action for the AJAX request
  def node_names
    industry = params[:industry]
    node_names = available_node_names(industry)
    render json: node_names
  end

  private

  def set_mapping
    @mapping = ExitOpportunityMapping.find(params[:id])
  end

  def mapping_params
    params.require(:exit_opportunity_mapping).permit(:source_category, :target_node_name, :likelihood, :target_industry)
  end

   # Helper method to get available industries
   def available_industries
    [
      "Hedge Fund",
      "Venture Capital",
      "Private Credit",
      "Private Equity",
      "Investment Banking",
      "Corporate Development",
      "Investment Management",
      "FP&A",
      "Other"
    ]
  end
  helper_method :available_industries

  # Helper method to get available node names for a given industry
  def available_node_names(industry)
    node_mapping.select { |node| node[:industry] == industry }
               .flat_map { |node| node[:names] }
               .uniq
  end
  helper_method :available_node_names

  # Node mapping data
  def node_mapping
    [
      # Hedge Fund
      { id: 11, names: ["Junior Analyst"], level: 1, industry: "Hedge Fund" },
      { id: 12, names: ["Research Associate"], level: 2, industry: "Hedge Fund" },
      { id: 13, names: ["Fund Analyst"], level: 3, industry: "Hedge Fund" },
      { id: 14, names: ["Sector Head"], level: 4, industry: "Hedge Fund" },
      { id: 15, names: ["Portfolio Manager"], level: 5, industry: "Hedge Fund" },

      # Venture Capital
      { id: 1, names: ["Analyst"], level: 1, industry: "Venture Capital" },
      { id: 2, names: ["Pre-MBA associate"], level: 2, industry: "Venture Capital" },
      { id: 3, names: ["Senior associate"], level: 3, industry: "Venture Capital" },
      { id: 4, names: ["Principal"], level: 4, industry: "Venture Capital" },
      { id: 5, names: ["Partner"], level: 5, industry: "Venture Capital" },

      # Private Credit
      { id: 41, names: ["Analyst"], level: 1, industry: "Private Credit" },
      { id: 42, names: ["Associate"], level: 2, industry: "Private Credit" },
      { id: 43, names: ["Vice president"], level: 3, industry: "Private Credit" },
      { id: 44, names: ["Principal"], level: 4, industry: "Private Credit" },
      { id: 45, names: ["Partner"], level: 5, industry: "Private Credit" },

      # Private Equity
      { id: 6, names: ["Analyst"], level: 1, industry: "Private Equity" },
      { id: 7, names: ["Associate"], level: 2, industry: "Private Equity" },
      { id: 8, names: ["Vice president"], level: 3, industry: "Private Equity" },
      { id: 9, names: ["Principal"], level: 4, industry: "Private Equity" },
      { id: 10, names: ["Partner"], level: 5, industry: "Private Equity" },

      # Investment Banking
      { id: 16, names: ["Analyst"], level: 1, industry: "Investment Banking" },
      { id: 17, names: ["Associate"], level: 2, industry: "Investment Banking" },
      { id: 18, names: ["Vice president"], level: 3, industry: "Investment Banking" },
      { id: 19, names: ["Senior vice president", "Executive Director"], level: 4, industry: "Investment Banking" },
      { id: 20, names: ["Managing director"], level: 5, industry: "Investment Banking" },

      # Corporate Development
      { id: 21, names: ["Analyst"], level: 1, industry: "Corporate Development" },
      { id: 22, names: ["Associate"], level: 2, industry: "Corporate Development" },
      { id: 23, names: ["Manager"], level: 3, industry: "Corporate Development" },
      { id: 24, names: ["Director"], level: 4, industry: "Corporate Development" },
      { id: 25, names: ["Vice president"], level: 5, industry: "Corporate Development" },

      # Investment Management
      { id: 26, names: ["Analyst"], level: 1, industry: "Investment Management" },
      { id: 27, names: ["Associate"], level: 2, industry: "Investment Management" },
      { id: 28, names: ["Senior Associate"], level: 3, industry: "Investment Management" },
      { id: 29, names: ["Portfolio Manager"], level: 4, industry: "Investment Management" },
      { id: 30, names: ["Director"], level: 5, industry: "Investment Management" },

      # FP&A
      { id: 31, names: ["Analyst"], level: 1, industry: "FP&A" },
      { id: 32, names: ["Senior Analyst"], level: 2, industry: "FP&A" },
      { id: 33, names: ["Manager"], level: 3, industry: "FP&A" },
      { id: 34, names: ["Director"], level: 4, industry: "FP&A" },
      { id: 35, names: ["Vice president"], level: 5, industry: "FP&A" },

      # Other
      { id: 36, names: ["Entry Level"], level: 1, industry: "Other" },
      { id: 37, names: ["Mid Level"], level: 2, industry: "Other" },
      { id: 38, names: ["Senior Level"], level: 3, industry: "Other" },
      { id: 39, names: ["Lead"], level: 4, industry: "Other" },
      { id: 40, names: ["Executive"], level: 5, industry: "Other" }
    ]
  end
end 
