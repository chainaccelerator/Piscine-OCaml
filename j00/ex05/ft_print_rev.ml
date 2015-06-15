(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_print_rev.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 18:04:37 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 18:17:22 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let ft_print_rev str =
    let size = String.length str in
    let rec char_rev str i =
        if i >= 0 then
            begin
                print_char (String.get str i);
                char_rev str (i - 1)
            end
        else
            print_char '\n'
    in 
    char_rev str (size - 1)

let main () =
    ft_print_rev "Hello world !";
    ft_print_rev "";
    ft_print_rev "alex";
    ft_print_rev "test";
    ft_print_rev "abcdefghigklmnopqrstuvwxyz";
    ft_print_rev "zyxwvutsr"

let () = main ()
