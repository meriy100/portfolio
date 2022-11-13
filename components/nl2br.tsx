import React from 'react'

const nl2br = (text: string) => {
  const regex = /(\r*\n)/g
  return text.split(regex).map((line) => {
    if (line.match(regex)) {
      return React.createElement('br')
    } else {
      return line
    }
  })
}

export default function Nl2Br({ text }: { text: string }) {
  return <p>{nl2br(text)}</p>
}
