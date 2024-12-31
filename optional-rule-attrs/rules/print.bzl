# Those print attributes won't be seen by the Starpls LSP server
_my_print_attrs_dict = {
    "_text": attr.string(
        doc = "This is an attribute in a dict of print.bzl",
        mandatory = False,
        default = "This is an attribute in a dict of print.bzl",
    ),
    "_text2": attr.string(
        doc = "This is another attribute in a dict of print.bzl",
        mandatory = False,
        default = "This is another attribute in a dict of print.bzl",
    ),
}

# Those attributes however will be seen by the Starpls LSP server
_my_print_attrs_struct = struct(
    _text = attr.string(
        mandatory = False,
        default = "This is an attribute in a struct of print.bzl",
    ),
)

# This "direct" attribute will be seen by the Starpls LSP server
my_print_direct_attr = attr.string(
    mandatory = False,
    default = "This is an attribute in print.bzl",
)

# Printing everything
def _my_print(ctx, attr):
    print(attr)

my_print = struct(
    dict_attrs = _my_print_attrs_dict,
    struct_attrs = _my_print_attrs_struct,
    direct_attr = my_print_direct_attr,
    impl = _my_print,
)
