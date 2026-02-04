export type Character = {
  id: string
  name: string
  alternateNames: string[]
  species: Species
  gender: Gender
  house: House
  dateOfBirth: string | null
  yearOfBirth: number | null
  wizard: boolean
  ancestry: Ancestry
  eyeColour: EyeColour
  hairColour: HairColour
  wand: Wand
  patronus: Patronus
  hogwartsStudent: boolean
  hogwartsStaff: boolean
  actor: string
  alternateActors: string[]
  alive: boolean
  image: string
}

export type Wand = {
  wood: Wood
  core: Core
  length: number | null
}
