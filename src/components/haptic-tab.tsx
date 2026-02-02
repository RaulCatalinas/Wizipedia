import { impactAsync, ImpactFeedbackStyle } from 'expo-haptics'
import { PlatformPressable } from '@react-navigation/elements'
import type { BottomTabBarButtonProps } from '@react-navigation/bottom-tabs'

export function HapticTab(props: BottomTabBarButtonProps) {
  return (
    <PlatformPressable
      {...props}
      onPressIn={ev => {
        if (process.env.EXPO_OS === 'ios') {
          // Add a soft haptic feedback when pressing down on the tabs.
          impactAsync(ImpactFeedbackStyle.Light).catch(e => {
            console.error(`Failed to trigger haptic feedback: ${e}`)
          })
        }
        props.onPressIn?.(ev)
      }}
    />
  )
}
