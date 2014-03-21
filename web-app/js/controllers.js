(function() {
    var as = angular.module('myApp.controllers', []);
    as.controller('AppCtrl',['$scope', '$rootScope', '$http', 'i18n', '$location', 'apiUrl', function($scope, $rootScope, $http, i18n, $location, apiUrl) {
        $scope.language = function() {
            return i18n.language;
        };
        $scope.setLanguage = function(lang) {
            i18n.setLanguage(lang);
        };
        $scope.activeWhen = function(value) {
            return value ? 'active' : '';
        };

        $scope.path = function() {
            return $location.url();
        };

        $scope.login = function() {
            $scope.$emit('event:loginRequest', $scope.username, $scope.password);
        };

        $scope.logout = function() {
            $rootScope.user = null;
            $scope.username = $scope.password = null;
            $scope.$emit('event:logoutRequest');
        };

        $http.get(apiUrl + '/status').success(function(data) {
            console.log('status @');
            console.log(data);
            $rootScope.user = data.user
            $rootScope.authorities = data.authorities
        });
    }]);

    /**
     * Categorias
     */
    as.controller('ListCategoriaCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/categoria.json')
                    .success(function(data, status, headers, config) {
                        console.log(data)
                        $scope.categorias = data;
                        angular.copy($scope.categorias, $scope.copy);
                    });
        }

        load();

        $scope.addCategoria = function() {
            console.log('call addCategoria');
            $location.path("/categorias/new");
        }

        $scope.editCategoria = function(index) {
            console.log('call editCategoria');
            $location.path('/categorias/edit/' + $scope.categorias[index].id);
        }

        $scope.delCategoria = function(index) {
            console.log('call delCategoria');
            var todel = $scope.categorias[index];
            $http
                    .delete(apiUrl + '/categoria/delete/' + todel.id + '.json')
                    .success(function(data, status, headers, config) {
                        load();
                    }).error(function(data, status, headers, config) {
            });
        }

    }]);

    as.controller('NewCategoriaCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {

        $scope.categoria = {};

        $scope.saveCategoria = function() {
            console.log('call saveCategoria');
            $http
			.post(apiUrl + '/categoria/save.json', $scope.categoria)
			.success(function(data, status, headers, config) {
				$location.path('/categorias');
				$rootScope.message = function(){
					return {text: 'updateSuccess', type: 'success', show: true};
				}
			}).error(function(data, status, headers, config) {
            });
        }
    }]);

    as.controller('EditCategoriaCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', 'growl',
        function($scope, $rootScope, $http, $routeParams, $location, apiUrl, growl) {

        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/categoria/show/' + $routeParams.id + '.json')
                .success(function(data, status, headers, config) {
                    $scope.categoria = data;
                    angular.copy($scope.categoria, $scope.copy);
                });
        }

        load();

        $scope.categoria = {};

        $scope.updateCategoria = function() {
            console.log('call updateCategoria');
            $http
			.put(apiUrl + '/categoria/update/' + $scope.categoria.id + '.json',  $scope.categoria)
			.success(function(data, status, headers, config) {
				if(!data.error) {
					showMessage('Registro salvo com exito', 'success');
					$location.path('/categorias');
				} else {
					showMessage(data.error, 'error');
				}
			}).error(function(data, status, headers, config) {
				showMessage($.i18n.prop('SaveError'), 'success');
			});
        }
    }]);

    /**
     * Orientador
     */
    as.controller('ListOrientadorCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/orientador.json')
                    .success(function(data, status, headers, config) {
                        console.log(data)
                        $scope.orientadores = data;
                        angular.copy($scope.orientadores, $scope.copy);
                    });
        }

        load();

        $scope.addOrientador = function() {
            console.log('call addOrientador');
            $location.path("/orientadores/new");
        }

        $scope.editOrientador = function(index) {
            console.log('call editOrientador');
            $location.path('/orientadores/edit/' + $scope.orientadores[index].id);
        }

        $scope.delOrientador = function(index) {
            console.log('call delOrientador');
            var todel = $scope.orientadores[index];
            $http
                    .delete(apiUrl + '/orientador/delete/' + todel.id + '.json')
                    .success(function(data, status, headers, config) {
                        load();
                    }).error(function(data, status, headers, config) {
            });
        }
    }]);

    as.controller('NewOrientadorCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {

        $scope.orientador = {};

        $scope.saveOrientador = function() {
            console.log('call saveOrientador');
            $http
			.post(apiUrl + '/orientador/save.json', $scope.orientador)
			.success(function(data, status, headers, config) {
				if(!data.error) {
					showMessage($.i18n.prop('SaveSuccess'), 'success');
					$location.path('/orientadores');
				} else {
					showMessage(data.error, 'error');
				}
			}).error(function(data, status, headers, config) {
				showMessage($.i18n.prop('SaveError'), 'success');
			});
        }
    }]);

    as.controller('EditOrientadorCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {

        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/orientador/show/' + $routeParams.id + '.json')
                    .success(function(data, status, headers, config) {
                        $scope.orientador = data;
                        angular.copy($scope.orientador, $scope.copy);
                    });
        }

        load();
        $scope.orientador = {};

        $scope.updateOrientador = function() {
            console.log('call updateOrientador');
            $http
			.put(apiUrl + '/orientador/update/' + $scope.orientador.id + '.json',  $scope.orientador)
			.success(function(data, status, headers, config) {
				if(!data.error) {
					showMessage($.i18n.prop('SaveSuccess'), 'success');
					$location.path('/orientadores');
				} else {
					showMessage(data.error, 'error');
				}
			}).error(function(data, status, headers, config) {
				showMessage($.i18n.prop('SaveError'), 'success');
			});
        }
    }]);

    /**
     * Autores
     */
    as.controller('ListAutorCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/autor.json')
                    .success(function(data, status, headers, config) {
                        console.log(data)
                        $scope.autores = data;
                        angular.copy($scope.autores, $scope.copy);
                    });
        }

        load();

        $scope.addAutor = function() {
            console.log('call addAutor');
            $location.path("/autores/new");
        }

        $scope.editAutor = function(index) {
            console.log('call editAutor');
            $location.path('/autores/edit/' + $scope.autores[index].id);
        }

        $scope.delAutor = function(index) {
            console.log('call delAutor');
            var todel = $scope.autores[index];
            $http
                    .delete(apiUrl + '/autores/delete/' + todel.id + '.json')
                    .success(function(data, status, headers, config) {
                        load();
                    }).error(function(data, status, headers, config) {
            });
        }

    }]);

    as.controller('NewAutorCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {

        $scope.autor = {};

        $scope.saveAutor = function() {
            console.log('call saveAutor');
            $http
                    .post(apiUrl + '/autor/save.json', $scope.autor)
                    .success(function(data, status, headers, config) {
                        $location.path('/autores');
                    }).error(function(data, status, headers, config) {
            });
        }
    }]);

    as.controller('EditAutorCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {

        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/autor/show/' + $routeParams.id + '.json')
                    .success(function(data, status, headers, config) {
                        $scope.autor = data;
                        angular.copy($scope.autor, $scope.copy);
                    });
        }

        load();

        $scope.autor = {};

        $scope.updateAutor = function() {
            console.log('call updateAutor');
            $http
			.put(apiUrl + '/autor/update/' + $scope.autor.id + '.json',  $scope.autor)
			.success(function(data, status, headers, config) {
				if(!data.error) {
					showMessage($.i18n.prop('SaveSuccess'), 'success');
					$location.path('/autores');
				} else {
					showMessage(data.error, 'error');
				}
			}).error(function(data, status, headers, config) {
				showMessage($.i18n.prop('SaveError'), 'success');
			});
        }
    }]);

    /**
     * Trabalhos
     */
    as.controller('ListTrabalhoCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/trabalho.json')
                    .success(function(data, status, headers, config) {
                        $scope.trabalhos = data;
                        angular.copy($scope.trabalhos, $scope.copy);
                    });
        }

        load();

        $scope.addTrabalho = function() {
            console.log('call addTrabalho');
            $location.path("/trabalhos/new");
        }

        $scope.editTrabalho = function(index) {
            console.log('call editTrabalho');
            $location.path('/trabalhos/edit/' + $scope.trabalhos[index].id);
        }

        $scope.delTrabalho = function(index) {
            console.log('call delTrabalho');
            var todel = $scope.trabalhos[index];
            $http
			.delete(apiUrl + '/trabalhos/delete/' + todel.id + '.json')
			.success(function(data, status, headers, config) {
				load();
			}).error(function(data, status, headers, config) {
            });
        }

        $scope.aprovarTrabalho = function(index) {
            console.log('call aprovarTrabalho');
            var todel = $scope.trabalhos[index];
            $http
            .get(apiUrl + '/trabalho/publish/' + todel.id + '.json')
            .success(function(data, status, headers, config) {
				load();
			}).error(function(data, status, headers, config) {
			});
        }

    }]);

    as.controller('NewTrabalhoCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {

        $scope.trabalho = {};

        $scope.saveTrabalho = function() {
            console.log('call saveTrabalho');
            $scope.trabalho.publicado = new Date();
            $scope.trabalho.enviado = new Date();
            $http
			.post(apiUrl + '/trabalho/save.json', $scope.trabalho)
			.success(function(data, status, headers, config) {
				$location.path('/trabalhos');
				$rootScope.message = function(){
					return {text: 'saveSuccess', type: 'success', show: true};
				}
			}).error(function(data, status, headers, config) {
				$rootScope.message = function(){
					return {text: 'httpRequestFailed', type: 'error', show: true};
				}
            });
        }

		$scope.orientadoresOptions = {
			minimumInputLength: 3,
			ajax: {
				url: apiUrl + '/orientador/find.json',
				dataType: "json",
				data: function (term, page) { return { nome: term }},
				quietMillis: 500,
				results: function (data, page) {
					return { results: data, text: "nome" };
				},
			},
			formatResult: function (item) { return item.nome; },
			formatSelection: function (item) { return item.nome; },
		};
		$scope.autoresOptions = {
			multiple: true,
			minimumInputLength: 3,
			ajax: {
				url: apiUrl + '/autor/find.json',
				dataType: "json",
				data: function (term, page) { return { nome: term }},
				quietMillis: 500,
				results: function (data, page) {
					return { results: data, text: "nome" };
				},
			},
			formatResult: function (item) { return item.nome; },
			formatSelection: function (item) { return item.nome; },
		};
    }]);

    as.controller('EditTrabalhoCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/trabalho/show/' + $routeParams.id + '.json')
            .success(function(data, status, headers, config) {
                $scope.trabalho = data;
                $("#orientador").select2("data", $scope.trabalho.orientador);
				$("#autores").select2("data", $scope.trabalho.autores);
				$("#palavrasChave").select2("data", $scope.trabalho.termos_chave);
            });
            $http.get(apiUrl + '/orientador.json')
			.success(function(data, status, headers, config) {
				$scope.orientadores = data;
			});
            $http.get(apiUrl + '/categoria.json')
			.success(function(data, status, headers, config) {
				$scope.categorias = data;
			});
        }
		$scope.orientadoresOptions = {
			minimumInputLength: 3,
			ajax: {
				url: apiUrl + '/orientador/find.json',
				dataType: "json",
				data: function (term, page) { return { nome: term }},
				quietMillis: 500,
				results: function (data, page) {
					return { results: data, text: "nome" };
				},
			},
			formatResult: function (item) { return item.nome; },
			formatSelection: function (item) { return item.nome; },
		};
		$scope.autoresOptions = {
			multiple: true,
			minimumInputLength: 3,
			ajax: {
				url: apiUrl + '/autor/find.json',
				dataType: "json",
				data: function (term, page) { return { nome: term }},
				quietMillis: 500,
				results: function (data, page) {
					return { results: data, text: "nome" };
				},
			},
			formatResult: function (item) { return item.nome; },
			formatSelection: function (item) { return item.nome; },
		};
        $scope.palavrasChaveOptions = {
            multiple: true,
            minimumInputLength: 2,
            tokenSeparators: [",", ";"],
            tags: [],
			createSearchChoice: function(term, data) {
				if ($(data).filter(function() {
					return this.nome.localeCompare(term) === 0;
				}).length === 0) {
					return {
						id: undefined,
						"class": "trabalho.TermoChave",
						nome: term
					};
				}
			},
            ajax: {
                url: apiUrl + '/termoChave/find.json',
                dataType: "json",
                data: function (term, page) { return { nome: term }},
                quietMillis: 500,
                results: function (data, page) {
                    return { results: data, text: "nome" };
                },
            },
            formatResult: function (item) { return item.nome; },
            formatSelection: function (item) { return item.nome; },
        };
		
		load();
        $scope.trabalho = {};

        $scope.updateTrabalho = function() {
            console.log('call updateTrabalho');
            console.log($scope.trabalho);
            $http
			.put(apiUrl + '/trabalho/update/' + $scope.trabalho.id + '.json',  $scope.trabalho)
			.success(function(data, status, headers, config) {
				if(!data.error) {
					showMessage($.i18n.prop('SaveSuccess'), 'success');
					$location.path('/trabalhos');
				} else {
					showMessage(data.error, 'error');
				}
			}).error(function(data, status, headers, config) {
				showMessage($.i18n.prop('SaveError'), 'success');
			});
        }
        
        $scope.adicionarOrientador = function() {
			$location.path('/orientadores/new/');
        }
        $scope.adicionarAutor = function() {
			$window.open('/autores/new/');
        }
    }]);

    /**
     * Usuarios
     */
    as.controller('ListUsuarioCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/user.json')
                    .success(function(data, status, headers, config) {
                        console.log(data)
                        $scope.usuarios = data;
                        angular.copy($scope.usuarios, $scope.copy);
                    });
        }

        load();

        $scope.addUsuario = function() {
            console.log('call addUsuario');
            $location.path("/usuarios/new");
        }

        $scope.editUsuario = function(index) {
            console.log('call editUsuario');
            $location.path('/usuarios/edit/' + $scope.usuarios[index].id);
        }

        $scope.delUsuario = function(index) {
            console.log('call delUsuario');
            var todel = $scope.usuarios[index];
            $http
            .delete(apiUrl + '/user/delete/' + todel.id + '.json')
            .success(function(data, status, headers, config) {
                load();
            }).error(function(data, status, headers, config) {
            });
        }

    }]);

    as.controller('NewUsuarioCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {

        $scope.usuario = {};

        $scope.saveUsuario = function() {
            console.log('call saveUsuario');
            $http
            .post(apiUrl + '/user/save.json', $scope.usuario)
            .success(function(data, status, headers, config) {
                $location.path('/usuarios');
                $rootScope.message = function(){
                    return {text: 'updateSuccess', type: 'success', show: true};
                }
            }).error(function(data, status, headers, config) {
            });
        }
    }]);

    as.controller('EditUsuarioCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {

        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/user/show/' + $routeParams.id + '.json')
                    .success(function(data, status, headers, config) {
                        $scope.usuario = data;
                        angular.copy($scope.usuario, $scope.copy);
                    });

        }

        load();

        $scope.usuario = {};

        $scope.updateUsuario = function() {
            console.log('call updateUsuario');
            $http
            .put(apiUrl + '/user/update/' + $scope.usuario.id + '.json',  $scope.usuario)
            .success(function(data, status, headers, config) {
                $location.path('/usuarios');
                $rootScope.message = function(){
                    setTimeout(function(){
                        $rootScope.message().show = false;
                    }, 5000);
                    return {text: 'updateSuccess', type: 'success', show: true};
                }
            }).error(function(data, status, headers, config) {
                console.log(data);
            });
        }
    }]);
}());