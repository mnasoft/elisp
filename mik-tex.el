
(setq Tex-auto-save t) ;I forget what these do, I've 
(setq TeX-parse-self t) ;always had them 
(require 'tex-mik) 
(load "auctex.el" nil t t) ;Now necessary with latest  
            ;version of AucTeX 
(setq org-export-with-LaTeX-fragments "dvipng") ;Now necessary with  
            ;orgmove version 7.4  
            ;or later 
