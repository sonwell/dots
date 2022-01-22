" Name:     sonwell vim scheme
" Author:   Andy Kassen <atkassen@gmail.com>
" Created:  In the middle of the day
" Modified: 2021 Nov 13
"
" ---------------------------------------------------------------------
" COLOR VALUES
" ---------------------------------------------------------------------
" TERMCOL   HEX     sRGB        HSB
" --------- ------- ----------- -----------
" black     #303030
" red       #802426
" green     #5aa261
" yellow    #b1813a
" blue      #3986a3
" magenta   #714e76
" cyan      #4e7d78
" white     #d7d7af
" brblack   #6c6c6c
" brred     #c34346
" brgreen   #70c87d
" bryellow  #d6cf7e
" brblue    #39a1df
" brmagenta #714e76
" brcyan    #3cc4b1
" brwhite   #d2e5d7
"
" Colorscheme initialization
" ---------------------------------------------------------------------
let colors_name = 'sonwell'

let s:none      = 'NONE'
let s:bold      = 'bold'
let s:italic    = 'italic'
let s:reverse   = 'inverse'
let s:inverse   = 'inverse'
let s:standout  = 'standout'
let s:underline = 'underline'
let s:undercurl = 'undercurl'
let s:nocombine = 'nocombine'
let s:strike    = 'strikethrough'

" This is really picked assuming at least 16 terminal
" colors so there aren't fallback options for terminals
" with fewer colors. Sorry about that.
let s:black         = { 'cterm':  '0', 'gui': '#303030' }
let s:red           = { 'cterm':  '1', 'gui': '#802426' }
let s:green         = { 'cterm':  '2', 'gui': '#5aa261' }
let s:yellow        = { 'cterm':  '3', 'gui': '#b1813a' }
let s:blue          = { 'cterm':  '4', 'gui': '#3986a3' }
let s:magenta       = { 'cterm':  '5', 'gui': '#714e76' }
let s:cyan          = { 'cterm':  '6', 'gui': '#4e7d78' }
let s:light_gray    = { 'cterm':  '7', 'gui': '#b9c1b9' }
let s:dark_gray     = { 'cterm':  '8', 'gui': '#6c6c6c' }
let s:light_red     = { 'cterm':  '9', 'gui': '#c34346' }
let s:light_green   = { 'cterm': '10', 'gui': '#70c87d' }
let s:light_yellow  = { 'cterm': '11', 'gui': '#d6cf7e' }
let s:light_blue    = { 'cterm': '12', 'gui': '#39a1df' }
let s:light_magenta = { 'cterm': '13', 'gui': '#a561ae' }
let s:light_cyan    = { 'cterm': '14', 'gui': '#3cc4b1' }
let s:white         = { 'cterm': '15', 'gui': '#d2e5d7' }
let s:cursor        = { 'cterm':  '8', 'gui': '#646564' }
let s:cursor_text   = { 'cterm': '15', 'gui': '#c7cbc6' }

function! s:stylify(style)
    let styled = []
    let style = {}
    for key in a:style
        exe 'let style.' . key . ' = v:true'
    endfor
    let all_styles = [
        \s:none,
        \s:bold,
        \s:italic,
        \s:reverse,
        \s:standout,
        \s:underline,
        \s:undercurl,
        \s:nocombine,
        \s:strike
        \]
    for key in all_styles
        if has_key(style, key)
            call add(styled, key)
        endif
    endfor
    if !len(styled)
        call add(styled, s:none)
    endif
    let final = join(styled, ',')
    return 'term=' . final. ' cterm=' . final . ' gui=' . final
endfunction

function! s:color(group, rules)
    if type(a:rules) == 1
        call s:link(a:group, a:rules)
        return
    endif
    let style = s:stylify(get(a:rules, 'style', []))
    let reset = { 'cterm': 'NONE', 'gui': 'NONE' }
    let fg = get(a:rules, 'fg', reset)
    let bg = get(a:rules, 'bg', reset)
    let cmd = 'hi! ' . a:group . ' ' . style
          \ . ' ctermfg=' . fg.cterm . ' guifg=' . fg.gui
          \ . ' ctermbg=' . bg.cterm . ' guibg=' . bg.gui
    if has_key(a:rules, 'sp')
        exe cmd . ' guisp=' . a:rules.sp.gui
    else
        exe cmd
    endif
endfunction

