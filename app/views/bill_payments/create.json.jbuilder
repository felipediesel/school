json.extract! @bill, :id
json.html render('bills/bill.html', bill: @bill)
