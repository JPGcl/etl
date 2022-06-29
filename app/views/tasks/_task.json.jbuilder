json.extract! task, :id, :name, :status, :created_at, :updated_at, :csv_files
json.url task_url(task, format: :json)
