let () = 
    let people = new People.people "human" in 
    let doctor = new Doctor.doctor "Doctor" 110 people in
    let dalek = new Dalek.dalek in
    print_endline (doctor#to_string);
    print_endline (people#to_string);
    print_endline (dalek#to_string);
    dalek#talk;
    dalek#talk;
    dalek#talk;
    dalek#exterminate people;
    print_endline (dalek#to_string);
    dalek#die
