class DeleteLogController < ApplicationController
    #
  def delete_ELIMINAR
    Log.delete.all    
  end

end
