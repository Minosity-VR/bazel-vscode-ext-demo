
_my_print_attrs = {
    "text1": attr.string(
        doc = "First text to print",
        mandatory = True,
    ),
    "_text2": attr.string(
        doc = "Second text to print",
        mandatory = False,
        default = "This is a placeholder for text 2",
    ),
}

def _my_print(ctx, attr):
    print(attr.text1)
    print(attr.text2)

my_print = struct(
    attrs = _my_print_attrs,
    impl = _my_print,
)
