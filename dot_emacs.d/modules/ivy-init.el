(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq ivy-height 25)
(setq ivy-count-format "(%d/%d) ")

(setq ivy-initializeinputs-alist nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order)))

(global-set-key (kbd "C-s") 'swiper)

(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
