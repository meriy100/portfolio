import React from 'react'

const nl2br = (text: string) => {
  const regex = /(\n)/g
  let idx = 0
  return text.split(regex).map((line) => {
    if (line.match(regex)) {
      idx += 1
      return React.createElement('br', { key: idx })
    } else {
      return line
    }
  })
}

export default function Nl2Br({ text }: { text: string }) {
  return <p>{nl2br(text)}</p>
}
