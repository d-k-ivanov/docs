### TMUX
```bash
tmux list-sessions
tmux attach -t 2
sudo tmux -2 -S /tmp/tmux-<UID>/default
```

### TMUX cheat sheet
```
==========================================          ==========================================
             TMUX COMMAND                                        WINDOW (TAB)
==========================================          ==========================================

List    tmux ls                                     List         ^b w
New          -s <session>                           Create       ^b c
Attach       att -t <session>                       Rename       ^b , <name>
Rename       rename-session -t <old> <new>          Last         ^b l               (lower-L)
Kill         kill-session -t <session>              Close        ^b &

==========================================          Goto #       ^b <0-9>
             CONTROLS                               Next         ^b n
==========================================          Previous     ^b p
                                                    Choose       ^b w <name>
Detach       ^b d
List         ^b =                                   ==========================================
Buffer       ^b <PgUpDn>                                         PANE (SPLIT WINDOW)
Command      ^b : <command>                         ==========================================

Copy         ^b [ ... <space> ... <enter>           Show #       ^b q
 Moving         vim/emacs key bindings              Split Horiz  ^b "                --------
 Start          <space>                             Split Vert   ^b %                   |
 Copy           <enter>                             Pane->Window ^b !
Paste        ^b ]                                   Kill         ^b x

==========================================          Reorganize   ^b <space>
             SESSION (Set of Windows)               Expand       ^b <alt><arrow>
==========================================          Resize       ^b ^<arrow>
                                                    Resize x n   ^b <n> <arrow>
New          ^b :new     ^b :new -s <name>
Rename       ^b $                                   Select       ^b <arrow>
List         ^b s                                   Previous     ^b {
Next         ^b (                                   Next         ^b }
Previous     ^b )                                   Switch       ^b o                  other
                                                    Swap         ^b ^o
                                                    Last         ^b ;
```

