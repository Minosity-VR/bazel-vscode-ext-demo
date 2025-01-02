load("//rules:print.bzl", "my_print")

def _wrapper_impl(ctx):
    my_print.impl(
        ctx=ctx,
        attr= struct(
            text1 = ctx.attr._text1,
            text2 = ctx.attr._text2,
            text3 = ctx.attr._text3,
            text4 = ctx.attr._text4,
            text5 = ctx.attr._text5,
            text6 = ctx.attr._text6,
            text7 = ctx.attr._text7,
        )
    )

my_local_optional_attr_dict = {
    "_text_optional" : attr.string(
        mandatory = False,
        default = "This is an attribute in a dict of wrapper.bzl, next to the rule definition. The first elem of the dict is optional",
    )
}
my_local_mandatory_attr_dict = {
    "_text_mandatory" : attr.string(
        mandatory = True,
        default = "",
    ),
    "_text_optional" : attr.string(
        mandatory = False,
        default = "This is an attribute in a dict of wrapper.bzl, next to the rule definition. The first elem of the dict is mandatory",
    ),
}

my_local_attr = attr.string(
    mandatory = False,
    default = "This is an attribute in wrapper.bzl, next to the rule definition",
)

wrapper = rule(
    implementation = _wrapper_impl,
    attrs = {
        "_text1": my_local_attr, # should be seen as optional by the Starlark LSP server
        "_text2": my_local_optional_attr_dict["_text_optional"], # should be seen as optional by the Starlark LSP server
        "_text3": my_local_mandatory_attr_dict["_text_optional"], # should be seen as mandatory by the Starlark LSP server
        "_text4": my_print.direct_attr, # should be seen as optional by the Starlark LSP server
        "_text5": my_print.struct_attrs._text_optional, # should be seen as optional by the Starlark LSP server
        "_text6": my_print.optional_dict_attrs["_text_optional"], # should be seen as optional by the Starlark LSP server
        "_text7": my_print.mandatory_dict_attrs["_text_optional"], # should be seen as mandatory by the Starlark LSP server
    },
)