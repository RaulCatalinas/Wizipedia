import { useEffect, useState } from 'react'
import { getAllCharacters, getCharacterByName } from '@/services/characters'
import type { Character } from '@/types/character'

export function useCharacters() {
  const [characters, setCharacters] = useState<Character[]>([])
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchAllCharacters() {
      setIsLoading(true)

      const result = await getAllCharacters()

      if (result.success) {
        setCharacters(result.data)
        setError(null)
      } else {
        setError(result.error)
      }

      setIsLoading(false)
    }

    void fetchAllCharacters()
  }, [])

  return { characters, isLoading, error }
}

export function useCharacterByName(name: string) {
  const [character, setCharacter] = useState<Character | null>(null)
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState<string | null>(null)

  useEffect(() => {
    async function fetchCharacter() {
      setIsLoading(true)

      const result = await getCharacterByName(name)

      if (result.success) {
        setCharacter(result.data)
        setError(null)
      } else {
        setError(result.error)
      }

      setIsLoading(false)
    }

    void fetchCharacter()
  }, [name])

  return { character, isLoading, error }
}
