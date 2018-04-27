
  module Admin
  class CompaniesController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_company, only: [:show, :edit, :update, :destroy, :print, :payment_edit]
    layout  'admin/layouts/admin'

    # GET /companies
    # GET /companies.json
    def index
      @companies = Company.all
    end
    def payment_edit

    end


     # Post
    def debit_payment
      @company = Company.find(params[:company][:id])
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
      companies = Company.where(status: "Not Cleared").ids
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
      format.json
      format.pdf { render template: 'admin/companies/report', pdf: 'report', layout: 'layouts/pdf'}
    end
  
    end
      def print
        respond_to do |format|
        format.html {render template: 'admin/companies/invoice' , layout: false}
      
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
      @company = Company.new(company_params)

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
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def company_params
      params.require(:company).permit(Company.attribute_names.map(&:to_sym))
    end
  end
end