function s:link(to, from)
    exe 'hi! link ' . a:to . ' ' . a:from
endfunction

function! s:colors(rules, ...)
    for ruleset in a:000
        add(a:rules, ruleset)
    endfor
    for [group, rule] in items(a:rules)
        call s:color(group, rule)
    endfor
endfunction

" Basic highlighting
" ---------------------------------------------------------------------
call s:color('Normal',     { 'fg': s:white })

call s:color('Comment',    { 'fg': s:dark_gray, 'style': [s:italic] })

call s:color('Constant',   { 'fg': s:light_cyan })
" hi! Constant       cterm=NONE      ctermfg=14    ctermbg=NONE
" hi! Boolean
" hi! Character
" hi! Float
" hi! Number
" hi! String

call s:color('Identifier', { 'fg': s:white })
call s:color('Function',   { 'fg': s:blue })
" hi! Identifier     cterm=NONE      ctermfg=15   ctermbg=NONE
" hi! Function       cterm=NONE      ctermfg=4    ctermbg=NONE

call s:color('Statement', { 'fg': s:green })
" hi! Statement      cterm=NONE      ctermfg=2    ctermbg=NONE
" hi! Conditional
" hi! Repeat
" hi! Label          cterm=NONE      ctermfg=2    ctermbg=NONE
" hi! Operator       cterm=NONE      ctermfg=2    ctermbg=NONE
" hi! Keyword
" hi! Exception

call s:color('PreProc', { 'fg': s:red })
" hi! PreProc        cterm=NONE      ctermfg=1    ctermbg=NONE
" hi! Include
" hi! Define
" hi! Macro
" hi! PreCondit

call s:color('Type', { 'fg': s:yellow })
call s:color('StorageClass', { 'fg': s:green })
" hi! Type           cterm=NONE      ctermfg=3    ctermbg=NONE
" hi! StorageClass   cterm=NONE      ctermfg=2    ctermbg=NONE
" hi! Structure
" hi! Typedef

" call s:color('Special', { 'fg': s:light_yellow })
call s:color('Special', { 'fg': s:red })
call s:color('SpecialChar', { 'fg': s:magenta })
" NOTE: TSPunctDelimiter links to Delimiter; it seems fine to just force
"       Delimiter to be upright (even in comments). If there are Delimiters
"       that should be Comment-styled, remove s:nocombine from the below and
"       style TSPuncDelimiter with it.
call s:color('Delimiter', { 'fg': s:white, 'style': [s:nocombine]}) 
call s:color('Debug', { 'fg': s:magenta })
" hi! Special        cterm=NONE      ctermfg=11   ctermbg=NONE
" hi! SpecialChar    cterm=NONE      ctermfg=5    ctermbg=NONE
" hi! Tag
" hi! Delimiter      cterm=NONE      ctermfg=15   ctermbg=NONE
" hi! SpecialComment
call s:color('SpecialComment', { 'fg': s:light_gray, 'style': [s:nocombine] })
" hi! Debug          cterm=NONE      ctermfg=5    ctermbg=NONE

call s:color('Underlined', { 'fg': s:light_magenta, 'style': [s:underline] })
" hi! Underlined     cterm=underline ctermfg=13   ctermbg=NONE

call s:color('Ignore', {})
" hi! Ignore         cterm=NONE      ctermfg=NONE ctermbg=NONE

call s:color('Error', { 'fg': s:light_red, 'style': [s:bold] })
" hi! Error          cterm=bold      ctermfg=9    ctermbg=NONE

call s:color('Todo', { 'fg': s:magenta, 'style': [s:bold, s:nocombine] })
" hi! Todo           cterm=bold      ctermfg=4    ctermbg=NONE


" Extended highlighting
" ---------------------------------------------------------------------

