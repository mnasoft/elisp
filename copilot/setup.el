
(list
 (locate-library "copilot")
 (locate-library "copilot-chat")
 (locate-library "copilot-chat-model")
 (locate-library "copilot-chat-backend"))
("c:/msys64/home/mnaso/.emacs.d/elpa/copilot-20261010.649/copilot.elc" "c:/msys64/home/mnaso/.emacs.d/elpa/copilot-chat-20260401.836/copilot-chat.elc" "c:/msys64/home/mnaso/.emacs.d/elpa/copilot-chat-20260401.836/copilot-chat-model.elc" "c:/msys64/home/mnaso/.emacs.d/elpa/copilot-chat-20260401.836/copilot-chat-backend.elc")

(require 'copilot-chat-backend)
(require 'copilot-chat)
(require 'copilot)

(list
 (featurep 'copilot-chat-backend)
 (boundp 'copilot-chat-backend)
 (and (boundp 'copilot-chat-backend)
      copilot-chat-backend))

(t t curl)

(symbol-file 'copilot-chat-set-model)

(copilot-chat--get-model-choices-with-wait)

(("[Anthropic] Claude Haiku 4.5   (Tokens in/out: 128k/ 32k)" . "claude-haiku-4.5")
 ("[Anthropic] Claude Sonnet 4.6  (Tokens in/out: 200k/ 64k)" . "claude-sonnet-4.6")
 ("[OpenAI   ] GPT-5.3-Codex      (Tokens in/out: 272k/128k)" . "gpt-5.3-codex")
 ("[Microsoft] MAI-Code-1.1-Flash (Tokens in/out: 128k/128k)" . "mai-code-1.1-flash"))

(copilot-chat-set-model "gpt-5.3-codex")
