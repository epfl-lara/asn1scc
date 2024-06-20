; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24416 () Bool)

(assert start!24416)

(declare-fun b!124247 () Bool)

(declare-fun e!81488 () Bool)

(assert (=> b!124247 (= e!81488 true)))

(declare-datatypes ((array!5477 0))(
  ( (array!5478 (arr!3072 (Array (_ BitVec 32) (_ BitVec 8))) (size!2479 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4432 0))(
  ( (BitStream!4433 (buf!2925 array!5477) (currentByte!5631 (_ BitVec 32)) (currentBit!5626 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10444 0))(
  ( (tuple2!10445 (_1!5490 BitStream!4432) (_2!5490 BitStream!4432)) )
))
(declare-fun lt!195876 () tuple2!10444)

(declare-fun thiss!1305 () BitStream!4432)

(declare-fun reader!0 (BitStream!4432 BitStream!4432) tuple2!10444)

(assert (=> b!124247 (= lt!195876 (reader!0 thiss!1305 thiss!1305))))

(declare-fun res!102996 () Bool)

(declare-fun e!81489 () Bool)

(assert (=> start!24416 (=> (not res!102996) (not e!81489))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!24416 (= res!102996 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24416 e!81489))

(assert (=> start!24416 true))

(declare-fun e!81491 () Bool)

(declare-fun inv!12 (BitStream!4432) Bool)

(assert (=> start!24416 (and (inv!12 thiss!1305) e!81491)))

(declare-fun b!124248 () Bool)

(declare-fun e!81492 () Bool)

(assert (=> b!124248 (= e!81489 e!81492)))

(declare-fun res!102999 () Bool)

(assert (=> b!124248 (=> (not res!102999) (not e!81492))))

(declare-fun lt!195878 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124248 (= res!102999 (validate_offset_bits!1 ((_ sign_extend 32) (size!2479 (buf!2925 thiss!1305))) ((_ sign_extend 32) (currentByte!5631 thiss!1305)) ((_ sign_extend 32) (currentBit!5626 thiss!1305)) lt!195878))))

(assert (=> b!124248 (= lt!195878 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124249 () Bool)

(declare-fun res!102998 () Bool)

(assert (=> b!124249 (=> (not res!102998) (not e!81492))))

(assert (=> b!124249 (= res!102998 (bvsge i!615 nBits!396))))

(declare-fun b!124250 () Bool)

(declare-fun res!102997 () Bool)

(assert (=> b!124250 (=> (not res!102997) (not e!81492))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124250 (= res!102997 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124251 () Bool)

(assert (=> b!124251 (= e!81492 (not e!81488))))

(declare-fun res!102995 () Bool)

(assert (=> b!124251 (=> res!102995 e!81488)))

(declare-fun lt!195877 () (_ BitVec 64))

(assert (=> b!124251 (= res!102995 (not (= lt!195877 (bvadd lt!195877 lt!195878))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124251 (= lt!195877 (bitIndex!0 (size!2479 (buf!2925 thiss!1305)) (currentByte!5631 thiss!1305) (currentBit!5626 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4432 BitStream!4432) Bool)

(assert (=> b!124251 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7702 0))(
  ( (Unit!7703) )
))
(declare-fun lt!195879 () Unit!7702)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4432) Unit!7702)

(assert (=> b!124251 (= lt!195879 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124252 () Bool)

(declare-fun array_inv!2281 (array!5477) Bool)

(assert (=> b!124252 (= e!81491 (array_inv!2281 (buf!2925 thiss!1305)))))

(assert (= (and start!24416 res!102996) b!124248))

(assert (= (and b!124248 res!102999) b!124250))

(assert (= (and b!124250 res!102997) b!124249))

(assert (= (and b!124249 res!102998) b!124251))

(assert (= (and b!124251 (not res!102995)) b!124247))

(assert (= start!24416 b!124252))

(declare-fun m!189451 () Bool)

(assert (=> b!124251 m!189451))

(declare-fun m!189453 () Bool)

(assert (=> b!124251 m!189453))

(declare-fun m!189455 () Bool)

(assert (=> b!124251 m!189455))

(declare-fun m!189457 () Bool)

(assert (=> b!124247 m!189457))

(declare-fun m!189459 () Bool)

(assert (=> start!24416 m!189459))

(declare-fun m!189461 () Bool)

(assert (=> b!124252 m!189461))

(declare-fun m!189463 () Bool)

(assert (=> b!124250 m!189463))

(declare-fun m!189465 () Bool)

(assert (=> b!124248 m!189465))

(push 1)

(assert (not b!124247))

(assert (not b!124248))

(assert (not b!124252))

(assert (not b!124251))

(assert (not start!24416))

(assert (not b!124250))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

