(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Color.ml                                           :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 13:57:39 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/19 14:35:08 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Spade | Heart | Diamond | Club

let all = [Spade; Heart; Diamond; Club]

let toString t = match t with
    | Spade -> "S"
    | Heart -> "H"
    | Diamond -> "D"
    | Club -> "C"

let toStringVerbose t = match t with
    | Spade -> "Spade"
    | Heart -> "Heart"
    | Diamond -> "Diamond"
    | Club -> "Club"
