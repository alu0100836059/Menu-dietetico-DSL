require "spec_helper"


describe Lista do
  before :all do
    
    # Elemento/s de la nueva clase Lista_doble
    @menu_1 = Lista::Lista_doble.new
    @menu_2 = Lista::Lista_doble.new
    @menu_3 = Lista::Lista_doble.new
    @menu_4 = Lista::Lista_doble.new
    @menu_5 = Lista::Lista_doble.new
    
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
                288.0, 17, 21, 62, ["leche, huevos, pescado, carne y frutos secos",
                "cereales, legumbres y féculas"])
                
    @cmd_edad1 = Menu_por_edad.new("MERIENDA", "15%", ["Galletas de leche con chocolate"+
                " y yogur", "Flan de vainilla sin huevo"], ["4 unidades", "1 unidad"],
                ["46 g", "110 g"], 313.6, 10, 30, 60, ["4 a 8 años", "9 a 13 años"])
    
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
    @menu_desayuno = "DESAYUNO (15%)\n- Leche desnatada, 1 vaso, 200 ml\n"+
                     "- Cacao instantáneo, 1 c/sopera, 10 g\n"+
                     "- Cereales de desayuno en hojuelas, 1 bol pequeño, 40 g\n"+
                     "- Almendras laminadas, (10 unidades) 2 c/soperas, 10 g\n"+
                     "V.C.T. | %\t288.0 kcal | 17% - 21% - 62%"
    
  end # Final de la inicialización :before all
  
  
describe "Node" do
  
  it "Existe un nodo en la lista" do
    expect(@menu_1.get_num_nodos).to eq 0
    @menu_1.insert_beginning(@nodo_1)
    expect(@menu_1.get_num_nodos).to eq 1
  end
  
  it "El nodo posee su siguiente" do
    @menu_1.insert_beginning(@nodo_3, @nodo_1)
    expect(@menu_1.at(0).next).to_not be_nil
  end
  
  
  it "El nodo contiene los datos correctos" do 
    @nodo_1_lista = @menu_1.at(0).value.to_s
    expect(@nodo_1_lista).to eq(@menu_desayuno)
  end
  
end 

describe "Lista_doble" do
  
  it "Se extrae el primer elemento de la lista" do
    primer_nodo = @menu_1.at(0).value
    expect(@menu_1.extract_first.value).to eq(primer_nodo)
  end
  
  it "Se puede insertar un elemento" do
    expect(@menu_4.get_num_nodos).to eq(0)
    @menu_4.insert_beginning(@nodo_1)
    expect(@menu_4.get_num_nodos).to eq(1)
  end


  it "Se pueden insertar varios elementos" do
    expect(@menu_5.get_cabeza).to be_nil
    expect(@menu_5.get_num_nodos).to eq(0)
    @menu_5.insert_beginning(@nodo_4, @nodo_5)
    expect(@menu_5.get_num_nodos).to eq(2)
  end
  
  it "Debe existir una Lista con su cabeza" do
    expect(@menu_4.get_cabeza).to_not be_nil
  end
  
  it "Se crea la lista vacía" do
    expect(@menu_2.get_cabeza).to be_nil
    expect(@menu_2.get_num_nodos).to eq(0)
  end
  
end #Lista_doble

describe "Inheritance" do
  
  it "Menu_por_alimentos hereda de la clase Menu" do
    @menu_1.reset
   @menu_1.insert_beginning(@nodo_a1)
   expect(@menu_1.at(0).value).to be_a_kind_of(Menu)
  end
  
  it "Menu_por_edad hereda de la clase Menu" do
    @menu_1.reset
   @menu_1.insert_beginning(@nodo_e1)
   expect(@menu_1.at(0).value).to be_a_kind_of(Menu)
  end
  
  
  
end

end