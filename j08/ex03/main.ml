let () = 
	let methane = new Methane.methane in
	let oc = new Octane.octane in
	let et = new Ethane.ethane in
		print_endline methane#to_string;
		print_string "check if methane = methane : "; print_endline (string_of_bool (methane#equals (new Methane.methane)));
		print_endline oc#to_string;
		print_endline et#to_string;
		print_string "check if ethane = ethane : "; print_endline (string_of_bool (et#equals (new Ethane.ethane)));
		print_string "check if ethane = octane : "; print_endline (string_of_bool (et#equals et));

		
