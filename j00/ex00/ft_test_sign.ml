(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_test_sign.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 11:33:45 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 12:42:45 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_test_sign x =
    if x < 0 then
        begin
            print_endline "negative"
        end
     else
        begin
            print_endline "positive"
        end
let main () =
    ft_test_sign (42);
    ft_test_sign (0);
    ft_test_sign (-42);
    ft_test_sign (-0);
    ft_test_sign (0);
    ft_test_sign (10000);
    ft_test_sign (-100000)

let () = main ()
