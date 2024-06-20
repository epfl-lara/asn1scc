; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16974 () Bool)

(assert start!16974)

(declare-fun b!83216 () Bool)

(declare-fun e!55258 () Bool)

(declare-fun e!55263 () Bool)

(assert (=> b!83216 (= e!55258 (not e!55263))))

(declare-fun res!68476 () Bool)

(assert (=> b!83216 (=> res!68476 e!55263)))

(declare-fun lt!132624 () (_ BitVec 64))

(declare-fun lt!132621 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> b!83216 (= res!68476 (bvsgt lt!132624 (bvsub lt!132621 b1ValidateOffsetBits!11)))))

(declare-datatypes ((array!3805 0))(
  ( (array!3806 (arr!2371 (Array (_ BitVec 32) (_ BitVec 8))) (size!1734 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3030 0))(
  ( (BitStream!3031 (buf!2124 array!3805) (currentByte!4203 (_ BitVec 32)) (currentBit!4198 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3030)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83216 (= (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) ((_ sign_extend 32) (currentByte!4203 b1!98)) ((_ sign_extend 32) (currentBit!4198 b1!98))) (bvsub lt!132621 lt!132624))))

(assert (=> b!83216 (= lt!132621 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98)))))))

(declare-datatypes ((Unit!5577 0))(
  ( (Unit!5578) )
))
(declare-fun lt!132620 () Unit!5577)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3030) Unit!5577)

