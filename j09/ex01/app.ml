module App =
	struct
		type project = string * string * int
		
		let zero = (("", "", 0):project)
		
		let combine (a:project) (b:project) = 
			match a with | (q, w, e) -> match b with | (a, s, d) -> 
			(((q ^ a), (if ((e + d) / 2) > 80 then "ucceed" else "fail") ,((e + d) / 2)):project)

		let fail (a:project) = match a with | (a, _, _) -> ((a, "fail", 0):project)
		let success (a:project) = match a with | (a, _, _) -> ((a, "ucceed", 80):project)
	end



let print_proj (a:App.project) = match a with | (q, w, e) -> print_string q; print_string " "; print_string w;  print_string " "; print_int e; print_string "\n"

let () = 
	 let p1:App.project = (App.zero) in 
    let p2:App.project = (("Rush 01", "succes", 80):App.project) in

    print_endline "Test App.fail avec App.zero : ";
    print_proj (App.fail p1);
    print_endline "Test App.success avec App.zero : ";
    print_proj (App.success p1);
    print_endline "Test App.combine avec App.zero et ((\"Rush 01\", \"succes\", 80):App.project) : ";
    print_proj (App.combine p1 p2);
    print_endline "Test App.fail avec ((\"Rush 01\", \"succes\", 80):App.project) : ";
    print_proj (App.fail p2);
    print_endline "Test App.success avec ((\"Rush 01\", \"succes\", 80):App.project) : ";
    print_proj (App.success p2)
