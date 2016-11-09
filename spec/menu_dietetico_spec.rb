require "spec_helper"
require "menu_dietetico"
require "menu_comida"

describe MenuDietetico do
  before :all do
    
    # Elemento/s de la nueva clase Menu_dietetico
    @menu_1 = MenuDietetico::Menu_dietetico.new()
    
    # Comidas del día
    @comida_1 = Menu_comida.new("DESAYUNO", "15%", ["Leche desnatada", "Cacao instantáneo",
                "Cereales de desayuno en hojuelas", "Almendras laminadas"],
                ["1 vaso", "1 c/sopera", "1 bol pequeño", 
                "(10 unidades) 2 c/soperas"], ["200 ml", "10 g", "40 g", "10 g"],
                288.0, 17, 21, 62)
    @comida_2 = Menu_comida.new("MEDIA MAÑANA","10%",["Cerezas",
                "Galletas bifidus con sésamo"], ["10-12 unidades medianas",
                "4 unidades"], [12,40], 255.5, 7, 24, 69)
    
    
    # Nodos del Struct creado en el nuevo archivo
    @nodo_1 = MenuDietetico::Node.new(@comida_1, nil)
    @nodo_2 = MenuDietetico::Node.new(@comida_2, nil)
    
    
    # variables para las comparaciones
    @menu_desayuno = "DESAYUNO (15%)\n- Leche desnatada, 1 vaso, 200 ml\n"+
                     "- Cacao instantáneo, 1 c/sopera, 10 g\n"+
                     "- Cereales de desayuno en hojuelas, 1 bol pequeño, 40 g\n"+
                     "- Almendras laminadas, (10 unidades) 2 c/soperas, 10 g\n"+
                     "V.C.T. | %\t288.0 kcal | 17% - 21% - 62%"
    
  end
  
  
describe "Debe existir un nodo de la lista con su valor y siguiente" do
  
  it "Existe un nodo en la lista" do
    expect(@menu_1.get_num_nodos).to eq 0
    @menu_1.insert(@nodo_1)
    expect(@menu_1.get_num_nodos).to eq 1
    
    # Revisar la documentación de to exist y como pasar la prueba
    #expect(@menu_1.at(0)).to exist
  end
  
  it "El nodo posee su siguiente" do
    @menu_1.insert(@nodo_2)
    expect(@menu_1.at(0).next).to_not be_nil
    
    # Pruebas to_s
    # puts @comida_1
    # puts 
    # puts
    # puts @nodo_1.value
    # puts @menu_1.at(0).value
  end
  
  
  it "El nodo contiene los datos correctos" do 
    @nodo_1_lista = @menu_1.at(0).value.to_s
    expect(@nodo_1_lista).to eq(@menu_desayuno)
  end
  
  
end
end