; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16924 () Bool)

(assert start!16924)

(declare-fun b!83070 () Bool)

(declare-fun e!55107 () Bool)

(declare-fun e!55108 () Bool)

(assert (=> b!83070 (= e!55107 e!55108)))

(declare-fun res!68376 () Bool)

(assert (=> b!83070 (=> (not res!68376) (not e!55108))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun lt!132372 () (_ BitVec 64))

(declare-datatypes ((array!3788 0))(
  ( (array!3789 (arr!2364 (Array (_ BitVec 32) (_ BitVec 8))) (size!1727 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3016 0))(
  ( (BitStream!3017 (buf!2117 array!3788) (currentByte!4187 (_ BitVec 32)) (currentBit!4182 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3016)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83070 (= res!68376 (= (bvadd lt!132372 b1b2Diff!1) (bitIndex!0 (size!1727 (buf!2117 b2!98)) (currentByte!4187 b2!98) (currentBit!4182 b2!98))))))

(declare-fun b1!98 () BitStream!3016)

(assert (=> b!83070 (= lt!132372 (bitIndex!0 (size!1727 (buf!2117 b1!98)) (currentByte!4187 b1!98) (currentBit!4182 b1!98)))))

(declare-fun res!68375 () Bool)

(assert (=> start!16924 (=> (not res!68375) (not e!55107))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16924 (= res!68375 (and (= (size!1727 (buf!2117 b1!98)) (size!1727 (buf!2117 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16924 e!55107))

(declare-fun e!55106 () Bool)

(declare-fun inv!12 (BitStream!3016) Bool)

(assert (=> start!16924 (and (inv!12 b1!98) e!55106)))

(declare-fun e!55110 () Bool)

(assert (=> start!16924 (and (inv!12 b2!98) e!55110)))

(assert (=> start!16924 true))

(declare-fun b!83071 () Bool)

(declare-fun array_inv!1573 (array!3788) Bool)

(assert (=> b!83071 (= e!55110 (array_inv!1573 (buf!2117 b2!98)))))

(declare-fun b!83072 () Bool)

(declare-fun res!68377 () Bool)

(assert (=> b!83072 (=> (not res!68377) (not e!55107))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83072 (= res!68377 (validate_offset_bits!1 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) ((_ sign_extend 32) (currentByte!4187 b1!98)) ((_ sign_extend 32) (currentBit!4182 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun lt!132371 () (_ BitVec 64))

(declare-fun b!83073 () Bool)

(assert (=> b!83073 (= e!55108 (not (bvsle lt!132372 (bvsub lt!132371 b1ValidateOffsetBits!11))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83073 (= (remainingBits!0 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) ((_ sign_extend 32) (currentByte!4187 b1!98)) ((_ sign_extend 32) (currentBit!4182 b1!98))) (bvsub lt!132371 lt!132372))))

(assert (=> b!83073 (= lt!132371 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98)))))))

(declare-datatypes ((Unit!5563 0))(
  ( (Unit!5564) )
))
(declare-fun lt!132370 () Unit!5563)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3016) Unit!5563)

(assert (=> b!83073 (= lt!132370 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83074 () Bool)

(assert (=> b!83074 (= e!55106 (array_inv!1573 (buf!2117 b1!98)))))

(assert (= (and start!16924 res!68375) b!83072))

(assert (= (and b!83072 res!68377) b!83070))

(assert (= (and b!83070 res!68376) b!83073))

(assert (= start!16924 b!83074))

(assert (= start!16924 b!83071))

(declare-fun m!129609 () Bool)

(assert (=> b!83072 m!129609))

(declare-fun m!129611 () Bool)

(assert (=> b!83070 m!129611))

(declare-fun m!129613 () Bool)

(assert (=> b!83070 m!129613))

(declare-fun m!129615 () Bool)

(assert (=> start!16924 m!129615))

(declare-fun m!129617 () Bool)

(assert (=> start!16924 m!129617))

(declare-fun m!129619 () Bool)

(assert (=> b!83071 m!129619))

(declare-fun m!129621 () Bool)

(assert (=> b!83074 m!129621))

(declare-fun m!129623 () Bool)

(assert (=> b!83073 m!129623))

(declare-fun m!129625 () Bool)

(assert (=> b!83073 m!129625))

(push 1)

(assert (not b!83074))

(assert (not b!83070))

(assert (not b!83071))

(assert (not b!83073))

(assert (not b!83072))

(assert (not start!16924))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26496 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26496 (= (inv!12 b1!98) (invariant!0 (currentBit!4182 b1!98) (currentByte!4187 b1!98) (size!1727 (buf!2117 b1!98))))))

(declare-fun bs!6508 () Bool)

(assert (= bs!6508 d!26496))

(declare-fun m!129677 () Bool)

(assert (=> bs!6508 m!129677))

(assert (=> start!16924 d!26496))

(declare-fun d!26504 () Bool)

(assert (=> d!26504 (= (inv!12 b2!98) (invariant!0 (currentBit!4182 b2!98) (currentByte!4187 b2!98) (size!1727 (buf!2117 b2!98))))))

(declare-fun bs!6509 () Bool)

(assert (= bs!6509 d!26504))

(declare-fun m!129679 () Bool)

(assert (=> bs!6509 m!129679))

(assert (=> start!16924 d!26504))

(declare-fun d!26506 () Bool)

(assert (=> d!26506 (= (array_inv!1573 (buf!2117 b2!98)) (bvsge (size!1727 (buf!2117 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83071 d!26506))

(declare-fun d!26508 () Bool)

(assert (=> d!26508 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) ((_ sign_extend 32) (currentByte!4187 b1!98)) ((_ sign_extend 32) (currentBit!4182 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) ((_ sign_extend 32) (currentByte!4187 b1!98)) ((_ sign_extend 32) (currentBit!4182 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6510 () Bool)

(assert (= bs!6510 d!26508))

(assert (=> bs!6510 m!129623))

(assert (=> b!83072 d!26508))

(declare-fun d!26512 () Bool)

(assert (=> d!26512 (= (remainingBits!0 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) ((_ sign_extend 32) (currentByte!4187 b1!98)) ((_ sign_extend 32) (currentBit!4182 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4187 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4182 b1!98)))))))

(assert (=> b!83073 d!26512))

(declare-fun d!26514 () Bool)

(declare-fun lt!132479 () (_ BitVec 64))

(declare-fun lt!132482 () (_ BitVec 64))

(assert (=> d!26514 (= (remainingBits!0 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) ((_ sign_extend 32) (currentByte!4187 b1!98)) ((_ sign_extend 32) (currentBit!4182 b1!98))) (bvsub lt!132479 lt!132482))))

(assert (=> d!26514 (or (= (bvand lt!132479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132482 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132479 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132479 lt!132482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26514 (= lt!132482 (bitIndex!0 (size!1727 (buf!2117 b1!98)) (currentByte!4187 b1!98) (currentBit!4182 b1!98)))))

(declare-fun lt!132483 () (_ BitVec 64))

(declare-fun lt!132481 () (_ BitVec 64))

(assert (=> d!26514 (= lt!132479 (bvmul lt!132483 lt!132481))))

(assert (=> d!26514 (or (= lt!132483 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132481 (bvsdiv (bvmul lt!132483 lt!132481) lt!132483)))))

(assert (=> d!26514 (= lt!132481 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26514 (= lt!132483 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))))))

(declare-fun lt!132480 () Unit!5563)

(declare-fun choose!23 (BitStream!3016) Unit!5563)

(assert (=> d!26514 (= lt!132480 (choose!23 b1!98))))

(assert (=> d!26514 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132480)))

(declare-fun bs!6513 () Bool)

(assert (= bs!6513 d!26514))

(assert (=> bs!6513 m!129623))

(assert (=> bs!6513 m!129613))

(declare-fun m!129683 () Bool)

(assert (=> bs!6513 m!129683))

(assert (=> b!83073 d!26514))

(declare-fun d!26518 () Bool)

(assert (=> d!26518 (= (array_inv!1573 (buf!2117 b1!98)) (bvsge (size!1727 (buf!2117 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83074 d!26518))

(declare-fun d!26520 () Bool)

(declare-fun e!55157 () Bool)

(assert (=> d!26520 e!55157))

(declare-fun res!68416 () Bool)

(assert (=> d!26520 (=> (not res!68416) (not e!55157))))

(declare-fun lt!132498 () (_ BitVec 64))

(declare-fun lt!132499 () (_ BitVec 64))

(declare-fun lt!132496 () (_ BitVec 64))

(assert (=> d!26520 (= res!68416 (= lt!132496 (bvsub lt!132498 lt!132499)))))

(assert (=> d!26520 (or (= (bvand lt!132498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132498 lt!132499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26520 (= lt!132499 (remainingBits!0 ((_ sign_extend 32) (size!1727 (buf!2117 b2!98))) ((_ sign_extend 32) (currentByte!4187 b2!98)) ((_ sign_extend 32) (currentBit!4182 b2!98))))))

(declare-fun lt!132497 () (_ BitVec 64))

(declare-fun lt!132500 () (_ BitVec 64))

(assert (=> d!26520 (= lt!132498 (bvmul lt!132497 lt!132500))))

(assert (=> d!26520 (or (= lt!132497 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132500 (bvsdiv (bvmul lt!132497 lt!132500) lt!132497)))))

(assert (=> d!26520 (= lt!132500 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26520 (= lt!132497 ((_ sign_extend 32) (size!1727 (buf!2117 b2!98))))))

(assert (=> d!26520 (= lt!132496 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4187 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4182 b2!98))))))

(assert (=> d!26520 (invariant!0 (currentBit!4182 b2!98) (currentByte!4187 b2!98) (size!1727 (buf!2117 b2!98)))))

(assert (=> d!26520 (= (bitIndex!0 (size!1727 (buf!2117 b2!98)) (currentByte!4187 b2!98) (currentBit!4182 b2!98)) lt!132496)))

(declare-fun b!83128 () Bool)

(declare-fun res!68417 () Bool)

(assert (=> b!83128 (=> (not res!68417) (not e!55157))))

(assert (=> b!83128 (= res!68417 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132496))))

(declare-fun b!83129 () Bool)

(declare-fun lt!132501 () (_ BitVec 64))

(assert (=> b!83129 (= e!55157 (bvsle lt!132496 (bvmul lt!132501 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83129 (or (= lt!132501 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132501 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132501)))))

(assert (=> b!83129 (= lt!132501 ((_ sign_extend 32) (size!1727 (buf!2117 b2!98))))))

(assert (= (and d!26520 res!68416) b!83128))

(assert (= (and b!83128 res!68417) b!83129))

(declare-fun m!129685 () Bool)

(assert (=> d!26520 m!129685))

(assert (=> d!26520 m!129679))

(assert (=> b!83070 d!26520))

(declare-fun d!26522 () Bool)

(declare-fun e!55158 () Bool)

(assert (=> d!26522 e!55158))

(declare-fun res!68418 () Bool)

(assert (=> d!26522 (=> (not res!68418) (not e!55158))))

(declare-fun lt!132505 () (_ BitVec 64))

(declare-fun lt!132504 () (_ BitVec 64))

(declare-fun lt!132502 () (_ BitVec 64))

(assert (=> d!26522 (= res!68418 (= lt!132502 (bvsub lt!132504 lt!132505)))))

(assert (=> d!26522 (or (= (bvand lt!132504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132505 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132504 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132504 lt!132505) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26522 (= lt!132505 (remainingBits!0 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))) ((_ sign_extend 32) (currentByte!4187 b1!98)) ((_ sign_extend 32) (currentBit!4182 b1!98))))))

(declare-fun lt!132503 () (_ BitVec 64))

(declare-fun lt!132506 () (_ BitVec 64))

(assert (=> d!26522 (= lt!132504 (bvmul lt!132503 lt!132506))))

(assert (=> d!26522 (or (= lt!132503 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132506 (bvsdiv (bvmul lt!132503 lt!132506) lt!132503)))))

(assert (=> d!26522 (= lt!132506 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26522 (= lt!132503 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))))))

(assert (=> d!26522 (= lt!132502 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4187 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4182 b1!98))))))

(assert (=> d!26522 (invariant!0 (currentBit!4182 b1!98) (currentByte!4187 b1!98) (size!1727 (buf!2117 b1!98)))))

(assert (=> d!26522 (= (bitIndex!0 (size!1727 (buf!2117 b1!98)) (currentByte!4187 b1!98) (currentBit!4182 b1!98)) lt!132502)))

(declare-fun b!83130 () Bool)

(declare-fun res!68419 () Bool)

(assert (=> b!83130 (=> (not res!68419) (not e!55158))))

(assert (=> b!83130 (= res!68419 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132502))))

(declare-fun b!83131 () Bool)

(declare-fun lt!132507 () (_ BitVec 64))

(assert (=> b!83131 (= e!55158 (bvsle lt!132502 (bvmul lt!132507 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83131 (or (= lt!132507 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132507 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132507)))))

(assert (=> b!83131 (= lt!132507 ((_ sign_extend 32) (size!1727 (buf!2117 b1!98))))))

(assert (= (and d!26522 res!68418) b!83130))

(assert (= (and b!83130 res!68419) b!83131))

(assert (=> d!26522 m!129623))

(assert (=> d!26522 m!129677))

(assert (=> b!83070 d!26522))

(push 1)

(assert (not d!26514))

(assert (not d!26504))

(assert (not d!26522))

(assert (not d!26508))

(assert (not d!26496))

(assert (not d!26520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

