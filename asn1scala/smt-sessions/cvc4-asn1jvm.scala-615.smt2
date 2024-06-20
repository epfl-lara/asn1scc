; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17468 () Bool)

(assert start!17468)

(declare-fun b!84180 () Bool)

(declare-fun res!69112 () Bool)

(declare-fun e!56282 () Bool)

(assert (=> b!84180 (=> (not res!69112) (not e!56282))))

(declare-datatypes ((array!3985 0))(
  ( (array!3986 (arr!2441 (Array (_ BitVec 32) (_ BitVec 8))) (size!1804 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3170 0))(
  ( (BitStream!3171 (buf!2194 array!3985) (currentByte!4352 (_ BitVec 32)) (currentBit!4347 (_ BitVec 32))) )
))
(declare-fun thiss!1136 () BitStream!3170)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!84180 (= res!69112 (invariant!0 (currentBit!4347 thiss!1136) (currentByte!4352 thiss!1136) (size!1804 (buf!2194 thiss!1136))))))

(declare-fun b!84181 () Bool)

(declare-fun res!69110 () Bool)

(assert (=> b!84181 (=> (not res!69110) (not e!56282))))

(declare-fun nBits!333 () (_ BitVec 32))

(assert (=> b!84181 (= res!69110 (bvslt #b00000000000000000000000000000000 nBits!333))))

(declare-fun b!84182 () Bool)

(declare-fun e!56281 () Bool)

(declare-fun array_inv!1650 (array!3985) Bool)

(assert (=> b!84182 (= e!56281 (array_inv!1650 (buf!2194 thiss!1136)))))

(declare-fun b!84183 () Bool)

(declare-fun res!69109 () Bool)

(assert (=> b!84183 (=> (not res!69109) (not e!56282))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!84183 (= res!69109 (validate_offset_bits!1 ((_ sign_extend 32) (size!1804 (buf!2194 thiss!1136))) ((_ sign_extend 32) (currentByte!4352 thiss!1136)) ((_ sign_extend 32) (currentBit!4347 thiss!1136)) ((_ sign_extend 32) nBits!333)))))

(declare-fun res!69111 () Bool)

(assert (=> start!17468 (=> (not res!69111) (not e!56282))))

(assert (=> start!17468 (= res!69111 (and (bvsge nBits!333 #b00000000000000000000000000000000) (bvsle nBits!333 #b00000000000000000000000001000000)))))

(assert (=> start!17468 e!56282))

(assert (=> start!17468 true))

(declare-fun inv!12 (BitStream!3170) Bool)

(assert (=> start!17468 (and (inv!12 thiss!1136) e!56281)))

(declare-fun b!84184 () Bool)

(assert (=> b!84184 (= e!56282 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!1804 (buf!2194 thiss!1136))) ((_ sign_extend 32) (currentByte!4352 thiss!1136)) ((_ sign_extend 32) (currentBit!4347 thiss!1136)) ((_ sign_extend 32) nBits!333))))))

(declare-fun lt!134169 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!84184 (= lt!134169 (bitIndex!0 (size!1804 (buf!2194 thiss!1136)) (currentByte!4352 thiss!1136) (currentBit!4347 thiss!1136)))))

(assert (= (and start!17468 res!69111) b!84183))

(assert (= (and b!84183 res!69109) b!84180))

(assert (= (and b!84180 res!69112) b!84181))

(assert (= (and b!84181 res!69110) b!84184))

(assert (= start!17468 b!84182))

(declare-fun m!130867 () Bool)

(assert (=> b!84183 m!130867))

(declare-fun m!130869 () Bool)

(assert (=> b!84180 m!130869))

(assert (=> b!84184 m!130867))

(declare-fun m!130871 () Bool)

(assert (=> b!84184 m!130871))

(declare-fun m!130873 () Bool)

(assert (=> b!84182 m!130873))

(declare-fun m!130875 () Bool)

(assert (=> start!17468 m!130875))

(push 1)

(assert (not b!84182))

(assert (not b!84183))

(assert (not start!17468))

