import {Elm} from "./Main.elm";
import './styles/style.scss';

const contents = require('./contents/histories.ja.yml');
console.log(contents);

// Elm.Main.init({
//     node: document.getElementById("elm-node")
// });

const storageKey = "store";
const flags = { storeKey: localStorage.getItem(storageKey), contents: contents };
const app = Elm.Main.init({flags: JSON.stringify(flags)});
