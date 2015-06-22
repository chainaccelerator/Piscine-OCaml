et convert_to_float (a:string) =
    begin try 
        float_of_string a
    with
        | _ ->     float_of_int (int_of_string a)
    end

    let example_of_files path =
    let lst = ref [] in
    begin try
                let ic = open_in path in
                    while true do
                        let s = input_line ic in
                            print_string (Array.of_list(Str.split (Str.regexp "-?.?[0-9]+") s)).(1);
                            lst := ((Array.map convert_to_float (Array.of_list(Str.split (Str.regexp "-?.?[0-9]+") s))), 
                                s.[(String.length s) - 1] ) ::!lst
                    done
            with
            | Sys_error err -> Printf.printf "Something went wrong: %s\n" err
            | End_of_file -> Printf.printf "eof"
            end;
            !lst


let () = 
    ignore(example_of_files "ionosphere.test.csv")