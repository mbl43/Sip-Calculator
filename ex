import React, { useEffect, useState } from "react";
import { Doughnut } from "react-chartjs-2";
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from "chart.js";

// Register components of Chart.js
ChartJS.register(ArcElement, Tooltip, Legend);
const Sip = () => {
 

  const [monthly_invest, setmonthly_invest] = useState("");
  const [roi, setroi] = useState("");
  const [time, settime] = useState("");

  // Results state
  const [resulmonthly_invest, setresultmonthly_invest] = useState("");
  const [resultroi, setresultroi] = useState("");
  const [resulttime, setresulttime] = useState("");

  const calculate = (e) => {
    e.preventDefault();
    const monthly_invest1 = parseInt(monthly_invest);
    const time1 = parseInt(time);
    const roi1 = parseFloat(roi) / 100;

    if (monthly_invest1 <= 0 || time1 <= 0 || roi1 <= 0) {
      alert("Please don't enter negative or zero values.");
      return;
    }
    if (isNaN(monthly_invest1) || isNaN(time1) || isNaN(roi1)) {
      alert("Please enter valid numeric values.");
      return;
    }
    const n = 12;
    const p = time1 * 12;
    const monthly_int_rate = roi1 / n;
    const total_invest = monthly_invest1 * p;
    const total_return =
      monthly_invest1 *
      (((Math.pow(1 + monthly_int_rate, p) - 1) / monthly_int_rate) *
        (1 + monthly_int_rate));

    const wealth_gain = total_return - total_invest;

    setresultmonthly_invest(total_invest.toFixed(2));
    setresulttime(wealth_gain.toFixed(2));
    setresultroi(total_return.toFixed(2));
    console.log(
      "monthly investment:",
      monthly_invest,
      "rate of interest:",
      roi,
      "time period",
      time
    );
    
  };

 // chartjs data
 const data = {
  labels: ["Invested Amount", "Est. Returns"],
  datasets: [
    {
      label: "My Dataset",
      data: [resulmonthly_invest, resulttime],
      backgroundColor: ["blue", "green"],
    },
  ],
};

const options = {
  responsive: true,
  plugins: {
    tooltip: {
      callbacks: {
        label: function (tooltipItem) {
          return `${tooltipItem.label}: ${tooltipItem.raw} rs`;
        },
      },
    },
  },
  cutout: "70%", // Makes it a donut shape
};

  
  // Reset function
  const reset = (e) => {
    e.preventDefault();
    setmonthly_invest("");
    setroi("");
    settime("");
    setresultmonthly_invest("");
    setresulttime("");
    setresultroi("");
  };



  return (
    <div className="w-full h-screen bg-gradient-to-r flex items-center justify-center sm:flex-row flex-col relative sm:top-0 top-20">
      <div className="flex flex-col w-full sm:w-[450px] rounded-2xl p-8 border-2 justify-center items-center border-white m-10 shadow-2xl bg-white bg-opacity-90">

      <form
        className=""
        onSubmit={calculate}
        >
        <h2 className="font-bold text-4xl text-gray-800 mb-6">
          SIP Calculator
        </h2>

        {/* Monthly Investment */}
        <label
          htmlFor="monthly-invest"
          className="text-lg font-semibold text-gray-700 w-full mb-4"
          >
          Monthly Investment (₹): <span>{monthly_invest}</span>
          <input
            type="range"
            name="monthly-invest"
            value={monthly_invest}
            onChange={(e) => setmonthly_invest(e.target.value)}
            className="my-2 w-full shadow-lg space-x-2 cursor-cursor-pointer"
            required
            min={500}
            step={500}
            max={100000}
            />
        </label>

        {/* Rate of Interest */}
        <label
          htmlFor="roi"
          className="text-lg font-semibold text-gray-700 w-full mb-4"
          >
          Rate of Interest (%):{roi}
          <input
            type="range"
            name="roi"
            min={1}
            max={30}
            step={0.5}
            value={roi}
            onChange={(e) => setroi(e.target.value)}
            className="my-2 cursor-pointer w-full shadow-lg "
            required
            />
        </label>

        {/* Time Period */}
        <label
          htmlFor="period"
          className="text-lg font-semibold text-gray-700 w-full mb-4 "
          >
          Time Period (Years):{time}
          <input
            type="range"
            name="period"
            min={1}
            max={50}
            value={time}
            onChange={(e) => settime(e.target.value)}
            className="my-2 w-full shadow-lg cursor-pointer"
            required
            />
        </label>

        {/* Buttons */}
        <div className="flex space-x-3 w-full justify-between mt-6">
          <button className="border-2 border-blue-500 bg-gradient-to-r from-blue-400 to-blue-600 text-white w-[100px] hover:from-blue-500 hover:to-blue-700 transition rounded-lg p-3 shadow-md">
            Calculate
          </button>
          <button
            className="border-2 border-red-500 bg-gradient-to-r from-red-400 to-red-600 text-white w-[100px] hover:from-red-500 hover:to-red-700 transition rounded-lg p-3 shadow-md"
            onClick={reset}
            >
            Reset
          </button>
        </div>
      </form>
      {/* result */}
      <div className="w-full sm:w-[350px] p-6 mt-8 mx-5 bg-gradient-to-r from-blue-400 to-purple-500 rounded-xl shadow-xl text-white">
        <h3 className="text-2xl font-semibold mb-4">Results</h3>
        {
          <div>
            <p className="text-lg mb-2">
              <strong>Total Investment:</strong> ₹ {resulmonthly_invest}
            </p>
            <p className="text-lg mb-2">
              <strong>Total Return:</strong> ₹ {resultroi}
            </p>
            <p className="text-lg mb-2">
              <strong>Wealth Gain:</strong> ₹ {resulttime}
            </p>
          </div>
        }
      </div>
              </div>

      {/* Results Section */}
     
      <div className="min-w-[350px]">
        <h2>SIP Calculator</h2>

        <Doughnut data={data} options={options} />
      </div>
    </div>
  );
};

