let () = 
    let people = new People.people "human" in 
    people#talk;
    print_endline (people#to_string);  
    people#die

