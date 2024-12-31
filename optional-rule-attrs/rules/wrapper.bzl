load("//rules:print.bzl", "my_print")

def _wrapper_impl(ctx):
    my_print.impl(
        ctx=ctx,
        attr= struct(
            text1 = ctx.attr._text1,
            text2 = ctx.attr._text2,
        )
    )

wrapper = rule(
    implementation = _wrapper_impl,
    attrs = {
        # Make the first attribute optional
        "_text1": attr.string(
            doc = "First text to write",
            mandatory = False,
            default = "This is a placeholder for text 1",
        ),
        # This IS an optional attribute
        "_text2": my_print.attrs["_text2"],
    },
)