
let eu_dist (a:float array) (b:float array) =
    let sizea = (Array.length a) in
    let sizeb = (Array.length b) in
    let rec calc (acc:float) i =
        if i >= sizea || i >= sizeb then
            sqrt(acc)
        else
            calc (acc +. ((a.(i) -. b.(i)) ** 2.)) (i + 1)
    in
    calc 0. 0

let () = 
    let tab1 = [|1.; 1.; 1.;|] in
    let tab2 = [|2.; 2.; 2.;|] in
    print_float (eu_dist tab1 tab2);
    print_char '\n';
    print_float (eu_dist [|1.; 2.; 3.; 4.12|] [|7.; 6.;65.; (-7.)|]);
    print_char '\n';
    print_float (eu_dist  [|1234.1;12.321;64.1236;45.2;98.5;78.654|]
    [|8.65;31.23;640.01;673.0123;5.0;0.12|]);

