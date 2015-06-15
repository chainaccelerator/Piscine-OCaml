(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   ft_countdown.ml                                    :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <apantiez@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/15 13:24:57 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/15 13:34:30 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let rec ft_countdown x =
    if x < 1 then
        begin
           print_int 0;
           print_char '\n'
        end
    else
        begin
            print_int x;
            print_char '\n';
            ft_countdown (x - 1)
        end

let main () =
    ft_countdown 10;
    ft_countdown (-10);
    ft_countdown 0

let () = main ()
