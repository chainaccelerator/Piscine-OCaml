class doctor (name:string) (age:int) (sidekick:People.people) =
    object (self)
        val _name = name
        val _age = age
        val _sidekick = sidekick
        val mutable _hp   = 0
        
        method to_string = (_name ^ " hp : " ^ (string_of_int _hp) ^ " age : " ^ (string_of_int age) ^ " sidekick : " ^ _sidekick#to_string)
        
        method talk = print_endline "Hi! I’m the Doctor!"
        method travel_in_time (start:int) (arrival:int) = 
print_endline "         /-\\ 
    _____|#|_____
   |_____________|
  |_______________|
|||_POLICE_##_BOX_|||
 | |¯|¯|¯|||¯|¯|¯| |
 | |-|-|-|||-|-|-| |
 | |_|_|_|||_|_|_| |
 | ||~~~| | |¯¯¯|| |
 | ||~~~|!|!| O || |
 | ||~~~| |.|___|| |
 | ||¯¯¯| | |¯¯¯|| |
 | ||   | | |   || |
 | ||___| | |___|| |
 | ||¯¯¯| | |¯¯¯|| |
 | ||   | | |   || |
 | ||___| | |___|| |
|¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯|
 ¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯";
 			if start > arrival then                    
                print_endline ("Doctor travel " ^ (string_of_int (start - arrival)) ^ " years in past.")
            else
                print_endline ("Doctor travel " ^ (string_of_int (arrival - start)) ^ " years in future.");
            print_endline "... But the travel was instant, his age haven't change !"

		method use_sonic_screwdriver = print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii" 
		method private regenerate = _hp <- 100

        initializer print_endline "A new doctor as born"; self#regenerate
    end