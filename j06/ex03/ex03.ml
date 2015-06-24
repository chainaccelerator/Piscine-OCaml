module type FIXED = sig 
	type t
	val of_float : float -> t
	val of_int : int -> t
	val to_float : t -> float
	val to_int : t -> int
	val to_string : t -> string
	val zero : t
	val one : t
	val succ : t -> t
	val pred : t -> t
	val min :t->t->t
	val max :t->t->t
	val gth :t->t->bool
	val lth :t->t->bool
	val gte :t->t->bool
	val lte :t->t->bool
	val eqp :t->t->bool
	val eqs :t->t->bool
	val add :t->t->t
	val sub :t->t->t
	val mul :t->t->t
	val div :t->t->t
	val foreach : t -> t -> (t -> unit) -> unit
end

module type FRACTIONNAL_BITS = sig
	val bits : int
end


module Fractionnal_bits = 
	functor (Frac : FRACTIONNAL_BITS) ->
	struct 
		let bits = Frac.bits
	end

module type MAKE = 
	functor (Fractionnal_bits : FRACTIONNAL_BITS) -> FIXED

module Make : MAKE =
	functor ( Fractionnal_bits : FRACTIONNAL_BITS ) ->
	struct
		type t = int
		let of_float (f:float) 	= 	let entier = (truncate f) in
									let dec = ((f -. (float_of_int entier)) *. (2. ** (float_of_int (Fractionnal_bits.bits)))) in
									((entier lsl Fractionnal_bits.bits) + (int_of_float dec))

		let of_int (i:int)  	  = i lsl Fractionnal_bits.bits 
		let to_int (t:t) 		  = t lsr Fractionnal_bits.bits
		let to_float (t:t) 		  = ((float_of_int t) /.  (2. ** (float_of_int (Fractionnal_bits.bits)))) 
		let to_string (t:t)		  = string_of_float(to_float t) 
	    let zero		   		  = of_int 0
        let one           		  = of_int 1
        let succ x   	 		  = x + 1
        let pred x        		  = x - 1
        let min x y       		  = if x <= y then x else y
        let max x y       		  = if x >= y then x else y
        let gth x y       		  = x > y
        let lth x y       		  = x < y
        let gte x y      	 	  = x >= y
        let lte x y      		  = x <= y
        let eqp x y      	 	  = x = y
        let eqs x y       		  = x == y
        let add x y       		  = x + y
        let sub x y      		  = x - y
        let mul x y       		  = (of_float((to_float x) *. (to_float y)))
        let div x y       		  =(of_float((to_float x) /. (to_float y)))
		let foreach	 (x:t) (y:t) (f:t-> unit)  =	let rec ft_for x y cmp op = begin match x with
														| x when not (cmp x y) -> ()
														| _ -> f x ; ft_for (op x) y cmp op
													end in 
													match x with
														| x when x > y -> ft_for x y gte pred
														| _  -> ft_for x y lte succ


	end



module Fixed4 : FIXED = Make (struct let bits = 4 end)

module Fixed8 : FIXED = Make (struct let bits = 8 end)

let () =
	let x8 = Fixed8.of_float 21.10 in
	let y8 = Fixed8.of_float 21.32 in
	let r8 = Fixed8.add x8 y8 in
	print_endline (Fixed8.to_string r8);
	print_endline "foreach Fixed4.zero to Fixed4.one : ";
	Fixed4.foreach (Fixed4.zero) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f));
	print_endline "\nforeach Fixed4.one to Fixed4.zero : ";
	Fixed4.foreach (Fixed4.one) (Fixed4.zero) (fun f -> print_endline (Fixed4.to_string f));
	print_endline "\nforeach Fixed4.one to Fixed4.one : ";
	Fixed4.foreach (Fixed4.one) (Fixed4.one) (fun f -> print_endline (Fixed4.to_string f));
	print_string "\ntest Fixed4.eqp Fixed4.of_float 42.42 Fixed4.of_float 42.42 : ";
	print_string (string_of_bool(Fixed4.eqp (Fixed4.of_float 42.42) (Fixed4.of_float 42.42)));
	print_string "\ntest Fixed4.eqp Fixed4.of_float 42. Fixed4.of_float 42.42 : ";
	print_string (string_of_bool(Fixed4.eqp (Fixed4.of_float 42.) (Fixed4.of_float 42.42)));
	print_string "\ntest Fixed4.eqs Fixed4.of_float 42.42 Fixed4.of_float 42.42 : ";
	print_string (string_of_bool(Fixed4.eqs (Fixed4.of_float 42.42) (Fixed4.of_float 42.42)));
	print_string "\ntest Fixed4.eqs Fixed4.of_float 42. Fixed4.of_float 42.42 : ";
	print_string (string_of_bool(Fixed4.eqs (Fixed4.of_float 42.) (Fixed4.of_float 42.42)));
	print_string "\n\ntest Fixed4.min Fixed4.of_int 21 Fixed4.of_float 42.42 : ";
	print_string (Fixed4.to_string(Fixed4.min (Fixed4.of_int 21) (Fixed4.of_float 42.42)));
	print_string "\ntest Fixed4.max Fixed4.of_int 21 Fixed4.of_float 42.42 : ";
	print_string (Fixed4.to_string(Fixed4.max (Fixed4.of_int 21) (Fixed4.of_float 42.42)));
	print_string "\n\ntest Fixed4.add Fixed4.of_int 21 Fixed4.of_float 21.42 : ";
	print_string (Fixed4.to_string(Fixed4.add (Fixed4.of_int 21) (Fixed4.of_float 21.42)));
	print_string "\n\ntest Fixed4.sub Fixed4.of_int -21 Fixed4.of_float -21.42 : ";
	print_string (Fixed4.to_string(Fixed4.sub (Fixed4.of_int (-21)) (Fixed4.of_float (-21.42))));
	print_string "\n\ntest Fixed4.mul Fixed4.of_float 21.42 Fixed4.of_float 21.42 : ";
	print_string (Fixed4.to_string(Fixed4.mul (Fixed4.of_float 21.42) (Fixed4.of_float 21.42)));
	print_string "\n\ntest Fixed4.div Fixed4.of_float 42.42 Fixed4.of_int 2 : ";
	print_string (Fixed4.to_string(Fixed4.div (Fixed4.of_float 42.42) (Fixed4.of_int 2)));

