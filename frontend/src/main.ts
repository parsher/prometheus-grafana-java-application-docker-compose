const app = document.querySelector<HTMLDivElement>('#app')!

app.innerHTML = `
  <h1>Monitoring Demo</h1>
  <button id="highCpuBtn">Trigger High CPU</button>
  <button id="memoryLeakBtn">Trigger Memory Leak</button>
  <button id="increaseThreadsBtn">Increase Threads</button>
`

const highCpuBtn = document.querySelector<HTMLButtonElement>('#highCpuBtn')!
const memoryLeakBtn = document.querySelector<HTMLButtonElement>('#memoryLeakBtn')!
const increaseThreadsBtn = document.querySelector<HTMLButtonElement>('#increaseThreadsBtn')!

highCpuBtn.addEventListener('click', () => {
  fetch('http://localhost/api/monitor/high-cpu')
    .then(response => response.text())
    .then(data => console.log(data))
})

memoryLeakBtn.addEventListener('click', () => {
  fetch('http://localhost/api/monitor/memory-leak')
    .then(response => response.text())
    .then(data => console.log(data))
})

increaseThreadsBtn.addEventListener('click', () => {
  fetch('http://localhost/api/monitor/increase-threads')
    .then(response => response.text())
    .then(data => console.log(data))
})
