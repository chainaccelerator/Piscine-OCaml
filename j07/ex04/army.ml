class ['a] army =
    object
        val mutable _list:'a list = []
        
        method get_army = _list (* Add for test *)

        method add (elem:'a) =  _list <- [elem]@_list
        method delete = match _list with
        				| [] ->  _list <- _list
        				| (h:'a)::(t:'a list) -> _list <- t
    end