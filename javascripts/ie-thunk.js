/*!
  Copyright © 2017, Michael Winter.
  MIT License.
*/
if (window && (typeof window.setImmediate === 'function') && (typeof window.setImmediate.bind === 'function')) {
  window.setImmediate = window.setImmediate.bind(window);
}
