# encoding: UTF-8
require_relative "menu"

class Menu_por_alimentos < Menu

	attr_accessor :grupo_alimentos
	
	def initialize(title, porcentaje,platos,porcion,gramos,vct,p_proteinas,p_grasas,p_hidratos,grupo_alimentos)
		super(title, porcentaje,platos,porcion,gramos,vct,p_proteinas,p_grasas,p_hidratos)
		@grupo_alimentos = grupo_alimentos
	end
	
	def to_s
	    "Menús pertenecientes a las categorías de alimentos: #{@edad}:\n"+super.to_s
	end
end