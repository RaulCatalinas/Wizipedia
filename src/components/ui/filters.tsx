import { FlatList, StyleSheet, TouchableOpacity } from 'react-native'
import { FILTER_KEYS, FILTERS } from '@/constants/filters'
import type { Character } from '@/types/character'
import { capitalizeFirstLetter } from '@/utils/strings'
import { ThemedText } from '../themed-text'

type Props = {
  characters: Character[]
}

function RenderFilter({
  filterKey,
  characters
}: {
  filterKey: string
  characters: Character[]
}) {
  return (
    <TouchableOpacity
      style={styles.filter}
      onPress={() => {
        const filterFunction = FILTERS[filterKey]
        const filteredCharacters = filterFunction(characters)
        console.log({ filteredCharacters })
      }}
    >
      <ThemedText style={styles.filterText} type="default">
        {capitalizeFirstLetter(filterKey)}
      </ThemedText>
    </TouchableOpacity>
  )
}

export default function Filters({ characters }: Props) {
  return (
    <FlatList
      style={styles.filterContainer}
      contentContainerStyle={styles.filterContent}
      horizontal
      showsHorizontalScrollIndicator={false}
      data={FILTER_KEYS}
      renderItem={({ item }) => (
        <RenderFilter filterKey={item} characters={characters} />
      )}
      keyExtractor={item => item}
    />
  )
}

const styles = StyleSheet.create({
  filterContainer: {
    marginBottom: 8
  },
  filterContent: {
    paddingHorizontal: 16,
    paddingTop: 0,
    paddingBottom: 10,
    gap: 8
  },
  filter: {
    paddingHorizontal: 12,
    paddingVertical: 3,
    borderRadius: 5,
    backgroundColor: '#333',
    height: 32,
    justifyContent: 'center'
  },
  filterText: {
    fontSize: 14,
    color: '#fff'
  }
})
