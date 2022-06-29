class OutputsDeleteController < ApplicationController
    def delete
        Output.delete_all  
        respond_to do |format|
            format.html { redirect_to tasks_url, notice: "Se ha limpiado la tabla OUTPUT." }
            format.json { head :no_content }
        end
    end
end