call s:color('SpecialKey', { 'fg': s:black, 'style': [s:bold] })
call s:color('NonText', { 'fg': s:black, 'style': [s:bold] })
call s:color('StatusLine', { 'fg': s:light_cyan, 'bg': s:black, 'style': [s:reverse] })
call s:color('StatusLineNC', { 'fg': s:light_gray, 'bg': s:black })
call s:color('Visual', { 'fg': s:light_green, 'bg': s:black, 'style': [s:reverse] })
" hi! SpecialKey     cterm=bold      ctermfg=0    ctermbg=NONE
" hi! NonText        cterm=bold      ctermfg=0    ctermbg=NONE
" hi! StatusLine     cterm=reverse   ctermfg=14   ctermbg=0
" hi! StatusLineNC   cterm=reverse   ctermfg=11   ctermbg=0
" hi! Visual         cterm=reverse   ctermfg=10   ctermbg=8
call s:color('Directory',    { 'fg': s:blue, 'style': [s:bold] })
call s:color('ErrorMsg',     { 'fg': s:red, 'style': [s:reverse] })
call s:color('IncSearch',    { 'fg': s:black, 'bg': s:light_yellow })
call s:color('Search',       { 'fg': s:yellow, 'style': [s:reverse] })
call s:color('MoreMsg',      { 'fg': s:blue })
call s:color('ModeMsg',      { 'fg': s:blue })
call s:color('LineNr',       { 'fg': s:black })
call s:color('Question',     { 'fg': s:cyan, 'style': [s:bold] })
call s:color('VertSplit',    { 'fg': s:light_gray })
call s:color('Title',        { 'fg': s:light_red, 'style': [s:bold] })
call s:color('VisualNOS',    { 'bg': s:black, 'style': [s:standout, s:reverse] })
call s:color('WarningMsg',   { 'fg': s:red, 'style': [s:bold] })
call s:color('WildMenu',     { 'fg': s:light_gray, 'bg': s:black, 'style': [s:reverse] })
call s:color('Folded',       { 'fg': s:dark_gray, 'bg': s:black, 'style': [s:underline, s:bold], 'sp': s:dark_gray })
call s:color('FoldColumn',   { 'fg': s:dark_gray, 'bg': s:black })
call s:color('DiffAdd',      { 'fg': s:green, 'bg': s:black, 'sp': s:green })
call s:color('DiffChange',   { 'fg': s:yellow, 'bg': s:black, 'sp': s:yellow })
call s:color('DiffDelete',   { 'fg': s:red, 'bg': s:black })
call s:color('DiffText',     { 'fg': s:blue, 'bg': s:black, 'sp': s:blue })
call s:color('SignColumn',   { 'fg': s:light_blue })
call s:color('Conceal',      { 'fg': s:blue })
call s:color('SpellBad',     { 'style': [s:undercurl], 'sp': s:red })
call s:color('SpellCap',     { 'style': [s:undercurl], 'sp': s:light_magenta })
call s:color('SpellRare',    { 'style': [s:undercurl], 'sp': s:cyan })
call s:color('SpellLocal',   { 'style': [s:undercurl], 'sp': s:yellow })
call s:color('Pmenu',        { 'fg': s:dark_gray, 'bg': s:black })
call s:color('PmenuSel',     { 'fg': s:white, 'bg': s:blue })
call s:color('PmenuSbar',    { 'fg': s:light_gray, 'bg': s:light_blue, 'style': [s:reverse] })
call s:color('PmenuThumb',   { 'fg': s:light_blue, 'bg': s:dark_gray, 'style': [s:reverse] })
call s:color('TabLine',      { 'fg': s:light_blue, 'bg': s:black, 'style': [s:underline], 'sp': s:light_blue })
call s:color('TabLineFill',  { 'fg': s:light_blue, 'bg': s:black, 'style': [s:underline], 'sp': s:light_blue })
call s:color('TabLineSel',   { 'fg': s:light_green, 'bg': s:light_gray, 'style': [s:underline, s:reverse], 'sp': s:light_blue })
call s:color('ColorColumn',  { 'bg': s:black })
call s:color('CursorColumn', {})
call s:color('CursorLine',   {})
call s:color('CursorLineNr', { 'fg': s:dark_gray })
call s:color('Cursor',       { 'fg': s:cursor_text, 'bg': s:cursor })
call s:color('TermCursor',   { 'fg': s:cursor_text, 'bg': s:cursor })
call s:color('TermCursorNC', {})
call s:link('lCursor', 'Cursor')
call s:color('MatchParen',   { 'style': [s:reverse] })

" hi! StatusLineTerm
" hi! StatusLineTermNC
" hi! ToolbarLine
" hi! ToolbarButton
" hi! QuickFixLine

call s:color('DiagnosticError', { 'fg': s:light_red })
call s:color('DiagnosticWarn', { 'fg': s:yellow })
call s:color('DiagnosticInfo', { 'fg': s:white })
call s:color('DiagnosticHint', { 'fg': s:light_yellow })
call s:color('DiagnosticVirtualTextError', { 'fg': s:light_red })

