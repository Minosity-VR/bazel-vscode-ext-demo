## Optional rule attributes

The LSP doesn't catch the "optional" property of an attribute if it is in a `dict` of attributes and the first element is an attribute set as mandatory.

```bazel
attr_dict = {
    "attr1" : attr.string(
        mandatory = True,
        default = "",
    ),
    "attr2" : attr.string(
        mandatory = False,
        default = "optional",
    ),
}

my_rule = rule(
    implementation = ...
    attrs = {
        "some_attr": attr_dict["attr2"],
    },
)
```

will cause a visual error when calling the rule, for instance in the [BUILD file](./optional-rule-attrs/BUILD):
```
Argument missing for attribute(s) "some_attr" - starpls
```

But the target can be executed fine & the argument is defaulted:

```bash
git clone https://github.com/Minosity-VR/bazel-vscode-ext-demo.git
cd bazel-vscode-ext-demo/optional-rule-attrs
bzl build example --action_env="$RANDOM"
```

(the `--action_env="$RANDOM"` is here to trash the bazel cache so you can just relaunch the same command)

It **does** work properly with a struct though.

You can check a bunch of examples in the `rules/` folder, with:
- a struct
- a dictionary whose first attribute **is not** mandatory
- a dictionary whose first attribute **is** mandatory
- directly an attribute
