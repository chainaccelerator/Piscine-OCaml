(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   uncipher.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 11:28:37 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/19 11:38:44 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let unrot_one c =
	if (c < 'a' && c < 'A') || (c > 'Z' && c > 'z') then
		c
	else if c = 'a' || c = 'A' then
		char_of_int ((int_of_char c) + 25)
	else
		char_of_int ((int_of_char c) - 1)

let unrot42 s =
	let rec loop n s =
		if n > 0 then
			let s2 = String.map unrot_one s in loop (n - 1) s2
		else
			s
	in
		loop 42 s

let rec uncaesar n s =
	if n > 0 then
		let s2 = String.map unrot_one s in uncaesar (n - 1) s2
	else
		s

let ft_uncrypt s lst_f =
    Cipher.ft_crypt s lst_f
