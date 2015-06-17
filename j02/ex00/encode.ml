(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   encode.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 10:42:49 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/17 15:31:47 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec check_nb lst nb acc = match lst with
    | [] -> acc
    | head::second::tail -> 
        begin
            if head = second then
                check_nb (second::tail) (nb + 1) acc
            else
                check_nb (second::tail) 0 (acc @ [((nb + 1), head)])
        end
    | head::tail ->
            check_nb [] 0 (acc @ [((nb + 1), head)])
;;

let encode lst  =
    check_nb lst 0 []
