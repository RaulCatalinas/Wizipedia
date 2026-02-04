import { StyleSheet } from 'react-native'
import { Image } from 'expo-image'

type Props = {
  imageUrl: string
  alt: string
}

export default function CharacterImage({ imageUrl, alt }: Props) {
  if (!imageUrl) {
    return (
      <Image
        source={require('@/assets/images/placeholder.avif')}
        accessibilityLabel="Placeholder Image"
        style={styles.characterImage}
      />
    )
  }

  return (
    <Image
      source={{ uri: imageUrl }}
      accessibilityLabel={alt}
      style={styles.characterImage}
      placeholder={require('@/assets/images/placeholder.avif')}
      placeholderContentFit="cover"
    />
  )
}

const styles = StyleSheet.create({
  characterImage: {
    width: 60,
    height: 60,
    borderRadius: 30,
    overflow: 'hidden',
    marginTop: 10,
    marginBottom: 10,
    marginRight: 12
  }
})
