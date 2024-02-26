" Name:       hos-wal.vim
" Version:    0.1.0
" Maintainer: github.com/hossein-lap
" License:    The MIT License (MIT)
"
" A minimal string colorscheme for Vim.
"
" Forked from sunbather:
" https://github.com/nikolvs/vim-sunbather
"
"""
hi clear

if exists('syntax on')
	  syntax reset
endif

let g:colors_name='vim-wal'
let s:background = &background

" color handler {{{

if filereadable(expand("~/.cache/wal/colors-wal.vim"))    
	source ~/.cache/wal/colors-wal.vim
	let s:wal_background = { "gui": background , "cterm": "black"  }
	let s:wal_foreground = { "gui": foreground , "cterm": "white" }

	let s:wal_color0     = { "gui": color0     , "cterm": "0"   }
	let s:wal_color1     = { "gui": color1     , "cterm": "1"   }
	let s:wal_color2     = { "gui": color2     , "cterm": "2"   }
	let s:wal_color3     = { "gui": color3     , "cterm": "3"   }
	let s:wal_color4     = { "gui": color4     , "cterm": "4"   }
	let s:wal_color5     = { "gui": color5     , "cterm": "5"   }
	let s:wal_color6     = { "gui": color6     , "cterm": "6"   }
	let s:wal_color7     = { "gui": color7     , "cterm": "7"   }
	let s:wal_color8     = { "gui": color8     , "cterm": "8"   }
	let s:wal_color9     = { "gui": color9     , "cterm": "9"   }
	let s:wal_color10    = { "gui": color10    , "cterm": "10"  }
	let s:wal_color11    = { "gui": color11    , "cterm": "11"  }
	let s:wal_color12    = { "gui": color12    , "cterm": "12"  }
	let s:wal_color13    = { "gui": color13    , "cterm": "13"  }
	let s:wal_color14    = { "gui": color14    , "cterm": "14"  }
	let s:wal_color15    = { "gui": color15    , "cterm": "15"  }
else
	let s:wal_background    = { "gui": "#000000", "cterm": "232"  }
	let s:wal_foreground    = { "gui": "#ffffff", "cterm": "231"  }
	let s:wal_color0 = { "gui": "#989898", "cterm": "248"  }
	let s:wal_color1     = { "gui": "#0077ff", "cterm": "153"  }
	let s:wal_color2   = { "gui": "#0022cc", "cterm": "12"   }
	let s:wal_color3  = { "gui": "#009900", "cterm": "34"   }
	let s:wal_color4    = { "gui": "#da5000", "cterm": "166"  }
	let s:wal_color5    = { "gui": "#d70000", "cterm": "160"  }
	let s:wal_color6    = { "gui": "#fff800", "cterm": "11"   }
	let s:wal_color7  = { "gui": "#33cc33", "cterm": "76"   }
	let s:wal_color8     = { "gui": "#967fc4", "cterm": "140"  }
	let s:wal_color9      = { "gui": "#af0000", "cterm": "124"  }
	let s:wal_color10   = { "gui": "#af0000", "cterm": "124"  }
	let s:wal_color11  = { "gui": "#ff5f87", "cterm": "204"  }
	let s:wal_color12    = { "gui": "#d70000", "cterm": "160"  }
	let s:wal_color13  = { "gui": "#8e44ad", "cterm": "140"  }
	let s:wal_color14  = { "gui": "#33cc33", "cterm": "76"   }
	let s:wal_color15   = { "gui": "#ff00aa", "cterm": "204"  }
endif

let s:alpha           = { "gui": "NONE",    "cterm": "NONE" }

let s:bg              = s:wal_background
let s:fg              = s:wal_foreground
let s:line            = s:wal_color11
let s:match           = s:wal_color0
let s:cf              = s:wal_color14
let s:cb              = s:wal_color8

let s:comment         = s:wal_color8
let s:keyword         = s:wal_color5
let s:statement       = s:wal_color6
let s:specialchar     = s:wal_color2
let s:error           = s:wal_color1
let s:warning         = s:wal_color9
let s:bool            = s:wal_color3
let s:function        = s:wal_color4
let s:string          = s:wal_color10
let s:condition       = s:wal_color13
let s:nontext         = s:wal_color8
" }}}

" toggle bold, italics, underline {{{
let g:fontfaces = 0

if g:fontfaces == 1
	  let s:thebold = 'bold'
	  let s:theitalic = 'italic'
	  let s:theurl = 'underline'
else
	  let s:thebold = 'none'
	  let s:theitalic = 'none'
	  let s:theurl = 'none'
endif
" }}}

let s:active = s:condition
let s:dark_active = s:condition
let s:light_active = s:condition
let s:visual = s:active

" https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
	execute "highlight" a:group
	  \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
	  \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
	  \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
	  \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
	  \ "ctermfg=" (has_key(a:style, "fg")    ? a:style.fg.cterm : "NONE")
	  \ "ctermbg=" (has_key(a:style, "bg")    ? a:style.bg.cterm : "NONE")
	  \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

call s:h("Normal",        {"bg": s:bg, "fg": s:cf})
call s:h("PlainNormal",   {"bg": s:alpha, "fg": s:cf})

" restore &background's value in case changing Normal changed &background (:help :hi-normal-cterm)
if &background != s:background
	 execute "set background=" . s:background
endif

call s:h("Cursor",      {"bg": s:active, "fg": s:cf })
call s:h("Comment",     {"fg": s:comment, "gui": s:theitalic, "cterm": s:theitalic})

call s:h("String",     {"fg": s:string})
call s:h("Boolean",    {"fg": s:bool})
call s:h("Number",     {"fg": s:cf})
hi! link Float           Number
call s:h("Constant",   {"fg": s:bool})
hi! link Character       Constant
"hi! link Boolean          Constant
"hi! link Number           Constant
"hi! link String           Constant

call s:h("Identifier",  {"fg": s:function})
call s:h("Function",    {"fg": s:function})
"hi! link Identifier       PlainNormal
"
"hi! link Function         Identifier

call s:h("Statement",   {"fg": s:statement})
call s:h("Conditonal",  {"fg": s:condition})
call s:h("Keyword",     {"fg": s:keyword})
call s:h("Repeat",      {"fg": s:condition})
"hi! link Conditonal       Statement
"hi! link Keyword          Statement
"hi! link Repeat           Statement
hi! link Label            Statement
hi! link Exception        Statement

call s:h("Operator",    {"fg": s:cf, "cterm": s:thebold, "gui": s:thebold})

call s:h("PreProc",     {"fg": s:keyword})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Type",        {"fg": s:statement})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

"hi! link SpecialChar      Special
call s:h("Special",     {"fg": s:condition, "gui": s:theitalic})
call s:h("SpecialChar", {"fg": s:specialchar, "gui": s:theitalic})
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:cf, "gui": s:theurl, "cterm": s:theurl})
call s:h("Ignore",        {"fg": s:cb})
call s:h("Todo",          {"fg": s:active, "gui": s:theurl, "cterm": s:theurl})
call s:h("SpecialKey",    {"fg": s:cb})
call s:h("NonText",       {"fg": s:nontext})
call s:h("Directory",     {"fg": s:cb})
call s:h("Error",         {"fg": s:fg, "bg": s:error, "cterm": s:thebold})
call s:h("ErrorMsg",      {"fg": s:error})
call s:h("IncSearch",     {"bg": s:line, "fg": s:match})
call s:h("Search",        {"bg": s:line, "fg": s:match})
call s:h("MoreMsg",       {"fg": s:cb, "cterm": s:thebold, "gui": s:thebold})
hi! link ModeMsg MoreMsg
call s:h("LineNr",        {"fg": s:line})
call s:h("CursorLineNr",  {"fg": s:active, "bg": s:match})
call s:h("Question",      {"fg": s:dark_active})
call s:h("StatusLine",    {"bg": s:match})
call s:h("StatusLineNC",  {"bg": s:match, "fg": s:cb})
call s:h("VertSplit",     {"bg": s:match, "fg": s:cf})
call s:h("Title",         {"fg": s:fg})
call s:h("Visual",        {"fg": s:match, "bg": s:visual})
call s:h("VisualNOS",     {"bg": s:line})
call s:h("WarningMsg",    {"fg": s:warning})
call s:h("WildMenu",      {"fg": s:match, "bg": s:cb})
call s:h("Folded",        {"fg": s:cb})
call s:h("FoldColumn",    {"fg": s:line})
call s:h("DiffAdd",       {"fg": s:specialchar})
call s:h("DiffDelete",    {"fg": s:error})
call s:h("DiffChange",    {"fg": s:function})
call s:h("DiffText",      {"fg": s:bool})
call s:h("SignColumn",    {"fg": s:specialchar})


if has("gui_running")
	call s:h("SpellBad",    {"gui": "italic", "cterm": "italic", "sp": s:comment})
	call s:h("SpellCap",    {"gui": "italic", "cterm": "italic", "sp": s:comment})
	call s:h("SpellRare",   {"gui": "italic", "cterm": "italic", "sp": s:comment})
	call s:h("SpellLocal",  {"gui": "italic", "cterm": "italic", "sp": s:comment})
else
	call s:h("SpellBad",    {"gui": "italic", "cterm": "italic", "fg": s:comment})
	call s:h("SpellCap",    {"gui": "italic", "cterm": "italic", "fg": s:comment})
	call s:h("SpellRare",   {"gui": "italic", "cterm": "italic", "fg": s:comment})
	call s:h("SpellLocal",  {"gui": "italic", "cterm": "italic", "fg": s:comment})
endif

call s:h("Pmenu",         {"fg": s:line, "bg": s:match})
call s:h("PmenuSel",      {"fg": s:match,   "bg": s:line})
call s:h("PmenuSbar",     {"fg": s:line, "bg": s:match})
call s:h("PmenuThumb",    {"fg": s:line, "bg": s:match})
call s:h("TabLine",       {"fg": s:cf, "bg": s:match})
call s:h("TabLineSel",    {"fg": s:cb,   "bg": s:active, "gui": s:thebold, "cterm": s:thebold})
call s:h("TabLineFill",   {"fg": s:cf, "bg": s:match})
call s:h("CursorColumn",  {"bg": s:match})
call s:h("CursorLine",    {"bg": s:match})
call s:h("ColorColumn",   {"bg": s:match, "fg": s:line})

call s:h("MatchParen",    {"bg": s:line, "fg": s:match})
call s:h("qfLineNr",      {"fg": s:cb})

call s:h("htmlH1",        {"bg": s:match, "fg": s:cf})
call s:h("htmlH2",        {"bg": s:match, "fg": s:cf})
call s:h("htmlH3",        {"bg": s:match, "fg": s:cf})
call s:h("htmlH4",        {"bg": s:match, "fg": s:cf})
call s:h("htmlH5",        {"bg": s:match, "fg": s:cf})
call s:h("htmlH6",        {"bg": s:match, "fg": s:cf})

" Syntastic
call s:h("SyntasticWarningSign", {"fg": s:warning})
call s:h("SyntasticWarning",     {"bg": s:warning, "fg": s:cb, "gui": s:thebold, "cterm": s:thebold})
call s:h("SyntasticErrorSign",   {"fg": s:error})
call s:h("SyntasticError",       {"bg": s:error, "fg": s:fg, "gui": s:thebold, "cterm": s:thebold})

" which-key.nvim
call s:h("WhichKey",          {"bg": s:cb, "fg": s:active, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeyDesc",      {"bg": s:cb, "fg": s:cb, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeySeparator", {"bg": s:cb, "fg": s:cf, "gui": s:thebold, "cterm": s:thebold})
call s:h("WhichKeyFloat",     {"bg": s:cb})
hi link WhichKeyGroup WhichKey

" Neomake
hi link NeomakeWarningSign	SyntasticWarningSign
hi link NeomakeErrorSign	SyntasticErrorSign

" ALE
hi link ALEWarningSign	SyntasticWarningSign
hi link ALEErrorSign	SyntasticErrorSign

" Signify, git-gutter
hi link SignifySignAdd              DiffAdd
hi link SignifySignDelete           DiffDelete
hi link SignifySignChange           DiffChange
hi link GitGutterAdd                DiffAdd
hi link GitGutterDelete             DiffDelete
hi link GitGutterChange             DiffChange
hi link GitGutterChangeDelete       DiffText
