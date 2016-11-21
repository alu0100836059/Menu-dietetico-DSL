require "menu_dietetico/version"

module Lista
  Node = Struct.new(:previous, :value, :next)
  
  class Lista_doble
     
     attr_accessor :head, :num_nodos
     
     # Módulo Enumerable
     include Enumerable
     
     def initialize
         @head = @tail = nil
         @num_nodos = 0
     end
     
     def get_num_nodos
         @num_nodos
     end
     
     def get_cabeza
         @head
     end
     
     def get_cola
         @tail
     end
     

    #################################################
    
    #  # :no_required
    #  # Esperamos val como un numero variable de nodos
    #  def insert_final(*val)
         
    #      val.each do |nuevo_nodo|
        
    #     if @tail != nil
    #         @tail.next = nuevo_nodo
    #         nuevo_nodo.previous = @tail
    #         @tail = nuevo_nodo
    #     else
    #         @head = @tail = nuevo_nodo
    #     end
    #     @num_nodos += 1
    #     end
    # end
    
    # Esperamos val como un numero variable de nodos
    def insert_beginning(*val)
        
        val.each do |nuevo_nodo|
            
            if @head != nil
                @head.previous = nuevo_nodo
                nuevo_nodo.next = @head
                @head = nuevo_nodo
            else
                @head = nuevo_nodo
            end
            @num_nodos += 1
            
        end
    end 
    ###################################################
    
    def extract_first
       
      if @head == nil
          puts "\nLista vacía, nada que extraer\n"
      else
          aux = @head
          @head = aux.next
          return aux
      end
      @num_nodos -= 1
    end
    
    # :no_required
    # def extract_last
        
    #     if @head.value == nil
    #         puts "Lista vacía, nada que extraer"
    #     else
    #         aux = @head
    #         while aux.next.next != nil
    #             aux = aux.next
    #         end
    #         aux_2 = aux.next
    #         aux.next = nil
    #         @num_nodos -= 1
    #         return aux_2
    #     end
    # end
    
    # Método de acceso a un elemento dependiendo del índice
    def at(indice)
        cont = 0
        aux = @head
        while cont < indice do
            aux = aux.next
        end
        return aux
    end
    
    def reset
       @head = @tail = nil
       @num_nodos = 0
    end
    
    # Para :Enumerable
	def each
	    
	   # aux = @head
	   # # yield sobre el primer elemento
	   # yield aux
    #     while aux.next != nil
    #     #yield interno
    #         aux = aux.next
    #         yield aux
    #     end
    #     # yield sobre el último elemento
    #     yield aux
	end
    
    
    def to_s
        aux = @head
        if aux == nil
            puts "Lista vacía"
        else
            while aux.next != nil
                puts aux.value
                puts 
                aux = aux.next
            end
        puts aux.value
        end
    end
 end # end Lista_doble class
  
end #end module
