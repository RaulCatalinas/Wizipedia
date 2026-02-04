import { StyleSheet } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'

export default function HomeScreen() {
  return (
    <SafeAreaView>
      <ThemedView style={styles.titleContainer}>
        <ThemedText type="title" style={styles.title}>
          Explore the{'\n'}Wizarding World
        </ThemedText>
        <ThemedText type="subtitle" style={styles.subtitle}>
          Discover characters, spells, houses, and more{'\n'}from the magical
          universe.
        </ThemedText>
      </ThemedView>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  titleContainer: {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    paddingBottom: 16,
    paddingHorizontal: 16,
    marginTop: 16
  },
  title: {
    marginBottom: 8,
    marginTop: 16,
    textAlign: 'center',
    fontSize: 32
  },
  subtitle: {
    marginTop: 8,
    textAlign: 'center',
    fontSize: 16,
    color: '#AAAAAA'
  }
})
