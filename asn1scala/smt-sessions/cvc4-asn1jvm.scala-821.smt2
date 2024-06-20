; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24384 () Bool)

(assert start!24384)

(declare-fun res!102767 () Bool)

(declare-fun e!81260 () Bool)

(assert (=> start!24384 (=> (not res!102767) (not e!81260))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!24384 (= res!102767 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24384 e!81260))

(assert (=> start!24384 true))

(declare-datatypes ((array!5445 0))(
  ( (array!5446 (arr!3056 (Array (_ BitVec 32) (_ BitVec 8))) (size!2463 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4400 0))(
  ( (BitStream!4401 (buf!2909 array!5445) (currentByte!5615 (_ BitVec 32)) (currentBit!5610 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4400)

(declare-fun e!81261 () Bool)

(declare-fun inv!12 (BitStream!4400) Bool)

(assert (=> start!24384 (and (inv!12 thiss!1305) e!81261)))

(declare-fun b!123969 () Bool)

(assert (=> b!123969 (= e!81260 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-fun lt!195686 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123969 (= lt!195686 (bitIndex!0 (size!2463 (buf!2909 thiss!1305)) (currentByte!5615 thiss!1305) (currentBit!5610 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4400 BitStream!4400) Bool)

(assert (=> b!123969 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7670 0))(
  ( (Unit!7671) )
))
(declare-fun lt!195687 () Unit!7670)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4400) Unit!7670)

(assert (=> b!123969 (= lt!195687 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!123970 () Bool)

(declare-fun array_inv!2265 (array!5445) Bool)

(assert (=> b!123970 (= e!81261 (array_inv!2265 (buf!2909 thiss!1305)))))

(declare-fun b!123971 () Bool)

(declare-fun res!102766 () Bool)

(assert (=> b!123971 (=> (not res!102766) (not e!81260))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!123971 (= res!102766 (validate_offset_bits!1 ((_ sign_extend 32) (size!2463 (buf!2909 thiss!1305))) ((_ sign_extend 32) (currentByte!5615 thiss!1305)) ((_ sign_extend 32) (currentBit!5610 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!123972 () Bool)

(declare-fun res!102765 () Bool)

(assert (=> b!123972 (=> (not res!102765) (not e!81260))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123972 (= res!102765 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!123973 () Bool)

(declare-fun res!102768 () Bool)

(assert (=> b!123973 (=> (not res!102768) (not e!81260))))

(assert (=> b!123973 (= res!102768 (bvsge i!615 nBits!396))))

(assert (= (and start!24384 res!102767) b!123971))

(assert (= (and b!123971 res!102766) b!123972))

(assert (= (and b!123972 res!102765) b!123973))

(assert (= (and b!123973 res!102768) b!123969))

(assert (= start!24384 b!123970))

(declare-fun m!189203 () Bool)

(assert (=> b!123971 m!189203))

(declare-fun m!189205 () Bool)

(assert (=> b!123970 m!189205))

(declare-fun m!189207 () Bool)

(assert (=> start!24384 m!189207))

(declare-fun m!189209 () Bool)

(assert (=> b!123972 m!189209))

(declare-fun m!189211 () Bool)

(assert (=> b!123969 m!189211))

(declare-fun m!189213 () Bool)

(assert (=> b!123969 m!189213))

(declare-fun m!189215 () Bool)

(assert (=> b!123969 m!189215))

(push 1)

(assert (not start!24384))

(assert (not b!123971))

(assert (not b!123969))

(assert (not b!123972))

(assert (not b!123970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

