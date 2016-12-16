require "spec_helper"


describe Lista do
  before :each do
    
    # Instancia de la nueva clase Lista_doble
    @menu_1 = Lista::Lista_doble.new
    
    # Comidas del día
    @comida_1 = Menu.new("DESAYUNO", "15%", ["Leche desnatada", "Cacao instantáneo",
                "Cereales de desayuno en hojuelas", "Almendras laminadas"],
                ["1 vaso", "1 c/sopera", "1 bol pequeño", 
                "(10 unidades) 2 c/soperas"], ["200 ml", "10 g", "40 g", "10 g"],
                288.0, 17, 21, 62)
    @comida_2 = Menu.new("MEDIA MAÑANA","10%",["Cerezas",
                "Galletas bifidus con sésamo"], ["10-12 unidades medianas",
                "4 unidades"], ["120 g","40 g"], 255.5, 7, 24, 69)
    @comida_3 = Menu.new("ALMUERZO", "30 - 35%", ["Macarrones con salsa"+
                " de tomate y queso parmesano", "Escalope de ternera",
                "Ensalada básica con zanahoria rallada", "Mandarina",
                "Pan de trigo integral"], ["1 1/2 cucharón", "1 bistec mediano",
                "", "1 grande", "1 rodaja"], ["200 g", "100 g", 
                "guarnición de 120 g", "180 g", "20 g"], 785.9, 19, 34, 47)
    @comida_4 = Menu.new("MERIENDA", "15%", ["Galletas de leche con chocolate"+
                " y yogur", "Flan de vainilla sin huevo"], ["4 unidades", "1 unidad"],
                ["46 g", "110 g"], 313.6, 10, 30, 60)
    @comida_5 = Menu.new("CENA", "25 - 30%", ["Crema de bubango", 
                "Tortilla capesina con espinacas", "Tomate en dados con atún",
                "Piña natural o en su jugo picada", "Pan de trigo integral"],
                ["2 cucharones", "1 cuña grande", "5 a 6 c/soperas",
                "5 c/soperas", "1 rodaja"], ["200 g", "150 g", "150 g", "120 g",
                "20 g"], 561.6, 19, 40, 41)
    
    @cmd_alim1 = Menu_por_alimentos.new("DESAYUNO", "15%", ["Leche desnatada", "Cacao instantáneo",
                "Cereales de desayuno en hojuelas", "Almendras laminadas"],
                ["1 vaso", "1 c/sopera", "1 bol pequeño", 
                "(10 unidades) 2 c/soperas"], ["200 ml", "10 g", "40 g", "10 g"],
                288.0, 17, 21, 62, "leche, huevos, pescado, carne y frutos secos")
                
    @cmd_edad1 = Menu_por_edad.new("MERIENDA", "15%", ["Galletas de leche con chocolate"+
                " y yogur", "Flan de vainilla sin huevo"], ["4 unidades", "1 unidad"],
                ["46 g", "110 g"], 313.6, 10, 30, 60, "4 a 8 años")
    
    # Nodos del Struct creado en el nuevo archivo
    @nodo_1 = Lista::Node.new(nil, @comida_1, nil)
    @nodo_2 = Lista::Node.new(nil, @comida_2, nil)
    @nodo_3 = Lista::Node.new(nil, @comida_3, nil)
    @nodo_4 = Lista::Node.new(nil, @comida_4, nil)
    @nodo_5 = Lista::Node.new(nil, @comida_5, nil)
    
    # Para las nuevas clases heredadas
    @nodo_a1 = Lista::Node.new(nil, @cmd_alim1, nil)
    @nodo_e1 = Lista::Node.new(nil, @cmd_edad1, nil)
    
    # variables para las comparaciones
    @check_nodo_1 = "DESAYUNO (15%)\n- Leche desnatada, 1 vaso, 200 ml\n"+
                     "- Cacao instantáneo, 1 c/sopera, 10 g\n"+
                     "- Cereales de desayuno en hojuelas, 1 bol pequeño, 40 g\n"+
                     "- Almendras laminadas, (10 unidades) 2 c/soperas, 10 g\n"+
                     "V.C.T. | %\t288.0 kcal | 17% - 21% - 62%"
                     
    @check_nodo_2 = "MEDIA MAÑANA (10%)\n- Cerezas, 10-12 unidades medianas, 120 g\n"+
                     "- Galletas bifidus con sésamo, 4 unidades, 40 g\n"+
                     "V.C.T. | %\t255.5 kcal | 7% - 24% - 69%"
    
    
    @comprobacion_a1 = "Menús pertenecientes a las categorías de alimentos: "+
                    "leche, huevos, pescado, carne y frutos secos:\n"+
                    "DESAYUNO (15%)\n- Leche desnatada, 1 vaso, 200 ml\n"+
                    "- Cacao instantáneo, 1 c/sopera, 10 g\n"+
                    "- Cereales de desayuno en hojuelas, 1 bol pequeño, 40 g\n"+
                    "- Almendras laminadas, (10 unidades) 2 c/soperas, 10 g\n"+
                    "V.C.T. | %\t288.0 kcal | 17% - 21% - 62%"
    
    @comprobacion_e1 = "Menú para edades de 4 a 8 años:\n"+
                    "MERIENDA (15%)\n- Galletas de leche con chocolate y yogur, 4 unidades, 46 g\n"+
                    "- Flan de vainilla sin huevo, 1 unidad, 110 g\n"+
                    "V.C.T. | %\t313.6 kcal | 10% - 30% - 60%"
    
    
    
    # Instancia DSL
              @menu_dsl = Menu_DSL.new("Mediodía") do
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
              
              
              @platos_dsl_exp = "\t\tDescripción: Macarrones con salsa de tomate y queso parmesano\n\t\t"+
                            "Porción: 1 1/2 cucharón\n\t\tGramos: 200\n\n, \t\tDescripción: Escalope de ternera\n\t\t"+
                            "Porción: 1 bistec mediano\n\t\tGramos: 100\n\n, \t\tDescripción: Ensalada básica con zanahoria rallada\n\t\t"+
                            "Porción: guarnición\n\t\tGramos: 120\n\n, \t\tDescripción: Mandarina\n\t\t"+
                            "Porción: 1 grande\n\t\tGramos: 180\n\n, \t\tDescripción: Pan de trigo integral\n\t\t"+
                            "Porción: 1 rodaja\n\t\tGramos: 20\n\n"
                            
                            
              @porcent_dsl_exp = "\t\tV.C.T: 785.9\n\t\tProteínas: 19\n\t\tGrasas: 34\n\t\tHidratos: 47\n\n"
              
  end # Final de la inicialización :before each
  
  
