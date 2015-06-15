(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_comb.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 15:54:50 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 18:03:12 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_comb () =
    let a = 0 in
    let b = 1 in
    let c = 2 in
    let rec calc a b c =
        print_int a;
        print_int b;
        print_int c;
        if a < 7 then
            begin
                print_string ", ";
                if c < 9 then
                    calc a b (c + 1)
                else if b < 8 then
                    calc a (b + 1) (b + 2)
                else if a < 7 then
                    calc (a + 1) (a + 2) (a + 3)
            end
                else
                    print_string "\n";
    in
    calc a b c

let main () =
    ft_print_comb ()

let () = main ()
