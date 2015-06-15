(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_alphabet.ml                               :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 14:58:31 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 15:17:55 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_alphabet () =
    let ascii_of_z = int_of_char 'z' in
    let rec view_ascii ascii_of_current_char =
        if ascii_of_current_char <= ascii_of_z then
            let char_of_current = char_of_int ascii_of_current_char in 
            print_char char_of_current;
            view_ascii (ascii_of_current_char + 1)
    in 
    view_ascii (int_of_char 'a');
    print_char '\n'

let main () =
    ft_print_alphabet ()

let () = main ()
