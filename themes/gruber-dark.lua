-- gruber-dark.lua — vis colour theme
-- Gruber Darker palette (rexim/gruber-darker-theme), retuned for OLED.
-- Install: ~/.config/vis/themes/gruber-dark.lua
-- Use:     set theme gruber-dark

local lexers = vis.lexers

local c = {
	-- #000000 hits vis's zero-slot sentinel; #101010 stays OLED-friendly and readable
	bg         = '#101010',
	bg1        = '#181818',
	bg2        = '#201d1e',
	bg3        = '#3a3238',
	bg4        = '#746d71',
	cursorline = '#181516',
	whitespace = '#3a3437',
	eof        = '#544c50',
	fg         = '#e4e4ef',
	fg1        = '#f4f4ff',
	red        = '#f43841',
	red2       = '#ff4f58',
	redbg      = '#422326',
	green      = '#73c936',
	yellow     = '#ffdd33',
	brown      = '#cc8c3c',
	quartz     = '#95a99f',
	niagara    = '#96a6c8',
	wisteria   = '#9e95c7',
}

lexers.colors = c

lexers.STYLE_DEFAULT      = 'fore:' .. c.fg .. ',back:' .. c.bg
lexers.STYLE_NOTHING      = ''
lexers.STYLE_ATTRIBUTE    = 'fore:' .. c.quartz
lexers.STYLE_CLASS        = 'fore:' .. c.quartz
lexers.STYLE_COMMENT      = 'fore:' .. c.brown
lexers.STYLE_CONSTANT     = 'fore:' .. c.wisteria
lexers.STYLE_DEFINITION   = 'fore:' .. c.niagara
lexers.STYLE_ERROR        = 'fore:' .. c.red2 .. ',bold'
lexers.STYLE_FUNCTION     = 'fore:' .. c.niagara
lexers.STYLE_HEADING      = 'fore:' .. c.quartz .. ',bold'
lexers.STYLE_KEYWORD      = 'fore:' .. c.yellow .. ',bold'
lexers.STYLE_LABEL        = 'fore:' .. c.niagara
lexers.STYLE_NUMBER       = 'fore:' .. c.wisteria
lexers.STYLE_OPERATOR     = 'fore:' .. c.fg
lexers.STYLE_REGEX        = 'fore:' .. c.green
lexers.STYLE_STRING       = 'fore:' .. c.green
lexers.STYLE_PREPROCESSOR = 'fore:' .. c.quartz
lexers.STYLE_TAG          = 'fore:' .. c.niagara
lexers.STYLE_TYPE         = 'fore:' .. c.quartz
lexers.STYLE_VARIABLE     = 'fore:' .. c.fg1
lexers.STYLE_WHITESPACE   = 'fore:' .. c.whitespace
lexers.STYLE_EMBEDDED     = 'fore:' .. c.green .. ',back:' .. c.cursorline
lexers.STYLE_IDENTIFIER   = 'fore:' .. c.fg

lexers.STYLE_FUNCTION_BUILTIN = 'fore:' .. c.yellow
lexers.STYLE_CONSTANT_BUILTIN = 'fore:' .. c.wisteria
lexers.STYLE_VARIABLE_BUILTIN = 'fore:' .. c.fg1
lexers.STYLE_FUNCTION_METHOD  = lexers.STYLE_FUNCTION
lexers.STYLE_ANNOTATION       = 'fore:' .. c.quartz

lexers.STYLE_LINENUMBER        = 'fore:' .. c.bg4 .. ',back:' .. c.bg
lexers.STYLE_LINENUMBER_CURSOR = 'fore:' .. c.yellow .. ',back:' .. c.bg .. ',bold'
lexers.STYLE_CURSOR            = 'fore:' .. c.bg .. ',back:' .. c.quartz
lexers.STYLE_CURSOR_PRIMARY    = 'fore:' .. c.bg .. ',back:' .. c.yellow
lexers.STYLE_CURSOR_LINE       = 'back:' .. c.cursorline .. ',keep_attribute'
lexers.STYLE_COLOR_COLUMN      = 'back:' .. c.bg2
lexers.STYLE_SELECTION         = 'back:' .. c.bg3 .. ',keep_attribute'
lexers.STYLE_STATUS            = 'fore:' .. c.quartz .. ',back:' .. c.bg1
lexers.STYLE_STATUS_FOCUSED    = 'fore:' .. c.fg1 .. ',back:' .. c.bg2 .. ',bold'
lexers.STYLE_SEPARATOR         = 'fore:' .. c.bg3 .. ',back:' .. c.bg1
lexers.STYLE_INFO              = 'fore:' .. c.fg .. ',back:' .. c.bg2
lexers.STYLE_EOF               = 'fore:' .. c.eof

-- lexer specific styles

-- Diff
lexers.STYLE_ADDITION = 'fore:' .. c.green
lexers.STYLE_DELETION = 'fore:' .. c.red2
lexers.STYLE_CHANGE   = 'fore:' .. c.yellow

-- CSS
lexers.STYLE_PROPERTY       = lexers.STYLE_ATTRIBUTE
lexers.STYLE_PSEUDOCLASS    = ''
lexers.STYLE_PSEUDOELEMENT  = ''

