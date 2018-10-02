defmodule ProductCatalog.Quote.QuoteService do
  def list_conditions do
    %{
      "FN" => "Factory New",
      "NE" => "New Material",
      "NS" => "New Surplus",
      "OH" => "Overhauled",
      "SV" => "Serviceable",
      "RP" => "Repairable",
      "AR" => "As Removed"
    }
  end

  def list_priorities do
    %{
      "AOG" => "Aircraft On Ground",
      "Immediate" => "Within 1-2 weeks",
      "Flixible" => "No Specific Time"
    }
  end
end
