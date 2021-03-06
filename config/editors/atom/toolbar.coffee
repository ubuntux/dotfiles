
module.exports = [
  {
    type: 'button'
    tooltip: 'Toggle Sidebar'
    callback: 'tree-view:toggle'
    icon: 'three-bars'
  },
  { type: 'spacer' },
  {
    type: 'button'
    tooltip: 'Terminal'
    callback: 'tempinal-plus:toggle'
    icon: 'terminal'
  },
  {
    type: 'button'
    tooltip: 'Git Control'
    dependency: 'git-control'
    callback: 'git-control:toggle'
    icon: 'mark-github'
  },
  {
    type: 'button'
    tooltip: 'Github Gist'
    dependency: 'gist-it'
    callback: 'gist-it:gist-current-file'
    icon: 'gist'
  },
  {
    type: 'button'
    tooltip: 'Merge Conflicts'
    dependency: 'merge-conflicts'
    callback: 'merge-conflicts:detect'
    icon: 'git-merge'
  },
  {
    type: 'spacer'
  },
  {
    type: 'button'
    tooltip: 'Toggle Minimap'
    dependency: 'minimap'
    callback: 'minimap:toggle'
    icon: 'location'
  },
  {
    type: 'button'
    tooltip: 'Split screen - Horizontally'
    callback: 'pane:split-right'
    icon: 'columns'
    iconset: 'fa'
  },
  {
    type: 'button'
    tooltip: 'Split screen - Vertically'
    callback: 'pane:split-down'
    icon: 'columns fa-rotate-270'
    iconset: 'fa'
  },
  { type: 'spacer' },
  {
    type: 'button'
    tooltip: 'Fold all'
    callback: 'editor:fold-all'
    icon: 'fold'
  },
  {
    type: 'button'
    tooltip: 'Unfold all'
    callback: 'editor:unfold-all'
    icon: 'unfold'
  },
  { type: 'spacer' },
  {
    type: 'button'
    tooltip: 'Reload Window'
    callback: 'window:reload'
    icon: 'sync'
  },
  {
    type: 'button'
    tooltip: 'Toggle Developer Tools'
    callback: 'window:toggle-dev-tools'
    icon: 'tools'
  },
  {
    type: 'button'
    tooltip: 'Open Settings View'
    callback: 'settings-view:open'
    icon: 'gear'
  }
]
