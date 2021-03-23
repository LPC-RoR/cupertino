class Perfil < ApplicationRecord
	TABLA_FIELDS = [
		['email', 'normal'], 
	]

	belongs_to :administrador, optional: true

end
