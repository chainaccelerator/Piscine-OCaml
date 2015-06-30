let rec game_loop (my_poke:Pokemon.pokemon) i =
    Sdltimer.delay 1;
    if (i = 1000) then begin game_loop my_poke#turn 0 end
    my_poke#draw;
    if not (my_poke#is_alive) then begin my_poke#draw_final end
    else game_loop (my_poke#catch_event) (i + 1)

let init ()= 
    Sdl.init [`VIDEO; `AUDIO];
    Sdlttf.init ();
    at_exit Sdl.quit;
    at_exit Sdlmixer.close_audio;
    let sav = Save.SAVE.to_string "./res/save.itama" in 
    let s = Sdlvideo.set_video_mode 550 400 [] in
    if (sav <> Save.SAVE.zero1) then
                    (new Pokemon.pokemon s)#load sav
                else 
                    new Pokemon.pokemon s

let main () = 
    let poke = init () in
    poke#draw_gui;
    poke#load_sound;
    ignore (game_loop poke 0)

let () = main ()
