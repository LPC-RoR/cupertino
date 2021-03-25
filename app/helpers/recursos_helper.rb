module RecursosHelper
	## ------------------------------------------------------- MENU

    ## Menu principal de la aplicación
    # [0] : Item del menú
    # [1] : Link del ítem
    # [2] : Tipo de ítem {'admin', 'usuario', 'anonimo', 'excluir'}
    # se usa directamente en 0p/navbar/_navbar.html.erb
	def menu
	    [
	        ["Estructura Base", "/estructuras",        'admin'],
	        ["Documentos",      "/documento_bases",    'admin'],
	        ["Administradores", "/administradores",    'admin'],
	        ["Temas Ayuda",     "/tema_ayudas",        'admin']
	    ]
	end

	def display_item_app(item, tipo_item)
		case item
		when 'Temas'
			session[:hay_proyecto] and Proyecto.find(session[:proyecto_activo]['id']).carpetas_personalizadas.any?
		else
			session[:hay_proyecto] or ['Proyectos'].include?(item)
		end
	end

	## ------------------------------------------------------- TABLA | BTNS

	def tr_row(objeto)
		case objeto.class.name
		when 'Publicacion'
			if usuario_signed_in?
				'default'
			else
				'default'
			end
		else
			'default'
		end
	end

	def crud_conditions(objeto, btn)
		case objeto.class.name
		when 'NivelBase'
			btn == 'Editar' and controller_name == 'curriculum_bases'
		when 'AreaBase'
			action_name == 'index'
		when 'AsignaturaBase'
			controller_name == 'curriculum_bases'
		when 'DocumentoBase'
			action_name == 'index'
		else
			true
		end
	end

	def x_conditions(objeto, btn)
		case objeto.class.name
		when 'NivelBase'
			case btn
			when 'Eliminar'
				objeto.children.empty? and controller_name == 'curriculum_bases'
			when 'Desasignar'
				(not ['nivel_bases', 'curriculum_bases'].include?(controller_name)) and action_name == 'show'
			end
		when 'AsignaturaBase'
			not ['estructura_bases', 'curriculum_bases'].include?(controller_name)
		else
			true
		end
	end

	def x_btns(objeto)
		case objeto.class.name
		when 'NivelBase'
			[
				['Eliminar', '/elimina_nivel_base', false],
				['Desasignar', '/desasignar', true]
			]
		when 'AsignaturaBase'
			[['Desasignar', '/desasignar', true]]
        else
        	[]
		end		
	end

	def show_link_condition(objeto)
		case objeto.class.name
		when 'Proyecto'
			objeto.id == session[:proyecto_activo]['id']
		else
			true
		end
	end

	## ------------------------------------------------------- FORM & SHOW

	def detail_controller_path(controller)
		if ['documento_bases'].include?(controller)
			"docs_base/#{controller}/detail"
		else
			"#{controller}/detail"
		end
	end

	# apoyo de filtro_condicional_field? (abajo)
	def get_field_condition(objeto, field)
		case objeto.class.name
		when 'Publicacion'
			objeto.origen == 'ingreso'
		when 'Mensaje'
			field != 'email' or not usuario_signed_in?
		end
	end

	## ------------------------------------------------------- SHOW

	# Método de apoyo usado en get_new_link (abajo)
	def objeto_title(objeto)
		case objeto.class.name
		when 'Publicacion'
			objeto.title
		when 'Linea'
			objeto.columnas.order(:orden).first.columna
		end
	end

	def show_links(objeto)
		case objeto.class.name
		when 'Publicacion'
			[
				['Editar',     [:edit, objeto], objeto.origen == 'ingreso'],
				['Papelera',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=papelera",     (['ingreso', 'duplicado'].include?(objeto.estado) and objeto.origen = 'ingreso')],
				['Eliminar',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=eliminado",    ['papelera'].include?(objeto.estado)],
				['Publicar',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=publicada",    (['ingreso'].include?(objeto.estado) and objeto.title.present? and objeto.author.present? and objeto.journal.present?)],	
				['Ingreso',    "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=ingreso",      (['publicado', 'papelera'].include?(objeto.estado) and objeto.origen == 'ingreso')],
				['Múltiple',   "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=multiple",     objeto.estado == 'duplicado'],
				['Corrección', "/publicaciones/estado?publicacion_id=#{objeto.id}&estado=correccion",   (objeto.estado == 'publicada' and objeto.origen == 'ingreso' and objeto.textos.empty?)]
			]
		end
	end

end
