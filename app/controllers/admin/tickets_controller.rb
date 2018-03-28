module Admin
  class TicketsController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_ticket, only: [:show, :edit, :update, :destroy, :print, :preview, :payment_edit]
    layout  'admin/layouts/admin'
 
    # GET /users
    # GET /users.json
    def index
      @tickets = Ticket.all
    end
    def payment_edit
    end


     # Post
    def debit_payment

      @ticket = Ticket.find(params[:ticket][:id])
      if @ticket.update(ticket_params)
        flash[:notice] = t('admin.tickets.update.success')
        redirect_to admin_tickets_url 
      else
        flash[:warning] = @ticket.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :ticket
      end
    end

    # GET /users/1
    # GET /users/1.json
    def debit
      @tickets =[]
      tickets = Ticket.where(status: "Not Cleared").ids
      tickets.each do | ticket|
        v = Ticket.find(ticket)
        @tickets << v
      end
      @tickets
    end
  
    def show
        respond_to do |format|
      format.html   
    end
    end

    def preview
        respond_to do |format|
      format.html   
    end   
    end

      def print
        respond_to do |format|
        format.html {render template: 'admin/tickets/invoice' , layout: false} 
      end
  
    end

    # GET /users/new
    def new
      @ticket = Ticket.new
      @url = admin_tickets_path
    end

    # GET /users/1/edit
    def edit
      @url = admin_ticket_path(@ticket)
    end

    # POST /users
    # POST /users.json
    def create
      @ticket = Ticket.new(ticket_params)

      if @ticket.save
        flash[:notice] = t('admin.tickets.create.success')
        redirect_to admin_tickets_url 
      else
        flash[:warning] = @ticket.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :ticket
      end
    end

    # PATCH/PUT /users/1
    # PATCH/PUT /users/1.json
    def update
      if @ticket.update(visit_params)
        flash[:notice] = t('admin.tickets.update.success')
        redirect_to admin_tickets_url 
      else
        flash[:warning] = @ticket.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :ticket
      end
    end

    # DELETE /users/1
    # DELETE /users/1.json
    def destroy
      @ticket.destroy
      respond_to do |format|
        format.html { redirect_to admin_tickets_path, notice: t('admin.tickets.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def ticket_params
      params.require(:ticket).permit(Ticket.attribute_names.map(&:to_sym))
    end
  end
end








