json.extract! @modality, :id, :name, :description, :created_at, :updated_at
json.levels @modality.levels, :id, :name, :color
