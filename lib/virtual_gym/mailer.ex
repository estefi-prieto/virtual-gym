defmodule VirtualGym.Mailer do
  @moduledoc """
    This module provides an API for mails to be sent by Pow.
  """
  use Swoosh.Mailer, otp_app: :virtual_gym
end
