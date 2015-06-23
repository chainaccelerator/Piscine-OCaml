
module StringHash =
    struct
        type t = string

        let equal i j = i=j

        let hash str = 
                let rec h i acc =
                    if i < (String.length str) then
                        h (i + 1) ((acc lsl 3) + acc + (int_of_char str.[i]))
                    else
                        acc;
                in h 0 4534545
    end


module StringHashtbl = Hashtbl.Make(StringHash)

let () =
        let ht = StringHashtbl.create 5 in
        let values = [ "Hello"; "world"; "42"; "Ocaml"; "H" ] in
        let pairs = List.map (fun s -> (s, String.length s)) values in
        List.iter (fun (k,v) -> StringHashtbl.add ht k v) pairs;
        StringHashtbl.iter (fun k v -> Printf.printf "k = \"%s\", v = %d\n" k v) ht
