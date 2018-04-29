
  module Admin
  class ExpensesController < Admin::ApplicationController
    respond_to :json, :html
    before_action :set_expense, only: [:show, :edit, :update, :destroy]

    # GET /expenses
    # GET /expenses.json
    def index
      
      if current_user.admin?
      @expenses = Expense.all
    else
      @expenses = current_user.expenses
    end
  end

    # GET /expenses/1
    # GET /expenses/1.json
    def show
        respond_to do |format|
      format.html   
      
      end
  
    end
      

    # GET /expenses/new
    def new
      @expense = Expense.new
      @url = admin_expenses_path
    end

    # GET /expenses/1/edit
    def edit
      @url = admin_expense_path(@expense)
    end

    # POST /expenses
    # POST /expenses.json
    def create
      @expense = current_user.expenses.build(expense_params)

      if @expense.save
        flash[:notice] = t('admin.expenses.create.success')
        redirect_to admin_expenses_url 
      else
        flash[:warning] = @expense.errors.full_messages.uniq.join(', ')
        respond_with :new, :admin, :expense
      end
    end

    # PATCH/PUT /expenses/1
    # PATCH/PUT /expenses/1.json
    def update
      if @expense.update(expense_params)
        flash[:notice] = t('admin.expenses.update.success')
        redirect_to admin_expenses_url 
      else
        flash[:warning] = @expense.errors.full_messages.uniq.join(', ')
        respond_with :edit, :admin, :expense
      end
    end

    # DELETE /expenses/1
    # DELETE /expenses/1.json
    def destroy
      @expense.destroy
      respond_to do |format|
        format.html { redirect_to admin_expenses_path, notice: t('admin.expenses.destroy.success') }
        format.json { head :no_content }
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    private def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    private def expense_params
      params.require(:expense).permit(Expense.attribute_names.map(&:to_sym))
    end
  end
end