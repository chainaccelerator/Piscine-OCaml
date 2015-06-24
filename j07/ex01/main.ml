let () = 
    let people = new People.people "human" in 
    let doctor = new Doctor.doctor "Doctor" 110 people in
    doctor#talk;
    print_endline (doctor#to_string);
    doctor#travel_in_time 2015 2000;
    doctor#use_sonic_screwdriver;
    people#die
