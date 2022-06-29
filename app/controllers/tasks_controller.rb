class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  require 'csv'

  # GET /tasks or /tasks.json
  def index
    @tasks = Task.with_attached_csv_files
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @data_in_0 = []
    @data_in_1 = []
    @data_in_2 = []
    @data_origen = []
    @filename = ""

    @tasks = Task.with_attached_csv_files
    
    @tasks.each_with_index do |task, i| 
      p task
      task.csv_files.count.times do |csv|
          #task.csv_files[csv]
          # Cargar archivos CSV (1 a N) atachados a un TASK.          
          CSV.parse(task.csv_files[csv].download, headers: true, row_sep: "\n", col_sep: ",", converters: :numeric) do |row|
            @data_in_0 << row["in_0"]  
            @data_in_1 << row["in_1"]
            @data_in_2 << row["in_2"]
            @filename = task.csv_files[csv].filename
            @data_origen << @filename.to_s.slice(0..40)
          end
          
          # Sanity
          @data_in_0.compact! 
          @data_in_1.compact!
          @data_in_2.compact!

          # Procesar Input
          @inputs = Input.all
          @inputs.each_with_index do |row, i|
            @data_in_0 << row["in_0"]
            @data_in_1 << row["in_1"]
            @data_in_2 << row["in_2"]
            @data_origen << "Postgresql"
          end
        
          # Almacenar en tabla de salida
          @data_in_0.each_with_index do |row, i|
            @in_0 = @data_in_0[i]
            @in_1 = @data_in_1[i]
            @in_2 = @data_in_2[i]
            @filename = @data_origen[i]

            @data_to_output = @data_in_1[i].slice(0..@data_in_2[i]-1)

            begin
              # Almacenar OUTPUT
              @output = Output.new(out_0: @data_in_0[i], out_1: @data_to_output)
              @output.save
            rescue Exception => e
              # Almacenar LOG
              @log = Log.new(in_1: @in_0, in_2: @in_1, in_3: @in_2, origen: @filename, error: e.message)
              @log.save
            end
          end

          @data_input  = Input.all
          @data_output = Output.all
          @data_log = Log.all
      end
    end
  end


  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    Output.delete_all
    Log.delete.all

    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
      @data_input  = Input.all
      @data_output = Output.all
      @data_log = Log.all
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:name, :status, csv_files: [])
    end
end
