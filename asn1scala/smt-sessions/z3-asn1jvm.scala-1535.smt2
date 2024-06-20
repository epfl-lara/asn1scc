; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42890 () Bool)

(assert start!42890)

(declare-fun b!201954 () Bool)

(declare-fun res!169127 () Bool)

(declare-fun e!138484 () Bool)

(assert (=> b!201954 (=> (not res!169127) (not e!138484))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201954 (= res!169127 (not (= i!590 nBits!348)))))

(declare-fun b!201956 () Bool)

(declare-fun e!138483 () Bool)

(declare-fun e!138480 () Bool)

(assert (=> b!201956 (= e!138483 e!138480)))

(declare-fun res!169132 () Bool)

(assert (=> b!201956 (=> (not res!169132) (not e!138480))))

(declare-fun lt!314783 () (_ BitVec 64))

(declare-fun lt!314782 () (_ BitVec 64))

(assert (=> b!201956 (= res!169132 (= lt!314783 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!314782)))))

(declare-datatypes ((array!10264 0))(
  ( (array!10265 (arr!5447 (Array (_ BitVec 32) (_ BitVec 8))) (size!4517 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8142 0))(
  ( (BitStream!8143 (buf!5022 array!10264) (currentByte!9453 (_ BitVec 32)) (currentBit!9448 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14327 0))(
  ( (Unit!14328) )
))
(declare-datatypes ((tuple2!17268 0))(
  ( (tuple2!17269 (_1!9286 Unit!14327) (_2!9286 BitStream!8142)) )
))
(declare-fun lt!314786 () tuple2!17268)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201956 (= lt!314783 (bitIndex!0 (size!4517 (buf!5022 (_2!9286 lt!314786))) (currentByte!9453 (_2!9286 lt!314786)) (currentBit!9448 (_2!9286 lt!314786))))))

(declare-fun thiss!1204 () BitStream!8142)

(assert (=> b!201956 (= lt!314782 (bitIndex!0 (size!4517 (buf!5022 thiss!1204)) (currentByte!9453 thiss!1204) (currentBit!9448 thiss!1204)))))

(declare-fun b!201957 () Bool)

(declare-fun res!169129 () Bool)

(assert (=> b!201957 (=> (not res!169129) (not e!138484))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201957 (= res!169129 (invariant!0 (currentBit!9448 thiss!1204) (currentByte!9453 thiss!1204) (size!4517 (buf!5022 thiss!1204))))))

(declare-fun b!201958 () Bool)

(declare-fun res!169125 () Bool)

(assert (=> b!201958 (=> (not res!169125) (not e!138480))))

(declare-fun isPrefixOf!0 (BitStream!8142 BitStream!8142) Bool)

(assert (=> b!201958 (= res!169125 (isPrefixOf!0 thiss!1204 (_2!9286 lt!314786)))))

(declare-fun res!169128 () Bool)

(assert (=> start!42890 (=> (not res!169128) (not e!138484))))

(assert (=> start!42890 (= res!169128 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42890 e!138484))

(assert (=> start!42890 true))

(declare-fun e!138481 () Bool)

(declare-fun inv!12 (BitStream!8142) Bool)

(assert (=> start!42890 (and (inv!12 thiss!1204) e!138481)))

(declare-fun b!201955 () Bool)

(declare-fun e!138482 () Bool)

(assert (=> b!201955 (= e!138484 (not e!138482))))

(declare-fun res!169131 () Bool)

(assert (=> b!201955 (=> res!169131 e!138482)))

(assert (=> b!201955 (= res!169131 (not (= (bitIndex!0 (size!4517 (buf!5022 (_2!9286 lt!314786))) (currentByte!9453 (_2!9286 lt!314786)) (currentBit!9448 (_2!9286 lt!314786))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4517 (buf!5022 thiss!1204)) (currentByte!9453 thiss!1204) (currentBit!9448 thiss!1204))))))))

(assert (=> b!201955 e!138483))

(declare-fun res!169126 () Bool)

(assert (=> b!201955 (=> (not res!169126) (not e!138483))))

(assert (=> b!201955 (= res!169126 (= (size!4517 (buf!5022 thiss!1204)) (size!4517 (buf!5022 (_2!9286 lt!314786)))))))

(declare-fun lt!314785 () Bool)

(declare-fun appendBit!0 (BitStream!8142 Bool) tuple2!17268)

(assert (=> b!201955 (= lt!314786 (appendBit!0 thiss!1204 lt!314785))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!201955 (= lt!314785 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!201959 () Bool)

(declare-fun array_inv!4258 (array!10264) Bool)

(assert (=> b!201959 (= e!138481 (array_inv!4258 (buf!5022 thiss!1204)))))

(declare-fun b!201960 () Bool)

(declare-fun e!138486 () Bool)

(assert (=> b!201960 (= e!138480 e!138486)))

(declare-fun res!169130 () Bool)

(assert (=> b!201960 (=> (not res!169130) (not e!138486))))

(declare-datatypes ((tuple2!17270 0))(
  ( (tuple2!17271 (_1!9287 BitStream!8142) (_2!9287 Bool)) )
))
(declare-fun lt!314784 () tuple2!17270)

(assert (=> b!201960 (= res!169130 (and (= (_2!9287 lt!314784) lt!314785) (= (_1!9287 lt!314784) (_2!9286 lt!314786))))))

(declare-fun readBitPure!0 (BitStream!8142) tuple2!17270)

(declare-fun readerFrom!0 (BitStream!8142 (_ BitVec 32) (_ BitVec 32)) BitStream!8142)

(assert (=> b!201960 (= lt!314784 (readBitPure!0 (readerFrom!0 (_2!9286 lt!314786) (currentBit!9448 thiss!1204) (currentByte!9453 thiss!1204))))))

(declare-fun b!201961 () Bool)

(assert (=> b!201961 (= e!138482 (or (not (= (bvand i!590 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (= (bvand i!590 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000))))))

(declare-fun b!201962 () Bool)

(declare-fun res!169133 () Bool)

(assert (=> b!201962 (=> (not res!169133) (not e!138484))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201962 (= res!169133 (validate_offset_bits!1 ((_ sign_extend 32) (size!4517 (buf!5022 thiss!1204))) ((_ sign_extend 32) (currentByte!9453 thiss!1204)) ((_ sign_extend 32) (currentBit!9448 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201963 () Bool)

(assert (=> b!201963 (= e!138486 (= (bitIndex!0 (size!4517 (buf!5022 (_1!9287 lt!314784))) (currentByte!9453 (_1!9287 lt!314784)) (currentBit!9448 (_1!9287 lt!314784))) lt!314783))))

(assert (= (and start!42890 res!169128) b!201962))

(assert (= (and b!201962 res!169133) b!201957))

(assert (= (and b!201957 res!169129) b!201954))

(assert (= (and b!201954 res!169127) b!201955))

(assert (= (and b!201955 res!169126) b!201956))

(assert (= (and b!201956 res!169132) b!201958))

(assert (= (and b!201958 res!169125) b!201960))

(assert (= (and b!201960 res!169130) b!201963))

(assert (= (and b!201955 (not res!169131)) b!201961))

(assert (= start!42890 b!201959))

(declare-fun m!312457 () Bool)

(assert (=> b!201963 m!312457))

(declare-fun m!312459 () Bool)

(assert (=> b!201959 m!312459))

(declare-fun m!312461 () Bool)

(assert (=> b!201955 m!312461))

(declare-fun m!312463 () Bool)

(assert (=> b!201955 m!312463))

(declare-fun m!312465 () Bool)

(assert (=> b!201955 m!312465))

(declare-fun m!312467 () Bool)

(assert (=> b!201957 m!312467))

(declare-fun m!312469 () Bool)

(assert (=> start!42890 m!312469))

(assert (=> b!201956 m!312461))

(assert (=> b!201956 m!312463))

(declare-fun m!312471 () Bool)

(assert (=> b!201958 m!312471))

(declare-fun m!312473 () Bool)

(assert (=> b!201960 m!312473))

(assert (=> b!201960 m!312473))

(declare-fun m!312475 () Bool)

(assert (=> b!201960 m!312475))

(declare-fun m!312477 () Bool)

(assert (=> b!201962 m!312477))

(check-sat (not b!201959) (not b!201963) (not b!201957) (not b!201956) (not start!42890) (not b!201958) (not b!201955) (not b!201960) (not b!201962))
(check-sat)
