; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24394 () Bool)

(assert start!24394)

(declare-fun b!124049 () Bool)

(declare-fun e!81327 () Bool)

(declare-datatypes ((array!5455 0))(
  ( (array!5456 (arr!3061 (Array (_ BitVec 32) (_ BitVec 8))) (size!2468 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4410 0))(
  ( (BitStream!4411 (buf!2914 array!5455) (currentByte!5620 (_ BitVec 32)) (currentBit!5615 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4410)

(declare-fun array_inv!2270 (array!5455) Bool)

(assert (=> b!124049 (= e!81327 (array_inv!2270 (buf!2914 thiss!1305)))))

(declare-fun res!102833 () Bool)

(declare-fun e!81326 () Bool)

(assert (=> start!24394 (=> (not res!102833) (not e!81326))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!24394 (= res!102833 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24394 e!81326))

(assert (=> start!24394 true))

(declare-fun inv!12 (BitStream!4410) Bool)

(assert (=> start!24394 (and (inv!12 thiss!1305) e!81327)))

(declare-fun b!124050 () Bool)

(declare-fun res!102831 () Bool)

(declare-fun e!81324 () Bool)

(assert (=> b!124050 (=> (not res!102831) (not e!81324))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124050 (= res!102831 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124051 () Bool)

(declare-fun e!81325 () Bool)

(assert (=> b!124051 (= e!81325 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand i!615 #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 i!615) #b10000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10422 0))(
  ( (tuple2!10423 (_1!5479 BitStream!4410) (_2!5479 BitStream!4410)) )
))
(declare-fun lt!195747 () tuple2!10422)

(declare-fun reader!0 (BitStream!4410 BitStream!4410) tuple2!10422)

(assert (=> b!124051 (= lt!195747 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124052 () Bool)

(assert (=> b!124052 (= e!81324 (not e!81325))))

(declare-fun res!102830 () Bool)

(assert (=> b!124052 (=> res!102830 e!81325)))

(declare-fun lt!195746 () (_ BitVec 64))

(declare-fun lt!195744 () (_ BitVec 64))

(assert (=> b!124052 (= res!102830 (not (= lt!195746 (bvadd lt!195746 lt!195744))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124052 (= lt!195746 (bitIndex!0 (size!2468 (buf!2914 thiss!1305)) (currentByte!5620 thiss!1305) (currentBit!5615 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4410 BitStream!4410) Bool)

(assert (=> b!124052 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7680 0))(
  ( (Unit!7681) )
))
(declare-fun lt!195745 () Unit!7680)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4410) Unit!7680)

(assert (=> b!124052 (= lt!195745 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124053 () Bool)

(declare-fun res!102832 () Bool)

(assert (=> b!124053 (=> (not res!102832) (not e!81324))))

(assert (=> b!124053 (= res!102832 (bvsge i!615 nBits!396))))

(declare-fun b!124054 () Bool)

(assert (=> b!124054 (= e!81326 e!81324)))

(declare-fun res!102834 () Bool)

(assert (=> b!124054 (=> (not res!102834) (not e!81324))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124054 (= res!102834 (validate_offset_bits!1 ((_ sign_extend 32) (size!2468 (buf!2914 thiss!1305))) ((_ sign_extend 32) (currentByte!5620 thiss!1305)) ((_ sign_extend 32) (currentBit!5615 thiss!1305)) lt!195744))))

(assert (=> b!124054 (= lt!195744 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!24394 res!102833) b!124054))

(assert (= (and b!124054 res!102834) b!124050))

(assert (= (and b!124050 res!102831) b!124053))

(assert (= (and b!124053 res!102832) b!124052))

(assert (= (and b!124052 (not res!102830)) b!124051))

(assert (= start!24394 b!124049))

(declare-fun m!189275 () Bool)

(assert (=> b!124049 m!189275))

(declare-fun m!189277 () Bool)

(assert (=> b!124054 m!189277))

(declare-fun m!189279 () Bool)

(assert (=> start!24394 m!189279))

(declare-fun m!189281 () Bool)

(assert (=> b!124052 m!189281))

(declare-fun m!189283 () Bool)

(assert (=> b!124052 m!189283))

(declare-fun m!189285 () Bool)

(assert (=> b!124052 m!189285))

(declare-fun m!189287 () Bool)

(assert (=> b!124050 m!189287))

(declare-fun m!189289 () Bool)

(assert (=> b!124051 m!189289))

(check-sat (not b!124052) (not b!124050) (not start!24394) (not b!124054) (not b!124051) (not b!124049))
