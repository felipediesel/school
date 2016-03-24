json.array!(@modalities) do |modality|
  json.extract! modality, :id, :name, :description
  json.levels modality.levels, :id, :name, :color
  json.url modality_url(modality, format: :json)
end
