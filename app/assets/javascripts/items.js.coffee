jQuery ->
  Morris.Line
    element: 'amazon'
    data: $('#amazon').data('items')
    # xkey: $('#amazon').data('items')[0].name + ": " + $('#amazon').data('items')[0].album
    xkey: "release"
    ykeys: ['salesrank']
    labels: ['Sales Rank']
    ymax:100
    xLabels:"month"
    smooth:false
    hoverCallback: (index, options) ->
      row = options.data[index]
      "#" + row.salesrank + ": " + row.name + ": " + row.album + "<br />" + row.release


