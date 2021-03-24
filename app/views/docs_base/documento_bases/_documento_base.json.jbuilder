json.extract! documento_base, :id, :orden, :documento, :area_base_id, :created_at, :updated_at
json.url documento_base_url(documento_base, format: :json)
