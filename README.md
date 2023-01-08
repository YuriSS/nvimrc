# Nvim settings

My vimrc preferences

# Keymaps

My keymaps for reference. The leader key is configured to be SPACE


## Resize

| Keymap  | Command                 | Description                                  |
|---------|:-----------------------:|:--------------------------------------------:|
| C-Up    | :resize -2<CR>          | Command to resize a panel in up direction    |
| C-Down  | :resize +2<CR>          | Command to resize a panel in down direction  |
| C-Left  | :vertical resize -2<CR> | Command to resize a panel in left direction  |
| C-Right | :vertical resize +2<CR> | Command to resize a panel in right direction |

## Navigation

- leader pv   vim.cmd.Ex        Command to open directory tree
- S-l         :bnext<CR>        Go to next buffer
- S-h         :bprevious<CR>    Go to previous buffer

## Selection

- <    <gv   Move selected lines foward without loose selection
- \>    \>gv   Move selected lines backward without loose selection

## Plugin

- leader py    <Plug>(Prettier)    Execute prettier

## Make a note

To create a note without leaving vim. Tmux installed is needed. It create one file note per day.
It use a script created inside bin folder. Put the notetaker script as executable and move to a PATH directory
[TODO]
  * set a env variable to configure save files path directory 
  * menu to choose a note file

- leader N    :!notetaker<Enter>       Create a note
- leader n    notes.take_note          Create a note adding the current file path, line and column
- leader rn   notes.read_last_note     Open notes file

## Marks buffer

To mark a buffer and jump to it by pressing a key. It is configured to have 4 marks.

- leader mm    marks.mark_file                 Mark current buffer on next free slot
- leader mr    marks.remove_current_file       Remove current buffer as marked file
- leader ma    marks.mark_file(1)              Mark current buffer on mark 1
- leader ms    marks.mark_file(2)              Mark current buffer on mark 2
- leader md    marks.mark_file(3)              Mark current buffer on mark 3
- leader mf    marks.mark_file(4)              Mark current buffer on mark 4
- leader a     marks.jump_to_marked_file(1)    Jump to mark 1
- leader s     marks.jump_to_marked_file(2)    Jump to mark 2
- leader d     marks.jump_to_marked_file(3)    Jump to mark 3
- leader f     marks.jump_to_marked_file(4)    Jump to mark 4
