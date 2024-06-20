; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24398 () Bool)

(assert start!24398)

(declare-fun b!124085 () Bool)

(declare-fun res!102862 () Bool)

(declare-fun e!81356 () Bool)

(assert (=> b!124085 (=> (not res!102862) (not e!81356))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124085 (= res!102862 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124086 () Bool)

(declare-fun e!81354 () Bool)

(declare-datatypes ((array!5459 0))(
  ( (array!5460 (arr!3063 (Array (_ BitVec 32) (_ BitVec 8))) (size!2470 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4414 0))(
  ( (BitStream!4415 (buf!2916 array!5459) (currentByte!5622 (_ BitVec 32)) (currentBit!5617 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4414)

(declare-fun array_inv!2272 (array!5459) Bool)

(assert (=> b!124086 (= e!81354 (array_inv!2272 (buf!2916 thiss!1305)))))

(declare-fun b!124087 () Bool)

(declare-fun res!102864 () Bool)

(assert (=> b!124087 (=> (not res!102864) (not e!81356))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!124087 (= res!102864 (bvsge i!615 nBits!396))))

(declare-fun res!102863 () Bool)

(declare-fun e!81353 () Bool)

(assert (=> start!24398 (=> (not res!102863) (not e!81353))))

(assert (=> start!24398 (= res!102863 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24398 e!81353))

(assert (=> start!24398 true))

(declare-fun inv!12 (BitStream!4414) Bool)

(assert (=> start!24398 (and (inv!12 thiss!1305) e!81354)))

(declare-fun b!124088 () Bool)

(declare-fun e!81357 () Bool)

(assert (=> b!124088 (= e!81356 (not e!81357))))

(declare-fun res!102861 () Bool)

(assert (=> b!124088 (=> res!102861 e!81357)))

(declare-fun lt!195769 () (_ BitVec 64))

(declare-fun lt!195770 () (_ BitVec 64))

(assert (=> b!124088 (= res!102861 (not (= lt!195769 (bvadd lt!195769 lt!195770))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124088 (= lt!195769 (bitIndex!0 (size!2470 (buf!2916 thiss!1305)) (currentByte!5622 thiss!1305) (currentBit!5617 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4414 BitStream!4414) Bool)

(assert (=> b!124088 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7684 0))(
  ( (Unit!7685) )
))
(declare-fun lt!195768 () Unit!7684)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4414) Unit!7684)

(assert (=> b!124088 (= lt!195768 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124089 () Bool)

(assert (=> b!124089 (= e!81357 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10426 0))(
  ( (tuple2!10427 (_1!5481 BitStream!4414) (_2!5481 BitStream!4414)) )
))
(declare-fun lt!195771 () tuple2!10426)

(declare-fun reader!0 (BitStream!4414 BitStream!4414) tuple2!10426)

(assert (=> b!124089 (= lt!195771 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124090 () Bool)

(assert (=> b!124090 (= e!81353 e!81356)))

(declare-fun res!102860 () Bool)

(assert (=> b!124090 (=> (not res!102860) (not e!81356))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124090 (= res!102860 (validate_offset_bits!1 ((_ sign_extend 32) (size!2470 (buf!2916 thiss!1305))) ((_ sign_extend 32) (currentByte!5622 thiss!1305)) ((_ sign_extend 32) (currentBit!5617 thiss!1305)) lt!195770))))

(assert (=> b!124090 (= lt!195770 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24398 res!102863) b!124090))

(assert (= (and b!124090 res!102860) b!124085))

(assert (= (and b!124085 res!102862) b!124087))

(assert (= (and b!124087 res!102864) b!124088))

(assert (= (and b!124088 (not res!102861)) b!124089))

(assert (= start!24398 b!124086))

(declare-fun m!189307 () Bool)

(assert (=> b!124090 m!189307))

(declare-fun m!189309 () Bool)

(assert (=> b!124088 m!189309))

(declare-fun m!189311 () Bool)

(assert (=> b!124088 m!189311))

(declare-fun m!189313 () Bool)

(assert (=> b!124088 m!189313))

(declare-fun m!189315 () Bool)

(assert (=> b!124086 m!189315))

(declare-fun m!189317 () Bool)

(assert (=> b!124085 m!189317))

(declare-fun m!189319 () Bool)

(assert (=> b!124089 m!189319))

(declare-fun m!189321 () Bool)

(assert (=> start!24398 m!189321))

(push 1)

(assert (not b!124085))

(assert (not b!124089))

(assert (not start!24398))

(assert (not b!124088))

(assert (not b!124090))

(assert (not b!124086))

(check-sat)

(pop 1)

(push 1)

(check-sat)

