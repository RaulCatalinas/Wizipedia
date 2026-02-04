import axios, { isAxiosError } from 'axios'
import { API_BASE_URL } from '@/constants/api'
import type { ApiResult } from '@/types/api'
import type { Character } from '@/types/character'

type RawCharacter = {
  alternate_names: string[]
  alternate_actors: string[]
} & Omit<Character, 'alternateNames' | 'alternateActors'>

function mapCharacter(raw: RawCharacter): Character {
  const { alternate_names, alternate_actors, ...rest } = raw

  return {
    ...rest,
    alternateNames: alternate_names,
    alternateActors: alternate_actors
  }
}

export async function getAllCharacters(): Promise<ApiResult<Character[]>> {
  try {
    const res = await axios.get<RawCharacter[]>(`${API_BASE_URL}/characters`)
    return { success: true, data: res.data.map(mapCharacter) }
  } catch (error) {
    const message = isAxiosError(error)
      ? (error.response?.statusText ?? 'Unknown error')
      : String(error)

    console.error(`Error fetching characters: ${error}`)
    return { success: false, error: message }
  }
}

export async function getCharacterByName(
  name: string
): Promise<ApiResult<Character>> {
  try {
    const res = await axios.get<RawCharacter>(
      `${API_BASE_URL}/characters/${name}`
    )
    return { success: true, data: mapCharacter(res.data) }
  } catch (error) {
    const message = isAxiosError(error)
      ? (error.response?.statusText ?? 'Unknown error')
      : String(error)

    console.error(`Error fetching character "${name}": ${error}`)
    return { success: false, error: message }
  }
}
