"use strict";var n=Object.defineProperty;var i=Object.getOwnPropertyDescriptor;var l=Object.getOwnPropertyNames;var p=Object.prototype.hasOwnProperty;var s=(o,a)=>{for(var r in a)n(o,r,{get:a[r],enumerable:!0})},u=(o,a,r,c)=>{if(a&&typeof a=="object"||typeof a=="function")for(let e of l(a))!p.call(o,e)&&e!==r&&n(o,e,{get:()=>a[e],enumerable:!(c=i(a,e))||c.enumerable});return o};var d=o=>u(n({},"__esModule",{value:!0}),o);var m={};s(m,{default:()=>f});module.exports=d(m);var t=require("@raycast/api"),f=async()=>{(0,t.open)("cleanshot://capture-previous-area"),await(0,t.closeMainWindow)()};0&&(module.exports={});