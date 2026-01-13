// TODO/FIXME: Hardcoded values; future data will need to be manually added until we arrive at a better solution.

final beldexDates = {
  "2019-03-01": 21164,
  "2019-04-01": 42675,
  "2019-05-01": 64918,
  "2019-06-01": 348926,
  "2019-07-01": 108687,
  "2019-08-01": 130935,
  "2019-09-01": 152452,
  "2019-10-01": 174680,
  "2019-11-01": 196906,
  "2019-12-01": 217017,
  "2020-01-01": 239353,
  "2020-02-01": 260946,
  "2020-03-01": 283214,
  "2020-04-01": 304758,
  "2020-05-01": 326679,
  "2020-06-01": 348926,
  "2020-07-01": 370533,
  "2020-08-01": 392807,
  "2020-09-01": 414270,
  "2020-10-01": 436562,
  "2020-11-01": 458817,
  "2020-12-01": 479654,
  "2021-01-01": 501870,
  "2021-02-01": 523356,
  "2021-03-01": 545569,
  "2021-04-01": 567123,
  "2021-05-01": 589402,
  "2021-06-01": 611687,
  "2021-07-01": 633161,
  "2021-08-01": 655438,
  "2021-09-01": 677038,
  "2021-10-01": 699358,
  "2021-11-01": 721678,
  "2021-12-01": 741838,
  "2022-01-01": 788501,
  "2022-02-01": 877781,
  "2022-03-01": 958421,
  "2022-04-01": 1006790,
  "2022-05-01": 1093190,
  "2022-06-01": 1199750,
  "2022-07-01": 1291910,
  "2022-08-01": 1361030,
  "2022-09-01": 1456070,
  "2022-10-01": 1574150,
  "2022-11-01": 1674950,
  "2022-12-01": 1764230,
  "2023-01-01": 1850630,
  "2023-02-01": 1942950,
  "2023-03-01": 2022950,
  "2023-04-01": 2112950,
  "2023-05-01": 2199950,
  "2023-06-01": 2289269,
  "2023-07-01": 2363143,
  "2023-08-01": 2420443,
  "2023-09-01": 2503900,
  "2023-10-01": 2585550,
  "2023-11-01": 2696980,
  "2023-12-01": 2816300,
  "2024-01-01": 2894560,
  "2024-02-01": 2986700,
  "2024-03-01": 3049909,
  "2024-04-01": 3130730,
  "2024-05-01": 3187670,
  "2024-06-01": 3317020,
  "2024-07-01": 3429750,
  "2024-08-01": 3479700,
  "2024-09-01": 3536850,
  "2024-10-01": 3668050,
  "2024-11-01": 3784050,
  "2024-12-01": 3870400,
  "2025-01-01": 3959700,
  "2025-02-01": 4048980,
  "2025-03-01": 4129600,
  "2025-04-01": 4218870,
  "2025-05-01": 4305270,
  "2025-06-01": 4394570,
  "2025-07-01": 4480990,
  "2025-08-01": 4570250,
  "2025-09-01": 4659510,
  "2025-10-01": 4745910,
  "2025-11-01": 4835190,
};

/* The data above was generated using this bash script:
#!/bin/bash

declare -A firstBlockOfTheMonth

for HEIGHT in {0..666657}
do
  TIMESTAMP=$(curl -s -X POST http://node.suchwow.xyz:34568/json_rpc -d '{"jsonrpc":"2.0","id":"0","method":"getblock","params":{"height":'$HEIGHT'}}' | jq '.result.block_header.timestamp')
  YRMO=$(date +'%Y-%m' -d "@"$TIMESTAMP) # Like "2022-11"
  if [ "${firstBlockOfTheMonth[$YRMO]+abc}" ]; then # Check if key $YRMO has been set in array firstBlockOfTheMonth.
    continue # We've already seen a block in this month.
  else # This is the first block of the month.
    echo '"'$YRMO'": '$HEIGHT
    firstBlockOfTheMonth[$YRMO]=$HEIGHT # Like firstBlockOfTheMonth["2021-5"]=312769.
  fi
  sleep 0.1
done
*/

@Deprecated("Something else should be used")
int getBeldexHeightByDate({required DateTime date}) {
  final raw = '${date.year}-${date.month}';
  final lastHeight = beldexDates.values.last;
  int? startHeight;
  int? endHeight;
  int height = 0;

  try {
    if ((beldexDates[raw] == null) || (beldexDates[raw] == lastHeight)) {
      startHeight = beldexDates.values.toList()[beldexDates.length - 2];
      endHeight = beldexDates.values.toList()[beldexDates.length - 1];
      final heightPerDay = (endHeight - startHeight) / 31;
      final endDateRaw =
          beldexDates.keys.toList()[beldexDates.length - 1].split('-');
      final endYear = int.parse(endDateRaw[0]);
      final endMonth = int.parse(endDateRaw[1]);
      final endDate = DateTime(endYear, endMonth);
      final differenceInDays = date.difference(endDate).inDays;
      final daysHeight = (differenceInDays * heightPerDay).round();
      height = endHeight + daysHeight;
    } else {
      startHeight = beldexDates[raw];
      final index = beldexDates.values.toList().indexOf(startHeight!);
      endHeight = beldexDates.values.toList()[index + 1];
      final heightPerDay = ((endHeight - startHeight) / 31).round();
      final daysHeight = (date.day - 1) * heightPerDay;
      height = startHeight + daysHeight - heightPerDay;
    }
  } catch (e) {
    // print(e);
    rethrow;
  }

  return height;
}
