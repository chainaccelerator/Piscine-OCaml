type 'a ft_ref = { mutable content : 'a }

let return x =
    let (a: 'a ft_ref) = {content = x} in
    a

let get (x:'a ft_ref) = 
    x.content

let set (x:'a ft_ref) a =
    x.content <- a

let bind (x:'a ft_ref) (f:'a ->'b ft_ref) =
    f x.content

let () =
    print_string "test with return [42] : ";
    let test = return 42 in
    print_int (get test);
    print_char '\n';
    print_string "test with bind [test (fun x -> return (char_of_int(get test)))] : ";
    let y = bind test (fun x -> return (char_of_int(get test))) in
    print_char (get y);
    print_char '\n';
    print_string "Verifier que les test n'a pas changer : ";
    print_int (get test);
    print_char '\n';
    print_string "test with set [test 21] : ";
    set test 21;
    print_int (get test);
    print_char '\n';

