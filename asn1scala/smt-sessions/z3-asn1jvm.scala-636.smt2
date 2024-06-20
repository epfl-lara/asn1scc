; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17862 () Bool)

(assert start!17862)

(declare-fun b!87513 () Bool)

(declare-fun e!58018 () Bool)

(declare-datatypes ((array!4130 0))(
  ( (array!4131 (arr!2503 (Array (_ BitVec 32) (_ BitVec 8))) (size!1866 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3294 0))(
  ( (BitStream!3295 (buf!2256 array!4130) (currentByte!4471 (_ BitVec 32)) (currentBit!4466 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5751 0))(
  ( (Unit!5752) )
))
(declare-datatypes ((tuple2!7400 0))(
  ( (tuple2!7401 (_1!3933 Unit!5751) (_2!3933 BitStream!3294)) )
))
(declare-fun lt!135663 () tuple2!7400)

(assert (=> b!87513 (= e!58018 (and (bvsle ((_ sign_extend 32) (size!1866 (buf!2256 (_2!3933 lt!135663)))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4471 (_2!3933 lt!135663))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4466 (_2!3933 lt!135663))) #b0000000000000000000000000000000001111111111111111111111111111111)))))

(declare-fun b!87514 () Bool)

(declare-fun e!58022 () Bool)

(declare-fun e!58024 () Bool)

(assert (=> b!87514 (= e!58022 e!58024)))

(declare-fun res!71983 () Bool)

(assert (=> b!87514 (=> (not res!71983) (not e!58024))))

(declare-fun lt!135662 () Bool)

(declare-datatypes ((tuple2!7402 0))(
  ( (tuple2!7403 (_1!3934 BitStream!3294) (_2!3934 Bool)) )
))
(declare-fun lt!135659 () tuple2!7402)

(assert (=> b!87514 (= res!71983 (and (= (_2!3934 lt!135659) lt!135662) (= (_1!3934 lt!135659) (_2!3933 lt!135663))))))

(declare-fun thiss!1152 () BitStream!3294)

(declare-fun readBitPure!0 (BitStream!3294) tuple2!7402)

(declare-fun readerFrom!0 (BitStream!3294 (_ BitVec 32) (_ BitVec 32)) BitStream!3294)

(assert (=> b!87514 (= lt!135659 (readBitPure!0 (readerFrom!0 (_2!3933 lt!135663) (currentBit!4466 thiss!1152) (currentByte!4471 thiss!1152))))))

(declare-fun b!87515 () Bool)

(declare-fun e!58019 () Bool)

(declare-fun array_inv!1712 (array!4130) Bool)

(assert (=> b!87515 (= e!58019 (array_inv!1712 (buf!2256 thiss!1152)))))

(declare-fun b!87516 () Bool)

(declare-fun res!71974 () Bool)

(declare-fun e!58023 () Bool)

(assert (=> b!87516 (=> (not res!71974) (not e!58023))))

(declare-fun thiss!1151 () BitStream!3294)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!87516 (= res!71974 (invariant!0 (currentBit!4466 thiss!1151) (currentByte!4471 thiss!1151) (size!1866 (buf!2256 thiss!1151))))))

(declare-fun b!87517 () Bool)

(declare-fun e!58021 () Bool)

(assert (=> b!87517 (= e!58021 (not e!58018))))

(declare-fun res!71972 () Bool)

(assert (=> b!87517 (=> res!71972 e!58018)))

(assert (=> b!87517 (= res!71972 (not (invariant!0 (currentBit!4466 (_2!3933 lt!135663)) (currentByte!4471 (_2!3933 lt!135663)) (size!1866 (buf!2256 (_2!3933 lt!135663))))))))

(declare-fun e!58025 () Bool)

(assert (=> b!87517 e!58025))

(declare-fun res!71971 () Bool)

(assert (=> b!87517 (=> (not res!71971) (not e!58025))))

(assert (=> b!87517 (= res!71971 (= (size!1866 (buf!2256 thiss!1152)) (size!1866 (buf!2256 (_2!3933 lt!135663)))))))

(declare-fun appendBit!0 (BitStream!3294 Bool) tuple2!7400)

(assert (=> b!87517 (= lt!135663 (appendBit!0 thiss!1152 lt!135662))))

(declare-fun v!179 () (_ BitVec 64))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!87517 (= lt!135662 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!87518 () Bool)

(assert (=> b!87518 (= e!58023 e!58021)))

(declare-fun res!71973 () Bool)

(assert (=> b!87518 (=> (not res!71973) (not e!58021))))

(declare-fun lt!135660 () (_ BitVec 64))

(declare-fun lt!135658 () (_ BitVec 64))

(assert (=> b!87518 (= res!71973 (= lt!135660 (bvadd lt!135658 ((_ sign_extend 32) i!576))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!87518 (= lt!135660 (bitIndex!0 (size!1866 (buf!2256 thiss!1152)) (currentByte!4471 thiss!1152) (currentBit!4466 thiss!1152)))))

(assert (=> b!87518 (= lt!135658 (bitIndex!0 (size!1866 (buf!2256 thiss!1151)) (currentByte!4471 thiss!1151) (currentBit!4466 thiss!1151)))))

(declare-fun b!87519 () Bool)

(declare-fun res!71986 () Bool)

(assert (=> b!87519 (=> (not res!71986) (not e!58021))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!87519 (= res!71986 (bvslt i!576 nBits!336))))

(declare-fun b!87520 () Bool)

(declare-fun e!58017 () Bool)

(assert (=> b!87520 (= e!58017 (array_inv!1712 (buf!2256 thiss!1151)))))

(declare-fun b!87521 () Bool)

(declare-fun res!71981 () Bool)

(assert (=> b!87521 (=> (not res!71981) (not e!58022))))

(declare-fun isPrefixOf!0 (BitStream!3294 BitStream!3294) Bool)

(assert (=> b!87521 (= res!71981 (isPrefixOf!0 thiss!1152 (_2!3933 lt!135663)))))

(declare-fun b!87522 () Bool)

(declare-fun res!71976 () Bool)

(assert (=> b!87522 (=> res!71976 e!58018)))

(assert (=> b!87522 (= res!71976 (not (= (bitIndex!0 (size!1866 (buf!2256 (_2!3933 lt!135663))) (currentByte!4471 (_2!3933 lt!135663)) (currentBit!4466 (_2!3933 lt!135663))) (bvadd lt!135658 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!576))))))))

(declare-fun b!87512 () Bool)

(declare-fun res!71975 () Bool)

(assert (=> b!87512 (=> (not res!71975) (not e!58021))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!87512 (= res!71975 (validate_offset_bits!1 ((_ sign_extend 32) (size!1866 (buf!2256 thiss!1152))) ((_ sign_extend 32) (currentByte!4471 thiss!1152)) ((_ sign_extend 32) (currentBit!4466 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun res!71977 () Bool)

(assert (=> start!17862 (=> (not res!71977) (not e!58023))))

(assert (=> start!17862 (= res!71977 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17862 e!58023))

(declare-fun inv!12 (BitStream!3294) Bool)

(assert (=> start!17862 (and (inv!12 thiss!1152) e!58019)))

(assert (=> start!17862 (and (inv!12 thiss!1151) e!58017)))

(assert (=> start!17862 true))

(declare-fun b!87523 () Bool)

(declare-fun res!71985 () Bool)

(assert (=> b!87523 (=> res!71985 e!58018)))

(assert (=> b!87523 (= res!71985 (or (bvslt (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvadd #b00000000000000000000000000000001 i!576) #b00000000000000000000000000000000) (not (= (size!1866 (buf!2256 (_2!3933 lt!135663))) (size!1866 (buf!2256 thiss!1151))))))))

(declare-fun b!87524 () Bool)

(declare-fun res!71979 () Bool)

(assert (=> b!87524 (=> (not res!71979) (not e!58023))))

(assert (=> b!87524 (= res!71979 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!87525 () Bool)

(declare-fun lt!135661 () (_ BitVec 64))

(assert (=> b!87525 (= e!58024 (= (bitIndex!0 (size!1866 (buf!2256 (_1!3934 lt!135659))) (currentByte!4471 (_1!3934 lt!135659)) (currentBit!4466 (_1!3934 lt!135659))) lt!135661))))

(declare-fun b!87526 () Bool)

(declare-fun res!71978 () Bool)

(assert (=> b!87526 (=> (not res!71978) (not e!58023))))

(assert (=> b!87526 (= res!71978 (validate_offset_bits!1 ((_ sign_extend 32) (size!1866 (buf!2256 thiss!1151))) ((_ sign_extend 32) (currentByte!4471 thiss!1151)) ((_ sign_extend 32) (currentBit!4466 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!87527 () Bool)

(declare-fun res!71984 () Bool)

(assert (=> b!87527 (=> (not res!71984) (not e!58023))))

(assert (=> b!87527 (= res!71984 (and (bvsle i!576 nBits!336) (= (size!1866 (buf!2256 thiss!1152)) (size!1866 (buf!2256 thiss!1151)))))))

(declare-fun b!87528 () Bool)

(assert (=> b!87528 (= e!58025 e!58022)))

(declare-fun res!71982 () Bool)

(assert (=> b!87528 (=> (not res!71982) (not e!58022))))

(assert (=> b!87528 (= res!71982 (= lt!135661 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!135660)))))

(assert (=> b!87528 (= lt!135661 (bitIndex!0 (size!1866 (buf!2256 (_2!3933 lt!135663))) (currentByte!4471 (_2!3933 lt!135663)) (currentBit!4466 (_2!3933 lt!135663))))))

(declare-fun b!87529 () Bool)

(declare-fun res!71980 () Bool)

(assert (=> b!87529 (=> (not res!71980) (not e!58023))))

(assert (=> b!87529 (= res!71980 (invariant!0 (currentBit!4466 thiss!1152) (currentByte!4471 thiss!1152) (size!1866 (buf!2256 thiss!1152))))))

(assert (= (and start!17862 res!71977) b!87526))

(assert (= (and b!87526 res!71978) b!87516))

(assert (= (and b!87516 res!71974) b!87524))

(assert (= (and b!87524 res!71979) b!87529))

(assert (= (and b!87529 res!71980) b!87527))

(assert (= (and b!87527 res!71984) b!87518))

(assert (= (and b!87518 res!71973) b!87512))

(assert (= (and b!87512 res!71975) b!87519))

(assert (= (and b!87519 res!71986) b!87517))

(assert (= (and b!87517 res!71971) b!87528))

(assert (= (and b!87528 res!71982) b!87521))

(assert (= (and b!87521 res!71981) b!87514))

(assert (= (and b!87514 res!71983) b!87525))

(assert (= (and b!87517 (not res!71972)) b!87523))

(assert (= (and b!87523 (not res!71985)) b!87522))

(assert (= (and b!87522 (not res!71976)) b!87513))

(assert (= start!17862 b!87515))

(assert (= start!17862 b!87520))

(declare-fun m!132969 () Bool)

(assert (=> b!87529 m!132969))

(declare-fun m!132971 () Bool)

(assert (=> b!87516 m!132971))

(declare-fun m!132973 () Bool)

(assert (=> b!87515 m!132973))

(declare-fun m!132975 () Bool)

(assert (=> b!87526 m!132975))

(declare-fun m!132977 () Bool)

(assert (=> b!87518 m!132977))

(declare-fun m!132979 () Bool)

(assert (=> b!87518 m!132979))

(declare-fun m!132981 () Bool)

(assert (=> b!87521 m!132981))

(declare-fun m!132983 () Bool)

(assert (=> b!87528 m!132983))

(declare-fun m!132985 () Bool)

(assert (=> b!87520 m!132985))

(declare-fun m!132987 () Bool)

(assert (=> b!87525 m!132987))

(declare-fun m!132989 () Bool)

(assert (=> b!87517 m!132989))

(declare-fun m!132991 () Bool)

(assert (=> b!87517 m!132991))

(assert (=> b!87522 m!132983))

(declare-fun m!132993 () Bool)

(assert (=> start!17862 m!132993))

(declare-fun m!132995 () Bool)

(assert (=> start!17862 m!132995))

(declare-fun m!132997 () Bool)

(assert (=> b!87514 m!132997))

(assert (=> b!87514 m!132997))

(declare-fun m!132999 () Bool)

(assert (=> b!87514 m!132999))

(declare-fun m!133001 () Bool)

(assert (=> b!87512 m!133001))

(check-sat (not b!87512) (not b!87522) (not b!87526) (not b!87514) (not b!87516) (not b!87520) (not b!87525) (not start!17862) (not b!87517) (not b!87521) (not b!87529) (not b!87528) (not b!87518) (not b!87515))
(check-sat)
