# frozen_string_literal: true
# E: Lint/Syntax: unexpected token tIDENTIFIER
# (Using Ruby 3.1 parser; configure using TargetRubyVersion parameter, under AllCops)
# If you have extra params to permit, append them to the sanitizer.

# disable the above error for below lines


class SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  GET /resource/sign_in
  def new
    super
  end

  POST /resource/sign_in
  def create
    super
  end

  DELETE /resource/sign_out
  def destroy
    super
  end

  protected

  If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end



