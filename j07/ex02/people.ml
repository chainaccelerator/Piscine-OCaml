class people (name:string) =
    object
        val _name = name
        val mutable _hp   = 100
        
        method to_string = _name ^ " " ^ (string_of_int _hp)
        method talk = print_endline ("I’m " ^ _name ^ "! Do you know the Doctor?")
        method die = print_endline "Aaaarghh"
        initializer print_endline "One people is born"
    end