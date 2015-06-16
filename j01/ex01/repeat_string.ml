(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   repeat_string.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 10:05:17 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/16 10:57:32 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec repeat_string ?(str = "x") x =
    if x == 0 then
        ""
    else if x < 0 then
        "Error"
    else
       str ^ repeat_string ~str:str (x - 1)

let main () =
    print_endline (repeat_string ~str:"a" 100);
    print_endline (repeat_string 10);
    print_endline (repeat_string 5);
    print_endline (repeat_string ~str:"test" 0);
    print_endline (repeat_string (-1));
    print_endline (repeat_string ~str:"what" 3);
    print_endline (repeat_string ~str:"Toto" 1)



let () = main ()
