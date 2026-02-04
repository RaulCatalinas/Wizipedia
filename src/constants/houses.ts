import type { HouseColor } from '@/types/houses'

export const HOUSES_COLORS: Record<string, HouseColor> = {
  Gryffindor: {
    foregroundColor: '#FFD700',
    backgroundColor: '#AE0001'
  },
  Hufflepuff: {
    foregroundColor: '#000000',
    backgroundColor: '#ECB939'
  },
  Ravenclaw: {
    foregroundColor: '#FFFFFF',
    backgroundColor: '#0E1A40'
  },
  Slytherin: {
    foregroundColor: '#FFFFFF',
    backgroundColor: '#1A472A'
  },
  Unknown: {
    foregroundColor: '#FFBDBDBD',
    backgroundColor: '#FF424242'
  }
} as const
