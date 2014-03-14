factoriesModule = angular.module 'raf.factories', []

factoriesModule.factory "Entry", ["$resource", ($resource) ->
  $resource "/entries/:id", {id: "@id"},{
    update: {method: "PUT"}
  }
]