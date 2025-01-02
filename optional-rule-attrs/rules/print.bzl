_my_print_optional_attr_dict = {
    "_text_optional" : attr.string(
        mandatory = False,
        default = "This is an optional attribute in a dict of print.bzl. The first elem of the dict is optional",
    )
}

# Those print attributes will all be considered as mandatory by the Starpls LSP server
_my_print_mandatory_attr_dict = {
     "_text_mandatory" : attr.string(
        mandatory = True,
        default = "",
    ),
    "_text_optional" : attr.string(
        mandatory = False,
        default = "This is an optional attribute in a dict of print.bzl. The first elem of the dict is mandatory",
    ),
}

# Those attributes however will be seen by the Starpls LSP server
_my_print_attrs_struct = struct(
    _text_mandatory = attr.string(
        mandatory = True,
        default = "This is a mandatory attribute in a struct of print.bzl",
    ),
    _text_optional = attr.string(
        mandatory = False,
        default = "This is an optional attribute in a struct of print.bzl",
    ),
)

# This "direct" attribute will be seen by the Starpls LSP server
_my_print_direct_attr = attr.string(
    mandatory = False,
    default = "This is an attribute in print.bzl",
)

# Printing everything
def _my_print(ctx, attr):
    print(attr)

my_print = struct(
    optional_dict_attrs = _my_print_optional_attr_dict,
    mandatory_dict_attrs = _my_print_mandatory_attr_dict,
    struct_attrs = _my_print_attrs_struct,
    direct_attr = _my_print_direct_attr,
    impl = _my_print,
)
