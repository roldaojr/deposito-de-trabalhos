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

    }]);

    /**
     * Categorias
     */
    as.controller('ListCategoriaCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/categorias.json')
                    .success(function(data, status, headers, config) {
                        console.log(data)
                        $scope.categorias = data;
                        angular.copy($scope.categorias, $scope.copy);
                    });
        }

        load();

        $scope.addCategoria = function() {
            console.log('call addCategoria');
            $location.path("/categoria/new");
        }

        $scope.editCategoria = function(index) {
            console.log('call editCategoria');
            $location.path('/categoria/edit/' + $scope.categorias[index].id);
        }

        $scope.delCategoria = function(index) {
            console.log('call delCategoria');
            var todel = $scope.categorias[index];
            $http
                    .delete(apiUrl + '/categoria/' + todel.id + '.json')
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
                    .post(apiUrl + '/categorias.json', $scope.categoria)
                    .success(function(data, status, headers, config) {
                        $location.path('/categorias');
                    }).error(function(data, status, headers, config) {
            });
        }
    }]);

    as.controller('EditCategoriaCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {

        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/categorias/' + $routeParams.id + '.json')
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
                    .put(apiUrl + '/categorias/' + $scope.categoria.id + '.json',  $scope.categoria)
                    .success(function(data, status, headers, config) {
                        $location.path('/categorias');
                    }).error(function(data, status, headers, config) {
            });
        }
    }]);

    /**
     * Orientador
     */
    as.controller('ListOrientadorCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/orientadores.json')
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
                    .delete(apiUrl + '/orientadores/' + todel.id + '.json')
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
                    .post(apiUrl + '/orientadores.json', $scope.orientador)
                    .success(function(data, status, headers, config) {
                        $location.path('/orientadores');
                    }).error(function(data, status, headers, config) {
            });
        }
    }]);

    as.controller('EditOrientadorCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {

        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/orientadores/' + $routeParams.id + '.json')
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
                    .put(apiUrl + '/orientadores/' + $scope.orientador.id + '.json',  $scope.orientador)
                    .success(function(data, status, headers, config) {
                        $location.path('/orientadores');
                    }).error(function(data, status, headers, config) {
            });
        }
    }]);

    /**
     * Trabalhos
     */
    as.controller('ListTrabalhoCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/trabalhos.json')
                    .success(function(data, status, headers, config) {
                        console.log(data)
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
                    .delete(apiUrl + '/trabalhos/' + todel.id + '.json')
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
                    .post(apiUrl + '/trabalhos.json', $scope.trabalho)
                    .success(function(data, status, headers, config) {
                        $location.path('/trabalhos');
                    }).error(function(data, status, headers, config) {
                        for(i in data["errors"]) {
                            data["errors"][i]
                        }
            });
        }
    }]);

    as.controller('EditTrabalhoCtrl', ['$scope', '$rootScope', '$http', '$routeParams', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {

        var load = function() {
            console.log('call load()...');
            $http.get(apiUrl + '/trabalhos/' + $routeParams.id + '.json')
                    .success(function(data, status, headers, config) {
                        $scope.trabalho = data;
                        angular.copy($scope.trabalho, $scope.copy);
                    });
        }

        load();

        $scope.trabalho = {};

        $scope.updateTrabalho = function() {
            console.log('call updateTrabalho');
            $http
                    .put(apiUrl + '/trabalhos/' + $scope.trabalho.id + '.json',  $scope.trabalho)
                    .success(function(data, status, headers, config) {
                        $location.path('/trabalhos');
                    }).error(function(data, status, headers, config) {
            });
        }
    }]);
}());