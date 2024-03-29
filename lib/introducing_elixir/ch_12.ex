# Chapter 12: Structured data storage

# Erlang Term Storage (ETS) & Disk Erlang Data Storage (DETS)

# :set :ordered_set :bag :duplicated_bag

defmodule IntroducingElixir.Ch12.Planemo do
  require Record
  Record.defrecord(:planemo, name: nil, gravity: 0, diameter: 0, distance_from_sun: 0)
end

defmodule IntroducingElixir.Ch12.PlanemoStorage do
  alias IntroducingElixir.Ch12.Planemo
  require IntroducingElixir.Ch12.Planemo

  def setup do
    planemo_table = :ets.new(:planemos, [:named_table, {:keypos, Planemo.planemo(:name) + 1}])

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :mercury, gravity: 3.7, diameter: 4878, distance_from_sun: 57.9)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :venus, gravity: 8.9, diameter: 12104, distance_from_sun: 108.2)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :earth, gravity: 9.8, diameter: 12756, distance_from_sun: 149.6)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :moon, gravity: 1.6, diameter: 3475, distance_from_sun: 149.6)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :mars, gravity: 3.7, diameter: 6787, distance_from_sun: 227.9)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :ceres, gravity: 0.27, diameter: 950, distance_from_sun: 413.7)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :jupiter, gravity: 23.1, diameter: 142_796, distance_from_sun: 778.3)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :saturn, gravity: 9.0, diameter: 120_660, distance_from_sun: 1427.0)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :uranus, gravity: 8.7, diameter: 51118, distance_from_sun: 2871.0)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :neptune, gravity: 11.0, diameter: 30200, distance_from_sun: 4497.1)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :pluto, gravity: 0.6, diameter: 2300, distance_from_sun: 5913.0)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :haumea, gravity: 0.44, diameter: 1150, distance_from_sun: 6484.0)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :makemake, gravity: 0.5, diameter: 1500, distance_from_sun: 6850.0)
    )

    :ets.insert(
      :planemos,
      Planemo.planemo(name: :eris, gravity: 0.8, diameter: 2400, distance_from_sun: 10210.0)
    )

    :ets.info(planemo_table)
  end
end

# `:ets.delete/1` for deleting ets-table
# `:ets.tab2list/1` for listing
# `:ets.lookup :planemos, :eris` / `hd :ets.lookup :planemos, :eris` for retrieve :eris planemo from ETS
