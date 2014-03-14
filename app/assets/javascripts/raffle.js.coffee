app = angular.module("Raffler", ["ngResource", "raf.factories", "raf.filters"])

@RaffleCtrl = ["$scope", "Entry", ($scope, Entry) ->
  $scope.entries = Entry.query()

  $scope.aDate = new Date()

  $scope.addEntry = ->
    entry = Entry.save($scope.newEntry)
    $scope.entries.push(entry)
    $scope.newEntry = {}

  $scope.drawWinner = ->
    pool = []
    angular.forEach $scope.entries, (entry) ->
      pool.push(entry) if !entry.winner
    if pool.length > 0
      entry = pool[Math.floor(Math.random()*pool.length)]
      entry.winner = true
      Entry.update(entry)
      # entry.$update()
      $scope.lastWinner = entry

]