class virtual atom =
    object (this)

        method virtual name : string
        method virtual symbol : string
        method virtual number : int


        method to_string = "Name of atom : " ^ this#name ^ " symbol is : "
        ^ this#symbol ^ " atomic number is : " ^ (string_of_int this#number)

        method equals ( that:atom ) = 
            ((this#name = that#name) && (this#symbol = that#symbol) && (this#number = that#number))

    end
