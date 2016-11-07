require "spec_helper"
require "menu_dietetico"
require "menu_comida"

describe MenuDietetico do
  before :all do
    
    # Elemento/s de la nueva clase Menu_dietetico
    @menu_1 = MenuDietetico::Menu_dietetico.new()
    
    # Comidas del día
    @comida_1 = Menu_comida.new("MEDIA MAÑANA","10%",["Cerezas",
                "Galletas bifidus con sésamo"], ["10-12 unidades medianas", "4 unidades"], [12,40], 255.5, 7, 24, 69)
    
    
    @nodo_1 = MenuDietetico::Node.new(@comida_1, nil)
    
    
  end
  
  
describe "Debe existir un nodo de la lista con su valor y siguiente" do
  
  it "Existe un nodo en la lista" do
    expect(@menu_1.get_num_nodos).to eq 0
    @menu_1.insert(@nodo_1)
    expect(@menu_1.get_num_nodos).to eq 1
  end
  
end
end