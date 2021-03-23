json.extract! observacion, :id, :observacion, :detalle, :created_at, :updated_at
json.url observacion_url(observacion, format: :json)
