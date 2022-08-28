(use-package solidity-mode
  :defer t)

(use-package solidity-flycheck
  :after solidity-mode
  :defer t)

(use-package company-solidity
  :after solidity-mode
  :config
  (push 'company-solidity company-backends)
  :defer t)

(provide 'init-solidity)
