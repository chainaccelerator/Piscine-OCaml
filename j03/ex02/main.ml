(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   main.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: apantiez <marvin@42.fr>                    +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2015/06/19 11:29:43 by apantiez          #+#    #+#             *)
(*   Updated: 2015/06/19 11:56:30 by apantiez         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

let main () =
    print_endline "\nTest des fonction crypte : \n";
    print_string "rot42 [abcdefghijklmnopqrstuvwxyz] : ";
	let s = Cipher.rot42 "abcdefghijklmnopqrstuvwxyz" in print_endline s;
    print_string "rot42 [0123456789] : ";
	let s3 = Cipher.rot42 "0123456789" in print_endline s3;
    print_string "ceasar [10 OI2EAS6789] : ";
	let s4 = Cipher.caesar 10 "OI2EAS6789" in print_endline s4;
    print_string "ceasar [10 Damned] : ";
	let s5 = Cipher.caesar 10  "Damned !" in print_endline s5;
    print_string "xor [15 \"\"] : ";
	let s6 = Cipher.xor 15 "" in print_endline s6;
    print_string "xor [15 NBzlk qnbjr !] : ";
	let s7 = Cipher.xor 15 "NBzlk qnbjr !" in print_endline s7;

    print_endline "\nTest des fonction decrypte : \n";
    print_string "unrot42 [ "; print_string s; print_string " ] :";
	let s8 = Uncipher.unrot42 s in print_endline s8;
    print_string "unrot42 [ "; print_string s3; print_string " ] :";
	let sa = Uncipher.unrot42 s3 in print_endline sa;
    print_string "uncaesar [ 10 "; print_string s4; print_string " ] :";
	let sb = Uncipher.uncaesar 10 s4 in print_endline sb;
    print_string "uncaesar [ 10 "; print_string s5; print_string " ] :";
	let sc = Uncipher.uncaesar 10 s5 in print_endline sc;
    print_string "xor [ 15 "; print_string s6; print_string " ] :";
	let sd = Cipher.xor 15 s6 in print_endline sd;
    print_string "xor [ 15 "; print_string s7; print_string " ] :";
    let se = Cipher.xor 15 s7 in print_endline se;

    print_endline "\nTest de ft_crypte : \n";
    print_string "ft_crypte [alex [ (Cipher.caesar 10); (Cipher.xor 10);
    Cipher.rot42] ] : ";
    let y = Cipher.ft_crypt "alex" [(Cipher.caesar 10); (Cipher.xor 10); Cipher.rot42] in print_endline y;

    print_endline "\nTest de ft_uncypte : \n";
    print_string "ft_uncrypt [ "; print_string y; print_string " [Uncipher.unrot42; (Cipher.xor 10); (Uncipher.uncaesar 10)] ] :";
    let z = Uncipher.ft_uncrypt y [Uncipher.unrot42; (Cipher.xor 10); (Uncipher.uncaesar 10)] in print_endline z


let () = main ()
