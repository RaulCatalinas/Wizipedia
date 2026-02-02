// https://docs.expo.dev/guides/using-eslint/
const { defineConfig } = require('eslint/config')
const expoConfig = require('eslint-config-expo/flat')
const jsxA11y = require('eslint-plugin-jsx-a11y')
const prettier = require('eslint-plugin-prettier/recommended')
const eslintConfigPrettier = require('eslint-config-prettier/flat')
const reactHooks = require('eslint-plugin-react-hooks')
const eslintPluginPrettierRecommended = require('eslint-plugin-prettier/recommended')
const universe = require('eslint-config-universe/flat')

module.exports = defineConfig([
  expoConfig,
  eslintConfigPrettier,
  prettier,
  eslintPluginPrettierRecommended,
  universe.native,
  universe.shared.typescriptAnalysis,
  {
    ignores: [
      'node_modules',
      '.github',
      '.husky',
      '.vscode',
      'public',
      'dist',
      'build'
    ]
  },
  {
    ...reactHooks.configs.flat['recommended-latest'],
    files: ['**/*.txs']
  },
  {
    plugins: {
      'jsx-a11y': jsxA11y.flatConfigs.strict
    },
    languageOptions: {
      parserOptions: {
        ecmaFeatures: {
          jsx: true
        }
      }
    },
    files: ['**/*.{ts,tsx}'],
    rules: {
      '@typescript-eslint/space-before-function-paren': 'off',
      '@typescript-eslint/explicit-function-return-type': 'off',
      '@typescript-eslint/no-unsafe-return': 'off',
      '@typescript-eslint/no-magic-numbers': 'off',
      '@typescript-eslint/no-unsafe-assignment': 'off',
      'prefer-destructuring': 'off',
      'no-console': 'off',
      'prettier/prettier': 'error'
    }
  }
])