describe "Node" do
  
  it "Existe un nodo en la lista" do
    expect(@menu_1.get_num_nodos).to eq 0
    @menu_1.insert_beginning(@nodo_1)
    expect(@menu_1.get_num_nodos).to eq (1)
  end
  
  it "El nodo posee su siguiente" do
    @menu_1.insert_beginning(@nodo_3, @nodo_1)
    expect(@menu_1.at(0).next).to_not be_nil
  end
  
  
  it "El nodo contiene los datos correctos" do 
    @menu_1.insert_beginning(@nodo_1)
    @nodo_1_lista = @menu_1.at(0).value.to_s
    expect(@nodo_1_lista).to eq(@check_nodo_1)
  end
  
end 

describe "Lista_doble" do
  
  it "Se extrae el primer elemento de la lista" do
    @menu_1.insert_beginning(@nodo_1)
    primer_nodo = @menu_1.at(0).value
    expect(@menu_1.extract_first.value).to eq(primer_nodo)
  end
  
  it "Se puede insertar un elemento" do
    expect(@menu_1.get_num_nodos).to eq(0)
    @menu_1.insert_beginning(@nodo_1)
    expect(@menu_1.get_num_nodos).to eq(1)
  end


  it "Se pueden insertar varios elementos" do
    expect(@menu_1.get_cabeza).to be_nil
    expect(@menu_1.get_num_nodos).to eq(0)
    @menu_1.insert_beginning(@nodo_1, @nodo_2)
    expect(@menu_1.get_num_nodos).to eq(2)
  end
  
  it "Debe existir una Lista con su cabeza" do
    @menu_1.insert_beginning(@nodo_1)
    expect(@menu_1.get_cabeza).to_not be_nil
  end
  
  it "Se crea la lista vacía" do
    expect(@menu_1.get_cabeza).to be_nil
    expect(@menu_1.get_num_nodos).to eq(0)
  end
  
end #Lista_doble

