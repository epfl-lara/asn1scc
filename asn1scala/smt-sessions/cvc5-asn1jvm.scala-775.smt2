; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22320 () Bool)

(assert start!22320)

(declare-fun b!112845 () Bool)

(declare-fun e!74038 () Bool)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!112845 (= e!74038 (and (bvslt i!615 nBits!396) (let ((bdg!5564 (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!5564 (bvand i!615 #b10000000000000000000000000000000))) (not (= bdg!5564 (bvand (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615) #b10000000000000000000000000000000)))))))))

(declare-fun b!112843 () Bool)

(declare-fun res!93174 () Bool)

(assert (=> b!112843 (=> (not res!93174) (not e!74038))))

(declare-datatypes ((array!5111 0))(
  ( (array!5112 (arr!2916 (Array (_ BitVec 32) (_ BitVec 8))) (size!2323 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4120 0))(
  ( (BitStream!4121 (buf!2731 array!5111) (currentByte!5305 (_ BitVec 32)) (currentBit!5300 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4120)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112843 (= res!93174 (validate_offset_bits!1 ((_ sign_extend 32) (size!2323 (buf!2731 thiss!1305))) ((_ sign_extend 32) (currentByte!5305 thiss!1305)) ((_ sign_extend 32) (currentBit!5300 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!93175 () Bool)

(assert (=> start!22320 (=> (not res!93175) (not e!74038))))

(assert (=> start!22320 (= res!93175 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22320 e!74038))

(assert (=> start!22320 true))

(declare-fun e!74040 () Bool)

(declare-fun inv!12 (BitStream!4120) Bool)

(assert (=> start!22320 (and (inv!12 thiss!1305) e!74040)))

(declare-fun b!112846 () Bool)

(declare-fun array_inv!2125 (array!5111) Bool)

(assert (=> b!112846 (= e!74040 (array_inv!2125 (buf!2731 thiss!1305)))))

(declare-fun b!112844 () Bool)

(declare-fun res!93176 () Bool)

(assert (=> b!112844 (=> (not res!93176) (not e!74038))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112844 (= res!93176 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22320 res!93175) b!112843))

(assert (= (and b!112843 res!93174) b!112844))

(assert (= (and b!112844 res!93176) b!112845))

(assert (= start!22320 b!112846))

(declare-fun m!168937 () Bool)

(assert (=> b!112843 m!168937))

(declare-fun m!168939 () Bool)

(assert (=> start!22320 m!168939))

(declare-fun m!168941 () Bool)

(assert (=> b!112846 m!168941))

(declare-fun m!168943 () Bool)

(assert (=> b!112844 m!168943))

(push 1)

(assert (not b!112846))

(assert (not b!112843))

(assert (not start!22320))

(assert (not b!112844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

