class Task < ApplicationRecord
    has_many_attached :csv_files
end
