; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19402 () Bool)

(assert start!19402)

(declare-fun b!96888 () Bool)

(declare-fun res!79518 () Bool)

(declare-fun e!63512 () Bool)

(assert (=> b!96888 (=> (not res!79518) (not e!63512))))

(declare-datatypes ((array!4528 0))(
  ( (array!4529 (arr!2664 (Array (_ BitVec 32) (_ BitVec 8))) (size!2071 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3616 0))(
  ( (BitStream!3617 (buf!2417 array!4528) (currentByte!4824 (_ BitVec 32)) (currentBit!4819 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3616)

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96888 (= res!79518 (validate_offset_bits!1 ((_ sign_extend 32) (size!2071 (buf!2417 thiss!1288))) ((_ sign_extend 32) (currentByte!4824 thiss!1288)) ((_ sign_extend 32) (currentBit!4819 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!96891 () Bool)

(declare-fun e!63513 () Bool)

(declare-fun array_inv!1873 (array!4528) Bool)

(assert (=> b!96891 (= e!63513 (array_inv!1873 (buf!2417 thiss!1288)))))

(declare-fun b!96890 () Bool)

(assert (=> b!96890 (= e!63512 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2071 (buf!2417 thiss!1288))) ((_ sign_extend 32) (currentByte!4824 thiss!1288)) ((_ sign_extend 32) (currentBit!4819 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!96889 () Bool)

(declare-fun res!79517 () Bool)

(assert (=> b!96889 (=> (not res!79517) (not e!63512))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96889 (= res!79517 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun res!79519 () Bool)

(assert (=> start!19402 (=> (not res!79519) (not e!63512))))

(assert (=> start!19402 (= res!79519 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19402 e!63512))

(assert (=> start!19402 true))

(declare-fun inv!12 (BitStream!3616) Bool)

(assert (=> start!19402 (and (inv!12 thiss!1288) e!63513)))

(assert (= (and start!19402 res!79519) b!96888))

(assert (= (and b!96888 res!79518) b!96889))

(assert (= (and b!96889 res!79517) b!96890))

(assert (= start!19402 b!96891))

(declare-fun m!140529 () Bool)

(assert (=> b!96890 m!140529))

(declare-fun m!140531 () Bool)

(assert (=> b!96889 m!140531))

(declare-fun m!140533 () Bool)

(assert (=> start!19402 m!140533))

(declare-fun m!140535 () Bool)

(assert (=> b!96891 m!140535))

(assert (=> b!96888 m!140529))

(push 1)

(assert (not b!96888))

(assert (not b!96891))

(assert (not b!96889))

(assert (not start!19402))

(assert (not b!96890))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

