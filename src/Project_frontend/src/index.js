import { Project_backend } from "../../declarations/Project_backend";

const form = document.querySelector('form');

const output=document.querySelector('#output')

form.addEventListener('submit', takeString);

async function takeString(e) {
  e.preventDefault();
  const firstString = document.querySelector('#data').value;
  let arrayData = firstString.split(',');
  arrayData = arrayData.map(number => parseInt(number));
  arrayData=arrayData.sort();
  const result = await Project_backend.calculate(arrayData);
  const paragraphMean = document.createElement('p');
  paragraphMean.textContent=`The mean of data is: ${result[0]}`;
  const paragraphMedium = document.createElement('p');
  paragraphMedium.textContent=`The medium of data is: ${result[1]}`;
  output.appendChild(paragraphMean);
  output.appendChild(paragraphMedium);
  return false;
}