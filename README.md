# base64.nvim

## Installation

Call `require("base64").setup()` after installing via one of the following methods (or use your other, favorite package manager)

### lazy.nvim

```lua
{'paytonward6/base64.nvim'},
```

### Packer
```lua
use {'paytonward6/base64.nvim'},
```

### Plug
```lua
Plug 'paytonward6/base64.nvim',
```

## Usage

`base64.nvim` works on visual selections only. The two commands created are:

- `Base64Encode [yaml]`
- `Base64Decode [yaml]`

Where `[yaml]` is an optional parameter that will encode only the value of a key-value pair delimited by `:` while also preserving indentation. Without this parameter, the entire line will be encoded.
