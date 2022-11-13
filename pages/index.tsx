import Head from 'next/head'
import styles from '../styles/Home.module.css'

interface Response<T> {
  data: T
}

interface Profile {
  job: string
  description: string
  timestamp: string
}

export async function getServerSideProps() {
  const res = await fetch(`http://localhost:8082/profile`)
  const data: Response<Profile> = await res.json()
  return { props: { profile: data.data } }
}

export default function Home({ profile }: { profile: Profile }) {
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
          <p>{profile.description}</p>
        </article>
      </main>

      <footer className={styles.footer}></footer>
    </div>
  )
}
