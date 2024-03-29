defmodule WhatFunWeb.HomeLive do
  @moduledoc false
  use WhatFunWeb, :live_view

  import LiveSelect

  alias Phoenix.LiveView
  alias WhatFun.Types

  require Logger

  @impl LiveView
  def mount(_params, _session, socket) do
    {:ok, assign(socket, types: Types.all(), form: to_form(%{arg: ""}))}
  end

  @impl LiveView
  def handle_event("live_select_change", %{"id" => id, "text" => text}, socket) do
    options = Enum.filter(socket.assigns.types, &(&1 |> String.downcase() |> String.contains?(String.downcase(text))))
    send_update(LiveSelect.Component, options: options, id: id)
    {:noreply, socket}
  end

  def handle_event("clear", %{"id" => id}, socket) do
    send_update(LiveSelect.Component, options: [], id: id)
    {:noreply, socket}
  end

  def handle_event(event, params, socket) do
    Logger.warning("Received unexpected event #{inspect(event)}(#{inspect(params)})")
    {:noreply, socket}
  end
end
