; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24380 () Bool)

(assert start!24380)

(declare-fun b!123939 () Bool)

(declare-fun res!102744 () Bool)

(declare-fun e!81241 () Bool)

(assert (=> b!123939 (=> (not res!102744) (not e!81241))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123939 (= res!102744 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!123940 () Bool)

(declare-fun res!102741 () Bool)

(assert (=> b!123940 (=> (not res!102741) (not e!81241))))

(declare-datatypes ((array!5441 0))(
  ( (array!5442 (arr!3054 (Array (_ BitVec 32) (_ BitVec 8))) (size!2461 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4396 0))(
  ( (BitStream!4397 (buf!2907 array!5441) (currentByte!5613 (_ BitVec 32)) (currentBit!5608 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4396)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!123940 (= res!102741 (validate_offset_bits!1 ((_ sign_extend 32) (size!2461 (buf!2907 thiss!1305))) ((_ sign_extend 32) (currentByte!5613 thiss!1305)) ((_ sign_extend 32) (currentBit!5608 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!123941 () Bool)

(declare-fun e!81243 () Bool)

(declare-fun array_inv!2263 (array!5441) Bool)

(assert (=> b!123941 (= e!81243 (array_inv!2263 (buf!2907 thiss!1305)))))

(declare-fun res!102742 () Bool)

(assert (=> start!24380 (=> (not res!102742) (not e!81241))))

(assert (=> start!24380 (= res!102742 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24380 e!81241))

(assert (=> start!24380 true))

(declare-fun inv!12 (BitStream!4396) Bool)

(assert (=> start!24380 (and (inv!12 thiss!1305) e!81243)))

(declare-fun b!123942 () Bool)

(assert (=> b!123942 (= e!81241 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-fun lt!195675 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123942 (= lt!195675 (bitIndex!0 (size!2461 (buf!2907 thiss!1305)) (currentByte!5613 thiss!1305) (currentBit!5608 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4396 BitStream!4396) Bool)

(assert (=> b!123942 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7666 0))(
  ( (Unit!7667) )
))
(declare-fun lt!195674 () Unit!7666)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4396) Unit!7666)

(assert (=> b!123942 (= lt!195674 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!123943 () Bool)

(declare-fun res!102743 () Bool)

(assert (=> b!123943 (=> (not res!102743) (not e!81241))))

(assert (=> b!123943 (= res!102743 (bvsge i!615 nBits!396))))

(assert (= (and start!24380 res!102742) b!123940))

(assert (= (and b!123940 res!102741) b!123939))

(assert (= (and b!123939 res!102744) b!123943))

(assert (= (and b!123943 res!102743) b!123942))

(assert (= start!24380 b!123941))

(declare-fun m!189175 () Bool)

(assert (=> b!123942 m!189175))

(declare-fun m!189177 () Bool)

(assert (=> b!123942 m!189177))

(declare-fun m!189179 () Bool)

(assert (=> b!123942 m!189179))

(declare-fun m!189181 () Bool)

(assert (=> b!123941 m!189181))

(declare-fun m!189183 () Bool)

(assert (=> b!123939 m!189183))

(declare-fun m!189185 () Bool)

(assert (=> start!24380 m!189185))

(declare-fun m!189187 () Bool)

(assert (=> b!123940 m!189187))

(push 1)

(assert (not start!24380))

(assert (not b!123941))

(assert (not b!123942))

(assert (not b!123939))

(assert (not b!123940))

(check-sat)

(pop 1)

(push 1)

(check-sat)

