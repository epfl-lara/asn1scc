; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24412 () Bool)

(assert start!24412)

(declare-fun b!124211 () Bool)

(declare-fun res!102968 () Bool)

(declare-fun e!81458 () Bool)

(assert (=> b!124211 (=> (not res!102968) (not e!81458))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!124211 (= res!102968 (bvsge i!615 nBits!396))))

(declare-fun b!124212 () Bool)

(declare-fun res!102965 () Bool)

(assert (=> b!124212 (=> (not res!102965) (not e!81458))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124212 (= res!102965 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124213 () Bool)

(declare-fun e!81460 () Bool)

(assert (=> b!124213 (= e!81460 true)))

(declare-datatypes ((array!5473 0))(
  ( (array!5474 (arr!3070 (Array (_ BitVec 32) (_ BitVec 8))) (size!2477 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4428 0))(
  ( (BitStream!4429 (buf!2923 array!5473) (currentByte!5629 (_ BitVec 32)) (currentBit!5624 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10440 0))(
  ( (tuple2!10441 (_1!5488 BitStream!4428) (_2!5488 BitStream!4428)) )
))
(declare-fun lt!195855 () tuple2!10440)

(declare-fun thiss!1305 () BitStream!4428)

(declare-fun reader!0 (BitStream!4428 BitStream!4428) tuple2!10440)

(assert (=> b!124213 (= lt!195855 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!124214 () Bool)

(declare-fun e!81461 () Bool)

(assert (=> b!124214 (= e!81461 e!81458)))

(declare-fun res!102967 () Bool)

(assert (=> b!124214 (=> (not res!102967) (not e!81458))))

(declare-fun lt!195854 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124214 (= res!102967 (validate_offset_bits!1 ((_ sign_extend 32) (size!2477 (buf!2923 thiss!1305))) ((_ sign_extend 32) (currentByte!5629 thiss!1305)) ((_ sign_extend 32) (currentBit!5624 thiss!1305)) lt!195854))))

(assert (=> b!124214 (= lt!195854 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124215 () Bool)

(assert (=> b!124215 (= e!81458 (not e!81460))))

(declare-fun res!102969 () Bool)

(assert (=> b!124215 (=> res!102969 e!81460)))

(declare-fun lt!195853 () (_ BitVec 64))

(assert (=> b!124215 (= res!102969 (not (= lt!195853 (bvadd lt!195853 lt!195854))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124215 (= lt!195853 (bitIndex!0 (size!2477 (buf!2923 thiss!1305)) (currentByte!5629 thiss!1305) (currentBit!5624 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4428 BitStream!4428) Bool)

(assert (=> b!124215 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7698 0))(
  ( (Unit!7699) )
))
(declare-fun lt!195852 () Unit!7698)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4428) Unit!7698)

(assert (=> b!124215 (= lt!195852 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!124216 () Bool)

(declare-fun e!81462 () Bool)

(declare-fun array_inv!2279 (array!5473) Bool)

(assert (=> b!124216 (= e!81462 (array_inv!2279 (buf!2923 thiss!1305)))))

(declare-fun res!102966 () Bool)

(assert (=> start!24412 (=> (not res!102966) (not e!81461))))

(assert (=> start!24412 (= res!102966 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24412 e!81461))

(assert (=> start!24412 true))

(declare-fun inv!12 (BitStream!4428) Bool)

(assert (=> start!24412 (and (inv!12 thiss!1305) e!81462)))

(assert (= (and start!24412 res!102966) b!124214))

(assert (= (and b!124214 res!102967) b!124212))

(assert (= (and b!124212 res!102965) b!124211))

(assert (= (and b!124211 res!102968) b!124215))

(assert (= (and b!124215 (not res!102969)) b!124213))

(assert (= start!24412 b!124216))

(declare-fun m!189419 () Bool)

(assert (=> b!124214 m!189419))

(declare-fun m!189421 () Bool)

(assert (=> b!124216 m!189421))

(declare-fun m!189423 () Bool)

(assert (=> b!124213 m!189423))

(declare-fun m!189425 () Bool)

(assert (=> b!124215 m!189425))

(declare-fun m!189427 () Bool)

(assert (=> b!124215 m!189427))

(declare-fun m!189429 () Bool)

(assert (=> b!124215 m!189429))

(declare-fun m!189431 () Bool)

(assert (=> start!24412 m!189431))

(declare-fun m!189433 () Bool)

(assert (=> b!124212 m!189433))

(check-sat (not b!124213) (not start!24412) (not b!124215) (not b!124216) (not b!124212) (not b!124214))
