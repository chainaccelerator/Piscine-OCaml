class water =
    object
        inherit Molecule.molecule "Water"  [(new Hydrogen.hydrogen); (new Hydrogen.hydrogen); (new Oxygen.oxygen)]
    end
