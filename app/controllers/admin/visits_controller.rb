module Admin
  class VisitsController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_visit, only: [:show, :edit, :update, :destroy, :print, :preview, :payment_edit]
    layout  'admin/layouts/admin'
 
    # GET /users
    # GET /users.json
    def index
      if current_user.admin?
        @visits = Visit.all
      else
        @visits = current_user.visits
      end 
    end

    def payment_edit
    end


     # Post
    def debit_payment
      if current_user.admin?
      @visit = Visit.find(params[:visit][:id])
    else
      @visit = current_user.visits.find(params[:visit][:id])
    end 
      if @visit.update(visit_params)
        flash[:notice] = t('admin.visits.update.success')
        redirect_to admin_visits_url 
      else
        flash[:warning] = @visit.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :visit
      end
    end

    # GET /users/1
    # GET /users/1.json
    def debit
      @visits =[]
      if current_user.admin?
        visits = Visit.where(status: "Not Cleared").ids
      else
      visits = current_user.visits.where(status: "Not Cleared").ids
    end 
      visits.each do | visit|
        v = Visit.find(visit)
        @visits << v
      end
      @visits
    end
  
    def show
        respond_to do |format|
      format.html   
      format.json
      format.pdf { render template: 'admin/visits/report', pdf: 'report', layout: 'layouts/pdf'}
    end
    end

    def preview
        respond_to do |format|
      format.html   
    end   
    end

      def print
        respond_to do |format|
        format.html {render template: 'admin/visits/invoice' , layout: false} 
      end
  
    end

    # GET /users/new
    def new
      @visit = Visit.new
      @url = admin_visits_path
    end

    # GET /users/1/edit
    def edit
      @url = admin_visit_path(@visit)
    end

    # POST /users
    # POST /users.json
    def create
      @visit = current_user.visits.build(visit_params)

      if @visit.save
        flash[:notice] = t('admin.visits.create.success')
        redirect_to admin_visits_url 
      else
        flash[:warning] = @visit.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :visit
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      if @visit.update(visit_params)
        flash[:notice] = t('admin.visits.update.success')
        redirect_to admin_visits_url 
      else
        flash[:warning] = @visit.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :visit
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @visit.destroy
      respond_to do |format|
        format.html { redirect_to admin_visits_path, notice: t('admin.visits.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_visit
       if current_user.admin?
        if Visit.exists?(params[:id])
        @visit = Visit.find(params[:id])
        else
        render :file => "#{Rails.root}/public/404",  layout: false, status: :not_found
        end 

      else
        
        if current_user.visits.exists?(params[:id])
        @visit = current_user.visits.find(params[:id])
        else
        render :file => "#{Rails.root}/public/404",  layout: false, status: :not_found
        end 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def visit_params
      params.require(:visit).permit(Visit.attribute_names.map(&:to_sym))
    end
  end
end








