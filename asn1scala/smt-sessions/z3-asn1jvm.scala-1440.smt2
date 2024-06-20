; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39592 () Bool)

(assert start!39592)

(declare-fun res!147837 () Bool)

(declare-fun e!124168 () Bool)

(assert (=> start!39592 (=> (not res!147837) (not e!124168))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!39592 (= res!147837 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39592 e!124168))

(assert (=> start!39592 true))

(declare-datatypes ((array!9607 0))(
  ( (array!9608 (arr!5165 (Array (_ BitVec 32) (_ BitVec 8))) (size!4235 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7578 0))(
  ( (BitStream!7579 (buf!4678 array!9607) (currentByte!8876 (_ BitVec 32)) (currentBit!8871 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7578)

(declare-fun e!124165 () Bool)

(declare-fun inv!12 (BitStream!7578) Bool)

(assert (=> start!39592 (and (inv!12 thiss!1204) e!124165)))

(declare-fun b!178278 () Bool)

(declare-fun res!147834 () Bool)

(assert (=> b!178278 (=> (not res!147834) (not e!124168))))

(assert (=> b!178278 (= res!147834 (not (= i!590 nBits!348)))))

(declare-fun b!178279 () Bool)

(declare-fun e!124167 () Bool)

(declare-fun e!124170 () Bool)

(assert (=> b!178279 (= e!124167 e!124170)))

(declare-fun res!147833 () Bool)

(assert (=> b!178279 (=> (not res!147833) (not e!124170))))

(declare-fun lt!274020 () (_ BitVec 64))

(declare-fun lt!274019 () (_ BitVec 64))

(assert (=> b!178279 (= res!147833 (= lt!274020 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!274019)))))

(declare-datatypes ((Unit!12850 0))(
  ( (Unit!12851) )
))
(declare-datatypes ((tuple2!15372 0))(
  ( (tuple2!15373 (_1!8331 Unit!12850) (_2!8331 BitStream!7578)) )
))
(declare-fun lt!274016 () tuple2!15372)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!178279 (= lt!274020 (bitIndex!0 (size!4235 (buf!4678 (_2!8331 lt!274016))) (currentByte!8876 (_2!8331 lt!274016)) (currentBit!8871 (_2!8331 lt!274016))))))

(assert (=> b!178279 (= lt!274019 (bitIndex!0 (size!4235 (buf!4678 thiss!1204)) (currentByte!8876 thiss!1204) (currentBit!8871 thiss!1204)))))

(declare-fun b!178280 () Bool)

(declare-fun e!124166 () Bool)

(assert (=> b!178280 (= e!124168 (not e!124166))))

(declare-fun res!147836 () Bool)

(assert (=> b!178280 (=> res!147836 e!124166)))

(assert (=> b!178280 (= res!147836 (not (= (bitIndex!0 (size!4235 (buf!4678 (_2!8331 lt!274016))) (currentByte!8876 (_2!8331 lt!274016)) (currentBit!8871 (_2!8331 lt!274016))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4235 (buf!4678 thiss!1204)) (currentByte!8876 thiss!1204) (currentBit!8871 thiss!1204))))))))

(assert (=> b!178280 e!124167))

(declare-fun res!147832 () Bool)

(assert (=> b!178280 (=> (not res!147832) (not e!124167))))

(assert (=> b!178280 (= res!147832 (= (size!4235 (buf!4678 thiss!1204)) (size!4235 (buf!4678 (_2!8331 lt!274016)))))))

(declare-fun lt!274021 () Bool)

(declare-fun appendBit!0 (BitStream!7578 Bool) tuple2!15372)

(assert (=> b!178280 (= lt!274016 (appendBit!0 thiss!1204 lt!274021))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!178280 (= lt!274021 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!178281 () Bool)

(assert (=> b!178281 (= e!124166 true)))

(declare-fun lt!274022 () (_ BitVec 64))

(declare-fun lt!274018 () tuple2!15372)

(assert (=> b!178281 (= lt!274022 (bitIndex!0 (size!4235 (buf!4678 (_2!8331 lt!274018))) (currentByte!8876 (_2!8331 lt!274018)) (currentBit!8871 (_2!8331 lt!274018))))))

(declare-fun isPrefixOf!0 (BitStream!7578 BitStream!7578) Bool)

(assert (=> b!178281 (isPrefixOf!0 thiss!1204 (_2!8331 lt!274018))))

(declare-fun lt!274015 () Unit!12850)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7578 BitStream!7578 BitStream!7578) Unit!12850)

(assert (=> b!178281 (= lt!274015 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8331 lt!274016) (_2!8331 lt!274018)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7578 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15372)

(assert (=> b!178281 (= lt!274018 (appendBitsLSBFirstLoopTR!0 (_2!8331 lt!274016) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!178282 () Bool)

(declare-fun array_inv!3976 (array!9607) Bool)

(assert (=> b!178282 (= e!124165 (array_inv!3976 (buf!4678 thiss!1204)))))

(declare-fun b!178283 () Bool)

(declare-fun res!147829 () Bool)

(assert (=> b!178283 (=> (not res!147829) (not e!124168))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!178283 (= res!147829 (invariant!0 (currentBit!8871 thiss!1204) (currentByte!8876 thiss!1204) (size!4235 (buf!4678 thiss!1204))))))

(declare-fun b!178284 () Bool)

(declare-fun e!124171 () Bool)

(declare-datatypes ((tuple2!15374 0))(
  ( (tuple2!15375 (_1!8332 BitStream!7578) (_2!8332 Bool)) )
))
(declare-fun lt!274017 () tuple2!15374)

(assert (=> b!178284 (= e!124171 (= (bitIndex!0 (size!4235 (buf!4678 (_1!8332 lt!274017))) (currentByte!8876 (_1!8332 lt!274017)) (currentBit!8871 (_1!8332 lt!274017))) lt!274020))))

(declare-fun b!178285 () Bool)

(declare-fun res!147831 () Bool)

(assert (=> b!178285 (=> (not res!147831) (not e!124168))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!178285 (= res!147831 (validate_offset_bits!1 ((_ sign_extend 32) (size!4235 (buf!4678 thiss!1204))) ((_ sign_extend 32) (currentByte!8876 thiss!1204)) ((_ sign_extend 32) (currentBit!8871 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!178286 () Bool)

(declare-fun res!147835 () Bool)

(assert (=> b!178286 (=> (not res!147835) (not e!124170))))

(assert (=> b!178286 (= res!147835 (isPrefixOf!0 thiss!1204 (_2!8331 lt!274016)))))

(declare-fun b!178287 () Bool)

(assert (=> b!178287 (= e!124170 e!124171)))

(declare-fun res!147830 () Bool)

(assert (=> b!178287 (=> (not res!147830) (not e!124171))))

(assert (=> b!178287 (= res!147830 (and (= (_2!8332 lt!274017) lt!274021) (= (_1!8332 lt!274017) (_2!8331 lt!274016))))))

(declare-fun readBitPure!0 (BitStream!7578) tuple2!15374)

(declare-fun readerFrom!0 (BitStream!7578 (_ BitVec 32) (_ BitVec 32)) BitStream!7578)

(assert (=> b!178287 (= lt!274017 (readBitPure!0 (readerFrom!0 (_2!8331 lt!274016) (currentBit!8871 thiss!1204) (currentByte!8876 thiss!1204))))))

(assert (= (and start!39592 res!147837) b!178285))

(assert (= (and b!178285 res!147831) b!178283))

(assert (= (and b!178283 res!147829) b!178278))

(assert (= (and b!178278 res!147834) b!178280))

(assert (= (and b!178280 res!147832) b!178279))

(assert (= (and b!178279 res!147833) b!178286))

(assert (= (and b!178286 res!147835) b!178287))

(assert (= (and b!178287 res!147830) b!178284))

(assert (= (and b!178280 (not res!147836)) b!178281))

(assert (= start!39592 b!178282))

(declare-fun m!278431 () Bool)

(assert (=> b!178285 m!278431))

(declare-fun m!278433 () Bool)

(assert (=> b!178283 m!278433))

(declare-fun m!278435 () Bool)

(assert (=> b!178279 m!278435))

(declare-fun m!278437 () Bool)

(assert (=> b!178279 m!278437))

(declare-fun m!278439 () Bool)

(assert (=> b!178286 m!278439))

(declare-fun m!278441 () Bool)

(assert (=> b!178282 m!278441))

(declare-fun m!278443 () Bool)

(assert (=> b!178281 m!278443))

(declare-fun m!278445 () Bool)

(assert (=> b!178281 m!278445))

(declare-fun m!278447 () Bool)

(assert (=> b!178281 m!278447))

(declare-fun m!278449 () Bool)

(assert (=> b!178281 m!278449))

(assert (=> b!178280 m!278435))

(assert (=> b!178280 m!278437))

(declare-fun m!278451 () Bool)

(assert (=> b!178280 m!278451))

(declare-fun m!278453 () Bool)

(assert (=> start!39592 m!278453))

(declare-fun m!278455 () Bool)

(assert (=> b!178284 m!278455))

(declare-fun m!278457 () Bool)

(assert (=> b!178287 m!278457))

(assert (=> b!178287 m!278457))

(declare-fun m!278459 () Bool)

(assert (=> b!178287 m!278459))

(check-sat (not b!178284) (not b!178286) (not b!178281) (not b!178282) (not b!178283) (not start!39592) (not b!178285) (not b!178287) (not b!178280) (not b!178279))
