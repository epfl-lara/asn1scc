; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22314 () Bool)

(assert start!22314)

(declare-fun res!93147 () Bool)

(declare-fun e!74013 () Bool)

(assert (=> start!22314 (=> (not res!93147) (not e!74013))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22314 (= res!93147 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22314 e!74013))

(assert (=> start!22314 true))

(declare-datatypes ((array!5105 0))(
  ( (array!5106 (arr!2913 (Array (_ BitVec 32) (_ BitVec 8))) (size!2320 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4114 0))(
  ( (BitStream!4115 (buf!2728 array!5105) (currentByte!5302 (_ BitVec 32)) (currentBit!5297 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4114)

(declare-fun e!74012 () Bool)

(declare-fun inv!12 (BitStream!4114) Bool)

(assert (=> start!22314 (and (inv!12 thiss!1305) e!74012)))

(declare-fun b!112809 () Bool)

(assert (=> b!112809 (= e!74013 (and (bvslt i!615 nBits!396) (not (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun b!112810 () Bool)

(declare-fun array_inv!2122 (array!5105) Bool)

(assert (=> b!112810 (= e!74012 (array_inv!2122 (buf!2728 thiss!1305)))))

(declare-fun b!112808 () Bool)

(declare-fun res!93148 () Bool)

(assert (=> b!112808 (=> (not res!93148) (not e!74013))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112808 (= res!93148 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112807 () Bool)

(declare-fun res!93149 () Bool)

(assert (=> b!112807 (=> (not res!93149) (not e!74013))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112807 (= res!93149 (validate_offset_bits!1 ((_ sign_extend 32) (size!2320 (buf!2728 thiss!1305))) ((_ sign_extend 32) (currentByte!5302 thiss!1305)) ((_ sign_extend 32) (currentBit!5297 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!22314 res!93147) b!112807))

(assert (= (and b!112807 res!93149) b!112808))

(assert (= (and b!112808 res!93148) b!112809))

(assert (= start!22314 b!112810))

(declare-fun m!168913 () Bool)

(assert (=> start!22314 m!168913))

(declare-fun m!168915 () Bool)

(assert (=> b!112810 m!168915))

(declare-fun m!168917 () Bool)

(assert (=> b!112808 m!168917))

(declare-fun m!168919 () Bool)

(assert (=> b!112807 m!168919))

(push 1)

(assert (not start!22314))

(assert (not b!112807))

(assert (not b!112808))

(assert (not b!112810))

(check-sat)

(pop 1)

(push 1)

(check-sat)

