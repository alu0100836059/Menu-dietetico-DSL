require "menu_dietetico/version"

module MenuDietetico
  Node = Struct.new(:value, :next)
  
  class Menu_dietetico
     
     attr_accessor :head, :num_nodos
     
     def initialize
         @head = Node.new(nil,nil)
         @num_nodos = 0
     end
     
     def get_num_nodos
         @num_nodos
     end
     
     
     def insert(value)
        if @head.value != nil
            aux = @head
            while aux.next != nil
                aux = aux.next
            end
            aux.next = value
        else
            @head = value
        end
        @num_nodos += 1
    end
    
    def extract_first
       
      if @head.value == nil
          puts "\nLista vacía, nada que extraer\n"
      else
          aux = @head
          @head = aux.next
          return aux
      end
    end
    
    def extract_last
        
        if @head.value == nil
            puts "Lista vacía, nada que extraer"
        else
            aux = @head
            while aux.next.next != nil
                aux = aux.next
            end
            aux_2 = aux.next
            aux.next = nil
            return aux_2
        end
    end
    
    def to_s
        aux = @head
        if aux.value == nil
            puts "Lista vacía"
        else
            while aux.next != nil
                puts aux.value
                aux = aux.next
            end
        puts aux.value
        end
    end
 end #end class
  
  
end #end module
