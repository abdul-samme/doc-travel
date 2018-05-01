
  module Admin
  class CompaniesController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_company, only: [:show, :edit, :update, :destroy, :payment_edit]
    layout  'admin/layouts/admin'

    # GET /companies
    # GET /companies.json
    def index
     if  current_user.admin?
      @companies = Company.all
     else
      @companies = current_user.companies
    end
  end 
    def payment_edit

    end


     # Post
    def debit_payment
      if current_user.admin?
      @company = Company.find(params[:company][:id])
    else
      @company = current_user.companies.find(params[:company][:id])
    end 
      if @company.update(company_params)
        flash[:notice] = t('admin.companies.update.success')
        redirect_to admin_companies_url 
      else
        flash[:warning] = @company.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :company
      end
    end

    # GET /users/1
    # GET /users/1.json
    def debit
      @companies =[]
      if current_user.admin?
      companies = Company.where(status: "Not Cleared").ids
      else
       companies = current_user.companies.where(status: "Not Cleared").ids
      end 

      companies.each do | company |
        c = Company.find(company)
        @companies << c
      end
      @companies
    end

    # GET /companies/1
    # GET /companies/1.json
    def show
        respond_to do |format|
      format.html   
      end 
    end
  

    # GET /companies/new
    def new
      @company = Company.new
      @url = admin_companies_path
    end

    # GET /companies/1/edit
    def edit
      @url = admin_company_path(@company)
    end

    # POST /companies
    # POST /companies.json
    def create
      @company = current_user.companies.build(company_params)

      if @company.save
        flash[:notice] = t('admin.companies.create.success')
        redirect_to admin_companies_url 
      else
        flash[:warning] = @company.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :company
      end
    end

    # PATCH/PUT /companies/1
    # PATCH/PUT /companies/1.json
    def update
      if @company.update(company_params)
        flash[:notice] = t('admin.companies.update.success')
        redirect_to admin_companies_url 
      else
        flash[:warning] = @company.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :company
      end
    end

    # DELETE /companies/1
    # DELETE /companies/1.json
    def destroy
      @company.destroy
      respond_to do |format|
        format.html { redirect_to admin_companies_path, notice: t('admin.companies.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_company

      
      if current_user.admin?
        if Company.exists?(params[:id])
        @company = Company.find(params[:id])
        else
        render :file => "#{Rails.root}/public/404",  layout: false, status: :not_found
        end 

      else
        
        if current_user.companies.exists?(params[:id])
        @company = current_user.companies.find(params[:id])
        else
        render :file => "#{Rails.root}/public/404",  layout: false, status: :not_found
        end 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def company_params
      params.require(:company).permit(Company.attribute_names.map(&:to_sym))
    end
  end
end