(assert (=> b!83216 (= lt!132620 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68477 () Bool)

(declare-fun e!55262 () Bool)

(assert (=> start!16974 (=> (not res!68477) (not e!55262))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3030)

(assert (=> start!16974 (= res!68477 (and (= (size!1734 (buf!2124 b1!98)) (size!1734 (buf!2124 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16974 e!55262))

(declare-fun e!55261 () Bool)

(declare-fun inv!12 (BitStream!3030) Bool)

(assert (=> start!16974 (and (inv!12 b1!98) e!55261)))

(declare-fun e!55260 () Bool)

(assert (=> start!16974 (and (inv!12 b2!98) e!55260)))

(assert (=> start!16974 true))

(declare-fun b!83217 () Bool)

(declare-fun array_inv!1580 (array!3805) Bool)

(assert (=> b!83217 (= e!55261 (array_inv!1580 (buf!2124 b1!98)))))

(declare-fun b!83218 () Bool)

(declare-fun res!68478 () Bool)

(assert (=> b!83218 (=> (not res!68478) (not e!55262))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83218 (= res!68478 (validate_offset_bits!1 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) ((_ sign_extend 32) (currentByte!4203 b1!98)) ((_ sign_extend 32) (currentBit!4198 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83219 () Bool)

(assert (=> b!83219 (= e!55260 (array_inv!1580 (buf!2124 b2!98)))))

(declare-fun lt!132625 () (_ BitVec 64))

(declare-fun lt!132623 () (_ BitVec 64))

(declare-fun lt!132626 () (_ BitVec 64))

(declare-fun b!83220 () Bool)

(assert (=> b!83220 (= e!55263 (or (not (= lt!132626 (bvsub lt!132623 lt!132625))) (bvsge lt!132626 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1))))))

(declare-fun lt!132622 () (_ BitVec 64))

(assert (=> b!83220 (= lt!132626 (bvsub lt!132623 lt!132622))))

(assert (=> b!83220 (= lt!132626 (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))) ((_ sign_extend 32) (currentByte!4203 b2!98)) ((_ sign_extend 32) (currentBit!4198 b2!98))))))

(assert (=> b!83220 (= lt!132623 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98)))))))

(declare-fun lt!132627 () Unit!5577)

(assert (=> b!83220 (= lt!132627 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83221 () Bool)

(assert (=> b!83221 (= e!55262 e!55258)))

(declare-fun res!68479 () Bool)

(assert (=> b!83221 (=> (not res!68479) (not e!55258))))

(assert (=> b!83221 (= res!68479 (= lt!132625 lt!132622))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83221 (= lt!132622 (bitIndex!0 (size!1734 (buf!2124 b2!98)) (currentByte!4203 b2!98) (currentBit!4198 b2!98)))))

(assert (=> b!83221 (= lt!132625 (bvadd lt!132624 b1b2Diff!1))))

(assert (=> b!83221 (= lt!132624 (bitIndex!0 (size!1734 (buf!2124 b1!98)) (currentByte!4203 b1!98) (currentBit!4198 b1!98)))))

(assert (= (and start!16974 res!68477) b!83218))

(assert (= (and b!83218 res!68478) b!83221))

(assert (= (and b!83221 res!68479) b!83216))

(assert (= (and b!83216 (not res!68476)) b!83220))

(assert (= start!16974 b!83217))

(assert (= start!16974 b!83219))

(declare-fun m!129775 () Bool)

(assert (=> b!83220 m!129775))

(declare-fun m!129777 () Bool)

(assert (=> b!83220 m!129777))

(declare-fun m!129779 () Bool)

(assert (=> b!83218 m!129779))

(declare-fun m!129781 () Bool)

(assert (=> b!83219 m!129781))

(declare-fun m!129783 () Bool)

(assert (=> b!83221 m!129783))

(declare-fun m!129785 () Bool)

(assert (=> b!83221 m!129785))

(declare-fun m!129787 () Bool)

(assert (=> b!83216 m!129787))

(declare-fun m!129789 () Bool)

(assert (=> b!83216 m!129789))

(declare-fun m!129791 () Bool)

(assert (=> start!16974 m!129791))

(declare-fun m!129793 () Bool)

(assert (=> start!16974 m!129793))

(declare-fun m!129795 () Bool)

(assert (=> b!83217 m!129795))

(check-sat (not b!83217) (not b!83219) (not b!83220) (not start!16974) (not b!83216) (not b!83221) (not b!83218))
(check-sat)
(get-model)

(declare-fun d!26528 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26528 (= (inv!12 b1!98) (invariant!0 (currentBit!4198 b1!98) (currentByte!4203 b1!98) (size!1734 (buf!2124 b1!98))))))

(declare-fun bs!6520 () Bool)

(assert (= bs!6520 d!26528))

(declare-fun m!129819 () Bool)

(assert (=> bs!6520 m!129819))

(assert (=> start!16974 d!26528))

(declare-fun d!26530 () Bool)

(assert (=> d!26530 (= (inv!12 b2!98) (invariant!0 (currentBit!4198 b2!98) (currentByte!4203 b2!98) (size!1734 (buf!2124 b2!98))))))

(declare-fun bs!6521 () Bool)

(assert (= bs!6521 d!26530))

(declare-fun m!129821 () Bool)

(assert (=> bs!6521 m!129821))

(assert (=> start!16974 d!26530))

(declare-fun d!26532 () Bool)

(assert (=> d!26532 (= (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))) ((_ sign_extend 32) (currentByte!4203 b2!98)) ((_ sign_extend 32) (currentBit!4198 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4203 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4198 b2!98)))))))

(assert (=> b!83220 d!26532))

(declare-fun d!26534 () Bool)

(declare-fun lt!132665 () (_ BitVec 64))

(declare-fun lt!132664 () (_ BitVec 64))

(assert (=> d!26534 (= (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))) ((_ sign_extend 32) (currentByte!4203 b2!98)) ((_ sign_extend 32) (currentBit!4198 b2!98))) (bvsub lt!132665 lt!132664))))

(assert (=> d!26534 (or (= (bvand lt!132665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132664 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132665 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132665 lt!132664) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26534 (= lt!132664 (bitIndex!0 (size!1734 (buf!2124 b2!98)) (currentByte!4203 b2!98) (currentBit!4198 b2!98)))))

(declare-fun lt!132662 () (_ BitVec 64))

(declare-fun lt!132663 () (_ BitVec 64))

(assert (=> d!26534 (= lt!132665 (bvmul lt!132662 lt!132663))))

(assert (=> d!26534 (or (= lt!132662 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132663 (bvsdiv (bvmul lt!132662 lt!132663) lt!132662)))))

(assert (=> d!26534 (= lt!132663 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26534 (= lt!132662 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))))))

(declare-fun lt!132666 () Unit!5577)

(declare-fun choose!23 (BitStream!3030) Unit!5577)

(assert (=> d!26534 (= lt!132666 (choose!23 b2!98))))

(assert (=> d!26534 (= (remainingBitsBitIndexLemma!0 b2!98) lt!132666)))

