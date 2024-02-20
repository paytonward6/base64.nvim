# base64.nvim

## Installation

> `base64` command required

Call `require("base64").setup()` after installing via one of the following methods (or use your other, favorite package manager)

### lazy.nvim

```lua
{'nvim-telescope/telescope.nvim'},
```

### Packer
```lua
use {'nvim-telescope/telescope.nvim'},
```

### Plug
```lua
Plug 'nvim-telescope/telescope.nvim',
```

## Usage

`base64.nvim` works on visual selections only. The two commands created are:

- `Base64Encode [yaml]`
- `Base64Decode [yaml]`

Where `[yaml]` is an optional parameter that will encode only the value of a key-value pair delimited by `:` while also preserving indentation. Without this parameter, the entire line will be encoded.
