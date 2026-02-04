import { StyleSheet, View } from 'react-native'
import { SafeAreaView } from 'react-native-safe-area-context'
import { ThemedText } from '@/components/themed-text'
import { ThemedView } from '@/components/themed-view'
import SectionCard from '@/components/ui/section-card'
import { HOUSES_COLORS } from '@/constants/houses'

export default function HomeScreen() {
  return (
    <SafeAreaView style={styles.container}>
      <ThemedView style={styles.titleContainer}>
        <ThemedText type="title" style={styles.title}>
          Explore the{'\n'}Wizarding World
        </ThemedText>
        <ThemedText type="subtitle" style={styles.subtitle}>
          Discover characters, spells, houses, and more{'\n'}from the magical
          universe.
        </ThemedText>
      </ThemedView>

      <View style={styles.cardsContainer}>
        <SectionCard
          title="Characters"
          subTitle="Discover the wizards"
          imageKey="characters"
          cardColors={HOUSES_COLORS.Gryffindor}
        />
        <SectionCard
          title="Houses"
          subTitle="Hogwarts houses"
          imageKey="houses"
          cardColors={HOUSES_COLORS.Slytherin}
        />
        <SectionCard
          title="Spells"
          subTitle="Magical spells"
          imageKey="spells"
          cardColors={HOUSES_COLORS.Ravenclaw}
        />
        <SectionCard
          title="Media"
          subTitle="Movies & books"
          imageKey="media"
          cardColors={HOUSES_COLORS.Hufflepuff}
        />
      </View>
    </SafeAreaView>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  titleContainer: {
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
  },
  cardsContainer: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    padding: 8
  }
})