(declare-fun bs!6522 () Bool)

(assert (= bs!6522 d!26534))

(assert (=> bs!6522 m!129775))

(assert (=> bs!6522 m!129783))

(declare-fun m!129823 () Bool)

(assert (=> bs!6522 m!129823))

(assert (=> b!83220 d!26534))

(declare-fun d!26536 () Bool)

(assert (=> d!26536 (= (array_inv!1580 (buf!2124 b2!98)) (bvsge (size!1734 (buf!2124 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83219 d!26536))

(declare-fun d!26538 () Bool)

(assert (=> d!26538 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) ((_ sign_extend 32) (currentByte!4203 b1!98)) ((_ sign_extend 32) (currentBit!4198 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) ((_ sign_extend 32) (currentByte!4203 b1!98)) ((_ sign_extend 32) (currentBit!4198 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6523 () Bool)

(assert (= bs!6523 d!26538))

(assert (=> bs!6523 m!129787))

(assert (=> b!83218 d!26538))

(declare-fun d!26540 () Bool)

(assert (=> d!26540 (= (array_inv!1580 (buf!2124 b1!98)) (bvsge (size!1734 (buf!2124 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83217 d!26540))

(declare-fun d!26542 () Bool)

(assert (=> d!26542 (= (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) ((_ sign_extend 32) (currentByte!4203 b1!98)) ((_ sign_extend 32) (currentBit!4198 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4203 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4198 b1!98)))))))

(assert (=> b!83216 d!26542))

(declare-fun d!26544 () Bool)

(declare-fun lt!132670 () (_ BitVec 64))

(declare-fun lt!132669 () (_ BitVec 64))

(assert (=> d!26544 (= (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) ((_ sign_extend 32) (currentByte!4203 b1!98)) ((_ sign_extend 32) (currentBit!4198 b1!98))) (bvsub lt!132670 lt!132669))))

(assert (=> d!26544 (or (= (bvand lt!132670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132669 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132670 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132670 lt!132669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26544 (= lt!132669 (bitIndex!0 (size!1734 (buf!2124 b1!98)) (currentByte!4203 b1!98) (currentBit!4198 b1!98)))))

(declare-fun lt!132667 () (_ BitVec 64))

(declare-fun lt!132668 () (_ BitVec 64))

(assert (=> d!26544 (= lt!132670 (bvmul lt!132667 lt!132668))))

(assert (=> d!26544 (or (= lt!132667 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132668 (bvsdiv (bvmul lt!132667 lt!132668) lt!132667)))))

(assert (=> d!26544 (= lt!132668 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26544 (= lt!132667 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))))))

(declare-fun lt!132671 () Unit!5577)

(assert (=> d!26544 (= lt!132671 (choose!23 b1!98))))

(assert (=> d!26544 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132671)))

(declare-fun bs!6524 () Bool)

(assert (= bs!6524 d!26544))

(assert (=> bs!6524 m!129787))

(assert (=> bs!6524 m!129785))

(declare-fun m!129825 () Bool)

(assert (=> bs!6524 m!129825))

(assert (=> b!83216 d!26544))

(declare-fun d!26546 () Bool)

(declare-fun e!55287 () Bool)

(assert (=> d!26546 e!55287))

(declare-fun res!68496 () Bool)

(assert (=> d!26546 (=> (not res!68496) (not e!55287))))

(declare-fun lt!132686 () (_ BitVec 64))

(declare-fun lt!132685 () (_ BitVec 64))

(declare-fun lt!132687 () (_ BitVec 64))

(assert (=> d!26546 (= res!68496 (= lt!132686 (bvsub lt!132685 lt!132687)))))

(assert (=> d!26546 (or (= (bvand lt!132685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132687 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132685 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132685 lt!132687) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26546 (= lt!132687 (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))) ((_ sign_extend 32) (currentByte!4203 b2!98)) ((_ sign_extend 32) (currentBit!4198 b2!98))))))

(declare-fun lt!132689 () (_ BitVec 64))

(declare-fun lt!132684 () (_ BitVec 64))

(assert (=> d!26546 (= lt!132685 (bvmul lt!132689 lt!132684))))

(assert (=> d!26546 (or (= lt!132689 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132684 (bvsdiv (bvmul lt!132689 lt!132684) lt!132689)))))

(assert (=> d!26546 (= lt!132684 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26546 (= lt!132689 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))))))

(assert (=> d!26546 (= lt!132686 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4203 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4198 b2!98))))))

(assert (=> d!26546 (invariant!0 (currentBit!4198 b2!98) (currentByte!4203 b2!98) (size!1734 (buf!2124 b2!98)))))

(assert (=> d!26546 (= (bitIndex!0 (size!1734 (buf!2124 b2!98)) (currentByte!4203 b2!98) (currentBit!4198 b2!98)) lt!132686)))

(declare-fun b!83245 () Bool)

(declare-fun res!68497 () Bool)

(assert (=> b!83245 (=> (not res!68497) (not e!55287))))

(assert (=> b!83245 (= res!68497 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132686))))

(declare-fun b!83246 () Bool)

(declare-fun lt!132688 () (_ BitVec 64))

(assert (=> b!83246 (= e!55287 (bvsle lt!132686 (bvmul lt!132688 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83246 (or (= lt!132688 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132688 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132688)))))

(assert (=> b!83246 (= lt!132688 ((_ sign_extend 32) (size!1734 (buf!2124 b2!98))))))

(assert (= (and d!26546 res!68496) b!83245))

(assert (= (and b!83245 res!68497) b!83246))

(assert (=> d!26546 m!129775))

(assert (=> d!26546 m!129821))

(assert (=> b!83221 d!26546))

(declare-fun d!26548 () Bool)

(declare-fun e!55288 () Bool)

(assert (=> d!26548 e!55288))

(declare-fun res!68498 () Bool)

(assert (=> d!26548 (=> (not res!68498) (not e!55288))))

(declare-fun lt!132691 () (_ BitVec 64))

(declare-fun lt!132693 () (_ BitVec 64))

(declare-fun lt!132692 () (_ BitVec 64))

(assert (=> d!26548 (= res!68498 (= lt!132692 (bvsub lt!132691 lt!132693)))))

(assert (=> d!26548 (or (= (bvand lt!132691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132693 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132691 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132691 lt!132693) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26548 (= lt!132693 (remainingBits!0 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))) ((_ sign_extend 32) (currentByte!4203 b1!98)) ((_ sign_extend 32) (currentBit!4198 b1!98))))))

(declare-fun lt!132695 () (_ BitVec 64))

(declare-fun lt!132690 () (_ BitVec 64))

(assert (=> d!26548 (= lt!132691 (bvmul lt!132695 lt!132690))))

(assert (=> d!26548 (or (= lt!132695 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132690 (bvsdiv (bvmul lt!132695 lt!132690) lt!132695)))))

(assert (=> d!26548 (= lt!132690 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26548 (= lt!132695 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))))))

