# encoding: UTF-8
require_relative "menu"

class Menu_por_edad < Menu
	attr_accessor :edad
	
	def initialize(title, porcentaje,platos,porcion,gramos,vct,p_proteinas,p_grasas,p_hidratos,edad)
		super(title, porcentaje,platos,porcion,gramos,vct,p_proteinas,p_grasas,p_hidratos)
		@edad = edad
	end
	
	def to_s
	    "Menú para edades de #{@edad}:\n"+super.to_s
	end

end