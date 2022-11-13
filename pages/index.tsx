import Head from 'next/head'
import styles from '../styles/Home.module.css'

export default function Home() {
  return (
    <div className={styles.container}>
      <Head>
        <title>meriy100 portfolio</title>
        <meta name="description" content="meriy100 portfolio" />
        <link rel="icon" href="/favicon.ico" />
      </Head>

      <main className={styles.main}>
        <h1 className={styles.title}>
          meriy100 portfolio
        </h1>
        <address>
          kouta@meriy100.com
        </address>
        <article className={styles.description}>
          Kouta Kariyado - 苅宿 航太
        </article>
      </main>

      <footer className={styles.footer}>
      </footer>
    </div>
  )
}