describe "Inheritance" do
  
  it "Menu_por_alimentos hereda de la clase Menu" do
   @menu_1.insert_beginning(@nodo_a1)
   expect(@menu_1.at(0).value).to be_a_kind_of(Menu)
  end
  
  
  it "Se lista adecuadamente el menu segun alimento" do
    @menu_1.insert_beginning(@nodo_a1)
    expect(@menu_1.at(0).value.to_s).to eq(@comprobacion_a1)
  end
  
  it "Menu_por_edad hereda de la clase Menu" do
   @menu_1.insert_beginning(@nodo_e1)
   expect(@menu_1.at(0).value).to be_a_kind_of(Menu)
  end
  
  it "Se lista adecuadamente el menu segun el rango de edad" do
    @menu_1.insert_beginning(@nodo_e1)
    expect(@menu_1.at(0).value.to_s).to eq(@comprobacion_e1)
  end
end # Final Inheritance

describe "Modulo Enumerable" do
  
    it "Se recorre la lista mostrandola perfectamente" do
      @menu_1.insert_beginning(@nodo_1, @nodo_2)
      @concat_nodo1_2 = @check_nodo_2+@check_nodo_1
      @concat_each = ""
      @menu_1.each{|nodo| @concat_each<<"#{nodo}"}
      expect(@concat_nodo1_2).to eq (@concat_each)
    end
    
    it ".all" do
      @menu_1.insert_beginning(@nodo_1, @nodo_2)
      expect(@menu_1.all?{|nodo| nodo.class == Menu}).to be true
    end
    
    it ".any" do
      @menu_1.insert_beginning(@nodo_1, @nodo_2)
      expect(@menu_1.any? {|nodo| nodo.to_s == "#{@check_nodo_1}"}).to be true
    end
    
    it ".map" do
      @menu_1.insert_beginning(@nodo_1, @nodo_2)
      @array_map = ["#{@check_nodo_2}","#{@check_nodo_1}"]
      @concat_cycle = @menu_1.map{|nodo| nodo.to_s}
      expect(@concat_cycle).to eq(@array_map)
    end
    
    it ".count" do
      @menu_1.insert_beginning(@nodo_1, @nodo_2, @nodo_3, @nodo_4)
      expect(@menu_1.count).to eq(4)
    end
    
    it ".cycle" do
      @menu_1.insert_beginning(@nodo_1, @nodo_2)
      @concat_nodo1_2_double = @check_nodo_2+@check_nodo_1+@check_nodo_2+@check_nodo_1
      @concat_cycle = ""
      @menu_1.cycle(2){|nodo| @concat_cycle<<"#{nodo}"}
      expect(@concat_cycle).to eq(@concat_nodo1_2_double)
    end
end # Final Enumerable

describe "Modulo Comparable" do
  
  it ".<" do
    @menu_1.insert_beginning(@nodo_1, @nodo_2)
    expect(@menu_1.at(0).value).to be < (@menu_1.at(1).value) 
  end
  
  it ".>" do
    @menu_1.insert_beginning(@nodo_1, @nodo_3)
    expect(@menu_1.at(0).value).to be > (@menu_1.at(1).value) 
  end
  
  it ".==" do
    @menu_1.insert_beginning(@nodo_1, @nodo_1)
    expect(@menu_1.at(0).value).to be == (@menu_1.at(1).value) 
  end
  
  it ".<=" do
    @menu_1.insert_beginning(@nodo_1, @nodo_1)
    expect(@menu_1.at(0).value).to be <= (@menu_1.at(1).value) 
  end
  
  it ".>=" do
    @menu_1.insert_beginning(@nodo_1, @nodo_1)
    expect(@menu_1.at(0).value).to be >= (@menu_1.at(1).value) 
  end
  
  it ".between" do
    @menu_1.insert_beginning(@nodo_1, @nodo_2)
    expect(@menu_1.at(1).value.between?(@nodo_1.value,@nodo_4.value)).to be true 
  end
end # Final Comparable


describe "Menú DSL" do
  it "La entrada posee una etiqueta" do
    expect(@menu_dsl.etiqueta).to eq("Mediodía")
  end
  
    it "La entrada posee una titulo" do
    expect(@menu_dsl.titulo).to eq("Almuerzo")
  end
  
  #   it "La entrada posee una lista de platos" do
  #   expect(@menu_dsl).to eq("Mediodía")
  # end
  
    it "La entrada posee una lista de platos" do
    expect(@menu_dsl.platos.join(', ')).to eq("#{@platos_dsl_exp}")
  end
  
    it "La entrada posee una lista de porcentajes" do
      expect(@menu_dsl.porcentaje.join(', ')).to eq("#{@porcent_dsl_exp}")
    end
  
  
end # Final DSL

end # Final describe Lista