import { Image } from 'expo-image'
import { Tabs } from 'expo-router'
import { HapticTab } from '@/components/haptic-tab'
import { Colors } from '@/constants/theme'
import { useColorScheme } from '@/hooks/use-color-scheme'

export default function TabLayout() {
  const colorScheme = useColorScheme()

  return (
    <Tabs
      screenOptions={{
        tabBarActiveTintColor: Colors[colorScheme ?? 'light'].tint,
        headerShown: false,
        tabBarButton: HapticTab
      }}
    >
      <Tabs.Screen
        name="index"
        options={{
          title: 'Home',
          tabBarIcon: ({ color }) => (
            <Image
              source={require('@/assets/icons/home.svg')}
              style={{ width: 25, height: 25 }}
              tintColor={color}
            />
          )
        }}
      />
      <Tabs.Screen
        name="characters"
        options={{
          title: 'Characters',
          tabBarIcon: ({ color }) => (
            <Image
              source={require('@/assets/icons/characters.svg')}
              style={{ width: 25, height: 25 }}
              tintColor={color}
            />
          )
        }}
      />
    </Tabs>
  )
}
