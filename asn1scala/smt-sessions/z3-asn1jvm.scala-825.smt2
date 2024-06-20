; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!24406 () Bool)

(assert start!24406)

(declare-fun b!124157 () Bool)

(declare-fun res!102924 () Bool)

(declare-fun e!81416 () Bool)

(assert (=> b!124157 (=> (not res!102924) (not e!81416))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!124157 (= res!102924 (bvsge i!615 nBits!396))))

(declare-fun b!124158 () Bool)

(declare-fun e!81413 () Bool)

(assert (=> b!124158 (= e!81416 (not e!81413))))

(declare-fun res!102923 () Bool)

(assert (=> b!124158 (=> res!102923 e!81413)))

(declare-fun lt!195817 () (_ BitVec 64))

(declare-fun lt!195816 () (_ BitVec 64))

(assert (=> b!124158 (= res!102923 (not (= lt!195817 (bvadd lt!195817 lt!195816))))))

(declare-datatypes ((array!5467 0))(
  ( (array!5468 (arr!3067 (Array (_ BitVec 32) (_ BitVec 8))) (size!2474 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4422 0))(
  ( (BitStream!4423 (buf!2920 array!5467) (currentByte!5626 (_ BitVec 32)) (currentBit!5621 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4422)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124158 (= lt!195817 (bitIndex!0 (size!2474 (buf!2920 thiss!1305)) (currentByte!5626 thiss!1305) (currentBit!5621 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4422 BitStream!4422) Bool)

(assert (=> b!124158 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!7692 0))(
  ( (Unit!7693) )
))
(declare-fun lt!195819 () Unit!7692)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4422) Unit!7692)

(assert (=> b!124158 (= lt!195819 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!102920 () Bool)

(declare-fun e!81415 () Bool)

(assert (=> start!24406 (=> (not res!102920) (not e!81415))))

(assert (=> start!24406 (= res!102920 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24406 e!81415))

(assert (=> start!24406 true))

(declare-fun e!81414 () Bool)

(declare-fun inv!12 (BitStream!4422) Bool)

(assert (=> start!24406 (and (inv!12 thiss!1305) e!81414)))

(declare-fun b!124159 () Bool)

(assert (=> b!124159 (= e!81415 e!81416)))

(declare-fun res!102922 () Bool)

(assert (=> b!124159 (=> (not res!102922) (not e!81416))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!124159 (= res!102922 (validate_offset_bits!1 ((_ sign_extend 32) (size!2474 (buf!2920 thiss!1305))) ((_ sign_extend 32) (currentByte!5626 thiss!1305)) ((_ sign_extend 32) (currentBit!5621 thiss!1305)) lt!195816))))

(assert (=> b!124159 (= lt!195816 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!124160 () Bool)

(declare-fun array_inv!2276 (array!5467) Bool)

(assert (=> b!124160 (= e!81414 (array_inv!2276 (buf!2920 thiss!1305)))))

(declare-fun b!124161 () Bool)

(declare-fun res!102921 () Bool)

(assert (=> b!124161 (=> (not res!102921) (not e!81416))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!124161 (= res!102921 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!124162 () Bool)

(assert (=> b!124162 (= e!81413 true)))

(declare-datatypes ((tuple2!10434 0))(
  ( (tuple2!10435 (_1!5485 BitStream!4422) (_2!5485 BitStream!4422)) )
))
(declare-fun lt!195818 () tuple2!10434)

(declare-fun reader!0 (BitStream!4422 BitStream!4422) tuple2!10434)

(assert (=> b!124162 (= lt!195818 (reader!0 thiss!1305 thiss!1305))))

(assert (= (and start!24406 res!102920) b!124159))

(assert (= (and b!124159 res!102922) b!124161))

(assert (= (and b!124161 res!102921) b!124157))

(assert (= (and b!124157 res!102924) b!124158))

(assert (= (and b!124158 (not res!102923)) b!124162))

(assert (= start!24406 b!124160))

(declare-fun m!189371 () Bool)

(assert (=> b!124161 m!189371))

(declare-fun m!189373 () Bool)

(assert (=> b!124158 m!189373))

(declare-fun m!189375 () Bool)

(assert (=> b!124158 m!189375))

(declare-fun m!189377 () Bool)

(assert (=> b!124158 m!189377))

(declare-fun m!189379 () Bool)

(assert (=> b!124159 m!189379))

(declare-fun m!189381 () Bool)

(assert (=> b!124162 m!189381))

(declare-fun m!189383 () Bool)

(assert (=> start!24406 m!189383))

(declare-fun m!189385 () Bool)

(assert (=> b!124160 m!189385))

(check-sat (not b!124160) (not b!124159) (not start!24406) (not b!124162) (not b!124158) (not b!124161))
