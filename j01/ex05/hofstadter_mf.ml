(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   hofstadter_mf.ml                                   :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/16 12:28:35 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/16 12:35:08 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec hfs_f n =
    if n = 0 then
        1
    else if n > 0 then
        n - hfs_m (hfs_f (n - 1))
    else
        -1
and hfs_m n =
    if n = 0 then
        0
    else if n > 0 then
        n - hfs_f (hfs_m (n - 1))
    else
        -1

let main () =
    print_int (hfs_m 0);
    print_char '\n';
    print_int (hfs_f 0);
    print_char '\n';
    print_int (hfs_m 4);
    print_char '\n';
    print_int (hfs_f 4);
    print_char '\n';
    print_int (hfs_m (-42));
    print_char '\n';
    print_int (hfs_f (-42));
    print_char '\n'

let () = main ()
