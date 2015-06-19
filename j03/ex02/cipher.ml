(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   cipher.ml                                          :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 11:28:26 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/19 11:29:53 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rot_one c =
	if (c < 'a' && c < 'A') || (c > 'Z' && c > 'z') then
		c
	else if c = 'z' || c = 'Z' then
		char_of_int ((int_of_char c) - 25)
	else
		char_of_int ((int_of_char c) + 1)

let  rot42 s =
	let rec loop n s =
		if n > 0 then
			let s2 = String.map rot_one s in loop (n - 1) s2
		else
			s
	in
		loop 42 s

let rec caesar n s =
	if n > 0 then
		let s2 = String.map rot_one s in caesar (n - 1) s2
	else
		s

let xor_ing key c =
    char_of_int((int_of_char c) lxor key)

let xor key s =
	if key > 0 then
        String.map (xor_ing (key mod 255)) s
	else
		s

let rec ft_crypt s lst_f = match lst_f with
| [] -> s
| h::t -> ft_crypt (h s) t

