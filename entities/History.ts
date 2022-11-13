import { YearMonth, compareYearMonth } from './YearMonth'
import { notEmpty } from '../utils/func'

export interface History {
  organization: string
  products: Product[]
}

export interface Product {
  title: string
  startMonth: YearMonth
  endMonth: YearMonth | null
  description: string[]
  technologies: string[]
}

export const historyStartMonth = (history: History) => {
  return history.products.map((p) => p.startMonth).sort(compareYearMonth)[0]
}
export const historyEndMonth = (history: History): YearMonth | null => {
  return (
    history.products
      .map((p) => p.endMonth)
      .filter(notEmpty)
      .sort(compareYearMonth)
      .slice(-1)[0] || null
  )
}

export const compareProduct = (x: Product, y: Product) => {
  return compareYearMonth(x.startMonth, y.startMonth)
}

export const compareHistory = (x: History, y: History) => {
  return compareYearMonth(historyStartMonth(x), historyStartMonth(y))
}
