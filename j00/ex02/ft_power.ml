(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_power.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 13:39:07 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 14:58:14 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_power x y =
    if y < 1 then
            1
    else
            x * ft_power x (y - 1)

let main () =
    print_string "Test with [2 4]: ";
    print_int(ft_power 2 4);
    print_char '\n';
    print_string "Test with [3 0]: ";
    print_int(ft_power 3 0);
    print_char '\n';
    print_string "Test with [0 5]: ";
    print_int(ft_power 0 5);
    print_char '\n';
    print_string "Test with [10 2]: ";
    print_int(ft_power 10 2);
    print_char '\n'

let () = main ()