(assert (=> d!26548 (= lt!132692 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4203 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4198 b1!98))))))

(assert (=> d!26548 (invariant!0 (currentBit!4198 b1!98) (currentByte!4203 b1!98) (size!1734 (buf!2124 b1!98)))))

(assert (=> d!26548 (= (bitIndex!0 (size!1734 (buf!2124 b1!98)) (currentByte!4203 b1!98) (currentBit!4198 b1!98)) lt!132692)))

(declare-fun b!83247 () Bool)

(declare-fun res!68499 () Bool)

(assert (=> b!83247 (=> (not res!68499) (not e!55288))))

(assert (=> b!83247 (= res!68499 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132692))))

(declare-fun b!83248 () Bool)

(declare-fun lt!132694 () (_ BitVec 64))

(assert (=> b!83248 (= e!55288 (bvsle lt!132692 (bvmul lt!132694 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83248 (or (= lt!132694 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132694 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132694)))))

(assert (=> b!83248 (= lt!132694 ((_ sign_extend 32) (size!1734 (buf!2124 b1!98))))))

(assert (= (and d!26548 res!68498) b!83247))

(assert (= (and b!83247 res!68499) b!83248))

(assert (=> d!26548 m!129787))

(assert (=> d!26548 m!129819))

(assert (=> b!83221 d!26548))

(check-sat (not d!26538) (not d!26546) (not d!26530) (not d!26548) (not d!26528) (not d!26544) (not d!26534))
(check-sat)
