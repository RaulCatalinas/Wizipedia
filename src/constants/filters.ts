import type { Character } from '@/types/character'
import { House } from '@/types/enums'

type FilterFunction = (characters: Character[]) => Character[]

export const FILTERS: Record<string, FilterFunction> = {
  all: (characters: Character[]) => characters,
  alive: (characters: Character[]) =>
    characters.filter(character => character.alive),
  deceased: (characters: Character[]) =>
    characters.filter(character => !character.alive),
  gryffindor: (characters: Character[]) =>
    characters.filter(
      character =>
        character.house.toLowerCase() === House.GRYFFINDOR.toLowerCase
    ),
  hufflepuff: (characters: Character[]) =>
    characters.filter(
      character =>
        character.house.toLowerCase() === House.HUFFLEPUFF.toLowerCase()
    ),
  ravenclaw: (characters: Character[]) =>
    characters.filter(
      character =>
        character.house.toLowerCase() === House.RAVENCLAW.toLowerCase()
    ),
  slytherin: (characters: Character[]) =>
    characters.filter(
      character =>
        character.house.toLowerCase() === House.SLYTHERIN.toLowerCase()
    )
} as const

export const FILTER_KEYS = Object.keys(FILTERS)
