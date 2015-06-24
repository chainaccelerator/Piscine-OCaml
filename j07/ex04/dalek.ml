class dalek =
    object
        val _name = Random.self_init ();"Dalek" ^ (String.make 1 (char_of_int((Random.int 15) + 65))) ^ (String.make 1 (char_of_int((Random.int 12) + 97))) ^ (String.make 1 (char_of_int((Random.int 11) + 97)))
        val mutable _hp   = 100
        val mutable _shield = true
        
        method to_string = _name ^ " " ^ (string_of_int _hp) ^ " shield : " ^ (string_of_bool _shield)
        method talk = let rand = (Random.int 3) in 
        	match rand with
        	| 0 -> print_endline "Explain! Explain!"
        	| 1 -> print_endline "Exterminate! Exterminate!"
        	| 2 -> print_endline "I obey!"
        	| _ -> print_endline "You are the Doctor! You are the enemy of the Daleks!"

        method exterminate (p:People.people) = p#die; if _shield = true then _shield <- false else _shield <- true
        method die = print_endline "Emergency Temporal Shift!"   

        initializer Random.self_init ()
    end