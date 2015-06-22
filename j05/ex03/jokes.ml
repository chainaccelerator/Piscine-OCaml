let print_blag tab = 
        let rand = Random.int (Array.length tab) in
            print_endline (Array.get tab rand)

let rec print_list = function 
    [] -> ()
    | e::l -> print_string e ; print_string "\n" ; print_list l

let get_tab_of_jokes name =
    let lst = ref [] in
    begin try
        let ic = open_in name in
        let sav = ref "" in
        let i = ref 1 in
         while true; do
            let s = input_line ic in
                 begin
                    if (String.get s 0)  <> '#' && !i <> 1 then
                        begin

                            sav := (!sav ^ "\n" ^ s);
                            i := !i + 1
                        end
                    else if !i <> 1 then
                        begin
                            lst := (!lst) @ [(!sav)] ;
                            i := 1;
                            sav := ""
                        end
                    else
                        i:= ((!i) + 1)
                    end
         done;
         close_in ic
        with
        | Sys_error err -> print_endline "File Name is wong" ; ignore(exit 1)
        | End_of_file -> print_endline "End of file, prassing ok"
    end;
    print_blag (Array.of_list !lst)

let main ac av = match ac with
    | 2 -> ignore (get_tab_of_jokes (Array.get av 1))
    | _ ->  print_endline "usage Name of File"

let () = 
    Random.self_init ();
    main (Array.length Sys.argv) Sys.argv
