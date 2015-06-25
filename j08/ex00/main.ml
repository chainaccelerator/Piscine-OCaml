let () = 
	let h = new Hydrogen.hydrogen in
	let o = new Oxygen.oxygen in
	let u = new Uranium.uranium in
	let c = new Carbon.carbon in
	let n = new Nitrogen.nitrogen in
	print_endline h#to_string;
	print_endline o#to_string;
	print_endline u#to_string;
	print_endline c#to_string;
	print_endline n#to_string;
	print_string "check if hydrogen = oxygen : "; print_endline (string_of_bool (h#equals o));
	print_string "check if hydrogen = hydrogen : "; print_endline (string_of_bool (h#equals (new Hydrogen.hydrogen)));
	print_string "check if oxygen = uranium : "; print_endline (string_of_bool (h#equals u));
