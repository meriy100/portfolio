import {Elm} from "./Main.elm";
import './styles/style.scss'

// Elm.Main.init({
//     node: document.getElementById("elm-node")
// });

const storageKey = "store";
const flags = localStorage.getItem(storageKey);
const app = Elm.Main.init({flags: flags});
console.log("welcome webpack v4");