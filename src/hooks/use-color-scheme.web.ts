import { useSyncExternalStore } from 'react'
import { useColorScheme as useRNColorScheme } from 'react-native'

const emptySubscribe = () => () => {}

function useIsHydrated() {
  return useSyncExternalStore(
    emptySubscribe,
    () => true,
    () => false
  )
}

export function useColorScheme() {
  const isHydrated = useIsHydrated()
  const colorScheme = useRNColorScheme()

  return isHydrated ? colorScheme : 'light'
}
