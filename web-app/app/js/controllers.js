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

    as.controller('CategoriaListCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $location, apiUrl) {
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
                    .delete(apiUrl + '/categorias/' + todel.id + '.json')
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

    as.controller('EditCategoriaCtrl', ['$scope', '$rootScope', '$http', '$location', 'apiUrl', function($scope, $rootScope, $http, $routeParams, $location, apiUrl) {

        var load = function() {
            console.log('call load()...');
            console.log($routeParams['id'])
            $http.get(apiUrl + '/categorias/' + $routeParams['id'] + '.json')
                    .success(function(data, status, headers, config) {
                        $scope.categoria = data;
                        angular.copy($scope.categoria, $scope.copy);
                    });
        }

        load();

        //$scope.categoria = {};

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
}());