(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 14:28:52 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/19 14:40:46 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () = 
    let t = Color.all in
    let rec loop lst = match lst with
        | [] -> ()
        | h::t ->
                print_endline (Color.toString h);
                print_endline (Color.toStringVerbose h);
                loop t
    in loop t

let () = 
    main ()
