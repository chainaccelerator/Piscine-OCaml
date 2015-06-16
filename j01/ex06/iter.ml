(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   iter.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 12:43:35 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/16 13:14:37 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec iter f x n =
    if n = 0 then
        x
    else if n = 1 then
        f x
    else if n < 0 then
        -1
    else
        f (iter f x (n - 1))

let () = 
    print_int (iter (fun x -> x * x) 2 4);
    print_char '\n';
    print_int (iter (fun x -> x * 2) 2 4);
    print_char '\n'
