(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   micronap.ml                                        :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/22 10:22:07 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/22 12:12:15 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let my_sleep () = Unix.sleep 1


let main () =
    if (Array.length Sys.argv) <> 1 then
        begin
            let ti =  Sys.argv.(1) in
            let time = 
                 try (int_of_string ti)
                 with _ -> 0
            in
                 for i = 1 to time do
                        my_sleep ()
                 done
         end
    else
        ()

let () = 
    main ()
