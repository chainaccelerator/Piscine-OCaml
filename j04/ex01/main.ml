(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 14:28:52 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/19 15:43:23 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () = 
    let t = Value.all in
    let rec loop lst = match lst with
        | h::t ->
                print_string "Value.toString : ";
                print_endline (Value.toString h);
                print_string "Value.toStringVerbose : ";
                print_endline (Value.toStringVerbose h);
                print_string "Value.toInt : ";
                print_endline (string_of_int (Value.toInt h));
                print_string "Value.toString (Value.next) : ";
                print_endline (Value.toString (Value.next h));
                print_string "\n";
                flush stdout;
                loop t
        | [] -> ()
    in loop t 

let () = 
    main ()
