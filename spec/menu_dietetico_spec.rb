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
                "(10 unidades) 2 c/soperas"], [200, 10, 40, 10],
                288.0, 17, 21, 62)
    @comida_2 = Menu_comida.new("MEDIA MAÑANA","10%",["Cerezas",
                "Galletas bifidus con sésamo"], ["10-12 unidades medianas",
                "4 unidades"], [12,40], 255.5, 7, 24, 69)
    
    
    # Nodos del Struct creado en el nuevo archivo
    @nodo_1 = MenuDietetico::Node.new(@comida_1, nil)
    @nodo_2 = MenuDietetico::Node.new(@comida_2, nil)
    
  end
  
  
describe "Debe existir un nodo de la lista con su valor y siguiente" do
  
  it "Existe un nodo en la lista" do
    expect(@menu_1.get_num_nodos).to eq 0
    @menu_1.insert(@nodo_1)
    expect(@menu_1.get_num_nodos).to eq 1
  end
  
  it "El nodo contiene los datos correctos" do 
    # falta
  end
  
  it "El nodo posee su siguiente" do
    # falta
  end
  
  
end
end