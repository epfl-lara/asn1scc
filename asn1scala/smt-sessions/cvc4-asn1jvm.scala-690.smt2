; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19406 () Bool)

(assert start!19406)

(declare-fun b!96913 () Bool)

(declare-fun res!79535 () Bool)

(declare-fun e!63529 () Bool)

(assert (=> b!96913 (=> (not res!79535) (not e!63529))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!96913 (= res!79535 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!96914 () Bool)

(declare-datatypes ((array!4532 0))(
  ( (array!4533 (arr!2666 (Array (_ BitVec 32) (_ BitVec 8))) (size!2073 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3620 0))(
  ( (BitStream!3621 (buf!2419 array!4532) (currentByte!4826 (_ BitVec 32)) (currentBit!4821 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3620)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!96914 (= e!63529 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2073 (buf!2419 thiss!1288))) ((_ sign_extend 32) (currentByte!4826 thiss!1288)) ((_ sign_extend 32) (currentBit!4821 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!96915 () Bool)

(declare-fun e!63530 () Bool)

(declare-fun array_inv!1875 (array!4532) Bool)

(assert (=> b!96915 (= e!63530 (array_inv!1875 (buf!2419 thiss!1288)))))

(declare-fun b!96912 () Bool)

(declare-fun res!79536 () Bool)

(assert (=> b!96912 (=> (not res!79536) (not e!63529))))

(assert (=> b!96912 (= res!79536 (validate_offset_bits!1 ((_ sign_extend 32) (size!2073 (buf!2419 thiss!1288))) ((_ sign_extend 32) (currentByte!4826 thiss!1288)) ((_ sign_extend 32) (currentBit!4821 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun res!79537 () Bool)

(assert (=> start!19406 (=> (not res!79537) (not e!63529))))

(assert (=> start!19406 (= res!79537 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19406 e!63529))

(assert (=> start!19406 true))

(declare-fun inv!12 (BitStream!3620) Bool)

(assert (=> start!19406 (and (inv!12 thiss!1288) e!63530)))

(assert (= (and start!19406 res!79537) b!96912))

(assert (= (and b!96912 res!79536) b!96913))

(assert (= (and b!96913 res!79535) b!96914))

(assert (= start!19406 b!96915))

(declare-fun m!140545 () Bool)

(assert (=> b!96913 m!140545))

(declare-fun m!140547 () Bool)

(assert (=> start!19406 m!140547))

(declare-fun m!140549 () Bool)

(assert (=> b!96915 m!140549))

(declare-fun m!140551 () Bool)

(assert (=> b!96912 m!140551))

(assert (=> b!96914 m!140551))

(push 1)

(assert (not b!96913))

(assert (not b!96915))

(assert (not b!96912))

(assert (not start!19406))

(assert (not b!96914))

(check-sat)

(pop 1)

