class Menu_DSL
  attr_accessor :titulo, :ingestas, :plato, :porcentajes, :etiqueta
  attr_accessor :title, :porcentaje, :platos, :porcion, :gramos, :vct, :p_proteinas, :p_grasas, :p_hidratos 

  # def initialize(etiqueta, &block)
  #   @etiqueta = etiqueta
  #   @platos = []
  #   @porcentajes =[[]]
  #     (block.arity < 1 ? (instance_eval block) : block.call(self)) if block_given?
  # end
  
  
  def initialize(etiqueta, &block)
    self.etiqueta = etiqueta
    # self.titulo = titulo
    self.ingestas = []
    self.platos=[]
    self.porcentaje = []

    if block_given?  
      if block.arity == 1
        yield self
      else
       instance_eval(&block) 
      end
    end
  end

  def titulo(titulo=nil)
      titulo.nil? ? @titulo : @titulo = titulo
  end
  
  
  

    
  def ingesta(options = {})
    aux = ""
    aux << " mínima: #{options[:min]}\t" if options[:min]
    aux << " máxima: #{options[:max]}" if options[:max]
    
    ingestas << "#{aux}"
    
    "#{ingestas}"
  end

  def plato(options = {})
    aux = ""
    aux << "\t\tDescripción: #{options[:descripcion]}\n" if options[:descripcion]
    aux << "\t\tPorción: #{options[:porcion]}\n" if options[:porcion]
    aux << "\t\tGramos: #{options[:gramos]}\n\n" if options[:gramos]
    
    platos << "#{aux}"
    
    "#{platos}"
  end

  def get_porcentaje
    porcentajes = ""
    porcentajes << @porcentaje.join(', ')
    porcentajes
    end
    
    
    
    def get_platos
    l_platos = ""
    l_platos << @platos.join(', ')
    
    l_platos
    end
    
  def porcentajes(options={})
    aux = ""
    aux << "\t\tV.C.T: #{options[:vct]}\n" if options[:vct]
    aux << "\t\tProteínas: #{options[:proteinas]}\n" if options[:proteinas]
    aux << "\t\tGrasas: #{options[:grasas]}\n" if options[:grasas]
    aux << "\t\tHidratos: #{options[:hidratos]}\n\n" if options[:hidratos]
    
    porcentaje << "#{aux}"
    
    "#{porcentaje}"
  end

    def to_s
      salida = ""
      salida << "\nTítulo\t#{titulo}"
      salida << "\n#{'=' * (titulo.size+8)}\n\n"
      salida << "\nIngesta:\t#{ingestas.join(', ')}"
      
      salida << "\nPlatos:\n#{platos.join}"
      
      salida << "\nPorcentajes:\n#{porcentaje.join}"


      salida
  end


end

menu = Menu_DSL.new("Mediodía") do
    titulo  "Almuerzo"
    ingesta :min => 30, :max => 50
    plato   :descripcion => "Macarrones con salsa de tomate y queso parmesano",
            :porcion => "1 1/2 cucharón",
            :gramos => "200"
    
    plato   :descripcion => "Escalope de ternera",
            :porcion => "1 bistec mediano",
            :gramos => "100"
            
    plato   :descripcion => "Ensalada básica con zanahoria rallada",
            :porcion => "guarnición",
            :gramos => "120"
            
    plato   :descripcion => "Mandarina", :porcion => "1 grande", :gramos => "180"
    
    plato   :descripcion => "Pan de trigo integral", :porcion => "1 rodaja", :gramos => "20"
    porcentajes :vct => 785.9, :proteinas => 19, :grasas => 34, :hidratos => 47
end


puts menu
