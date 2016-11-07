require "spec_helper"
require "menu_dietetico"

# describe MenuDietetico do
  
#   it "has a version number" do
#     expect(MenuDietetico::VERSION).not_to be nil
#   end
  
#   it "does something useful i.e" do
#     expect(false).to eq(false)
#   end


describe MenuDietetico do
  before :all do
    @menu_1 = MenuDietetico::Menu_dietetico.new()
    @nodo_1 = MenuDietetico::Node.new("Macarrones", nil)
  end
  
  
describe "Debe existir un nodo de la lista con su valor y siguiente" do
  
  it "Existe un nodo en la lista" do
    expect(@menu_1.get_num_nodos).to eq 0
    @menu_1.insert(@nodo_1)
    expect(@menu_1.get_num_nodos).to eq 1
  end
  
end
end