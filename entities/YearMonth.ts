export interface YearMonth {
  year: number
  month: number
}

export const yearMonthToString = (yearMonth: YearMonth) => {
  return `${yearMonth.year}/${yearMonth.month.toString().padStart(2, '0')}`
}

export const yearMonthRange = (startMonth: YearMonth, endMonth: YearMonth | null) => {
  if (!endMonth) {
    return `${yearMonthToString(startMonth)} ~`
  }

  return `${yearMonthToString(startMonth)} ~ ${yearMonthToString(endMonth)}`
}

export const compareYearMonth = (x: YearMonth, y: YearMonth) => {
  if (x.year !== y.year) {
    return x.year < y.year ? -1 : 1
  }

  return x.month < y.month ? -1 : 1
}
