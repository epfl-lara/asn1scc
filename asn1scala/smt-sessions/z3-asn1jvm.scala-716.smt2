; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20010 () Bool)

(assert start!20010)

(declare-fun b!99971 () Bool)

(declare-fun e!65425 () Bool)

(declare-fun e!65424 () Bool)

(assert (=> b!99971 (= e!65425 (not e!65424))))

(declare-fun res!82068 () Bool)

(assert (=> b!99971 (=> res!82068 e!65424)))

(declare-datatypes ((array!4709 0))(
  ( (array!4710 (arr!2743 (Array (_ BitVec 32) (_ BitVec 8))) (size!2150 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3774 0))(
  ( (BitStream!3775 (buf!2507 array!4709) (currentByte!4953 (_ BitVec 32)) (currentBit!4948 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6127 0))(
  ( (Unit!6128) )
))
(declare-datatypes ((tuple2!8066 0))(
  ( (tuple2!8067 (_1!4288 Unit!6127) (_2!4288 BitStream!3774)) )
))
(declare-fun lt!144659 () tuple2!8066)

(declare-fun lt!144660 () tuple2!8066)

(assert (=> b!99971 (= res!82068 (not (= (size!2150 (buf!2507 (_2!4288 lt!144659))) (size!2150 (buf!2507 (_2!4288 lt!144660))))))))

(declare-fun e!65427 () Bool)

(assert (=> b!99971 e!65427))

(declare-fun res!82071 () Bool)

(assert (=> b!99971 (=> (not res!82071) (not e!65427))))

(declare-fun thiss!1305 () BitStream!3774)

(declare-fun isPrefixOf!0 (BitStream!3774 BitStream!3774) Bool)

(assert (=> b!99971 (= res!82071 (isPrefixOf!0 thiss!1305 (_2!4288 lt!144660)))))

(declare-fun lt!144662 () Unit!6127)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3774 BitStream!3774 BitStream!3774) Unit!6127)

(assert (=> b!99971 (= lt!144662 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4288 lt!144659) (_2!4288 lt!144660)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3774 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8066)

(assert (=> b!99971 (= lt!144660 (appendNLeastSignificantBitsLoop!0 (_2!4288 lt!144659) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65430 () Bool)

(assert (=> b!99971 e!65430))

(declare-fun res!82076 () Bool)

(assert (=> b!99971 (=> (not res!82076) (not e!65430))))

(assert (=> b!99971 (= res!82076 (= (size!2150 (buf!2507 thiss!1305)) (size!2150 (buf!2507 (_2!4288 lt!144659)))))))

(declare-fun lt!144656 () Bool)

(declare-fun appendBit!0 (BitStream!3774 Bool) tuple2!8066)

(assert (=> b!99971 (= lt!144659 (appendBit!0 thiss!1305 lt!144656))))

(assert (=> b!99971 (= lt!144656 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!99972 () Bool)

(declare-fun res!82067 () Bool)

(assert (=> b!99972 (=> (not res!82067) (not e!65425))))

(assert (=> b!99972 (= res!82067 (bvslt i!615 nBits!396))))

(declare-fun b!99973 () Bool)

(declare-fun res!82075 () Bool)

(assert (=> b!99973 (=> (not res!82075) (not e!65425))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99973 (= res!82075 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!99974 () Bool)

(declare-fun res!82073 () Bool)

(declare-fun e!65426 () Bool)

(assert (=> b!99974 (=> (not res!82073) (not e!65426))))

(assert (=> b!99974 (= res!82073 (isPrefixOf!0 thiss!1305 (_2!4288 lt!144659)))))

(declare-fun b!99975 () Bool)

(declare-fun res!82074 () Bool)

(assert (=> b!99975 (=> res!82074 e!65424)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99975 (= res!82074 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!2150 (buf!2507 (_2!4288 lt!144659)))) ((_ sign_extend 32) (currentByte!4953 thiss!1305)) ((_ sign_extend 32) (currentBit!4948 thiss!1305)))))))

(declare-fun b!99976 () Bool)

(assert (=> b!99976 (= e!65430 e!65426)))

(declare-fun res!82065 () Bool)

(assert (=> b!99976 (=> (not res!82065) (not e!65426))))

(declare-fun lt!144658 () (_ BitVec 64))

(declare-fun lt!144664 () (_ BitVec 64))

(assert (=> b!99976 (= res!82065 (= lt!144658 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144664)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!99976 (= lt!144658 (bitIndex!0 (size!2150 (buf!2507 (_2!4288 lt!144659))) (currentByte!4953 (_2!4288 lt!144659)) (currentBit!4948 (_2!4288 lt!144659))))))

(assert (=> b!99976 (= lt!144664 (bitIndex!0 (size!2150 (buf!2507 thiss!1305)) (currentByte!4953 thiss!1305) (currentBit!4948 thiss!1305)))))

(declare-fun b!99977 () Bool)

(declare-fun e!65423 () Bool)

(assert (=> b!99977 (= e!65426 e!65423)))

(declare-fun res!82069 () Bool)

(assert (=> b!99977 (=> (not res!82069) (not e!65423))))

(declare-datatypes ((tuple2!8068 0))(
  ( (tuple2!8069 (_1!4289 BitStream!3774) (_2!4289 Bool)) )
))
(declare-fun lt!144661 () tuple2!8068)

(assert (=> b!99977 (= res!82069 (and (= (_2!4289 lt!144661) lt!144656) (= (_1!4289 lt!144661) (_2!4288 lt!144659))))))

(declare-fun readBitPure!0 (BitStream!3774) tuple2!8068)

(declare-fun readerFrom!0 (BitStream!3774 (_ BitVec 32) (_ BitVec 32)) BitStream!3774)

(assert (=> b!99977 (= lt!144661 (readBitPure!0 (readerFrom!0 (_2!4288 lt!144659) (currentBit!4948 thiss!1305) (currentByte!4953 thiss!1305))))))

(declare-fun b!99978 () Bool)

(declare-fun res!82066 () Bool)

(assert (=> b!99978 (=> res!82066 e!65424)))

(declare-fun arrayBitRangesEq!0 (array!4709 array!4709 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99978 (= res!82066 (not (arrayBitRangesEq!0 (buf!2507 (_2!4288 lt!144659)) (buf!2507 (_2!4288 lt!144660)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!2150 (buf!2507 (_2!4288 lt!144659))) (currentByte!4953 thiss!1305) (currentBit!4948 thiss!1305))))))))

(declare-fun b!99979 () Bool)

(declare-fun res!82072 () Bool)

(assert (=> b!99979 (=> (not res!82072) (not e!65425))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!99979 (= res!82072 (validate_offset_bits!1 ((_ sign_extend 32) (size!2150 (buf!2507 thiss!1305))) ((_ sign_extend 32) (currentByte!4953 thiss!1305)) ((_ sign_extend 32) (currentBit!4948 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!99980 () Bool)

(declare-fun e!65428 () Bool)

(declare-fun array_inv!1952 (array!4709) Bool)

(assert (=> b!99980 (= e!65428 (array_inv!1952 (buf!2507 thiss!1305)))))

(declare-fun b!99981 () Bool)

(assert (=> b!99981 (= e!65423 (= (bitIndex!0 (size!2150 (buf!2507 (_1!4289 lt!144661))) (currentByte!4953 (_1!4289 lt!144661)) (currentBit!4948 (_1!4289 lt!144661))) lt!144658))))

(declare-fun res!82070 () Bool)

(assert (=> start!20010 (=> (not res!82070) (not e!65425))))

(assert (=> start!20010 (= res!82070 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20010 e!65425))

(assert (=> start!20010 true))

(declare-fun inv!12 (BitStream!3774) Bool)

(assert (=> start!20010 (and (inv!12 thiss!1305) e!65428)))

(declare-fun b!99982 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!99982 (= e!65427 (invariant!0 (currentBit!4948 thiss!1305) (currentByte!4953 thiss!1305) (size!2150 (buf!2507 (_2!4288 lt!144659)))))))

(declare-fun b!99983 () Bool)

(assert (=> b!99983 (= e!65424 true)))

(declare-fun lt!144663 () tuple2!8068)

(assert (=> b!99983 (= lt!144663 (readBitPure!0 (BitStream!3775 (buf!2507 (_2!4288 lt!144660)) (currentByte!4953 thiss!1305) (currentBit!4948 thiss!1305))))))

(declare-fun lt!144657 () tuple2!8068)

(assert (=> b!99983 (= lt!144657 (readBitPure!0 (BitStream!3775 (buf!2507 (_2!4288 lt!144659)) (currentByte!4953 thiss!1305) (currentBit!4948 thiss!1305))))))

(assert (=> b!99983 (invariant!0 (currentBit!4948 thiss!1305) (currentByte!4953 thiss!1305) (size!2150 (buf!2507 (_2!4288 lt!144660))))))

(assert (= (and start!20010 res!82070) b!99979))

(assert (= (and b!99979 res!82072) b!99973))

(assert (= (and b!99973 res!82075) b!99972))

(assert (= (and b!99972 res!82067) b!99971))

(assert (= (and b!99971 res!82076) b!99976))

(assert (= (and b!99976 res!82065) b!99974))

(assert (= (and b!99974 res!82073) b!99977))

(assert (= (and b!99977 res!82069) b!99981))

(assert (= (and b!99971 res!82071) b!99982))

(assert (= (and b!99971 (not res!82068)) b!99975))

(assert (= (and b!99975 (not res!82074)) b!99978))

(assert (= (and b!99978 (not res!82066)) b!99983))

(assert (= start!20010 b!99980))

(declare-fun m!145315 () Bool)

(assert (=> b!99983 m!145315))

(declare-fun m!145317 () Bool)

(assert (=> b!99983 m!145317))

(declare-fun m!145319 () Bool)

(assert (=> b!99983 m!145319))

(declare-fun m!145321 () Bool)

(assert (=> b!99971 m!145321))

(declare-fun m!145323 () Bool)

(assert (=> b!99971 m!145323))

(declare-fun m!145325 () Bool)

(assert (=> b!99971 m!145325))

(declare-fun m!145327 () Bool)

(assert (=> b!99971 m!145327))

(declare-fun m!145329 () Bool)

(assert (=> b!99976 m!145329))

(declare-fun m!145331 () Bool)

(assert (=> b!99976 m!145331))

(declare-fun m!145333 () Bool)

(assert (=> b!99981 m!145333))

(declare-fun m!145335 () Bool)

(assert (=> b!99975 m!145335))

(declare-fun m!145337 () Bool)

(assert (=> b!99977 m!145337))

(assert (=> b!99977 m!145337))

(declare-fun m!145339 () Bool)

(assert (=> b!99977 m!145339))

(declare-fun m!145341 () Bool)

(assert (=> start!20010 m!145341))

(declare-fun m!145343 () Bool)

(assert (=> b!99978 m!145343))

(declare-fun m!145345 () Bool)

(assert (=> b!99978 m!145345))

(declare-fun m!145347 () Bool)

(assert (=> b!99974 m!145347))

(declare-fun m!145349 () Bool)

(assert (=> b!99980 m!145349))

(declare-fun m!145351 () Bool)

(assert (=> b!99982 m!145351))

(declare-fun m!145353 () Bool)

(assert (=> b!99973 m!145353))

(declare-fun m!145355 () Bool)

(assert (=> b!99979 m!145355))

(check-sat (not b!99977) (not b!99980) (not b!99983) (not b!99976) (not start!20010) (not b!99975) (not b!99982) (not b!99981) (not b!99978) (not b!99974) (not b!99979) (not b!99973) (not b!99971))
