" Alternative 2 from the following link works for me:
" https://vi.stackexchange.com/questions/2306/html-syntax-folding-in-vim?utm_source=pocket_mylist
syntax region htmlFold start="<\z(p\|h\d\|i\?frame\|table\|colgroup\|thead\|tfoot\|tbody\|t[dhr]\|pre\|[diou]l\|li\|span\|div\|head\|script\|style\|blockquote\|form\)\%(\_s*\_[^/]\?>\|\_s\_[^>]*\_[^>/]>\)" end="</\z1\_s*>" fold transparent keepend extend containedin=htmlHead
