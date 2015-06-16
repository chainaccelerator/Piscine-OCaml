(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   converges.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 13:17:48 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/16 13:44:09 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec converges f x n =
    if n < 0 then
        false
    else if n = 0 && x = f x then
        true
    else
        converges f (f x) (n - 1)

let () = 
    print_endline (string_of_bool (converges (( * ) 2) 2 5) );
    print_endline (string_of_bool (converges (fun x -> x / 2) 2 3) );
    print_endline (string_of_bool (converges (fun x-> x / 2) 2 2) );
    print_endline (string_of_bool (converges (fun x-> x + 2) (-2) 1) )
