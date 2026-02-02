// https://docs.expo.dev/guides/using-eslint/
const { strict } = require('eslint-config-expo-magic')
const prettier = require('eslint-plugin-prettier/recommended')
const eslintConfigPrettier = require('eslint-config-prettier/flat')
const reactHooks = require('eslint-plugin-react-hooks')
const eslintPluginPrettierRecommended = require('eslint-plugin-prettier/recommended')

module.exports = (async function config() {
  return [
    ...strict,
    eslintConfigPrettier,
    prettier,
    eslintPluginPrettierRecommended,
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
      files: ['**/*.{ts,tsx}'],
      rules: {
        'react-hooks/rules-of-hooks': 'error',
        '@typescript-eslint/explicit-function-return-type': 'off',
        'react-hooks/exhaustive-deps': 'warn',
        '@typescript-eslint/no-unused-vars': 'warn',
        '@typescript-eslint/space-before-function-paren': 'off',
        '@typescript-eslint/no-unsafe-return': 'off',
        '@typescript-eslint/no-magic-numbers': 'off',
        '@typescript-eslint/no-unsafe-assignment': 'off',
        'prefer-destructuring': 'off',
        'no-console': 'off',
        'prettier/prettier': 'error'
      }
    }
  ]
})()
