local keys = {
    { "-#", "<CMD>PHPEasyAttribute<CR>", ft = "php" },
    { "-b", "<CMD>PHPEasyDocBlock<CR>", ft = "php" },
    { "-r", "<CMD>PHPEasyReplica<CR>", ft = "php" },
    { "-c", "<CMD>PHPEasyCopy<CR>", ft = "php" },
    { "-d", "<CMD>PHPEasyDelete<CR>", ft = "php" },
    { "-uu", "<CMD>PHPEasyRemoveUnusedUses<CR>", ft = "php" },
    { "-e", "<CMD>PHPEasyExtends<CR>", ft = "php" },
    { "-i", "<CMD>PHPEasyImplements<CR>", ft = "php" },
    { "--i", "<CMD>PHPEasyInitInterface<CR>", ft = "php" },
    { "--c", "<CMD>PHPEasyInitClass<CR>", ft = "php" },
    { "--ac", "<CMD>PHPEasyInitAbstractClass<CR>", ft = "php" },
    { "--t", "<CMD>PHPEasyInitTrait<CR>", ft = "php" },
    { "--e", "<CMD>PHPEasyInitEnum<CR>", ft = "php" },
    { "--_", "<CMD>PHPEasyAppendInvoke<CR>", ft = "php" },
    { "-c", "<CMD>PHPEasyAppendConstant<CR>", ft = "php", mode = { "n", "v" } },
    { "-p", "<CMD>PHPEasyAppendProperty<CR>", ft = "php", mode = { "n", "v" } },
    { "-m", "<CMD>PHPEasyAppendMethod<CR>", ft = "php", mode = { "n", "v" } },
    { "-_", "<CMD>PHPEasyAppendConstruct<CR>", ft = "php" },
    { "-a", "<CMD>PHPEasyAppendArgument<CR>", ft = "php" },
}

return keys
