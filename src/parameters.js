const util = require('./util');

// eslint-disable-next-line
const bigNumberStringEndpointId = '0x5880c06932463a4e8d9ffe87ac43db110767fe4f47f669990284f7ced6b73a69';
// eslint-disable-next-line
const bigNumberRawEndpointId = '0x67bd2cbbdd1fc9a7602e1009b4261ebea23a3b1135092756b964a69cc3ecab48';

module.exports = {
  providerId:
    util.readFromReceipt('providerId') || '0x23722bcdd23e559d7151db284f290fadde9f3cb725859d476ef1f16ab315355e',
  endpointId: '0xc5bcd7fc3c655a87b32a0f2314b2bbf7b55b7c7c5d47bec4fc61863dd76d665a',
};
