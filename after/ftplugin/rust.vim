call LspAddServer([#{name: 'rustanalyzer',
    \  filetype: ['rust'],
    \  path: 'rust-analyzer',
    \  args: [],
    \  syncInit: v:true,
    \  initializationOptions: #{
    \    inlayHints: #{
    \      typeHints: #{
    \        enable: v:true
    \      },
    \      parameterHints: #{
    \        enable: v:true
    \      }
    \    },
    \  }
    \ }])
