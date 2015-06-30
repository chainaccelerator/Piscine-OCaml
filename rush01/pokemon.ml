class pokemon s =
    object (self)
        val _screen= s
        val _hp= 100
        val _hy= 100
        val _e= 100
        val _ha= 100
        method hp = _hp
        method hy = _hy
        method ha = _ha
        method e = _e
        method screen = _screen
        method turn= self#draw_image "./res/img/pitchu_base.xpm"; {< _hp=_hp - 1>}
        method eat= self#draw_image "./res/img/pitchu_eat.xpm"; {< _hp=_hp + 25; _e = _e - 10; _hy=_hy - 20; _ha = _ha + 5 >}
        method thunder= self#draw_image "./res/img/pitchu_foudre.xpm"; {< _hp= _hp - 20; _e = _e + 25; _ha = _ha - 20 >}
        method bath= self#draw_image "./res/img/pitchu_bath.xpm"; {< _hp= _hp - 20; _e = _e - 10; _hy=_hy + 25; _ha = _ha + 5 >}
        method kill= self#draw_image "./res/img/pitchu_sleep.xpm"; {< _hp= _hp - 20; _e = _e - 10; _ha = _ha + 20 >}

        method load (x:string) = (
            let lst = Str.split (Str.regexp ";") x in
            {< _hp = int_of_string (List.nth lst 0); _hy = int_of_string (List.nth lst 1) ; _e = int_of_string (List.nth lst 2); _ha = int_of_string (List.nth lst 3) >}
            )

        method is_alive =
            ((_hp > 0) && (_hy > 0) && (_e > 0) && (_ha > 0))

        method to_string = (
            "Health: "^(string_of_int _hp)^" Hygiene: "^(string_of_int _hy)^" Energy: "^(string_of_int _e)^" Happyness: "^(string_of_int _ha)
            )

        method save =
            if self#is_alive then
                Save.SAVE.to_file ((string_of_int _hp)^";"^(string_of_int _hy)^";"^(string_of_int _e)^";"^(string_of_int _ha))
            else
                Save.SAVE.to_file (Save.SAVE.zero1)

        method draw_graph x y color n =
            let rect = Sdlvideo.rect x y 100 20 in
            let perc = Sdlvideo.rect x y n 20 in
            let surface = Sdlvideo.create_RGB_surface [`SWSURFACE] ~w:100 ~h:20 ~bpp:32 ~rmask:0xff000000l ~gmask:0x00FF0000l ~bmask:0x0000FF00l ~amask:0x000000FFl in
            Sdlvideo.fill_rect ~rect:rect (self#screen) (Sdlvideo.map_RGB surface Sdlvideo.white);
            Sdlvideo.fill_rect ~rect:perc self#screen (Sdlvideo.map_RGB surface color);
            Sdlvideo.blit_surface ~dst_rect:rect ~src:surface ~dst:self#screen ();

        method write_string x y color s =
            let font = Sdlttf.open_font "./res/font/PokemonSolid.ttf" 12 in
            let text = Sdlttf.render_text_blended font s ~fg:color in
            let pos = Sdlvideo.rect x y 50 50 in
            Sdlvideo.blit_surface ~dst_rect:pos ~src:text ~dst:self#screen ()

        method draw =
            let trunc x =
                if x > 100 then 100 else x
            in
            self#draw_graph 35 75 Sdlvideo.red (trunc self#hp); self#write_string 60 100 Sdlvideo.black "Health";
            self#draw_graph 160 75 Sdlvideo.blue (trunc self#e); self#write_string 185 100 Sdlvideo.black "Energy";
            self#draw_graph 285 75 Sdlvideo.green (trunc self#hy); self#write_string 305 100 Sdlvideo.black "Hygiene";
            self#draw_graph 410 75 Sdlvideo.magenta (trunc self#ha); self#write_string 425 100 Sdlvideo.black "Happyness";
            Sdlvideo.flip self#screen

        method catch_event  =
            match Sdlevent.poll () with
            | Some (x)  -> self#treat_event x
            | None      -> self

        method between x mi ma =
            ((x >= mi) && (x <= ma))

        method treat_event event =
            match event with
            | Sdlevent.KEYDOWN {Sdlevent.keysym=Sdlkey.KEY_ESCAPE} ->
                    self#save; exit 0
            | Sdlevent.MOUSEBUTTONDOWN {Sdlevent.mbe_button=Sdlmouse.BUTTON_LEFT} ->
                    begin
                        match (Sdlmouse.get_state ~relative:false ()) with
                        | (x, y, _) when (self#between x 35 135) && (self#between y 300 360)  -> self#eat
                        | (x, y, _) when (self#between x 160 260) && (self#between y 300 360) -> self#thunder
                        | (x, y, _) when (self#between x 285 385) && (self#between y 300 360) -> self#bath
                        | (x, y, _) when (self#between x 410 510) && (self#between y 300 360) -> self#kill
                        | _                                                         -> self
                    end
                        | _     -> self

        method draw_button x x2 y s =
            let rect = Sdlvideo.rect x y 100 60 in
            let s_rect = Sdlvideo.rect x2 (y + 24) 100 60 in
            let surface = Sdlvideo.create_RGB_surface [`SWSURFACE] ~w:100 ~h:80 ~bpp:32
            ~rmask:0xff000000l ~gmask:0x00FF0000l ~bmask:0x0000FF00l ~amask:0x000000FFl in
            let font = Sdlttf.open_font "./res/font/PokemonSolid.ttf" 12 in
            let text = Sdlttf.render_text_blended font s ~fg:Sdlvideo.white in
            Sdlvideo.fill_rect ~rect:rect self#screen (Sdlvideo.map_RGB surface Sdlvideo.black);
            Sdlvideo.blit_surface ~dst_rect:rect ~src:surface ~dst:self#screen ();
            Sdlvideo.blit_surface ~dst_rect:s_rect ~src:text ~dst:self#screen ()

        method draw_gui =
            let font = Sdlttf.open_font "./res/font/PokemonSolid.ttf" 24 in
            let text = Sdlttf.render_text_blended font "Pokemochi!" ~fg:Sdlvideo.yellow in
            let title_pos = Sdlvideo.rect 215 20 0 0 in
            Sdlvideo.fill_rect self#screen (Sdlvideo.map_RGB self#screen (127, 127, 127));
            Sdlvideo.blit_surface ~dst_rect:title_pos ~src:text ~dst:self#screen ();
            self#draw_button 35 70 300 "Eat";
            self#draw_button 160 185 300 "Thunder";
            self#draw_button 285 315 300 "Bath";
            self#draw_button 410 445 300 "Kill";
            self#draw;
            self#draw_image "./res/img/pitchu_base.xpm"

        method draw_final () =
            let font = Sdlttf.open_font "./res/font/PokemonSolid.ttf" 24 in
            let text = Sdlttf.render_text_blended font "Game Over !"
            ~fg:Sdlvideo.red in
            let text2 = Sdlttf.render_text_blended font "Press ESC to quit !"
            ~fg:Sdlvideo.black in
            let title_pos = Sdlvideo.rect 200 150 0 0 in
            let title2_pos = Sdlvideo.rect 150 180 0 0 in
            Sdlvideo.fill_rect self#screen (Sdlvideo.map_RGB self#screen (127, 127, 127));
            Sdlvideo.blit_surface ~dst_rect:title_pos ~src:text ~dst:self#screen ();
            Sdlvideo.blit_surface ~dst_rect:title2_pos ~src:text2 ~dst:self#screen ();
            Sdlvideo.flip self#screen


        method load_sound =
            Sdlmixer.open_audio ();
            let sound = Sdlmixer.load_music "./res/sound/sound.ogg" in
            Sdlmixer.play_music ~loops:0 sound

        method draw_image (x:string) =
            let image = Sdlloader.load_image x in
            let pos = Sdlvideo.rect 211 136 0 0 in
            Sdlvideo.blit_surface ~dst_rect:pos ~src:image ~dst:self#screen ();
            Sdlvideo.flip self#screen

                    end
