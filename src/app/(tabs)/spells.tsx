import { SafeAreaView } from 'react-native-safe-area-context'
import { ThemedText } from '@/components/themed-text'

export default function SpellsScreen() {
  return (
    <SafeAreaView>
      <ThemedText type="title">Spells</ThemedText>
    </SafeAreaView>
  )
}