export default Sip;


// import React from 'react'
import { github, main, linkdin, mbl, mail } from "../assets/export";

const Contactform = () => {
  return (
    <div className="h-screen w-full  ">
      <div className="flex justify-center items-center flex-col w-full h-full mx-auto md:flex-col">
        <div className="shadow-2xl rounded-2xl items-center justify-center flex   flex-col md:flex-row  p-10 ">
          <div className="rounded w-full">
            <img src={main} alt="contact image" className="rounded-lg" />
            <div className="flex flex-row space-x-7 items-center justify-center">
              <a href="http://">
                <img
                  src={github}
                  alt=""
                  className="w-9 md:w-11 hover:scale-125 rounded-xl"
                />
              </a>
              <a href="http://">
                <img
                  src={linkdin}
                  alt=""
                  className="w-9 md:w-11 hover:scale-125 rounded-xl "
                />
              </a>
              <a href="http://">
                <img
                  src={mbl}
                  alt=""
                  className="w-9 md:w-11 hover:scale-125 rounded-xl"
                />
              </a>
              <a href="http://">
                <img
                  src={mail}
                  alt=""
                  className="w-9 md:w-11 hover:scale-125 rounded-xl"
                />
              </a>
            </div>
          </div>

          <div className="flex justify-center items-center flex-col w-full sm:mt-6 m-3 mt-8">
            <h2 className="text-4xl font-semibold text-center mb-6">
              Contact Me
            </h2>
            <form
              action=""
              method="post"
              className="flex justify-center items-center flex-col space-y-4 w-full"
            >
              <input
                className="border-b-2 rounded-xl p-2 w-full text-gray-700 focus:outline-none"
                type="text"
                name="name"
                placeholder="Enter Your Name"
                required
              />
              <input
                className="border-b-2 rounded-xl p-2 w-full text-gray-700  focus:outline-none "
                type="email"
                name="email"
                placeholder="Enter Your Mail"
                required
              />
              <textarea
                className="border-b-2 rounded-xl p-2 w-full text-gray-700  focus:outline-none  "
                name="message"
                rows="5"
                placeholder="Enter your message here"
                required
              ></textarea>
              <button
                type="submit"
                className="  py-2 px-4 bg-blue-600 text-white font-semibold rounded-xl hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full"
              >
                Submit
              </button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Contactform;
