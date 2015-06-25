let () = 
	let water = new Water.water in
	let co2 = new Carbondioxyde.carbondioxyde in
		print_endline water#to_string;
		print_string "check if water = water : "; print_endline (string_of_bool (water#equals (new Water.water)));
		print_endline co2#to_string;
		print_string "check if carbondioxyde = carbondioxyde : "; print_endline (string_of_bool (co2#equals (new Carbondioxyde.carbondioxyde)));
		print_string "check if water = carbondioxyde : "; print_endline (string_of_bool (water#equals co2));
	let tnt = new Tnt.tnt in
        print_endline tnt#to_string;
    let but = new Butan.butan in
        print_endline but#to_string;
    let ben = new Benzylparaben.benzylparaben in
        print_endline ben#to_string;
    let tca = new Trans_cinnamic_acid.trans_cinnamic_acid in
        print_endline tca#to_string;
    let eth = new Ethane.ethane in
        print_endline eth#to_string;

		