" NVIM-specific highlighting
" ---------------------------------------------------------------------

call s:link('LspDiagnosticsDefaultError', 'DiagnosticError')
call s:color('LspReferenceRead', { 'bg': s:black })
call s:link('LspReferenceText', 'LspReferenceRead')
call s:link('LspReferenceWrite', 'LspReferenceRead')

call s:color('NvimInternalError', { 'fg': s:red, 'style': [s:bold] })  " highlighter error

"
" Tree-sitter Highlighting
" ---------------------------------------------------------------------
call s:color('TSNamespace', { 'fg': s:white })
" hi! TSAttribute
" hi! TSBoolean
" hi! TSCharacter
" hi! TSComment
" hi! TSConditional
" hi! TSConstant
" hi! TSConstBuiltin
" hi! TSConstMacro
" hi! TSConstructor
" hi! TSError
" hi! TSException
" hi! TSField
" hi! TSFloat
" hi! TSFunction
" hi! TSFuncBuiltin
" hi! TSFuncMacro
" hi! TSInclude
" hi! TSKeyword
" hi! TSKeywordFunction
" hi! TSKeywordOperator
" hi! TSKeywordReturn
" hi! TSLabel
" hi! TSMethod
" hi! TSNamespace    cterm=NONE     ctermfg=White      ctermbg=NONE
" hi! TSNone
" hi! TSNumber
" hi! TSOperator     cterm=NONE     ctermfg=DarkGreen  ctermbg=NONE
" hi! TSParameter    cterm=NONE     ctermfg=White      ctermbg=NONE
" hi! TSProperty
" hi! TSPunctDelimiter
" hi! TSPunctBracket
" hi! TSPunctSpecial
" hi! TSRepeat
" hi! TSString
" hi! TSStringRegex
" hi! TSStringEscape
" hi! TSStringSpecial
" hi! TSSymbol
" hi! TSTag
" hi! TSTagAttribute
" hi! TSTagDelimiter
" hi! TSText
" hi! TSStrong
" hi! TSEmphasis
" hi! TSUnderline
" hi! TSStrike
" hi! TSTitle
" hi! TSLiteral
" hi! TSURI
" hi! TSMath
" hi! TSTextReference
" hi! TSEnvironment
" hi! TSEnvironmentName
" hi! TSNote
" hi! TSWarning
" hi! TSDanger
" hi! TSType
" hi! TSTypeBuiltin
" hi! TSVariable
" hi! TSVariableBuiltin
" hi! TSVariableBuiltin
call s:color('TSConstant', { 'fg': s:light_blue })
call s:color('TSDanger', { 'fg': s:light_red, 'style': [s:bold, s:nocombine] })
"
" NVimTree highlighting
" ---------------------------------------------------------------------
call s:color('NvimTreeSymlink', { 'fg': s:light_magenta })
" NvimTreeFolderName -> Directory
call s:link('NvimTreeRootFolder', 'Directory')
call s:color('NvimTreeFolderIcon', { 'fg': s:yellow })
" NvimTreeEmptyFolderName -> Directory
" NvimTreeOpenedFolderName -> Directory
call s:color('NvimTreeExecFile', { 'fg': s:green })
call s:color('NvimTreeOpenedFile', { 'style': [s:bold, s:italic] })
call s:color('NvimTreeSpecialFile', { 'fg': s:light_magenta, 'style': [s:italic] })
call s:color('NvimTreeImageFile', { 'fg': s:magenta })
call s:color('NvimTreeIndentMarker', { 'fg': s:blue })  " Directory without bold
" 
call s:color('NvimTreeGitDirty',   { 'fg': s:red })
call s:color('NvimTreeGitStaged',  { 'fg': s:green })
call s:color('NvimTreeGitMerge',   { 'fg': s:light_red })
call s:color('NvimTreeGitRenamed', { 'fg': s:light_magenta })
call s:color('NvimTreeGitNew',     { 'fg': s:light_yellow })
call s:color('NvimTreeGitDeleted', { 'fg': s:black, 'style': [s:italic] })
call s:color('NvimTreeGitIgnored', { 'fg': s:black })
" 
call s:color('NvimTreeWindowPicker', { 'fg': s:white, 'bg': s:light_blue })
" 
" NvimTreeFileDirty   -> NVimTreeGitDirty
" NvimTreeFileStaged  -> NVimTreeGitStaged
" NvimTreeFileMerge   -> NVimTreeGitMerge
" NvimTreeFileRenamed -> NVimTreeGitRenamed
" NvimTreeFileNew     -> NVimTreeGitNew
" NvimTreeFileDeleted -> NVimTreeGitDeleted
"
" nvim-web-devicons highlighting
" ---------------------------------------------------------------------
call s:color('DevIconDefault', { 'fg': s:white })
call s:link('DevIconTxt', 'DevIconDefault')
call s:link('DevIconTex', 'DevIconDefault')

