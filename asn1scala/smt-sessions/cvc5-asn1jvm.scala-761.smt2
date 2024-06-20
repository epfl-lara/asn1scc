; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21844 () Bool)

(assert start!21844)

(declare-fun b!110169 () Bool)

(declare-fun e!72215 () Bool)

(assert (=> b!110169 (= e!72215 (not true))))

(declare-fun lt!166958 () (_ BitVec 64))

(declare-datatypes ((array!5024 0))(
  ( (array!5025 (arr!2877 (Array (_ BitVec 32) (_ BitVec 8))) (size!2284 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4042 0))(
  ( (BitStream!4043 (buf!2678 array!5024) (currentByte!5232 (_ BitVec 32)) (currentBit!5227 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4042)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110169 (= lt!166958 (bitIndex!0 (size!2284 (buf!2678 thiss!1305)) (currentByte!5232 thiss!1305) (currentBit!5227 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4042 BitStream!4042) Bool)

(assert (=> b!110169 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6733 0))(
  ( (Unit!6734) )
))
(declare-fun lt!166957 () Unit!6733)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4042) Unit!6733)

(assert (=> b!110169 (= lt!166957 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!90946 () Bool)

(assert (=> start!21844 (=> (not res!90946) (not e!72215))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21844 (= res!90946 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21844 e!72215))

(assert (=> start!21844 true))

(declare-fun e!72213 () Bool)

(declare-fun inv!12 (BitStream!4042) Bool)

(assert (=> start!21844 (and (inv!12 thiss!1305) e!72213)))

(declare-fun b!110170 () Bool)

(declare-fun res!90945 () Bool)

(assert (=> b!110170 (=> (not res!90945) (not e!72215))))

(assert (=> b!110170 (= res!90945 (bvsge i!615 nBits!396))))

(declare-fun b!110171 () Bool)

(declare-fun res!90944 () Bool)

(assert (=> b!110171 (=> (not res!90944) (not e!72215))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110171 (= res!90944 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110172 () Bool)

(declare-fun array_inv!2086 (array!5024) Bool)

(assert (=> b!110172 (= e!72213 (array_inv!2086 (buf!2678 thiss!1305)))))

(declare-fun b!110173 () Bool)

(declare-fun res!90943 () Bool)

(assert (=> b!110173 (=> (not res!90943) (not e!72215))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110173 (= res!90943 (validate_offset_bits!1 ((_ sign_extend 32) (size!2284 (buf!2678 thiss!1305))) ((_ sign_extend 32) (currentByte!5232 thiss!1305)) ((_ sign_extend 32) (currentBit!5227 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!21844 res!90946) b!110173))

(assert (= (and b!110173 res!90943) b!110171))

(assert (= (and b!110171 res!90944) b!110170))

(assert (= (and b!110170 res!90945) b!110169))

(assert (= start!21844 b!110172))

(declare-fun m!163763 () Bool)

(assert (=> b!110172 m!163763))

(declare-fun m!163765 () Bool)

(assert (=> start!21844 m!163765))

(declare-fun m!163767 () Bool)

(assert (=> b!110171 m!163767))

(declare-fun m!163769 () Bool)

(assert (=> b!110173 m!163769))

(declare-fun m!163771 () Bool)

(assert (=> b!110169 m!163771))

(declare-fun m!163773 () Bool)

(assert (=> b!110169 m!163773))

(declare-fun m!163775 () Bool)

(assert (=> b!110169 m!163775))

(push 1)

(assert (not b!110173))

(assert (not b!110171))

(assert (not b!110169))

(assert (not b!110172))

(assert (not start!21844))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

