-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/chtc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/chtc/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/chtc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/chtc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/chtc/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    config = { "\27LJ\2\2Æ\2\0\0\2\0\b\0\0256\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\1K\0\1\0'let bufferline.maximum_padding = 2'let bufferline.animation = v:false\"let bufferline.icons = v:true&let bufferline.auto_hide = v:true/let bufferline = get(g:, 'bufferline', {})&hi! link BufferTabpageFill Normal\bcmd\bvim\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\2Û\1\0\0\4\0\16\0\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2=\2\15\1B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\1\ttext\bâ•°\14topdelete\1\0\1\ttext\bâ•·\vdelete\1\0\1\ttext\bâ•µ\vchange\1\0\1\ttext\bâ”‚\badd\1\0\0\1\0\1\ttext\bâ”‚\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\2û\1\0\0\2\0\a\0\0216\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\1K\0\1\0'hi! link GitSignsDelete GruvboxRed(hi! link GitSignsChange GruvboxAqua&hi! link GitSignsAdd GruvboxGreen\31hi! link SignColumn LineNr\24colorscheme gruvbox\bcmd\bvim\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/gruvbox.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\2ƒ\2\0\0\2\0\b\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\5\0\0\tfern\btxt\vpacker\thelp&indent_blankline_filetype_exclude#indent_blankline_show_foldtext-indent_blankline_show_first_indent_level\1\5\0\0\bâ”‚\bâ”†\bâ”Š\bî˜¡\31indent_blankline_char_list\6g\bvim\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/lush.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\2O\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\4\0\0\6*\n!fern\f!packer\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\2Þ\2\0\0\3\0\f\0\0276\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\n\0005\2\t\0=\2\v\1=\1\b\0K\0\1\0\bgit\1\0\0\1\0\6\runstaged\bï‘™\fdeleted\bï‘˜\14untracked\bï‘—\fignored\bï‘´\frenamed\bï‘š\vstaged\bîœ©\20nvim_tree_icons\1\0\3\ffolders\3\1\nfiles\3\1\bgit\3\1\25nvim_tree_show_icons\27nvim_tree_hijack_netrw\25nvim_tree_auto_close\24nvim_tree_auto_open\21nvim_tree_git_hl\6g\bvim\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\2Ê\1\0\0\3\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\6c\21ensure_installed\1\0\0\1\4\0\0\blua\bcss\thtml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    config = { "\27LJ\2\2ˆ\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\frainbow\1\0\0\1\0\3\19max_file_lines\3ˆ'\18extended_mode\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/chtc/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\2O\0\0\2\0\4\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\3\0B\0\2\1K\0\1\0\1\4\0\0\6*\n!fern\f!packer\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\2Ê\1\0\0\3\0\f\0\0156\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\6c\21ensure_installed\1\0\0\1\4\0\0\blua\bcss\thtml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\2Û\1\0\0\4\0\16\0\0196\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\14\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2=\2\15\1B\0\2\1K\0\1\0\nsigns\1\0\0\17changedelete\1\0\1\ttext\bâ•°\14topdelete\1\0\1\ttext\bâ•·\vdelete\1\0\1\ttext\bâ•µ\vchange\1\0\1\ttext\bâ”‚\badd\1\0\0\1\0\1\ttext\bâ”‚\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-ts-rainbow
time([[Config for nvim-ts-rainbow]], true)
try_loadstring("\27LJ\2\2ˆ\1\0\0\3\0\6\0\t6\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\4\0005\2\3\0=\2\5\1B\0\2\1K\0\1\0\frainbow\1\0\0\1\0\3\19max_file_lines\3ˆ'\18extended_mode\2\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-ts-rainbow")
time([[Config for nvim-ts-rainbow]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\2û\1\0\0\2\0\a\0\0216\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\1K\0\1\0'hi! link GitSignsDelete GruvboxRed(hi! link GitSignsChange GruvboxAqua&hi! link GitSignsAdd GruvboxGreen\31hi! link SignColumn LineNr\24colorscheme gruvbox\bcmd\bvim\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\2ƒ\2\0\0\2\0\b\0\0176\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\1\0=\1\4\0006\0\0\0009\0\1\0+\1\1\0=\1\5\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0K\0\1\0\1\5\0\0\tfern\btxt\vpacker\thelp&indent_blankline_filetype_exclude#indent_blankline_show_foldtext-indent_blankline_show_first_indent_level\1\5\0\0\bâ”‚\bâ”†\bâ”Š\bî˜¡\31indent_blankline_char_list\6g\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\2Æ\2\0\0\2\0\b\0\0256\0\0\0009\0\1\0'\1\2\0B\0\2\0016\0\0\0009\0\1\0'\1\3\0B\0\2\0016\0\0\0009\0\1\0'\1\4\0B\0\2\0016\0\0\0009\0\1\0'\1\5\0B\0\2\0016\0\0\0009\0\1\0'\1\6\0B\0\2\0016\0\0\0009\0\1\0'\1\a\0B\0\2\1K\0\1\0'let bufferline.maximum_padding = 2'let bufferline.animation = v:false\"let bufferline.icons = v:true&let bufferline.auto_hide = v:true/let bufferline = get(g:, 'bufferline', {})&hi! link BufferTabpageFill Normal\bcmd\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\2Þ\2\0\0\3\0\f\0\0276\0\0\0009\0\1\0)\1\1\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\3\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\5\0006\0\0\0009\0\1\0005\1\a\0=\1\6\0006\0\0\0009\0\1\0005\1\n\0005\2\t\0=\2\v\1=\1\b\0K\0\1\0\bgit\1\0\0\1\0\6\runstaged\bï‘™\fdeleted\bï‘˜\14untracked\bï‘—\fignored\bï‘´\frenamed\bï‘š\vstaged\bîœ©\20nvim_tree_icons\1\0\3\ffolders\3\1\nfiles\3\1\bgit\3\1\25nvim_tree_show_icons\27nvim_tree_hijack_netrw\25nvim_tree_auto_close\24nvim_tree_auto_open\21nvim_tree_git_hl\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