" dropbox
" call s:color('DevIconDropbox', { 'fg': s:light_blue })

" MS Office files
" call s:color('DevIconXls', { 'fg': s:green })
" call s:color('DevIconDoc', { 'fg': s:blue  })
" call s:color('DevIconPpt', { 'fg': s:light_red })

" Visual Studio
" call s:color('DevIconSettingsJson', { 'fg': s:light_magenta })
" call s:link('DevIconSln', 'DevIconSettingsJson')
" call s:link('DevIconSuo', 'DevIconSettingsJson')

" heroku
" call s:color('DevIconProcfile', { 'fg': s:magenta })

" XML
" call s:link('DevIconXml', 'DevIconDefault')
" call s:color('DevIconSvg', { 'fg': s:yellow })

" shell + utilities
" call s:color('DevIconTerminal', { 'fg': s:white })
" call s:color('DevIconSh', { 'fg': s:dark_gray })
" call s:link('DevIconAwk', 'DevIconSh')
" call s:link('DevIconBash', 'DevIconSh')
" call s:link('DevIconZsh', 'DevIconSh')
" call s:link('DevIconZsh', 'DevIconSh')
" call s:link('DevIconCsh', 'DevIconSh')
" call s:link('DevIconKsh', 'DevIconSh')
" call s:link('DevIconFish', 'DevIconSh')
" call s:color('DevIconPs1', { 'fg': s:blue })

" configuration files
" call s:color('DevIconConf', { 'fg': s:light_gray })
" call s:link('DevIconBashProfile', 'DevIconConf')
" call s:link('DevIconBashrc', 'DevIconBashProfile')
" call s:link('DevIconZshprofile', 'DevIconConf')
" call s:link('DevIconZshrc', 'DevIconZshprofile')
" call s:link('DevIconZshenv', 'DevIconZshprofile')

" git
" call s:color('DevIconGitLogo', { 'fg': s:light_red })
" call s:link('DevIconGitAttributes', 'DevIconGitLogo')
" call s:link('DevIconGitIgnore', 'DevIconGitLogo')
" call s:link('DevIconGitModules', 'DevIconGitLogo')
" call s:link('DevIconGitCommit', 'DevIconGitLogo')

" C + relatives
" call s:color('DevIconC', { 'fg': s:blue })
call s:link('DevIconCPlusPlus', 'DevIconC')
call s:link('DevIconCpp', 'DevIconC')
call s:link('DevIconCp', 'DevIconC')
call s:link('DevIconCxx', 'DevIconC')
" call s:color('DevIconH', { 'fg': s:yellow })
" call s:link('DevIconHh', 'DevIconH')
" call s:link('DevIconHpp', 'DevIconH')
" call s:color('DevIconCs', { 'fg': s:light_green })

" Ruby
" call s:color('DevIconRb', { 'fg': s:light_red })
" call s:link('DevIconGemfile', 'DevIconRb')
" call s:link('DevIconRake', 'DevIconRb')
" call s:link('DevIconRakefile', 'DevIconRb')
" call s:link('DevIconBrewfile', 'DevIconRb')
" call s:link('DevIconConfigRu', 'DevIconRb')

" License
" call s:color('DevIconLicense', { 'fg': s:light_yellow })

" Other
" call s:color('DevIconDsStore', { 'fg': s:light_gray })
" call s:color('DevIconPdf', { 'fg': s:light_red })

" call s:color('DevIconVim', { 'fg': s:green })
" call s:link('DevIconGvimrc', 'DevIconVim')
" call s:link('DevIconVimrc', 'DevIconVim')

"
" License "
" ---------------------------------------------------------------------
"
" Copyright (c) 2021 Andrew Kassen
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
