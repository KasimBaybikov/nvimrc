-- Функция для проверки наличия файла в указанном пути
local function check_file(file_path)
	return vim.fn.filereadable(file_path) == 1
end

-- Пути к файлам для проверки
local file_paths = {
	"./cmd/service/main.go",
	"./main.go",
	"./cmd/main.go"
}


function open_go_main(file_path)
	if file_path and check_file(file_path) then
		vim.cmd('edit ' .. file_path)
	else
		-- Проверка наличия файлов по умолчанию
		local found_file_path = nil
		for _, path in ipairs(file_paths) do
			if check_file(path) then
				found_file_path = path
				break
			end
		end

		-- Если файл найден, открываем его
		if found_file_path then
			vim.cmd('edit ' .. found_file_path)
		else
			print("Файл 'main.go' не найден в указанных местах и их поддиректориях.")
		end
	end
end

-- Если файл найден, открываем его
local function dgo(args)
	open_go_main(args.fargs[1])
	require("remaps.dap").open_dapui()
end

-- Функция для поиска файлов main.go в текущей директории и ее поддиректориях
local function complete_main_go_files(findstart, base)
	if findstart == 1 then
		-- Если это начало запроса автодополнения, возвращаем текущую позицию курсора
		return vim.fn.col('.') - 1
	else
		-- Получаем пути к файлам main.go в текущей директории и ее поддиректориях
		local function find_files_recursive(directory)
			local files = vim.fn.glob(directory .. '/**/main.go', true, true)
			local result = {}

			for _, file in ipairs(files) do
				if vim.fn.isdirectory(file) == 0 then
					-- Добавляем только файлы main.go в результат
					table.insert(result, vim.fn.fnamemodify(file, ':p'))
				end
			end

			return result
		end

		-- Текущая директория пользователя
		local current_directory = vim.fn.getcwd()

		-- Получаем список файлов main.go для автодополнения
		local main_go_files = find_files_recursive(current_directory)

		-- Возвращаем список файлов для автодополнения
		return main_go_files
	end
end

vim.api.nvim_create_user_command(
	"Dgo",
	dgo,
	{ desc = "open debug", nargs = "?", complete = complete_main_go_files }
)
