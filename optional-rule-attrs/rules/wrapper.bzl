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
        )
    )

my_local_attr_dict = {
    "_text1" : attr.string(
        mandatory = False,
        default = "This is an attribute in a dict of wrapper.bzl, next to the rule definition",
    )
}

my_local_attr = attr.string(
    mandatory = False,
    default = "This is an attribute in wrapper.bzl, next to the rule definition",
)

wrapper = rule(
    implementation = _wrapper_impl,
    attrs = {
        "_text1": my_local_attr,
        "_text2": my_local_attr_dict["_text1"],
        "_text3": my_print.direct_attr,
        "_text4": my_print.struct_attrs._text,
        "_text5": my_print.attrs["_text"],
        "_text6": my_print.attrs["_text2"],
    },
)