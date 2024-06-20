; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21948 () Bool)

(assert start!21948)

(declare-fun lt!167553 () (_ BitVec 64))

(declare-fun b!110711 () Bool)

(declare-fun e!72638 () Bool)

(declare-fun lt!167558 () (_ BitVec 64))

(declare-fun lt!167557 () (_ BitVec 64))

(assert (=> b!110711 (= e!72638 (or (not (= (bvand lt!167553 lt!167557) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!167553 lt!167558) lt!167553)))))

(declare-fun b!110712 () Bool)

(declare-fun e!72644 () Bool)

(declare-fun e!72642 () Bool)

(assert (=> b!110712 (= e!72644 e!72642)))

(declare-fun res!91396 () Bool)

(assert (=> b!110712 (=> (not res!91396) (not e!72642))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> b!110712 (= res!91396 (and (= (bvand v!199 lt!167558) v!199) (bvsge i!615 nBits!396)))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110712 (= lt!167558 (onesLSBLong!0 nBits!396))))

(declare-fun b!110713 () Bool)

(declare-fun e!72641 () Bool)

(assert (=> b!110713 (= e!72641 e!72638)))

(declare-fun res!91394 () Bool)

(assert (=> b!110713 (=> res!91394 e!72638)))

(declare-datatypes ((array!5077 0))(
  ( (array!5078 (arr!2902 (Array (_ BitVec 32) (_ BitVec 8))) (size!2309 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4092 0))(
  ( (BitStream!4093 (buf!2706 array!5077) (currentByte!5263 (_ BitVec 32)) (currentBit!5258 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9212 0))(
  ( (tuple2!9213 (_1!4863 BitStream!4092) (_2!4863 BitStream!4092)) )
))
(declare-fun lt!167552 () tuple2!9212)

(declare-fun lt!167554 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110713 (= res!91394 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!2309 (buf!2706 (_1!4863 lt!167552)))) ((_ sign_extend 32) (currentByte!5263 (_1!4863 lt!167552))) ((_ sign_extend 32) (currentBit!5258 (_1!4863 lt!167552))) lt!167554)))))

(declare-datatypes ((Unit!6786 0))(
  ( (Unit!6787) )
))
(declare-fun lt!167551 () Unit!6786)

(declare-fun thiss!1305 () BitStream!4092)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4092 array!5077 (_ BitVec 64)) Unit!6786)

(assert (=> b!110713 (= lt!167551 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2706 thiss!1305) lt!167554))))

(assert (=> b!110713 (= lt!167553 (bvand v!199 (bvnot lt!167557)))))

(assert (=> b!110713 (= lt!167557 (onesLSBLong!0 (bvsub nBits!396 i!615)))))

(declare-fun reader!0 (BitStream!4092 BitStream!4092) tuple2!9212)

(assert (=> b!110713 (= lt!167552 (reader!0 thiss!1305 thiss!1305))))

(declare-fun res!91395 () Bool)

(declare-fun e!72639 () Bool)

(assert (=> start!21948 (=> (not res!91395) (not e!72639))))

(assert (=> start!21948 (= res!91395 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21948 e!72639))

(assert (=> start!21948 true))

(declare-fun e!72640 () Bool)

(declare-fun inv!12 (BitStream!4092) Bool)

(assert (=> start!21948 (and (inv!12 thiss!1305) e!72640)))

(declare-fun b!110714 () Bool)

(declare-fun array_inv!2111 (array!5077) Bool)

(assert (=> b!110714 (= e!72640 (array_inv!2111 (buf!2706 thiss!1305)))))

(declare-fun b!110715 () Bool)

(assert (=> b!110715 (= e!72642 (not e!72641))))

(declare-fun res!91392 () Bool)

(assert (=> b!110715 (=> res!91392 e!72641)))

(declare-fun lt!167556 () (_ BitVec 64))

(assert (=> b!110715 (= res!91392 (not (= lt!167556 (bvadd lt!167556 lt!167554))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110715 (= lt!167556 (bitIndex!0 (size!2309 (buf!2706 thiss!1305)) (currentByte!5263 thiss!1305) (currentBit!5258 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4092 BitStream!4092) Bool)

(assert (=> b!110715 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-fun lt!167555 () Unit!6786)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4092) Unit!6786)

(assert (=> b!110715 (= lt!167555 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110716 () Bool)

(assert (=> b!110716 (= e!72639 e!72644)))

(declare-fun res!91393 () Bool)

(assert (=> b!110716 (=> (not res!91393) (not e!72644))))

(assert (=> b!110716 (= res!91393 (validate_offset_bits!1 ((_ sign_extend 32) (size!2309 (buf!2706 thiss!1305))) ((_ sign_extend 32) (currentByte!5263 thiss!1305)) ((_ sign_extend 32) (currentBit!5258 thiss!1305)) lt!167554))))

(assert (=> b!110716 (= lt!167554 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!21948 res!91395) b!110716))

(assert (= (and b!110716 res!91393) b!110712))

(assert (= (and b!110712 res!91396) b!110715))

(assert (= (and b!110715 (not res!91392)) b!110713))

(assert (= (and b!110713 (not res!91394)) b!110711))

(assert (= start!21948 b!110714))

(declare-fun m!164295 () Bool)

(assert (=> b!110714 m!164295))

(declare-fun m!164297 () Bool)

(assert (=> b!110713 m!164297))

(declare-fun m!164299 () Bool)

(assert (=> b!110713 m!164299))

(declare-fun m!164301 () Bool)

(assert (=> b!110713 m!164301))

(declare-fun m!164303 () Bool)

(assert (=> b!110713 m!164303))

(declare-fun m!164305 () Bool)

(assert (=> b!110715 m!164305))

(declare-fun m!164307 () Bool)

(assert (=> b!110715 m!164307))

(declare-fun m!164309 () Bool)

(assert (=> b!110715 m!164309))

(declare-fun m!164311 () Bool)

(assert (=> start!21948 m!164311))

(declare-fun m!164313 () Bool)

(assert (=> b!110716 m!164313))

(declare-fun m!164315 () Bool)

(assert (=> b!110712 m!164315))

(check-sat (not b!110712) (not b!110715) (not b!110716) (not b!110713) (not start!21948) (not b!110714))
(check-sat)
