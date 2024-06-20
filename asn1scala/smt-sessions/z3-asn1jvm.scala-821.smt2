; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24382 () Bool)

(assert start!24382)

(declare-fun b!123954 () Bool)

(declare-fun res!102753 () Bool)

(declare-fun e!81250 () Bool)

(assert (=> b!123954 (=> (not res!102753) (not e!81250))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!123954 (= res!102753 (bvsge i!615 nBits!396))))

(declare-fun b!123956 () Bool)

(declare-fun e!81252 () Bool)

(declare-datatypes ((array!5443 0))(
  ( (array!5444 (arr!3055 (Array (_ BitVec 32) (_ BitVec 8))) (size!2462 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4398 0))(
  ( (BitStream!4399 (buf!2908 array!5443) (currentByte!5614 (_ BitVec 32)) (currentBit!5609 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4398)

(declare-fun array_inv!2264 (array!5443) Bool)

(assert (=> b!123956 (= e!81252 (array_inv!2264 (buf!2908 thiss!1305)))))

(declare-fun b!123957 () Bool)

(declare-fun res!102756 () Bool)

(assert (=> b!123957 (=> (not res!102756) (not e!81250))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!123957 (= res!102756 (validate_offset_bits!1 ((_ sign_extend 32) (size!2462 (buf!2908 thiss!1305))) ((_ sign_extend 32) (currentByte!5614 thiss!1305)) ((_ sign_extend 32) (currentBit!5609 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!123958 () Bool)

(assert (=> b!123958 (= e!81250 (not (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000)))))))

(declare-fun lt!195681 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123958 (= lt!195681 (bitIndex!0 (size!2462 (buf!2908 thiss!1305)) (currentByte!5614 thiss!1305) (currentBit!5609 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4398 BitStream!4398) Bool)

(assert (=> b!123958 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7668 0))(
  ( (Unit!7669) )
))
(declare-fun lt!195680 () Unit!7668)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4398) Unit!7668)

(assert (=> b!123958 (= lt!195680 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!123955 () Bool)

(declare-fun res!102755 () Bool)

(assert (=> b!123955 (=> (not res!102755) (not e!81250))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!123955 (= res!102755 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!102754 () Bool)

(assert (=> start!24382 (=> (not res!102754) (not e!81250))))

(assert (=> start!24382 (= res!102754 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24382 e!81250))

(assert (=> start!24382 true))

(declare-fun inv!12 (BitStream!4398) Bool)

(assert (=> start!24382 (and (inv!12 thiss!1305) e!81252)))

(assert (= (and start!24382 res!102754) b!123957))

(assert (= (and b!123957 res!102756) b!123955))

(assert (= (and b!123955 res!102755) b!123954))

(assert (= (and b!123954 res!102753) b!123958))

(assert (= start!24382 b!123956))

(declare-fun m!189189 () Bool)

(assert (=> b!123958 m!189189))

(declare-fun m!189191 () Bool)

(assert (=> b!123958 m!189191))

(declare-fun m!189193 () Bool)

(assert (=> b!123958 m!189193))

(declare-fun m!189195 () Bool)

(assert (=> start!24382 m!189195))

(declare-fun m!189197 () Bool)

(assert (=> b!123956 m!189197))

(declare-fun m!189199 () Bool)

(assert (=> b!123957 m!189199))

(declare-fun m!189201 () Bool)

(assert (=> b!123955 m!189201))

(check-sat (not b!123955) (not start!24382) (not b!123958) (not b!123956) (not b!123957))
(check-sat)
