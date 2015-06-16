(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ackermann.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 10:58:39 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/16 11:19:22 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ackermann m n =
    if m = 0 then
        (n + 1)
    else if m > 0 && n = 0 then
        ackermann (m - 1) 1
    else if m > 0 && n > 0 then
        ackermann (m - 1) (ackermann m (n - 1))
    else
        -1

let main () =
    print_string "Test with [-1, 7] : ";
    print_int (ackermann (-1) 7);
    print_string "\nTest with [0, 0] : ";
    print_int (ackermann 0 0);
    print_string "\nTest with [2, 3] : ";
    print_int (ackermann 2 3);
    print_string "\nTest with [4, 1] : ";
    print_int (ackermann 4 1);
    print_string "\n"

let () = main ()
