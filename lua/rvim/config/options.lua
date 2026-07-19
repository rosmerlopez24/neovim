-- Establecer las teclas lideres antes de cargar plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Soporte para iconos si la terminal cuenta con Nerd Font
vim.g.have_nerd_font = true

-- [[ Opciones de Configuracion ]]
-- Consulta ':help option-list' para mas detalles

vim.opt.autowrite = true -- Guarda automaticamente al cambiar de bufer
vim.opt.breakindent = true -- Mantiene la indentacion visual en lineas envueltas
vim.opt.conceallevel = 2 -- Oculta sintaxis markup (ej. Markdown) de forma limpia
vim.opt.confirm = true -- Pide confirmacion antes de salir con cambios sin guardar
vim.opt.cursorline = true -- Resalta visualmente la linea del cursor

-- Gestion de Tabuladores y Espacios
vim.opt.expandtab = true -- Transforma tabulaciones en espacios
vim.opt.shiftround = true -- Redondea la indentacion a multiplos de 'shiftwidth'
vim.opt.shiftwidth = 2 -- Tamano de la sangria por paso
vim.opt.tabstop = 2 -- Espacios que representa un tabulador en el archivo

-- Comportamiento de Busqueda
vim.opt.ignorecase = true -- Ignora mayusculas al buscar
vim.opt.smartcase = true -- Respeta mayusculas si se introducen explicitamente
vim.opt.inccommand = "split" -- Muestra previsualizacion incremental en ventana dividida

-- Interfaz y Ventanas
vim.opt.shortmess:append("I") -- Ocultar el mensaje de bienvenida de Neovim al arrancar
vim.opt.laststatus = 0 -- Barra de estado global unificada
vim.opt.list = true -- Muestra caracteres invisibles configurados
vim.opt.mouse = "" -- Mantiene el raton desactivado (linea original)
vim.opt.number = true -- Activa numeros de linea
vim.opt.ruler = false -- Desactiva la regla nativa antigua en la esquina
vim.opt.showmode = false -- Oculta modo nativo (asume uso de plugin de statusline)
vim.opt.signcolumn = "yes" -- Mantiene la columna de signos fija para evitar parpadeos
vim.opt.splitbelow = true -- Los nuevos splits horizontales van abajo
vim.opt.splitright = true -- Los nuevos splits verticales van a la derecha
vim.opt.splitkeep = "screen" -- Minimiza el scroll al realizar splits

-- Desplazamiento (Scrolling)
vim.opt.scrolloff = 4 -- Lineas minimas de margen vertical al hacer scroll
vim.opt.sidescrolloff = 4 -- Columnas minimas de margen horizontal al hacer scroll

-- Limites y Tiempos de Respuesta
vim.opt.timeoutlen = 300 -- Tiempo de espera para secuencias de mapeo (ms)
vim.opt.updatetime = 250 -- Tiempo de inactividad para disparar eventos (ms)
vim.opt.virtualedit = "block" -- Permite mover el cursor donde no hay texto en Modo Visual Bloque
vim.opt.wildmode = "longest:full,full" -- Comportamiento del menu de completado de comandos

-- Ajuste de Linea (Corregido el conflicto previo)
vim.opt.wrap = false -- Desactiva el ajuste de linea visual
vim.opt.linebreak = true -- Corta las lineas respetando palabras enteras

-- Rendimiento y Respaldos
vim.opt.shadafile = "NONE" -- Deshabilita shadafile
vim.opt.swapfile = false -- Evita la creacion de archivos de intercambio (.swp)

-- Sincronizacion diferida del portapapeles para optimizar el tiempo de arranque
-- stylua: ignore start
vim.schedule(function() vim.opt.clipboard = "unnamedplus" end)
-- stylua: ignore end

-- Previene que los estilos recomendados de Markdown fuercen sangrias de 4 espacios
vim.g.markdown_recommended_style = 0
