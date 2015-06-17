(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   crossover.ml                                       :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/17 15:32:08 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/17 16:28:46 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec is_in_list x liste = match liste with
        | [] -> false
        | head::tail -> (x = head) || (is_in_list x tail)
;;

let rec crossover lst1 lst2 = match lst1 with
| [] -> []
    | head::tail ->
            if (is_in_list head lst2) = true then
                head :: crossover tail lst2
            else
                crossover tail lst2
;;

