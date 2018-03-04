Rails.application.routes.draw do
  root 'alunos#index'

  resources :fornecedors
  resources :contas_pagars
  resources :contas_recebers
  resources :treinos
  resources :tipo_exercicios
  resources :exame_fisicos
  resources :funcionarios
  resources :cargos
  resources :alunos

  # GET responsável por enviar qualquer requisição que não exista para o root
  get '*path' => redirect('/')
end
