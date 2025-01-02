# Testing the vscode extension

This repo was created to test the behavior of the vscode extension syntax highlighting & [starpls](https://github.com/withered-magic/starpls) LSP.

## Optional rule attributes

The LSP doesn't catch the "optional" property of an attribute if it is in a `dict` of attributes and the first element is a mandatory element

```bazel
wrapper = rule(
    ...
    attrs = {
        ...
        # This IS an optional attribute, but the first element of the dictionary is mandatory
         "_text3": my_local_mandatory_attr_dict["_text_optional"],
        ...
    },
)
```

will cause a visual error when calling the rule, for instance in the [BUILD file](./optional-rule-attrs/BUILD):
```
Argument missing for attribute(s) "_text2" - starpls
```

But the target can be executed fine & the argument is defaulted:

```bash
git clone https://github.com/Minosity-VR/bazel-vscode-ext-demo.git
cd bazel-vscode-ext-demo/optional-rule-attrs
bzl build example --action_env="$RANDOM"
```

(the `--action_env="$RANDOM"` is here to trash the bazel cache so you can just relaunch the same command)

It **does** work properly with a struct though.
