(defun translate-region (dest-lang)
  "Translates nearest-killed ring"
 (insert (shell-command-to-string
	  (concat "translate --dest " dest-lang " \"" (current-kill 0) "\"")
  )
  )
 (message (concat "Translated to \"" dest-lang "\"."))
 )


;; creates a macro for generation translation functions
(defmacro translate-to (dest-lang)
(list 'defun
      (intern
	     (concat "translate-to-" dest-lang)) () 
	     (list (intern "interactive"))
	     (list (intern "translate-region") dest-lang)
	     )
)

;; languages
(translate-to "de")
(translate-to "ja")
(translate-to "en")
(translate-to "zh-tw")

;; keybindings
(global-set-key "\C-ct" 'translate-to-zh-tw)
(global-set-key "\C-ce" 'translate-to-en)
(global-set-key "\C-cj" 'translate-to-ja)
(global-set-key "\C-cd" 'translate-to-de)
