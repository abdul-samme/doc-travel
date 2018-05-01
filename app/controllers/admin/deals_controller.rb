
  module Admin
  class DealsController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_deal, only: [:show, :edit, :update, :destroy]

    # GET /deals
    # GET /deals.json
    def index
      if current_user.admin?
      @deals = Deal.all
      else
        @deals = current_user.deals
      end 
    end

    # GET /deals/1
    # GET /deals/1.json
    def show
      
    end
  
   

    # GET /deals/new
    def new
      @deal = Deal.new
      @url = admin_deals_path
    end

    # GET /deals/1/edit
    def edit
      @url = admin_deal_path(@deal)
    end

    # POST /deals
    # POST /deals.json
    def create
      @deal = current_user.deals.build(deal_params)

      if @deal.save
        flash[:notice] = t('admin.deals.create.success')
        redirect_to admin_deals_url 
      else
        flash[:warning] = @deal.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :deal
      end
    end

    # PATCH/PUT /deals/1
    # PATCH/PUT /deals/1.json
    def update
      if @deal.update(deal_params)
        flash[:notice] = t('admin.deals.update.success')
        redirect_to admin_deals_url 
      else
        flash[:warning] = @deal.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :deal
      end
    end

    # DELETE /deals/1
    # DELETE /deals/1.json
    def destroy
      @deal.destroy
      respond_to do |format|
        format.html { redirect_to admin_deals_path, notice: t('admin.deals.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_deal
      if current_user.admin?

        if Deal.exists?(params[:id])
        @deal = Deal.find(params[:id])
        else
        render :file => "#{Rails.root}/public/404",  layout: false, status: :not_found
        end 

      else
        
        if current_user.deals.exists?(params[:id])
        @deal = current_user.deals.find(params[:id])
        else
        render :file => "#{Rails.root}/public/404",  layout: false, status: :not_found
        end 
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def deal_params
      params.require(:deal).permit(Deal.attribute_names.map(&:to_sym))
    end
  end
end