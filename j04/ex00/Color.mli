(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Color.mli                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 13:53:47 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/19 13:57:27 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

type t = Spade | Heart | Diamond | Club

val all : t list            (* list of all values of type t *)

val toString        : t -> string   (* "S", "H", "D" or "C" *)
val toStringVerbose : t -> string   (* "Spade, "Heart", ... "*)
