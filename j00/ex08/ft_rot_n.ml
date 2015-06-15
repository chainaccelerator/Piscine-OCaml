(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_rot_n.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 19:52:47 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 19:52:48 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rot_one c =
    if (c < 'a' && c < 'A') || (c > 'Z' && c > 'z') then
        c
    else if c = 'z' || c = 'Z' then
        char_of_int ((int_of_char c) - 25)
    else
        char_of_int ((int_of_char c) + 1)

let rec ft_rot_n n s =
    if n > 0 then
        let s2 = String.map rot_one s in ft_rot_n (n - 1) s2
    else
        s

let main () =
    print_endline (ft_rot_n 42 "0123456789");
    print_endline (ft_rot_n 42 "0123456789");
    print_endline (ft_rot_n 42 "0123456789");
    print_endline  (ft_rot_n 2 "OI2EAS6789");
    print_endline (ft_rot_n 0 "Damned !");
    print_endline (ft_rot_n 42 "");
    print_endline (ft_rot_n 1 "NBzlk qnbjr !");
    print_endline (ft_rot_n 5 "HelloWorld !")

let () = main ()