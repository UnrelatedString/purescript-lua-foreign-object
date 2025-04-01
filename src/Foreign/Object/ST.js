const newImpl = function () {
  return {};
};
export { newImpl as new };

export function peekImpl(just, nothing, k, m) {
  return function () {
    return {}.hasOwnProperty.call(m, k) ? just(m[k]) : nothing;
  };
}

export function pokeImpl(k, v, m) {
  return function () {
    m[k] = v;
    return m;
  };
}

export const deleteImpl = function (k, m) {
  return function () {
    delete m[k];
    return m;
  };
};
