defmodule Sequence.Server do
  use GenServer
  alias Sequence.Impl
  ######
  # GenServer Implementation

  def init initial_number do
    { :ok, initial_number }
  end

  @doc """
    handles the call for changing the current number's state
  """
  def handle_call :next_number, _from, current_number do
    { :reply, current_number, Impl.next(current_number)}
  end

  @doc """
    handles the request when there is no reply
  """
  def handle_cast { :increment_number, delta }, current_number do
    { :noreply, Impl.increment(current_number, delta) }
  end

  @doc """
    format the current state 
  """
  def format_status _reason, [ _pdict, state ] do
    [ data: [{ 'state', "My current state is '#{inspect state}', and I'm happy"}]]
  end
end

