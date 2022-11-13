import Head from 'next/head'
import styles from '../styles/Home.module.scss'
import Nl2Br from '../components/nl2br'
import { yearMonthRange } from '../entities/YearMonth'
import { History, historyStartMonth, historyEndMonth, compareHistory, compareProduct } from '../entities/History'

interface Response<T> {
  data: T
}

interface Profile {
  job: string
  description: string
  timestamp: string
}

async function fetchProfile() {
  const res = await fetch(`${process.env.API_HOST}/profile`)
  const data: Response<Profile> = await res.json()
  return data.data
}

async function fetchHistories() {
  const res = await fetch(`${process.env.API_HOST}/histories`)
  const data: Response<History[]> = await res.json()
  return data.data
}

export async function getServerSideProps() {
  const profile = await fetchProfile()
  const histories = await fetchHistories()
  return { props: { profile, histories } }
}

export default function Home({ profile, histories }: { profile: Profile; histories: History[] }) {
  return (
    <div className={styles.container}>
      <Head>
        <title>meriy100 portfolio</title>
        <meta name="description" content="meriy100 portfolio" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>meriy100 portfolio</h1>
        <address>kouta@meriy100.com</address>
        <article className={styles.description}>
          Kouta Kariyado - 苅宿 航太
          <p>{profile.job}</p>
          <Nl2Br text={profile.description} />
        </article>
        <div>
          <h1>職務経歴</h1>
          {histories
            .sort(compareHistory)
            .reverse()
            .map((history) => (
              <div key={history.organization}>
                <h2>
                  {history.organization}
                  <span>{yearMonthRange(historyStartMonth(history), historyEndMonth(history))}</span>
                </h2>
                {history.products
                  .sort(compareProduct)
                  .reverse()
                  .map((product) => (
                    <div key={product.title}>
                      <h3>{product.title}</h3>
                      <p>{yearMonthRange(product.startMonth, product.endMonth)}</p>
                      <ul>
                        {product.description.map((text) => (
                          <li key={text}>{text}</li>
                        ))}
                      </ul>
                      <h4>利用技術など</h4>
                      <ul>
                        {product.technologies.map((text) => (
                          <li key={text}>{text}</li>
                        ))}
                      </ul>
                    </div>
                  ))}
              </div>
            ))}
        </div>
      </main>
      <footer className={styles.footer}></footer>
    </div>
  )
}
