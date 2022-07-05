Variable.g({
  firenvim_config = {
    ['globalSettings'] = { ['alt'] = 'all' },
    ['localSettings'] = {
      ['.*'] = {
        ['cmdline'] = 'neovim',
        ['priority'] = 0,
        ['selector'] = 'textarea',
        ['takeover'] = 'always',
      },
      ['https?://translate.google.com/.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
      ['https://studio.youtube.com.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
      ['https?://instagram.com.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
      ['https?://twitter.com.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
      ['https://.*gmail.com.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
      ['https://.*google.com.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
      ['https?://.*twitch.tv.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
      ['https?://.*jira.*'] = { ['takeover'] = 'never', ['priority'] = 1 },
    }
  }
})
