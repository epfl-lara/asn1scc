; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39964 () Bool)

(assert start!39964)

(declare-fun b!182120 () Bool)

(declare-fun e!126427 () Bool)

(declare-fun e!126424 () Bool)

(assert (=> b!182120 (= e!126427 (not e!126424))))

(declare-fun res!151331 () Bool)

(assert (=> b!182120 (=> res!151331 e!126424)))

(declare-fun lt!279604 () (_ BitVec 64))

(declare-fun lt!279618 () (_ BitVec 64))

(assert (=> b!182120 (= res!151331 (not (= lt!279604 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279618))))))

(declare-datatypes ((array!9724 0))(
  ( (array!9725 (arr!5219 (Array (_ BitVec 32) (_ BitVec 8))) (size!4289 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7686 0))(
  ( (BitStream!7687 (buf!4738 array!9724) (currentByte!8960 (_ BitVec 32)) (currentBit!8955 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13075 0))(
  ( (Unit!13076) )
))
(declare-datatypes ((tuple2!15724 0))(
  ( (tuple2!15725 (_1!8507 Unit!13075) (_2!8507 BitStream!7686)) )
))
(declare-fun lt!279623 () tuple2!15724)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182120 (= lt!279604 (bitIndex!0 (size!4289 (buf!4738 (_2!8507 lt!279623))) (currentByte!8960 (_2!8507 lt!279623)) (currentBit!8955 (_2!8507 lt!279623))))))

(declare-fun thiss!1204 () BitStream!7686)

(assert (=> b!182120 (= lt!279618 (bitIndex!0 (size!4289 (buf!4738 thiss!1204)) (currentByte!8960 thiss!1204) (currentBit!8955 thiss!1204)))))

(declare-fun e!126423 () Bool)

(assert (=> b!182120 e!126423))

(declare-fun res!151344 () Bool)

(assert (=> b!182120 (=> (not res!151344) (not e!126423))))

(assert (=> b!182120 (= res!151344 (= (size!4289 (buf!4738 thiss!1204)) (size!4289 (buf!4738 (_2!8507 lt!279623)))))))

(declare-fun lt!279620 () Bool)

(declare-fun appendBit!0 (BitStream!7686 Bool) tuple2!15724)

(assert (=> b!182120 (= lt!279623 (appendBit!0 thiss!1204 lt!279620))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> b!182120 (= lt!279620 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!182121 () Bool)

(declare-fun e!126420 () Bool)

(declare-fun array_inv!4030 (array!9724) Bool)

(assert (=> b!182121 (= e!126420 (array_inv!4030 (buf!4738 thiss!1204)))))

(declare-fun b!182122 () Bool)

(declare-fun res!151342 () Bool)

(assert (=> b!182122 (=> (not res!151342) (not e!126427))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!182122 (= res!151342 (invariant!0 (currentBit!8955 thiss!1204) (currentByte!8960 thiss!1204) (size!4289 (buf!4738 thiss!1204))))))

(declare-fun res!151332 () Bool)

(declare-fun e!126426 () Bool)

(assert (=> start!39964 (=> (not res!151332) (not e!126426))))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> start!39964 (= res!151332 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39964 e!126426))

(assert (=> start!39964 true))

(declare-fun inv!12 (BitStream!7686) Bool)

(assert (=> start!39964 (and (inv!12 thiss!1204) e!126420)))

(declare-fun b!182123 () Bool)

(declare-fun e!126418 () Bool)

(assert (=> b!182123 (= e!126424 e!126418)))

(declare-fun res!151335 () Bool)

(assert (=> b!182123 (=> res!151335 e!126418)))

(declare-fun lt!279617 () (_ BitVec 64))

(assert (=> b!182123 (= res!151335 (not (= lt!279617 (bvsub (bvsub (bvadd lt!279604 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun lt!279606 () tuple2!15724)

(assert (=> b!182123 (= lt!279617 (bitIndex!0 (size!4289 (buf!4738 (_2!8507 lt!279606))) (currentByte!8960 (_2!8507 lt!279606)) (currentBit!8955 (_2!8507 lt!279606))))))

(declare-fun isPrefixOf!0 (BitStream!7686 BitStream!7686) Bool)

(assert (=> b!182123 (isPrefixOf!0 thiss!1204 (_2!8507 lt!279606))))

(declare-fun lt!279621 () Unit!13075)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7686 BitStream!7686 BitStream!7686) Unit!13075)

(assert (=> b!182123 (= lt!279621 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8507 lt!279623) (_2!8507 lt!279606)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7686 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!15724)

(assert (=> b!182123 (= lt!279606 (appendBitsLSBFirstLoopTR!0 (_2!8507 lt!279623) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!182124 () Bool)

(declare-fun e!126417 () Bool)

(assert (=> b!182124 (= e!126423 e!126417)))

(declare-fun res!151340 () Bool)

(assert (=> b!182124 (=> (not res!151340) (not e!126417))))

(declare-fun lt!279612 () (_ BitVec 64))

(declare-fun lt!279608 () (_ BitVec 64))

(assert (=> b!182124 (= res!151340 (= lt!279612 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!279608)))))

(assert (=> b!182124 (= lt!279612 (bitIndex!0 (size!4289 (buf!4738 (_2!8507 lt!279623))) (currentByte!8960 (_2!8507 lt!279623)) (currentBit!8955 (_2!8507 lt!279623))))))

(assert (=> b!182124 (= lt!279608 (bitIndex!0 (size!4289 (buf!4738 thiss!1204)) (currentByte!8960 thiss!1204) (currentBit!8955 thiss!1204)))))

(declare-fun b!182125 () Bool)

(declare-fun res!151341 () Bool)

(assert (=> b!182125 (=> res!151341 e!126418)))

(assert (=> b!182125 (= res!151341 (not (isPrefixOf!0 thiss!1204 (_2!8507 lt!279623))))))

(declare-fun b!182126 () Bool)

(declare-fun res!151334 () Bool)

(assert (=> b!182126 (=> res!151334 e!126418)))

(assert (=> b!182126 (= res!151334 (or (not (= (size!4289 (buf!4738 (_2!8507 lt!279606))) (size!4289 (buf!4738 thiss!1204)))) (not (= lt!279617 (bvsub (bvadd lt!279618 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!182127 () Bool)

(declare-fun res!151336 () Bool)

(assert (=> b!182127 (=> (not res!151336) (not e!126427))))

(assert (=> b!182127 (= res!151336 (not (= i!590 nBits!348)))))

(declare-fun b!182128 () Bool)

(declare-fun res!151330 () Bool)

(assert (=> b!182128 (=> res!151330 e!126418)))

(assert (=> b!182128 (= res!151330 (not (invariant!0 (currentBit!8955 (_2!8507 lt!279606)) (currentByte!8960 (_2!8507 lt!279606)) (size!4289 (buf!4738 (_2!8507 lt!279606))))))))

(declare-fun b!182129 () Bool)

(declare-fun res!151343 () Bool)

(assert (=> b!182129 (=> (not res!151343) (not e!126417))))

(assert (=> b!182129 (= res!151343 (isPrefixOf!0 thiss!1204 (_2!8507 lt!279623)))))

(declare-fun b!182130 () Bool)

(declare-fun e!126425 () Bool)

(assert (=> b!182130 (= e!126417 e!126425)))

(declare-fun res!151333 () Bool)

(assert (=> b!182130 (=> (not res!151333) (not e!126425))))

(declare-datatypes ((tuple2!15726 0))(
  ( (tuple2!15727 (_1!8508 BitStream!7686) (_2!8508 Bool)) )
))
(declare-fun lt!279610 () tuple2!15726)

(assert (=> b!182130 (= res!151333 (and (= (_2!8508 lt!279610) lt!279620) (= (_1!8508 lt!279610) (_2!8507 lt!279623))))))

(declare-fun readBitPure!0 (BitStream!7686) tuple2!15726)

(declare-fun readerFrom!0 (BitStream!7686 (_ BitVec 32) (_ BitVec 32)) BitStream!7686)

(assert (=> b!182130 (= lt!279610 (readBitPure!0 (readerFrom!0 (_2!8507 lt!279623) (currentBit!8955 thiss!1204) (currentByte!8960 thiss!1204))))))

(declare-fun b!182131 () Bool)

(declare-fun e!126421 () Bool)

(assert (=> b!182131 (= e!126421 (invariant!0 (currentBit!8955 thiss!1204) (currentByte!8960 thiss!1204) (size!4289 (buf!4738 (_2!8507 lt!279606)))))))

(declare-fun b!182132 () Bool)

(declare-fun res!151339 () Bool)

(assert (=> b!182132 (=> res!151339 e!126418)))

(assert (=> b!182132 (= res!151339 (not (isPrefixOf!0 (_2!8507 lt!279623) (_2!8507 lt!279606))))))

(declare-fun b!182133 () Bool)

(assert (=> b!182133 (= e!126418 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!590)) (bvsle (bvadd #b00000000000000000000000000000001 i!590) nBits!348)))))

(declare-fun lt!279607 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!182133 (validate_offset_bits!1 ((_ sign_extend 32) (size!4289 (buf!4738 (_2!8507 lt!279606)))) ((_ sign_extend 32) (currentByte!8960 (_2!8507 lt!279623))) ((_ sign_extend 32) (currentBit!8955 (_2!8507 lt!279623))) lt!279607)))

(declare-fun lt!279611 () Unit!13075)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7686 array!9724 (_ BitVec 64)) Unit!13075)

(assert (=> b!182133 (= lt!279611 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8507 lt!279623) (buf!4738 (_2!8507 lt!279606)) lt!279607))))

(assert (=> b!182133 (= lt!279607 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!15728 0))(
  ( (tuple2!15729 (_1!8509 BitStream!7686) (_2!8509 BitStream!7686)) )
))
(declare-fun lt!279605 () tuple2!15728)

(declare-datatypes ((tuple2!15730 0))(
  ( (tuple2!15731 (_1!8510 BitStream!7686) (_2!8510 (_ BitVec 64))) )
))
(declare-fun lt!279622 () tuple2!15730)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7686 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!15730)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!182133 (= lt!279622 (readNBitsLSBFirstsLoopPure!0 (_1!8509 lt!279605) nBits!348 i!590 (bvand v!189 (onesLSBLong!0 i!590))))))

(declare-fun lt!279616 () (_ BitVec 64))

(assert (=> b!182133 (validate_offset_bits!1 ((_ sign_extend 32) (size!4289 (buf!4738 (_2!8507 lt!279606)))) ((_ sign_extend 32) (currentByte!8960 thiss!1204)) ((_ sign_extend 32) (currentBit!8955 thiss!1204)) lt!279616)))

(declare-fun lt!279615 () Unit!13075)

(assert (=> b!182133 (= lt!279615 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4738 (_2!8507 lt!279606)) lt!279616))))

(assert (=> b!182133 (= (_2!8508 (readBitPure!0 (_1!8509 lt!279605))) lt!279620)))

(declare-fun lt!279614 () tuple2!15728)

(declare-fun reader!0 (BitStream!7686 BitStream!7686) tuple2!15728)

(assert (=> b!182133 (= lt!279614 (reader!0 (_2!8507 lt!279623) (_2!8507 lt!279606)))))

(assert (=> b!182133 (= lt!279605 (reader!0 thiss!1204 (_2!8507 lt!279606)))))

(declare-fun e!126419 () Bool)

(assert (=> b!182133 e!126419))

(declare-fun res!151329 () Bool)

(assert (=> b!182133 (=> (not res!151329) (not e!126419))))

(declare-fun lt!279609 () tuple2!15726)

(declare-fun lt!279613 () tuple2!15726)

(assert (=> b!182133 (= res!151329 (= (bitIndex!0 (size!4289 (buf!4738 (_1!8508 lt!279609))) (currentByte!8960 (_1!8508 lt!279609)) (currentBit!8955 (_1!8508 lt!279609))) (bitIndex!0 (size!4289 (buf!4738 (_1!8508 lt!279613))) (currentByte!8960 (_1!8508 lt!279613)) (currentBit!8955 (_1!8508 lt!279613)))))))

(declare-fun lt!279619 () Unit!13075)

(declare-fun lt!279603 () BitStream!7686)

(declare-fun readBitPrefixLemma!0 (BitStream!7686 BitStream!7686) Unit!13075)

(assert (=> b!182133 (= lt!279619 (readBitPrefixLemma!0 lt!279603 (_2!8507 lt!279606)))))

(assert (=> b!182133 (= lt!279613 (readBitPure!0 (BitStream!7687 (buf!4738 (_2!8507 lt!279606)) (currentByte!8960 thiss!1204) (currentBit!8955 thiss!1204))))))

(assert (=> b!182133 (= lt!279609 (readBitPure!0 lt!279603))))

(assert (=> b!182133 e!126421))

(declare-fun res!151337 () Bool)

(assert (=> b!182133 (=> (not res!151337) (not e!126421))))

(assert (=> b!182133 (= res!151337 (invariant!0 (currentBit!8955 thiss!1204) (currentByte!8960 thiss!1204) (size!4289 (buf!4738 (_2!8507 lt!279623)))))))

(assert (=> b!182133 (= lt!279603 (BitStream!7687 (buf!4738 (_2!8507 lt!279623)) (currentByte!8960 thiss!1204) (currentBit!8955 thiss!1204)))))

(declare-fun b!182134 () Bool)

(assert (=> b!182134 (= e!126419 (= (_2!8508 lt!279609) (_2!8508 lt!279613)))))

(declare-fun b!182135 () Bool)

(assert (=> b!182135 (= e!126425 (= (bitIndex!0 (size!4289 (buf!4738 (_1!8508 lt!279610))) (currentByte!8960 (_1!8508 lt!279610)) (currentBit!8955 (_1!8508 lt!279610))) lt!279612))))

(declare-fun b!182136 () Bool)

(assert (=> b!182136 (= e!126426 e!126427)))

(declare-fun res!151338 () Bool)

(assert (=> b!182136 (=> (not res!151338) (not e!126427))))

(assert (=> b!182136 (= res!151338 (validate_offset_bits!1 ((_ sign_extend 32) (size!4289 (buf!4738 thiss!1204))) ((_ sign_extend 32) (currentByte!8960 thiss!1204)) ((_ sign_extend 32) (currentBit!8955 thiss!1204)) lt!279616))))

(assert (=> b!182136 (= lt!279616 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!39964 res!151332) b!182136))

(assert (= (and b!182136 res!151338) b!182122))

(assert (= (and b!182122 res!151342) b!182127))

(assert (= (and b!182127 res!151336) b!182120))

(assert (= (and b!182120 res!151344) b!182124))

(assert (= (and b!182124 res!151340) b!182129))

(assert (= (and b!182129 res!151343) b!182130))

(assert (= (and b!182130 res!151333) b!182135))

(assert (= (and b!182120 (not res!151331)) b!182123))

(assert (= (and b!182123 (not res!151335)) b!182128))

(assert (= (and b!182128 (not res!151330)) b!182126))

(assert (= (and b!182126 (not res!151334)) b!182132))

(assert (= (and b!182132 (not res!151339)) b!182125))

(assert (= (and b!182125 (not res!151341)) b!182133))

(assert (= (and b!182133 res!151337) b!182131))

(assert (= (and b!182133 res!151329) b!182134))

(assert (= start!39964 b!182121))

(declare-fun m!283297 () Bool)

(assert (=> b!182128 m!283297))

(declare-fun m!283299 () Bool)

(assert (=> start!39964 m!283299))

(declare-fun m!283301 () Bool)

(assert (=> b!182131 m!283301))

(declare-fun m!283303 () Bool)

(assert (=> b!182133 m!283303))

(declare-fun m!283305 () Bool)

(assert (=> b!182133 m!283305))

(declare-fun m!283307 () Bool)

(assert (=> b!182133 m!283307))

(declare-fun m!283309 () Bool)

(assert (=> b!182133 m!283309))

(declare-fun m!283311 () Bool)

(assert (=> b!182133 m!283311))

(declare-fun m!283313 () Bool)

(assert (=> b!182133 m!283313))

(declare-fun m!283315 () Bool)

(assert (=> b!182133 m!283315))

(declare-fun m!283317 () Bool)

(assert (=> b!182133 m!283317))

(declare-fun m!283319 () Bool)

(assert (=> b!182133 m!283319))

(declare-fun m!283321 () Bool)

(assert (=> b!182133 m!283321))

(declare-fun m!283323 () Bool)

(assert (=> b!182133 m!283323))

(declare-fun m!283325 () Bool)

(assert (=> b!182133 m!283325))

(declare-fun m!283327 () Bool)

(assert (=> b!182133 m!283327))

(declare-fun m!283329 () Bool)

(assert (=> b!182133 m!283329))

(declare-fun m!283331 () Bool)

(assert (=> b!182133 m!283331))

(declare-fun m!283333 () Bool)

(assert (=> b!182122 m!283333))

(declare-fun m!283335 () Bool)

(assert (=> b!182123 m!283335))

(declare-fun m!283337 () Bool)

(assert (=> b!182123 m!283337))

(declare-fun m!283339 () Bool)

(assert (=> b!182123 m!283339))

(declare-fun m!283341 () Bool)

(assert (=> b!182123 m!283341))

(declare-fun m!283343 () Bool)

(assert (=> b!182125 m!283343))

(declare-fun m!283345 () Bool)

(assert (=> b!182132 m!283345))

(declare-fun m!283347 () Bool)

(assert (=> b!182130 m!283347))

(assert (=> b!182130 m!283347))

(declare-fun m!283349 () Bool)

(assert (=> b!182130 m!283349))

(declare-fun m!283351 () Bool)

(assert (=> b!182121 m!283351))

(assert (=> b!182129 m!283343))

(declare-fun m!283353 () Bool)

(assert (=> b!182136 m!283353))

(declare-fun m!283355 () Bool)

(assert (=> b!182124 m!283355))

(declare-fun m!283357 () Bool)

(assert (=> b!182124 m!283357))

(declare-fun m!283359 () Bool)

(assert (=> b!182135 m!283359))

(assert (=> b!182120 m!283355))

(assert (=> b!182120 m!283357))

(declare-fun m!283361 () Bool)

(assert (=> b!182120 m!283361))

(check-sat (not b!182136) (not b!182122) (not b!182123) (not b!182130) (not b!182135) (not b!182133) (not b!182121) (not b!182120) (not b!182129) (not start!39964) (not b!182131) (not b!182132) (not b!182128) (not b!182124) (not b!182125))
(check-sat)
