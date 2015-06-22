let rec print_list = function 
    [] -> ()
    | e::l -> print_endline e; print_list l


let () =
    Random.self_init ();
    let deck = Deck.newDeck () in
    print_list (Deck.toStringListVerbose deck);
    let (n, c) as card = Deck.drawCard deck in
    print_string "Je tire une carte = "; print_endline (Deck.Card.toStringVerbose n);
    let (o, d) as card = Deck.drawCard c in
    print_string "puis une suivante = "; print_endline (Deck.Card.toStringVerbose o)