-- HTML
lexers.STYLE_TAG_UNKNOWN       = lexers.STYLE_TAG .. ',italics'
lexers.STYLE_TAG_SINGLE        = lexers.STYLE_TAG
lexers.STYLE_TAG_DOCTYPE       = lexers.STYLE_TAG .. ',bold'
lexers.STYLE_ATTRIBUTE_UNKNOWN = lexers.STYLE_ATTRIBUTE .. ',italics'

-- LaTeX, TeX and Texinfo
lexers.STYLE_COMMAND           = lexers.STYLE_KEYWORD
lexers.STYLE_COMMAND_SECTION   = lexers.STYLE_CLASS
lexers.STYLE_ENVIRONMENT       = lexers.STYLE_TYPE
lexers.STYLE_ENVIRONMENT_MATH  = lexers.STYLE_NUMBER

-- Makefile
lexers.STYLE_TARGET = ''

-- Markdown
lexers.STYLE_HR = ''
for i = 1, 6 do lexers['STYLE_HEADING_H' .. i] = lexers.STYLE_HEADING end
lexers.STYLE_BOLD      = 'bold'
lexers.STYLE_ITALIC    = 'italics'
lexers.STYLE_LIST      = lexers.STYLE_KEYWORD
lexers.STYLE_LINK      = 'fore:' .. c.niagara .. ',underlined'
lexers.STYLE_REFERENCE = lexers.STYLE_KEYWORD
lexers.STYLE_CODE      = lexers.STYLE_EMBEDDED

-- Output
lexers.STYLE_FILENAME = ''
lexers.STYLE_LINE     = ''
lexers.STYLE_COLUMN   = ''
lexers.STYLE_MESSAGE  = ''

-- Python
lexers.STYLE_KEYWORD_SOFT = ''

-- Taskpaper
lexers.STYLE_NOTE          = ''
lexers.STYLE_TAG_EXTENDED  = ''
lexers.STYLE_TAG_DAY       = 'fore:' .. c.yellow
lexers.STYLE_TAG_OVERDUE   = 'fore:' .. c.red
lexers.STYLE_TAG_PLAIN     = ''

-- XML
lexers.STYLE_CDATA = ''

-- YAML
lexers.STYLE_ERROR_INDENT = 'back:' .. c.redbg

-- The following are temporary styles until their legacy lexers are migrated.

-- Antlr
lexers.STYLE_ACTION = ''

-- Clojure
lexers.STYLE_CLOJURE_KEYWORD = lexers.STYLE_TYPE
lexers.STYLE_CLOJURE_SYMBOL  = lexers.STYLE_TYPE .. ',bold'

-- Gleam
lexers.STYLE_MODULE  = lexers.STYLE_CONSTANT
lexers.STYLE_DISCARD = lexers.STYLE_COMMENT

-- Icon
lexers.STYLE_SPECIAL_KEYWORD = lexers.STYLE_TYPE

-- jq
lexers.STYLE_FORMAT = lexers.STYLE_CONSTANT
lexers.STYLE_SYSVAR = lexers.STYLE_CONSTANT .. ',bold'

-- Julia
lexers.STYLE_CHARACTER = lexers.STYLE_CONSTANT

-- Mediawiki
lexers.STYLE_BEHAVIOR_SWITCH = lexers.STYLE_KEYWORD

-- Moonscript
lexers.STYLE_TBL_KEY      = lexers.STYLE_REGEX
lexers.STYLE_SELF_REF     = lexers.STYLE_LABEL
lexers.STYLE_PROPER_IDENT = lexers.STYLE_CLASS
lexers.STYLE_FNDEF        = lexers.STYLE_PREPROCESSOR

-- reST
lexers.STYLE_LITERAL_BLOCK    = lexers.STYLE_EMBEDDED
lexers.STYLE_FOOTNOTE_BLOCK   = lexers.STYLE_LABEL
lexers.STYLE_CITATION_BLOCK   = lexers.STYLE_LABEL
lexers.STYLE_LINK_BLOCK       = lexers.STYLE_LABEL
lexers.STYLE_CODE_BLOCK       = lexers.STYLE_CODE
lexers.STYLE_DIRECTIVE        = lexers.STYLE_KEYWORD
lexers.STYLE_SPHINX_DIRECTIVE = lexers.STYLE_KEYWORD
lexers.STYLE_UNKNOWN_DIRECTIVE = lexers.STYLE_KEYWORD
lexers.STYLE_SUBSTITUTION     = lexers.STYLE_VARIABLE
lexers.STYLE_INLINE_LITERAL   = lexers.STYLE_EMBEDDED
lexers.STYLE_ROLE             = lexers.STYLE_CLASS
lexers.STYLE_INTERPRETED      = lexers.STYLE_STRING

-- txt2tags
lexers.STYLE_LINE = 'bold'
for i = 1, 5 do lexers['STYLE_H' .. i] = lexers.STYLE_HEADING end
lexers.STYLE_IMAGE              = 'fore:' .. c.green
lexers.STYLE_STRIKE             = 'italics'
lexers.STYLE_TAGGED             = lexers.STYLE_EMBEDDED
lexers.STYLE_TAGGED_AREA        = lexers.STYLE_EMBEDDED
lexers.STYLE_TABLE_SEP          = 'fore:' .. c.green
lexers.STYLE_HEADER_CELL_CONTENT = 'fore:' .. c.green
