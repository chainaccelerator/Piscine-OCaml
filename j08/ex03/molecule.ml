class virtual molecule (name:string) (lste:Atom.atom list) =
	object (this)

		method genFormula lst =
			let rec loop lst acc = match lst with
				| [] -> acc
				| h::t -> loop t (acc @ [h#symbol])
				in 

			let rec check_nb lst nb acc = match lst with
			    | [] -> acc
			    | head::second::tail -> 
			        begin
			            if head = second then
			                check_nb (second::tail) (nb + 1) acc
			            else
			                check_nb (second::tail) 0 (acc @ [((nb + 1), head)])
			        end
			    | head::tail ->
            check_nb [] 0 (acc @ [((nb + 1), head)]) in
            let tub_lst = (check_nb (loop lst []) 0 []) in
        		let rec getString x acc = match x with
		        	| [] -> acc
		        	| (a,b)::t -> (getString t  (acc ^ b ^ (string_of_int a)))
		        	in getString tub_lst ""
			

		method name = name
		method formula = this#genFormula lste

		method to_string = "Name of atom : " ^ this#name ^ " symbol is : "
        ^ this#formula

		method equals ( that:molecule ) = 
            ((this#name = that#name) && (this#formula = that#formula))
	end 




