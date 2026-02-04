import { ActivityIndicator, StyleSheet } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import Characters from '@/components/ui/characters'
import { useCharacters } from '@/hooks/use-characters'

export default function CharactersScreen() {
  const { characters, isLoading, error } = useCharacters()

  return (
    <SafeAreaView>
      <ThemedView style={styles.stepContainer}>
        {error ? (
          <ThemedText type="error">
            Error loading characters: {error}
          </ThemedText>
        ) : null}

        {isLoading ? (
          <ActivityIndicator size="large" color="#0000ff" />
        ) : (
          <Characters characters={characters} />
        )}
      </ThemedView>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  stepContainer: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    paddingBottom: 16,
    paddingHorizontal: 16,
    gap: 8,
    margin: 0,
    padding: 16,
    width: '100%',
    height: '100%'
  }
})
