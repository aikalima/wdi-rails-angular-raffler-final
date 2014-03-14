filtersModule = angular.module("raf.filters", [])

filtersModule.filter "relativeDate", ->
  (leDate) ->
    return "Today"  if leDate.isToday()
    return "Yesterday"  if leDate.isYesterday()
    leDate.format "{MM}/{dd}/{yy}"