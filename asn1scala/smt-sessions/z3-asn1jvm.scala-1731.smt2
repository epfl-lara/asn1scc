; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47734 () Bool)

(assert start!47734)

(declare-fun b!227214 () Bool)

(declare-fun e!155445 () Bool)

(declare-datatypes ((array!11401 0))(
  ( (array!11402 (arr!5975 (Array (_ BitVec 32) (_ BitVec 8))) (size!5000 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9096 0))(
  ( (BitStream!9097 (buf!5541 array!11401) (currentByte!10379 (_ BitVec 32)) (currentBit!10374 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9096)

(declare-fun array_inv!4741 (array!11401) Bool)

(assert (=> b!227214 (= e!155445 (array_inv!4741 (buf!5541 thiss!1870)))))

(declare-fun b!227211 () Bool)

(declare-fun res!190626 () Bool)

(declare-fun e!155443 () Bool)

(assert (=> b!227211 (=> (not res!190626) (not e!155443))))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!227211 (= res!190626 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5000 (buf!5541 thiss!1870))) ((_ sign_extend 32) (currentByte!10379 thiss!1870)) ((_ sign_extend 32) (currentBit!10374 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun res!190627 () Bool)

(assert (=> start!47734 (=> (not res!190627) (not e!155443))))

(declare-fun arr!308 () array!11401)

(assert (=> start!47734 (= res!190627 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5000 arr!308))))))

(assert (=> start!47734 e!155443))

(assert (=> start!47734 true))

(assert (=> start!47734 (array_inv!4741 arr!308)))

(declare-fun inv!12 (BitStream!9096) Bool)

(assert (=> start!47734 (and (inv!12 thiss!1870) e!155445)))

(declare-fun b!227213 () Bool)

(assert (=> b!227213 (= e!155443 (not true))))

(declare-fun lt!362991 () array!11401)

(declare-fun arrayRangesEq!836 (array!11401 array!11401 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!227213 (arrayRangesEq!836 arr!308 lt!362991 #b00000000000000000000000000000000 i!761)))

(declare-datatypes ((Unit!16943 0))(
  ( (Unit!16944) )
))
(declare-fun lt!362989 () Unit!16943)

(declare-datatypes ((tuple2!19522 0))(
  ( (tuple2!19523 (_1!10594 (_ BitVec 8)) (_2!10594 BitStream!9096)) )
))
(declare-fun lt!362988 () tuple2!19522)

(declare-fun arrayUpdatedAtPrefixLemma!395 (array!11401 (_ BitVec 32) (_ BitVec 8)) Unit!16943)

(assert (=> b!227213 (= lt!362989 (arrayUpdatedAtPrefixLemma!395 arr!308 i!761 (_1!10594 lt!362988)))))

(declare-fun lt!362986 () (_ BitVec 32))

(declare-fun lt!362990 () (_ BitVec 64))

(declare-datatypes ((tuple3!1382 0))(
  ( (tuple3!1383 (_1!10595 Unit!16943) (_2!10595 BitStream!9096) (_3!833 array!11401)) )
))
(declare-fun lt!362993 () tuple3!1382)

(declare-fun lt!362994 () (_ BitVec 64))

(declare-fun lt!362987 () (_ BitVec 64))

(assert (=> b!227213 (and (= (bvadd lt!362990 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!362986))) lt!362987) (= (bvadd lt!362994 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!362987) (= (buf!5541 thiss!1870) (buf!5541 (_2!10595 lt!362993))) (= (size!5000 arr!308) (size!5000 (_3!833 lt!362993))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!227213 (= lt!362987 (bitIndex!0 (size!5000 (buf!5541 (_2!10595 lt!362993))) (currentByte!10379 (_2!10595 lt!362993)) (currentBit!10374 (_2!10595 lt!362993))))))

(assert (=> b!227213 (= lt!362990 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!362994))))

(assert (=> b!227213 (= lt!362990 (bitIndex!0 (size!5000 (buf!5541 (_2!10594 lt!362988))) (currentByte!10379 (_2!10594 lt!362988)) (currentBit!10374 (_2!10594 lt!362988))))))

(assert (=> b!227213 (= lt!362994 (bitIndex!0 (size!5000 (buf!5541 thiss!1870)) (currentByte!10379 thiss!1870) (currentBit!10374 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9096 array!11401 (_ BitVec 32) (_ BitVec 32)) tuple3!1382)

(assert (=> b!227213 (= lt!362993 (readByteArrayLoop!0 (_2!10594 lt!362988) lt!362991 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!227213 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5000 (buf!5541 (_2!10594 lt!362988)))) ((_ sign_extend 32) (currentByte!10379 (_2!10594 lt!362988))) ((_ sign_extend 32) (currentBit!10374 (_2!10594 lt!362988))) lt!362986)))

(assert (=> b!227213 (= lt!362986 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!362992 () Unit!16943)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9096 BitStream!9096 (_ BitVec 64) (_ BitVec 32)) Unit!16943)

(assert (=> b!227213 (= lt!362992 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10594 lt!362988) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!227213 (= lt!362991 (array!11402 (store (arr!5975 arr!308) i!761 (_1!10594 lt!362988)) (size!5000 arr!308)))))

(declare-fun readByte!0 (BitStream!9096) tuple2!19522)

(assert (=> b!227213 (= lt!362988 (readByte!0 thiss!1870))))

(declare-fun b!227212 () Bool)

(declare-fun res!190625 () Bool)

(assert (=> b!227212 (=> (not res!190625) (not e!155443))))

(assert (=> b!227212 (= res!190625 (bvslt i!761 to!496))))

(assert (= (and start!47734 res!190627) b!227211))

(assert (= (and b!227211 res!190626) b!227212))

(assert (= (and b!227212 res!190625) b!227213))

(assert (= start!47734 b!227214))

(declare-fun m!349331 () Bool)

(assert (=> b!227214 m!349331))

(declare-fun m!349333 () Bool)

(assert (=> b!227211 m!349333))

(declare-fun m!349335 () Bool)

(assert (=> start!47734 m!349335))

(declare-fun m!349337 () Bool)

(assert (=> start!47734 m!349337))

(declare-fun m!349339 () Bool)

(assert (=> b!227213 m!349339))

(declare-fun m!349341 () Bool)

(assert (=> b!227213 m!349341))

(declare-fun m!349343 () Bool)

(assert (=> b!227213 m!349343))

(declare-fun m!349345 () Bool)

(assert (=> b!227213 m!349345))

(declare-fun m!349347 () Bool)

(assert (=> b!227213 m!349347))

(declare-fun m!349349 () Bool)

(assert (=> b!227213 m!349349))

(declare-fun m!349351 () Bool)

(assert (=> b!227213 m!349351))

(declare-fun m!349353 () Bool)

(assert (=> b!227213 m!349353))

(declare-fun m!349355 () Bool)

(assert (=> b!227213 m!349355))

(declare-fun m!349357 () Bool)

(assert (=> b!227213 m!349357))

(check-sat (not start!47734) (not b!227211) (not b!227213) (not b!227214))
