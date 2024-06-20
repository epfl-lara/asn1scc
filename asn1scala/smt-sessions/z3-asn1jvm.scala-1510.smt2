; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41836 () Bool)

(assert start!41836)

(declare-fun b!196794 () Bool)

(declare-fun res!164682 () Bool)

(declare-fun e!135212 () Bool)

(assert (=> b!196794 (=> res!164682 e!135212)))

(declare-datatypes ((array!10084 0))(
  ( (array!10085 (arr!5375 (Array (_ BitVec 32) (_ BitVec 8))) (size!4445 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7998 0))(
  ( (BitStream!7999 (buf!4931 array!10084) (currentByte!9260 (_ BitVec 32)) (currentBit!9255 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13922 0))(
  ( (Unit!13923) )
))
(declare-datatypes ((tuple2!17022 0))(
  ( (tuple2!17023 (_1!9156 Unit!13922) (_2!9156 BitStream!7998)) )
))
(declare-fun lt!306280 () tuple2!17022)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!196794 (= res!164682 (not (invariant!0 (currentBit!9255 (_2!9156 lt!306280)) (currentByte!9260 (_2!9156 lt!306280)) (size!4445 (buf!4931 (_2!9156 lt!306280))))))))

(declare-fun lt!306284 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!7998)

(declare-fun b!196795 () Bool)

(declare-fun lt!306282 () (_ BitVec 64))

(assert (=> b!196795 (= e!135212 (or (not (= (size!4445 (buf!4931 (_2!9156 lt!306280))) (size!4445 (buf!4931 thiss!1204)))) (= lt!306282 (bvsub (bvadd lt!306284 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))))

(declare-fun b!196796 () Bool)

(declare-fun res!164679 () Bool)

(declare-fun e!135217 () Bool)

(assert (=> b!196796 (=> (not res!164679) (not e!135217))))

(declare-fun lt!306286 () tuple2!17022)

(declare-fun isPrefixOf!0 (BitStream!7998 BitStream!7998) Bool)

(assert (=> b!196796 (= res!164679 (isPrefixOf!0 thiss!1204 (_2!9156 lt!306286)))))

(declare-fun b!196798 () Bool)

(declare-fun res!164681 () Bool)

(declare-fun e!135216 () Bool)

(assert (=> b!196798 (=> (not res!164681) (not e!135216))))

(assert (=> b!196798 (= res!164681 (invariant!0 (currentBit!9255 thiss!1204) (currentByte!9260 thiss!1204) (size!4445 (buf!4931 thiss!1204))))))

(declare-fun b!196799 () Bool)

(declare-fun e!135214 () Bool)

(assert (=> b!196799 (= e!135216 (not e!135214))))

(declare-fun res!164675 () Bool)

(assert (=> b!196799 (=> res!164675 e!135214)))

(declare-fun lt!306287 () (_ BitVec 64))

(assert (=> b!196799 (= res!164675 (not (= lt!306287 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306284))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!196799 (= lt!306287 (bitIndex!0 (size!4445 (buf!4931 (_2!9156 lt!306286))) (currentByte!9260 (_2!9156 lt!306286)) (currentBit!9255 (_2!9156 lt!306286))))))

(assert (=> b!196799 (= lt!306284 (bitIndex!0 (size!4445 (buf!4931 thiss!1204)) (currentByte!9260 thiss!1204) (currentBit!9255 thiss!1204)))))

(declare-fun e!135213 () Bool)

(assert (=> b!196799 e!135213))

(declare-fun res!164676 () Bool)

(assert (=> b!196799 (=> (not res!164676) (not e!135213))))

(assert (=> b!196799 (= res!164676 (= (size!4445 (buf!4931 thiss!1204)) (size!4445 (buf!4931 (_2!9156 lt!306286)))))))

(declare-fun lt!306288 () Bool)

(declare-fun appendBit!0 (BitStream!7998 Bool) tuple2!17022)

(assert (=> b!196799 (= lt!306286 (appendBit!0 thiss!1204 lt!306288))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!196799 (= lt!306288 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!196800 () Bool)

(assert (=> b!196800 (= e!135214 e!135212)))

(declare-fun res!164678 () Bool)

(assert (=> b!196800 (=> res!164678 e!135212)))

(assert (=> b!196800 (= res!164678 (not (= lt!306282 (bvsub (bvsub (bvadd lt!306287 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!196800 (= lt!306282 (bitIndex!0 (size!4445 (buf!4931 (_2!9156 lt!306280))) (currentByte!9260 (_2!9156 lt!306280)) (currentBit!9255 (_2!9156 lt!306280))))))

(assert (=> b!196800 (isPrefixOf!0 thiss!1204 (_2!9156 lt!306280))))

(declare-fun lt!306285 () Unit!13922)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7998 BitStream!7998 BitStream!7998) Unit!13922)

(assert (=> b!196800 (= lt!306285 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9156 lt!306286) (_2!9156 lt!306280)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7998 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17022)

(assert (=> b!196800 (= lt!306280 (appendBitsLSBFirstLoopTR!0 (_2!9156 lt!306286) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!196801 () Bool)

(declare-fun e!135215 () Bool)

(assert (=> b!196801 (= e!135217 e!135215)))

(declare-fun res!164677 () Bool)

(assert (=> b!196801 (=> (not res!164677) (not e!135215))))

(declare-datatypes ((tuple2!17024 0))(
  ( (tuple2!17025 (_1!9157 BitStream!7998) (_2!9157 Bool)) )
))
(declare-fun lt!306281 () tuple2!17024)

(assert (=> b!196801 (= res!164677 (and (= (_2!9157 lt!306281) lt!306288) (= (_1!9157 lt!306281) (_2!9156 lt!306286))))))

(declare-fun readBitPure!0 (BitStream!7998) tuple2!17024)

(declare-fun readerFrom!0 (BitStream!7998 (_ BitVec 32) (_ BitVec 32)) BitStream!7998)

(assert (=> b!196801 (= lt!306281 (readBitPure!0 (readerFrom!0 (_2!9156 lt!306286) (currentBit!9255 thiss!1204) (currentByte!9260 thiss!1204))))))

(declare-fun res!164680 () Bool)

(assert (=> start!41836 (=> (not res!164680) (not e!135216))))

(assert (=> start!41836 (= res!164680 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41836 e!135216))

(assert (=> start!41836 true))

(declare-fun e!135211 () Bool)

(declare-fun inv!12 (BitStream!7998) Bool)

(assert (=> start!41836 (and (inv!12 thiss!1204) e!135211)))

(declare-fun b!196797 () Bool)

(declare-fun array_inv!4186 (array!10084) Bool)

(assert (=> b!196797 (= e!135211 (array_inv!4186 (buf!4931 thiss!1204)))))

(declare-fun b!196802 () Bool)

(declare-fun res!164674 () Bool)

(assert (=> b!196802 (=> (not res!164674) (not e!135216))))

(assert (=> b!196802 (= res!164674 (not (= i!590 nBits!348)))))

(declare-fun b!196803 () Bool)

(assert (=> b!196803 (= e!135213 e!135217)))

(declare-fun res!164672 () Bool)

(assert (=> b!196803 (=> (not res!164672) (not e!135217))))

(declare-fun lt!306289 () (_ BitVec 64))

(declare-fun lt!306283 () (_ BitVec 64))

(assert (=> b!196803 (= res!164672 (= lt!306289 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!306283)))))

(assert (=> b!196803 (= lt!306289 (bitIndex!0 (size!4445 (buf!4931 (_2!9156 lt!306286))) (currentByte!9260 (_2!9156 lt!306286)) (currentBit!9255 (_2!9156 lt!306286))))))

(assert (=> b!196803 (= lt!306283 (bitIndex!0 (size!4445 (buf!4931 thiss!1204)) (currentByte!9260 thiss!1204) (currentBit!9255 thiss!1204)))))

(declare-fun b!196804 () Bool)

(declare-fun res!164673 () Bool)

(assert (=> b!196804 (=> (not res!164673) (not e!135216))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!196804 (= res!164673 (validate_offset_bits!1 ((_ sign_extend 32) (size!4445 (buf!4931 thiss!1204))) ((_ sign_extend 32) (currentByte!9260 thiss!1204)) ((_ sign_extend 32) (currentBit!9255 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!196805 () Bool)

(assert (=> b!196805 (= e!135215 (= (bitIndex!0 (size!4445 (buf!4931 (_1!9157 lt!306281))) (currentByte!9260 (_1!9157 lt!306281)) (currentBit!9255 (_1!9157 lt!306281))) lt!306289))))

(assert (= (and start!41836 res!164680) b!196804))

(assert (= (and b!196804 res!164673) b!196798))

(assert (= (and b!196798 res!164681) b!196802))

(assert (= (and b!196802 res!164674) b!196799))

(assert (= (and b!196799 res!164676) b!196803))

(assert (= (and b!196803 res!164672) b!196796))

(assert (= (and b!196796 res!164679) b!196801))

(assert (= (and b!196801 res!164677) b!196805))

(assert (= (and b!196799 (not res!164675)) b!196800))

(assert (= (and b!196800 (not res!164678)) b!196794))

(assert (= (and b!196794 (not res!164682)) b!196795))

(assert (= start!41836 b!196797))

(declare-fun m!304315 () Bool)

(assert (=> b!196796 m!304315))

(declare-fun m!304317 () Bool)

(assert (=> b!196794 m!304317))

(declare-fun m!304319 () Bool)

(assert (=> b!196804 m!304319))

(declare-fun m!304321 () Bool)

(assert (=> start!41836 m!304321))

(declare-fun m!304323 () Bool)

(assert (=> b!196805 m!304323))

(declare-fun m!304325 () Bool)

(assert (=> b!196797 m!304325))

(declare-fun m!304327 () Bool)

(assert (=> b!196801 m!304327))

(assert (=> b!196801 m!304327))

(declare-fun m!304329 () Bool)

(assert (=> b!196801 m!304329))

(declare-fun m!304331 () Bool)

(assert (=> b!196800 m!304331))

(declare-fun m!304333 () Bool)

(assert (=> b!196800 m!304333))

(declare-fun m!304335 () Bool)

(assert (=> b!196800 m!304335))

(declare-fun m!304337 () Bool)

(assert (=> b!196800 m!304337))

(declare-fun m!304339 () Bool)

(assert (=> b!196798 m!304339))

(declare-fun m!304341 () Bool)

(assert (=> b!196803 m!304341))

(declare-fun m!304343 () Bool)

(assert (=> b!196803 m!304343))

(assert (=> b!196799 m!304341))

(assert (=> b!196799 m!304343))

(declare-fun m!304345 () Bool)

(assert (=> b!196799 m!304345))

(check-sat (not b!196799) (not b!196805) (not b!196801) (not b!196804) (not b!196797) (not start!41836) (not b!196796) (not b!196800) (not b!196794) (not b!196798) (not b!196803))
(check-sat)
