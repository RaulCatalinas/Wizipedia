import { StyleSheet, TouchableOpacity } from 'react-native'
import { Image } from 'expo-image'
import { useRouter } from 'expo-router'
import type { HouseColor } from '@/types/houses'
import { ThemedText } from '../themed-text'

const IMAGES = {
  characters: require('@/assets/icons/characters.svg'),
  houses: require('@/assets/icons/houses.svg'),
  spells: require('@/assets/icons/spells.svg'),
  media: require('@/assets/icons/media.svg')
} as const

type ImageKey = keyof typeof IMAGES

type Props = {
  title: string
  subTitle: string
  imageKey: ImageKey
  tintColor?: string
  cardColors: HouseColor
}

export default function SectionCard({
  title,
  subTitle,
  imageKey,
  tintColor = '#FFFFFF',
  cardColors
}: Props) {
  const router = useRouter()

  return (
    <TouchableOpacity
      onPress={() => {
        router.navigate(`/(tabs)/${title.toLowerCase()}`)
      }}
      style={[styles.card, { backgroundColor: cardColors.backgroundColor }]}
    >
      <Image
        style={styles.icon}
        source={IMAGES[imageKey]}
        placeholder={require('@/assets/images/placeholder.avif')}
        placeholderContentFit="cover"
        tintColor={tintColor}
      />
      <ThemedText
        type="title"
        style={[styles.title, { color: cardColors.foregroundColor }]}
      >
        {title}
      </ThemedText>
      <ThemedText type="subtitle" style={styles.subtitle}>
        {subTitle}
      </ThemedText>
    </TouchableOpacity>
  )
}

const styles = StyleSheet.create({
  card: {
    width: '47%',
    aspectRatio: 0.8,
    borderRadius: 8,
    padding: 16,
    margin: '1.5%'
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 4
  },
  subtitle: {
    fontSize: 14,
    color: '#AAAAAA',
    marginBottom: 8
  },
  icon: {
    width: 40,
    height: 40,
    marginTop: 'auto'
  }
})
