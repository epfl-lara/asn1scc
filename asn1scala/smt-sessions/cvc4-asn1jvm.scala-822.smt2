; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24390 () Bool)

(assert start!24390)

(declare-fun b!124014 () Bool)

(declare-fun res!102802 () Bool)

(declare-fun e!81295 () Bool)

(assert (=> b!124014 (=> (not res!102802) (not e!81295))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124014 (= res!102802 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!102801 () Bool)

(declare-fun e!81294 () Bool)

(assert (=> start!24390 (=> (not res!102801) (not e!81294))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!24390 (= res!102801 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24390 e!81294))

(assert (=> start!24390 true))

(declare-datatypes ((array!5451 0))(
  ( (array!5452 (arr!3059 (Array (_ BitVec 32) (_ BitVec 8))) (size!2466 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4406 0))(
  ( (BitStream!4407 (buf!2912 array!5451) (currentByte!5618 (_ BitVec 32)) (currentBit!5613 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4406)

(declare-fun e!81297 () Bool)

(declare-fun inv!12 (BitStream!4406) Bool)

(assert (=> start!24390 (and (inv!12 thiss!1305) e!81297)))

(declare-fun b!124015 () Bool)

(declare-fun res!102803 () Bool)

(assert (=> b!124015 (=> (not res!102803) (not e!81295))))

(assert (=> b!124015 (= res!102803 (bvsge i!615 nBits!396))))

(declare-fun b!124016 () Bool)

(declare-fun array_inv!2268 (array!5451) Bool)

(assert (=> b!124016 (= e!81297 (array_inv!2268 (buf!2912 thiss!1305)))))

(declare-fun b!124017 () Bool)

(assert (=> b!124017 (= e!81294 e!81295)))

(declare-fun res!102804 () Bool)

(assert (=> b!124017 (=> (not res!102804) (not e!81295))))

(declare-fun lt!195722 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124017 (= res!102804 (validate_offset_bits!1 ((_ sign_extend 32) (size!2466 (buf!2912 thiss!1305))) ((_ sign_extend 32) (currentByte!5618 thiss!1305)) ((_ sign_extend 32) (currentBit!5613 thiss!1305)) lt!195722))))

(assert (=> b!124017 (= lt!195722 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun lt!195721 () (_ BitVec 64))

(declare-fun b!124018 () Bool)

(declare-fun lt!195720 () (_ BitVec 64))

(assert (=> b!124018 (= e!81295 (not (or (not (= lt!195721 (bvand lt!195722 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!195721 (bvand (bvadd lt!195720 lt!195722) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!124018 (= lt!195721 (bvand lt!195720 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124018 (= lt!195720 (bitIndex!0 (size!2466 (buf!2912 thiss!1305)) (currentByte!5618 thiss!1305) (currentBit!5613 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4406 BitStream!4406) Bool)

(assert (=> b!124018 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7676 0))(
  ( (Unit!7677) )
))
(declare-fun lt!195723 () Unit!7676)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4406) Unit!7676)

(assert (=> b!124018 (= lt!195723 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (= (and start!24390 res!102801) b!124017))

(assert (= (and b!124017 res!102804) b!124014))

(assert (= (and b!124014 res!102802) b!124015))

(assert (= (and b!124015 res!102803) b!124018))

(assert (= start!24390 b!124016))

(declare-fun m!189245 () Bool)

(assert (=> b!124016 m!189245))

(declare-fun m!189247 () Bool)

(assert (=> start!24390 m!189247))

(declare-fun m!189249 () Bool)

(assert (=> b!124014 m!189249))

(declare-fun m!189251 () Bool)

(assert (=> b!124018 m!189251))

(declare-fun m!189253 () Bool)

(assert (=> b!124018 m!189253))

(declare-fun m!189255 () Bool)

(assert (=> b!124018 m!189255))

(declare-fun m!189257 () Bool)

(assert (=> b!124017 m!189257))

(push 1)

(assert (not b!124014))

(assert (not b!124016))

(assert (not start!24390))

(assert (not b!124018))

(assert (not b!124017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

