defmodule VirtualGymWeb.ExerciseSchemas do
  @moduledoc """
  Define the schemas used by open api spec for Exercise entity endpoints
  """
  alias OpenApiSpex.Schema
  require OpenApiSpex

  defmodule ExerciseRequest do
    @moduledoc false
    OpenApiSpex.schema(%{
      title: "Exercise Request",
      description: "Exercise data",
      type: :object,
      properties: %{
        exercise: %Schema{
          description: "Exercise fields",
          type: :object,
          properties: %{
            name: %Schema{type: :string, description: "Exercise name"},
            affected_muscles: %Schema{
              type: :array,
              description: "Strings List wich represent the the affected zones"
            },
            video: %Schema{type: :string, description: "Link to exercise explanation"},
            recomendations: %Schema{
              type: :string,
              description: "Advices about common errors and hot to prevent them"
            }
          },
          required: [:name, :affected_muscles]
        }
      },
      required: [:exercise],
      example: %{
        "exercise" => %{
          "name" => "hammer curl",
          "affected_muscles" => ["biceps"],
          "video" => "https://www.youtube.com/",
          "recomendations" => "Keep your back straight"
        }
      }
    })
  end

  defmodule ExerciseResponse do
    @moduledoc false
    OpenApiSpex.schema(%{
      title: "Exercise Response",
      description: "Exercise created data content",
      type: :object,
      properties: %{
        data: %Schema{
          description: "Exercise fields",
          type: :object,
          properties: %{
            id: %Schema{type: :string, description: "Exercise id", format: :uuid},
            name: %Schema{type: :string, description: "Exercise name"},
            affected_muscles: %Schema{
              type: :array,
              description: "Strings List wich represent the the affected zones",
              items: %Schema{type: :string}
            },
            video: %Schema{type: :string, description: "Link to exercise explanation"},
            recomendations: %Schema{
              type: :string,
              description: "Advices about common errors and hot to prevent them"
            }
          },
          required: [:id, :name, :affected_muscles]
        }
      },
      required: [:data],
      example: %{
        "data" => %{
          "id" => "2a46d8f1-7781-46ce-bd65-893c6a51eda3",
          "name" => "hammer curl",
          "affected_muscles" => ["biceps"],
          "video" => "https://www.youtube.com/",
          "recomendations" => "Keep your back straight"
        }
      }
    })
  end

  defmodule ExerciseIndexResponse do
    @moduledoc false
    OpenApiSpex.schema(%{
      title: "Exercise Index Response",
      description: "List all created exercises",
      type: :object,
      properties: %{
        data: %Schema{
          description: "Exercises list",
          type: :array,
          items: ExerciseResponse,
          required: [:data]
        }
      },
      required: [:data],
      example: %{
        "data" => [
          %{
            "id" => "2a46d8f1-7781-46ce-bd65-893c6a51eda3",
            "name" => "hammer curl",
            "affected_muscles" => ["biceps"],
            "video" => "https://www.youtube.com/",
            "recomendations" => "Keep your back straight"
          }
        ]
      }
    })
  end

  defmodule DeleteExerciseResponse do
    @moduledoc false
    OpenApiSpex.schema(%{
      title: "Delete Exercise Response",
      description: "Exercise deleted id and name",
      type: :object,
      properties: %{
        id: %Schema{type: :string, description: "Exercise id", format: :uuid},
        name: %Schema{type: :string, description: "Exercise name"}
      },
      required: [:data],
      example: %{
        "id" => "2a46d8f1-7781-46ce-bd65-893c6a51eda3",
        "name" => "hammer curl"
      }
    })
  end
end
