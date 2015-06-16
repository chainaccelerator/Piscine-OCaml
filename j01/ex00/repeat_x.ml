(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_x.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 09:23:27 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/16 10:28:29 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_x x =
    if x == 0 then
        ""
    else if x < 0 then
        "Error"
    else
        "x" ^ repeat_x (x - 1)


let main () =
    print_endline (repeat_x 100);
    print_endline (repeat_x 10);
    print_endline (repeat_x 5);
    print_endline (repeat_x 0);
    print_endline (repeat_x (-1))

let () = main ()
