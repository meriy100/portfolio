import Head from 'next/head'
import styles from '../styles/Home.module.css'
import Nl2Br from '../components/nl2br'

interface Response<T> {
  data: T
}

interface Profile {
  job: string
  description: string
  timestamp: string
}

interface Month {
  year: number
  month: number
}

interface Product {
  title: string
  startMonth: Month
  endMonth: Month | null
  description: string[]
  technologies: string[]
}

interface History {
  organization: string
  products: Product[]
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
      </main>
      <div>
        <h1>職務経歴</h1>
      </div>

      <footer className={styles.footer}></footer>
    </div>
  )
}
