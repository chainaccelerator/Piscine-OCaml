
let main () =
    let tab = [|"Connais-tu la blague de toto en Amérique i?\nNon ?\n Moi non plus il n'y avait plus de place dans l'avion !";
    "C'est un garçon dans un restaurant qui demande :\n-Alors cette crème renversée, elle arrive ?\n- On la ramasse, Monsieur, on la ramasse !";
    "- A combien rouliez-vous? Demande le gendarme.\n- A deux seulement, mais si vous voulez monter, il reste de la place.";
    "Qu'est-ce qu'une soirée entre hibous ?\nC'est super chouette !";
    "C'est un pingouin, il respire par les fesses, un jour il s'assoit, et il meurt." |] in
    let rand = Random.int 5 in
    print_endline (Array.get tab rand)


let () = 
    Random.self_init ();
    main ()
