(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   tak.ml                                             :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 11:19:54 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/16 11:28:40 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec tak x y z =
    if y < x then
        tak (tak (x - 1) y z) (tak (y - 1) z x) (tak (z - 1) x y)
    else
        z

let main () =
    print_string "Test with [1 2 3] : ";
    print_int (tak 1 2 3);
    print_string "\nTest with [5 23 7] : ";
    print_int (tak 5 23 7);
    print_string "\nTest with [9 1 0] : ";
    print_int (tak 9 1 0);
    print_string "\nTest with [1 1 1] : ";
    print_int (tak 1 1 1);
    print_string "\nTest with [0 42 0] : ";
    print_int (tak 0 42 0);
    print_string "\nTest with [23498 98734 98776] : ";
    print_int (tak 23498 98734 98776);
    print_string "\n"

let () = main ()
