json.array!(@modalities) do |modality|
  json.extract! modality, :id, :name, :description
  json.url modality_url(modality, format: :json)
end
