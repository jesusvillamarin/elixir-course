defmodule FixMonths do 

    def getAllMSI() do

        banks = [
            %{name: "Santander", months: 3},
            %{name: "Santander", months: 6},
            %{name: "Santander", months: 9},
            %{name: "Santander", months: 12},
            %{name: "Santander", months: 18},
            %{name: "Bancomer", months: 3},
            %{name: "Bancomer", months: 6},
            %{name: "Bancomer", months: 9},
            %{name: "Bancomer", months: 12},
            %{name: "Bancomer", months: 18},
            %{name: "Banamex", months: 3},
            %{name: "Banamex", months: 6},
            %{name: "Banamex", months: 9},
            %{name: "Banamex", months: 12},
            %{name: "Banamex", months: 18},
        ]

        nameBanks = [
            %{name: "Santander"},
            %{name: "Bancomer"},
            %{name: "Banamex"},
            %{name: "Banorte"}
        ]

        for element <- nameBanks do
            Enum.filter(banks, fn bank -> 
            bank.name === element.name
            end) |> createArrayMonths(element.name)
        end
    end

    def createArrayMonths(array, nameBank) do
        months = for element <- array do
            element.months
        end
        if length(months) !== 0, do: %{name: nameBank, months: months}
    end

    def saveOnDBMSI() do
        banks = [
            %{months: [3, 6, 9, 12, 18], name: "Santander"},
            %{months: [3, 6, 9, 12, 18], name: "Bancomer"},
            %{months: [3, 6, 9, 12, 18], name: "Banamex"},
        ]
        for bank <- banks do
            for month <- bank.months do
                %{name: bank.name, month: month}
            end
        end |> List.flatten
    end

end    

