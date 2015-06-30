module SAVE =
    struct
        type element = string
        let zero1 = "KO"

        let to_file (x:element)   =
        begin  try
             let oc = open_out "./res/save.itama" in 
                Printf.fprintf oc "%s\n" x;
             close_out oc;
             x
         with
           | _ -> Unix.mkdir "./res" 0o760; zero1
       end

        let to_string (x:element) = 
        let str = "" in
        begin  try 
                let ic = open_in x in 
                let line = input_line ic in
                    let lst = Str.split (Str.regexp ";") (String.trim line) in
                        if List.length lst = 4 then
                            let rec loop l acc =
                                match l with
                                | [] -> acc
                                | h::s::t -> (loop (s::t) (acc ^ h ^ ";"))
                                | h::t -> (loop t (acc ^ h))
                            in 
                                loop lst ""
                        else 
                            zero1
                with
                    | End_of_file -> (str:element)
                    | _ -> zero1
        end
    end

