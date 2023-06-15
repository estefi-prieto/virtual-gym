defmodule VirtualGym.SuperSeriesTest do
  use VirtualGym.DataCase

  alias VirtualGym.SuperSeries

  describe "super_series" do
    alias VirtualGym.SuperSeries.SuperSerie

    import VirtualGym.SuperSeriesFixtures

    @invalid_attrs %{}

    test "list_super_series/0 returns all super_series" do
      super_serie = super_serie_fixture()
      assert SuperSeries.list_super_series() == [super_serie]
    end

    test "get_super_serie!/1 returns the super_serie with given id" do
      super_serie = super_serie_fixture()
      assert SuperSeries.get_super_serie!(super_serie.id) == super_serie
    end

    test "create_super_serie/1 with valid data creates a super_serie" do
      valid_attrs = %{}

      assert {:ok, %SuperSerie{} = super_serie} = SuperSeries.create_super_serie(valid_attrs)
    end

    test "create_super_serie/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SuperSeries.create_super_serie(@invalid_attrs)
    end

    test "update_super_serie/2 with valid data updates the super_serie" do
      super_serie = super_serie_fixture()
      update_attrs = %{}

      assert {:ok, %SuperSerie{} = super_serie} =
               SuperSeries.update_super_serie(super_serie, update_attrs)
    end

    test "update_super_serie/2 with invalid data returns error changeset" do
      super_serie = super_serie_fixture()

      assert {:error, %Ecto.Changeset{}} =
               SuperSeries.update_super_serie(super_serie, @invalid_attrs)

      assert super_serie == SuperSeries.get_super_serie!(super_serie.id)
    end

    test "delete_super_serie/1 deletes the super_serie" do
      super_serie = super_serie_fixture()
      assert {:ok, %SuperSerie{}} = SuperSeries.delete_super_serie(super_serie)
      assert_raise Ecto.NoResultsError, fn -> SuperSeries.get_super_serie!(super_serie.id) end
    end

    test "change_super_serie/1 returns a super_serie changeset" do
      super_serie = super_serie_fixture()
      assert %Ecto.Changeset{} = SuperSeries.change_super_serie(super_serie)
    end
  end
end
