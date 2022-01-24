let g:airline#themes#sonwell#palette = {}

function! airline#themes#sonwell#refresh()
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Colors
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Base colors
  let s:base03  = {'t':  8, 'g': '#303030'}
  let s:base02  = {'t':  0, 'g': '#6c6c6c'}
  let s:base01  = {'t': 10, 'g': '#70c87d'}
  let s:base00  = {'t': 11, 'g': '#d6cf7e'}
  let s:base0   = {'t': 12, 'g': '#39a1df'}
  let s:base1   = {'t': 14, 'g': '#3cc4b1'}
  let s:base2   = {'t':  7, 'g': '#b9c1b9'}
  let s:base3   = {'t': 15, 'g': '#d2e5d7'}
  let s:yellow  = {'t':  3, 'g': '#b58900'}
  let s:orange  = {'t':  9, 'g': '#c34346'}
  let s:red     = {'t':  1, 'g': '#802426'}
  let s:magenta = {'t':  5, 'g': '#714e76'}
  let s:violet  = {'t': 13, 'g': '#714e76'}
  let s:blue    = {'t':  4, 'g': '#3986a3'}
  let s:cyan    = {'t':  6, 'g': '#4e7d78'}
  let s:green   = {'t':  2, 'g': '#5aa261'}

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Simple mappings
  " NOTE: These are easily tweakable mappings. The actual mappings get
  " the specific gui and terminal colors from the base color dicts.
  """"""""""""""""""""""""""""""""""""""""""""""""
  " Normal mode
  let s:N1 = [s:base3, s:cyan, 'bold']
  let s:N2 = [s:base3, s:base03, '']
  let s:N3 = [s:base03, s:base02, '']
  let s:NF = [s:orange, s:N3[1], '']
  let s:NW = [s:base3, s:orange, '']
  let s:NM = [s:cyan, s:N3[1], '']
  let s:NMi = [s:base3, s:N3[1], '']

  " Insert mode
  let s:I1 = [s:N1[0], s:yellow, 'bold']
  let s:I2 = s:N2
  let s:I3 = s:N3
  let s:IF = s:NF
  let s:IM = s:NM

  " Visual mode
  let s:V1 = [s:N1[0], s:magenta, 'bold']
  let s:V2 = s:N2
  let s:V3 = s:N3
  let s:VF = s:NF
  let s:VM = s:NM

  " Replace mode
  let s:R1 = [s:N1[0], s:red, '']
  let s:R2 = s:N2
  let s:R3 = s:N3
  let s:RM = s:NM
  let s:RF = s:NF

  " Inactive, according to VertSplit in sonwell
  let s:IA = [s:base02, s:base03, '']

  """"""""""""""""""""""""""""""""""""""""""""""""
  " Actual mappings
  " WARNING: Don't modify this section unless necessary.
  """"""""""""""""""""""""""""""""""""""""""""""""
  let s:NFa = [s:NF[0].g, s:NF[1].g, s:NF[0].t, s:NF[1].t, s:NF[2]]
  let s:IFa = [s:IF[0].g, s:IF[1].g, s:IF[0].t, s:IF[1].t, s:IF[2]]
  let s:VFa = [s:VF[0].g, s:VF[1].g, s:VF[0].t, s:VF[1].t, s:VF[2]]
  let s:RFa = [s:RF[0].g, s:RF[1].g, s:RF[0].t, s:RF[1].t, s:RF[2]]

  let g:airline#themes#sonwell#palette.accents = {
        \ 'red': s:NFa,
        \ }

  let g:airline#themes#sonwell#palette.inactive = airline#themes#generate_color_map(
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]],
        \ [s:IA[0].g, s:IA[1].g, s:IA[0].t, s:IA[1].t, s:IA[2]])
  let g:airline#themes#sonwell#palette.inactive_modified = {
        \ 'airline_c': [s:NMi[0].g, '', s:NMi[0].t, '', s:NMi[2]]}

  let g:airline#themes#sonwell#palette.normal = airline#themes#generate_color_map(
        \ [s:N1[0].g, s:N1[1].g, s:N1[0].t, s:N1[1].t, s:N1[2]],
        \ [s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]],
        \ [s:N3[0].g, s:N3[1].g, s:N3[0].t, s:N3[1].t, s:N3[2]])

  let g:airline#themes#sonwell#palette.normal.airline_warning = [
        \ s:NW[0].g, s:NW[1].g, s:NW[0].t, s:NW[1].t, s:NW[2]]

  let g:airline#themes#sonwell#palette.normal_modified = {
        \ 'airline_c': [s:NM[0].g, s:NM[1].g,
        \ s:NM[0].t, s:NM[1].t, s:NM[2]]}

  let g:airline#themes#sonwell#palette.normal_modified.airline_warning =
        \ g:airline#themes#sonwell#palette.normal.airline_warning

  let g:airline#themes#sonwell#palette.insert = airline#themes#generate_color_map(
        \ [s:I1[0].g, s:I1[1].g, s:I1[0].t, s:I1[1].t, s:I1[2]],
        \ [s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]],
        \ [s:I3[0].g, s:I3[1].g, s:I3[0].t, s:I3[1].t, s:I3[2]])

  let g:airline#themes#sonwell#palette.insert.airline_warning =
        \ g:airline#themes#sonwell#palette.normal.airline_warning

  let g:airline#themes#sonwell#palette.insert_modified = {
        \ 'airline_c': [s:IM[0].g, s:IM[1].g,
        \ s:IM[0].t, s:IM[1].t, s:IM[2]]}

  let g:airline#themes#sonwell#palette.insert_modified.airline_warning =
        \ g:airline#themes#sonwell#palette.normal.airline_warning

  let g:airline#themes#sonwell#palette.visual = airline#themes#generate_color_map(
        \ [s:V1[0].g, s:V1[1].g, s:V1[0].t, s:V1[1].t, s:V1[2]],
        \ [s:V2[0].g, s:V2[1].g, s:V2[0].t, s:V2[1].t, s:V2[2]],
        \ [s:V3[0].g, s:V3[1].g, s:V3[0].t, s:V3[1].t, s:V3[2]])

  let g:airline#themes#sonwell#palette.visual.airline_warning =
        \ g:airline#themes#sonwell#palette.normal.airline_warning

  let g:airline#themes#sonwell#palette.visual_modified = {
        \ 'airline_c': [s:VM[0].g, s:VM[1].g,
        \ s:VM[0].t, s:VM[1].t, s:VM[2]]}

  let g:airline#themes#sonwell#palette.visual_modified.airline_warning =
        \ g:airline#themes#sonwell#palette.normal.airline_warning

  let g:airline#themes#sonwell#palette.replace = airline#themes#generate_color_map(
        \ [s:R1[0].g, s:R1[1].g, s:R1[0].t, s:R1[1].t, s:R1[2]],
        \ [s:R2[0].g, s:R2[1].g, s:R2[0].t, s:R2[1].t, s:R2[2]],
        \ [s:R3[0].g, s:R3[1].g, s:R3[0].t, s:R3[1].t, s:R3[2]])

  let g:airline#themes#sonwell#palette.replace.airline_warning =
        \ g:airline#themes#sonwell#palette.normal.airline_warning

  let g:airline#themes#sonwell#palette.replace_modified = {
        \ 'airline_c': [s:RM[0].g, s:RM[1].g,
        \ s:RM[0].t, s:RM[1].t, s:RM[2]]}

  let g:airline#themes#sonwell#palette.replace_modified.airline_warning =
        \ g:airline#themes#sonwell#palette.normal.airline_warning

  let g:airline#themes#sonwell#palette.tabline = {}

  let g:airline#themes#sonwell#palette.tabline.airline_tab = [
        \ s:I2[0].g, s:I2[1].g, s:I2[0].t, s:I2[1].t, s:I2[2]]

  let g:airline#themes#sonwell#palette.tabline.airline_tabtype = [
        \ s:N2[0].g, s:N2[1].g, s:N2[0].t, s:N2[1].t, s:N2[2]]
endfunction

call airline#themes#sonwell#refresh()

