class LogsDeleteController < ApplicationController
    def delete
        Log.delete_all  
        respond_to do |format|
            format.html { redirect_to tasks_url, notice: "Se ha limpiado la tabla de LOG." }
            format.json { head :no_content }
        end
    end
end
