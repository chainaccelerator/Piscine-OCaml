class virtual alkane (n:int) =
    object (this)

    	inherit Molecule.molecule 
    		(match n with | 1 -> "methane" | 2 -> "ethane" | 3 -> " propane" | 4 -> "butane" | 5 -> "Pentane" | 6 -> "Hexane" | 7 -> "Heptane" | 8 -> "Octane" | 9 -> "Nonane" | 10 -> "Decane" | 11 -> "Undecane" | 12 -> "Dodecane" | _ -> "methane")
    		(let rec genLstcarb nb acc = match nb with 
    				| nb when nb = 0 -> acc 
    				| nb when (nb > 0 && nb <= 12) -> genLstcarb (nb - 1) ([new Carbon.carbon] @ acc) 
    				| _ -> acc
    			in let rec genLsthydro nb acc = match nb with 
    				| nb when nb = 0 -> acc @ [new Hydrogen.hydrogen] @ [new Hydrogen.hydrogen]
    				| nb when (nb > 0 && nb <= 12) -> genLsthydro (nb - 1) (acc @ [new Hydrogen.hydrogen] @ [new Hydrogen.hydrogen]) 
    				| _ -> acc
    			in  genLsthydro n (genLstcarb n [])
    		)    
    end