import { FlatList, View, StyleSheet, Text } from 'react-native'
import { HOUSES_COLORS } from '@/constants/houses'
import type { Character } from '@/types/character'
import CharacterImage from './character-image'
import Filters from './filters'
import { ThemedText } from '../themed-text'

type Props = {
  characters: Character[]
}

function RenderCharacter({ character }: { character: Character }) {
  const houseColor =
    character.house === ''
      ? HOUSES_COLORS.Unknown
      : HOUSES_COLORS[character.house]

  return (
    <View style={styles.characterContainer}>
      <CharacterImage imageUrl={character.image} alt={character.name} />
      <View style={styles.characterInfoContainer}>
        <ThemedText type="title" style={styles.characterName}>
          {character.name}
        </ThemedText>
        <ThemedText type="subtitle" style={styles.characterActor}>
          {character.actor}
        </ThemedText>
        <Text
          style={{
            backgroundColor: houseColor.backgroundColor,
            color: houseColor.foregroundColor,
            fontSize: 12,
            marginTop: 4,
            marginRight: 'auto',
            marginLeft: 0,
            paddingHorizontal: 8,
            paddingVertical: 4,
            textAlign: 'center',
            flexWrap: 'wrap'
          }}
        >
          {character.house === '' ? '—' : character.house.toUpperCase()}
        </Text>
      </View>
      <View
        style={{
          backgroundColor: character.alive ? '#20a651' : '#a90900',
          width: 8,
          height: 8,
          borderRadius: 100,
          marginTop: 4,
          alignItems: 'flex-end',
          justifyContent: 'flex-start'
        }}
      />
    </View>
  )
}

export default function Characters({ characters }: Props) {
  return (
    <View style={styles.container}>
      <View style={styles.titleContainer}>
        <ThemedText style={styles.charactersSectionTile}>Characters</ThemedText>
        <ThemedText style={styles.numberOfCharacters}>
          {characters.length}
        </ThemedText>
      </View>
      <Filters characters={characters} />
      <FlatList
        data={characters}
        renderItem={({ item }) => <RenderCharacter character={item} />}
        keyExtractor={item => item.id}
      />
    </View>
  )
}

const styles = StyleSheet.create({
  container: {
    flex: 1
  },
  characterContainer: {
    flexDirection: 'row',
    marginBottom: 16,
    padding: 12,
    alignItems: 'center',
    justifyContent: 'flex-start',
    backgroundColor: '#222526',
    borderRadius: 8
  },
  characterInfoContainer: {
    display: 'flex',
    flexDirection: 'column',
    marginLeft: 12,
    paddingTop: 4
  },
  characterName: {
    fontSize: 25,
    fontWeight: 'bold'
  },
  characterActor: {
    fontSize: 18,
    color: '#666666'
  },
  charactersSectionTile: {
    fontSize: 32,
    fontWeight: '600',
    marginBottom: 20
  },
  numberOfCharacters: {
    backgroundColor: '#333',
    color: '#fff',
    height: 25,
    paddingInline: 8,
    marginInline: 10,
    borderRadius: 10
  },
  titleContainer: {
    display: 'flex',
    flexDirection: 'row'
  }
})
