;;; ollama-buddy--preset__common-lisp.el --- Common Lisp role -*- lexical-binding: t; -*-

;;; Commentary:

;; Common Lisp role and command definitions for Ollama Buddy.
;;
;; This preset provides commands for explaining, debugging, reviewing,
;; refactoring and documenting Common Lisp code, writing tests, analysing
;; ASDF definitions and macros, and accessing project and RAG context.
;;
;; Loading this file replaces `ollama-buddy-command-definitions' with the
;; Common Lisp-oriented command set below.

;;; Code:

(require 'ollama-buddy)
(require 'ollama-buddy-project)
(require 'ollama-buddy-rag)

(defgroup my/ollama-buddy-common-lisp nil
  "Common Lisp configuration for Ollama Buddy."
  :group 'ollama-buddy
  :prefix "my/ollama-buddy-common-lisp-")

(defcustom my/ollama-buddy-common-lisp-system
  "You are an expert Common Lisp programmer.

Use ANSI Common Lisp unless implementation-specific code is explicitly
required.

Development environment:
- SBCL
- ASDF
- Quicklisp
- Emacs
- SLY

Guidelines:
- Prefer idiomatic Common Lisp.
- Prefer standard Common Lisp facilities when practical.
- Clearly identify SBCL-specific extensions.
- Do not confuse Common Lisp with Scheme, Clojure, Emacs Lisp or AutoLISP.
- Preserve package boundaries and ASDF system structure.
- Pay attention to symbols, packages, read-time dependencies and load order.
- When debugging, explain the cause before proposing a fix.
- When refactoring, preserve observable behaviour unless explicitly asked
  to change it.
- Do not invent functions, packages or library APIs.
- If information about an external library is missing, explicitly say so."
  "System prompt used by the Common Lisp Ollama Buddy role."
  :type 'string
  :group 'my/ollama-buddy-common-lisp)

(setq ollama-buddy-command-definitions
      `((open-chat
         :key ?o
         :description "Open chat"
         :group "General"
         :action ollama-buddy--open-chat)

        (switch-role
         :key ?R
         :description "Switch role"
         :group "General"
         :action ollama-buddy-roles-switch-role)

        (swap-model
         :key ?m
         :description "Switch model"
         :group "General"
         :action ollama-buddy--swap-model)

        (help
         :key ?h
         :description "Help"
         :group "General"
         :action ollama-buddy--menu-help-assistant)

        (explain-lisp
         :key ?e
         :description "Explain Common Lisp"
         :group "Analysis"
         :prompt "Explain the following Common Lisp code. Describe its purpose,
control flow, data structures, side effects, package dependencies and any
non-obvious Common Lisp idioms:"
         :system ,my/ollama-buddy-common-lisp-system
         :destination chat
         :action (lambda ()
                   (ollama-buddy--send-with-command 'explain-lisp)))

        (debug-lisp
         :key ?d
         :description "Debug Common Lisp"
         :group "Analysis"
         :prompt "Analyze the following Common Lisp code or error. Identify the
root cause first, then propose the smallest correct fix. Pay particular
attention to packages, symbols, lexical/dynamic bindings, macros, evaluation
order, type declarations and SBCL diagnostics:"
         :system ,my/ollama-buddy-common-lisp-system
         :destination chat
         :action (lambda ()
                   (ollama-buddy--send-with-command 'debug-lisp)))

        (review-lisp
         :key ?v
         :description "Review Common Lisp"
         :group "Analysis"
         :prompt "Review the following Common Lisp code. Look for correctness
problems, non-idiomatic constructs, unnecessary complexity, package issues,
portability problems and opportunities for simplification. Do not rewrite
the code unless needed to demonstrate a recommendation:"
         :system ,my/ollama-buddy-common-lisp-system
         :destination chat
         :action (lambda ()
                   (ollama-buddy--send-with-command 'review-lisp)))

        (refactor-lisp
         :key ?r
         :description "Refactor Common Lisp"
         :group "Editing"
         :prompt "Refactor the following Common Lisp code. Preserve behaviour.
Prefer idiomatic ANSI Common Lisp, clear names, simple control flow and
appropriate abstraction. Return only the replacement Common Lisp code:"
         :system ,my/ollama-buddy-common-lisp-system
         :parameters ((temperature . 0.2))
         :destination in-buffer
         :action (lambda ()
                   (ollama-buddy--send-with-command 'refactor-lisp)))

        (simplify-lisp
         :key ?s
         :description "Simplify Common Lisp"
         :group "Editing"
         :prompt "Simplify the following Common Lisp code without changing its
observable behaviour. Remove unnecessary complexity and prefer idiomatic
Common Lisp. Return only the replacement code:"
         :system ,my/ollama-buddy-common-lisp-system
         :parameters ((temperature . 0.2))
         :destination in-buffer
         :action (lambda ()
                   (ollama-buddy--send-with-command 'simplify-lisp)))

        (document-lisp
         :key ?c
         :description "Document Common Lisp"
         :group "Editing"
         :prompt "Add or improve Common Lisp documentation for the following
code. Prefer useful docstrings that describe semantics, arguments, return
values, side effects and important conditions. Avoid comments that merely
repeat the code. Return only the resulting code:"
         :system ,my/ollama-buddy-common-lisp-system
         :parameters ((temperature . 0.2))
         :destination in-buffer
         :action (lambda ()
                   (ollama-buddy--send-with-command 'document-lisp)))

        (write-tests
         :key ?t
         :description "Write tests"
         :group "Development"
         :prompt "Write tests for the following Common Lisp code. First infer
the public behaviour visible from the supplied code. Cover normal cases,
boundary conditions and meaningful failure cases. Do not assume a particular
testing framework unless it is evident from the context:"
         :system ,my/ollama-buddy-common-lisp-system
         :parameters ((temperature . 0.2))
         :destination chat
         :action (lambda ()
                   (ollama-buddy--send-with-command 'write-tests)))

        (analyze-asdf
         :key ?a
         :description "Analyze ASDF"
         :group "Development"
         :prompt "Analyze this ASDF/Common Lisp project definition. Check system
components, dependency relationships, package/load ordering and portability.
Explain potential ASDF problems and suggest concrete corrections:"
         :system ,my/ollama-buddy-common-lisp-system
         :destination chat
         :action (lambda ()
                   (ollama-buddy--send-with-command 'analyze-asdf)))

        (analyze-macro
         :key ?M
         :description "Analyze macro"
         :group "Development"
         :prompt "Analyze the following Common Lisp macro. Explain expansion
semantics, evaluation behaviour, hygiene concerns, multiple evaluation,
gensym usage and compile-time versus run-time effects. Identify any potential
macro-writing errors:"
         :system ,my/ollama-buddy-common-lisp-system
         :destination chat
         :action (lambda ()
                   (ollama-buddy--send-with-command 'analyze-macro)))

        (project
         :key ?P
         :description "Project"
         :group "Context"
         :action ollama-buddy-project-menu)

        (rag
         :key ?g
         :description "RAG"
         :group "Context"
         :action ollama-buddy-rag-menu)

        (open-roles-directory
         :key ?D
         :description "Roles directory"
         :group "Context"
         :action ollama-buddy-roles-open-directory)))

(provide 'ollama-buddy--preset__common-lisp)

;;; ollama-buddy--preset__common-lisp.el ends here
