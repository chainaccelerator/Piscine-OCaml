
let split (str:string) =
    let size = String.length str in 
    let rec sp lst i = match i with
        | i when i = size -> lst
        | _ ->  begin try
                    sp (lst @ [String.sub str i (String.index_from str i ',')]) ((String.index_from str i ',') + 1)
                with
                   | _ -> lst
                end;
    in
        sp [] 0



let convert_to_float (a:string) =
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
                             lst := ((Array.map convert_to_float (Array.of_list(split s))), 
                                s.[(String.length s) - 1] ) ::!lst
                    done
            with
            | Sys_error err -> Printf.printf "Something went wrong: %s\n" err
            | End_of_file -> Printf.printf "eof"
            end;
            !lst


let () = 
    ignore(example_of_files "ionosphere.test.csv")