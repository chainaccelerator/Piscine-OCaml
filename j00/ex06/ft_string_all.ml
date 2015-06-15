(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_string_all.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 18:25:15 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 19:34:53 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_string_all fc str =
    let size = String.length str in
    if size > 0 then
        begin
            let rec char_check fc str i =
                if i >= 0 && true = fc (String.get str i) then
                    char_check fc str (i - 1)
                else if i <= 0 then
                    true
                else
                    false
    in
    char_check fc str (size - 1)
        end
    else
        false


let is_digit c = c >= '0' && c <= '9'

let is_alpha c = c >= 'a' && c <= 'z' || c >= 'A' && c <= 'Z'

let main () =
    print_string "Test with [is_digit 0123456789]: ";
    print_endline (string_of_bool(ft_string_all is_digit "0123456789"));
    print_string "Test with [is_digit 012345678B9]: ";
    print_endline (string_of_bool(ft_string_all is_digit "01234567B9"));
    print_string "Test with [is_digit AABB]: ";
    print_endline (string_of_bool(ft_string_all is_digit "AABB"));
    print_string "Test with [is_digit \"\"]: ";
    print_endline (string_of_bool(ft_string_all is_digit ""));
    print_string "Test with [is_alpha AABB]: ";
    print_endline (string_of_bool(ft_string_all is_alpha "AABB"));
    print_string "Test with [is_alpha 11AA]: ";
    print_endline (string_of_bool(ft_string_all is_alpha "11AA"));
    print_string "Test with [is_alpha aBcD]: ";
    print_endline (string_of_bool(ft_string_all is_alpha "aBcD"))

let () = main ()
