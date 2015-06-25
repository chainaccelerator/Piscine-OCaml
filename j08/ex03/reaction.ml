class virtual reaction (lst:Atom.atom) (lst2:Atom.atom) =
object

	method virtual get_start:  (Molecule.molecule * int) list
	method virtual get_result:  (Molecule.molecule * int) list
	method virtual balance:  reaction
	method virtual is_balanced:  bool 

end