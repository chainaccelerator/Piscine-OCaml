
let sum (x:float) (y:float) = 
    x +. y

let main () =
    print_string "Testing sun with [10. 11.] : ";
    print_float (sum 10. 11.);
    print_char '\n';
    print_string "Testing sun with [21. 21.] : ";
    print_float (sum 21. 21.);
    print_char '\n';
    print_string "Testing sun with [(-10.) (-11.)] : ";
    print_float (sum (-10.) (-11.));
    print_char '\n';
    print_string "Testing sun with [10000000000000000000000. 99999999999999999999.9999999999999)] : ";
    print_float (sum 10000000000000000000000. 99999999999999999999.9999999999999);
    print_char '\n';
    print_string "Testing sun with [(-42.424424242424242424242442424242424242424242424242424242424242424) 21.424424242424242424242442424242424242424242424242424242424242424)] : ";
    print_float (sum
    (-42.424424242424242424242442424242424242424242424242424242424242424)
    21.424424242424242424242442424242424242424242424242424242424242424)


let () = main ()
