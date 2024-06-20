; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15292 () Bool)

(assert start!15292)

(declare-fun b!77981 () Bool)

(declare-fun res!64402 () Bool)

(declare-fun e!51180 () Bool)

(assert (=> b!77981 (=> (not res!64402) (not e!51180))))

(declare-datatypes ((array!3320 0))(
  ( (array!3321 (arr!2141 (Array (_ BitVec 32) (_ BitVec 8))) (size!1540 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2642 0))(
  ( (BitStream!2643 (buf!1930 array!3320) (currentByte!3750 (_ BitVec 32)) (currentBit!3745 (_ BitVec 32))) )
))
(declare-fun thiss!1107 () BitStream!2642)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!77981 (= res!64402 (validate_offset_bit!0 ((_ sign_extend 32) (size!1540 (buf!1930 thiss!1107))) ((_ sign_extend 32) (currentByte!3750 thiss!1107)) ((_ sign_extend 32) (currentBit!3745 thiss!1107))))))

(declare-fun b!77982 () Bool)

(declare-fun e!51183 () Bool)

(assert (=> b!77982 (= e!51180 (not e!51183))))

(declare-fun res!64399 () Bool)

(assert (=> b!77982 (=> res!64399 e!51183)))

(declare-datatypes ((Unit!5165 0))(
  ( (Unit!5166) )
))
(declare-datatypes ((tuple2!6946 0))(
  ( (tuple2!6947 (_1!3610 Unit!5165) (_2!3610 BitStream!2642)) )
))
(declare-fun lt!124918 () tuple2!6946)

(assert (=> b!77982 (= res!64399 (not (= (size!1540 (buf!1930 (_2!3610 lt!124918))) (size!1540 (buf!1930 thiss!1107)))))))

(declare-fun e!51182 () Bool)

(assert (=> b!77982 e!51182))

(declare-fun res!64400 () Bool)

(assert (=> b!77982 (=> (not res!64400) (not e!51182))))

(assert (=> b!77982 (= res!64400 (= (size!1540 (buf!1930 thiss!1107)) (size!1540 (buf!1930 (_2!3610 lt!124918)))))))

(declare-fun lt!124917 () Bool)

(declare-fun appendBit!0 (BitStream!2642 Bool) tuple2!6946)

(assert (=> b!77982 (= lt!124918 (appendBit!0 thiss!1107 lt!124917))))

(declare-fun b!215 () (_ BitVec 8))

(declare-fun bitNr!1 () (_ BitVec 32))

(assert (=> b!77982 (= lt!124917 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) b!215))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) bitNr!1))) #b00000000000000000000000000000000)))))

(declare-fun b!77983 () Bool)

(declare-fun e!51181 () Bool)

(declare-fun e!51186 () Bool)

(assert (=> b!77983 (= e!51181 e!51186)))

(declare-fun res!64405 () Bool)

(assert (=> b!77983 (=> (not res!64405) (not e!51186))))

(declare-datatypes ((tuple2!6948 0))(
  ( (tuple2!6949 (_1!3611 BitStream!2642) (_2!3611 Bool)) )
))
(declare-fun lt!124919 () tuple2!6948)

(assert (=> b!77983 (= res!64405 (and (= (_2!3611 lt!124919) lt!124917) (= (_1!3611 lt!124919) (_2!3610 lt!124918))))))

(declare-fun readBitPure!0 (BitStream!2642) tuple2!6948)

(declare-fun readerFrom!0 (BitStream!2642 (_ BitVec 32) (_ BitVec 32)) BitStream!2642)

(assert (=> b!77983 (= lt!124919 (readBitPure!0 (readerFrom!0 (_2!3610 lt!124918) (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107))))))

(declare-fun res!64401 () Bool)

(assert (=> start!15292 (=> (not res!64401) (not e!51180))))

(assert (=> start!15292 (= res!64401 (and (bvsge bitNr!1 #b00000000000000000000000000000000) (bvslt bitNr!1 #b00000000000000000000000000001000)))))

(assert (=> start!15292 e!51180))

(assert (=> start!15292 true))

(declare-fun e!51185 () Bool)

(declare-fun inv!12 (BitStream!2642) Bool)

(assert (=> start!15292 (and (inv!12 thiss!1107) e!51185)))

(declare-fun b!77984 () Bool)

(declare-fun res!64403 () Bool)

(assert (=> b!77984 (=> (not res!64403) (not e!51181))))

(declare-fun isPrefixOf!0 (BitStream!2642 BitStream!2642) Bool)

(assert (=> b!77984 (= res!64403 (isPrefixOf!0 thiss!1107 (_2!3610 lt!124918)))))

(declare-fun b!77985 () Bool)

(declare-fun array_inv!1386 (array!3320) Bool)

(assert (=> b!77985 (= e!51185 (array_inv!1386 (buf!1930 thiss!1107)))))

(declare-fun b!77986 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!77986 (= e!51183 (invariant!0 (currentBit!3745 (_2!3610 lt!124918)) (currentByte!3750 (_2!3610 lt!124918)) (size!1540 (buf!1930 (_2!3610 lt!124918)))))))

(declare-fun b!77987 () Bool)

(declare-fun lt!124916 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!77987 (= e!51186 (= (bitIndex!0 (size!1540 (buf!1930 (_1!3611 lt!124919))) (currentByte!3750 (_1!3611 lt!124919)) (currentBit!3745 (_1!3611 lt!124919))) lt!124916))))

(declare-fun b!77988 () Bool)

(assert (=> b!77988 (= e!51182 e!51181)))

(declare-fun res!64404 () Bool)

(assert (=> b!77988 (=> (not res!64404) (not e!51181))))

(declare-fun lt!124920 () (_ BitVec 64))

(assert (=> b!77988 (= res!64404 (= lt!124916 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!124920)))))

(assert (=> b!77988 (= lt!124916 (bitIndex!0 (size!1540 (buf!1930 (_2!3610 lt!124918))) (currentByte!3750 (_2!3610 lt!124918)) (currentBit!3745 (_2!3610 lt!124918))))))

(assert (=> b!77988 (= lt!124920 (bitIndex!0 (size!1540 (buf!1930 thiss!1107)) (currentByte!3750 thiss!1107) (currentBit!3745 thiss!1107)))))

(assert (= (and start!15292 res!64401) b!77981))

(assert (= (and b!77981 res!64402) b!77982))

(assert (= (and b!77982 res!64400) b!77988))

(assert (= (and b!77988 res!64404) b!77984))

(assert (= (and b!77984 res!64403) b!77983))

(assert (= (and b!77983 res!64405) b!77987))

(assert (= (and b!77982 (not res!64399)) b!77986))

(assert (= start!15292 b!77985))

(declare-fun m!123603 () Bool)

(assert (=> b!77985 m!123603))

(declare-fun m!123605 () Bool)

(assert (=> b!77984 m!123605))

(declare-fun m!123607 () Bool)

(assert (=> b!77987 m!123607))

(declare-fun m!123609 () Bool)

(assert (=> b!77988 m!123609))

(declare-fun m!123611 () Bool)

(assert (=> b!77988 m!123611))

(declare-fun m!123613 () Bool)

(assert (=> b!77986 m!123613))

(declare-fun m!123615 () Bool)

(assert (=> b!77981 m!123615))

(declare-fun m!123617 () Bool)

(assert (=> b!77983 m!123617))

(assert (=> b!77983 m!123617))

(declare-fun m!123619 () Bool)

(assert (=> b!77983 m!123619))

(declare-fun m!123621 () Bool)

(assert (=> b!77982 m!123621))

(declare-fun m!123623 () Bool)

(assert (=> b!77982 m!123623))

(declare-fun m!123625 () Bool)

(assert (=> start!15292 m!123625))

(push 1)

(assert (not b!77983))

(assert (not b!77982))

(assert (not b!77987))

(assert (not b!77986))

(assert (not b!77985))

(assert (not b!77984))

(assert (not b!77988))

(assert (not start!15292))

(assert (not b!77981))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!24606 () Bool)

(assert (=> d!24606 (= (invariant!0 (currentBit!3745 (_2!3610 lt!124918)) (currentByte!3750 (_2!3610 lt!124918)) (size!1540 (buf!1930 (_2!3610 lt!124918)))) (and (bvsge (currentBit!3745 (_2!3610 lt!124918)) #b00000000000000000000000000000000) (bvslt (currentBit!3745 (_2!3610 lt!124918)) #b00000000000000000000000000001000) (bvsge (currentByte!3750 (_2!3610 lt!124918)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3750 (_2!3610 lt!124918)) (size!1540 (buf!1930 (_2!3610 lt!124918)))) (and (= (currentBit!3745 (_2!3610 lt!124918)) #b00000000000000000000000000000000) (= (currentByte!3750 (_2!3610 lt!124918)) (size!1540 (buf!1930 (_2!3610 lt!124918))))))))))

(assert (=> b!77986 d!24606))

(declare-fun d!24608 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!24608 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!1540 (buf!1930 thiss!1107))) ((_ sign_extend 32) (currentByte!3750 thiss!1107)) ((_ sign_extend 32) (currentBit!3745 thiss!1107))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1540 (buf!1930 thiss!1107))) ((_ sign_extend 32) (currentByte!3750 thiss!1107)) ((_ sign_extend 32) (currentBit!3745 thiss!1107))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5980 () Bool)

(assert (= bs!5980 d!24608))

(declare-fun m!123647 () Bool)

(assert (=> bs!5980 m!123647))

(assert (=> b!77981 d!24608))

(declare-fun d!24610 () Bool)

(declare-fun e!51226 () Bool)

(assert (=> d!24610 e!51226))

(declare-fun res!64477 () Bool)

(assert (=> d!24610 (=> (not res!64477) (not e!51226))))

(declare-fun lt!124990 () tuple2!6946)

(assert (=> d!24610 (= res!64477 (= (size!1540 (buf!1930 thiss!1107)) (size!1540 (buf!1930 (_2!3610 lt!124990)))))))

(declare-fun choose!16 (BitStream!2642 Bool) tuple2!6946)

(assert (=> d!24610 (= lt!124990 (choose!16 thiss!1107 lt!124917))))

(assert (=> d!24610 (validate_offset_bit!0 ((_ sign_extend 32) (size!1540 (buf!1930 thiss!1107))) ((_ sign_extend 32) (currentByte!3750 thiss!1107)) ((_ sign_extend 32) (currentBit!3745 thiss!1107)))))

(assert (=> d!24610 (= (appendBit!0 thiss!1107 lt!124917) lt!124990)))

(declare-fun b!78059 () Bool)

(declare-fun res!64476 () Bool)

(assert (=> b!78059 (=> (not res!64476) (not e!51226))))

(assert (=> b!78059 (= res!64476 (isPrefixOf!0 thiss!1107 (_2!3610 lt!124990)))))

(declare-fun b!78058 () Bool)

(declare-fun res!64474 () Bool)

(assert (=> b!78058 (=> (not res!64474) (not e!51226))))

(declare-fun lt!124992 () (_ BitVec 64))

(declare-fun lt!124989 () (_ BitVec 64))

(assert (=> b!78058 (= res!64474 (= (bitIndex!0 (size!1540 (buf!1930 (_2!3610 lt!124990))) (currentByte!3750 (_2!3610 lt!124990)) (currentBit!3745 (_2!3610 lt!124990))) (bvadd lt!124992 lt!124989)))))

(assert (=> b!78058 (or (not (= (bvand lt!124992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!124989 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!124992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!124992 lt!124989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!78058 (= lt!124989 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!78058 (= lt!124992 (bitIndex!0 (size!1540 (buf!1930 thiss!1107)) (currentByte!3750 thiss!1107) (currentBit!3745 thiss!1107)))))

(declare-fun b!78060 () Bool)

(declare-fun e!51227 () Bool)

(assert (=> b!78060 (= e!51226 e!51227)))

(declare-fun res!64475 () Bool)

(assert (=> b!78060 (=> (not res!64475) (not e!51227))))

(declare-fun lt!124991 () tuple2!6948)

(assert (=> b!78060 (= res!64475 (and (= (_2!3611 lt!124991) lt!124917) (= (_1!3611 lt!124991) (_2!3610 lt!124990))))))

(assert (=> b!78060 (= lt!124991 (readBitPure!0 (readerFrom!0 (_2!3610 lt!124990) (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107))))))

(declare-fun b!78061 () Bool)

(assert (=> b!78061 (= e!51227 (= (bitIndex!0 (size!1540 (buf!1930 (_1!3611 lt!124991))) (currentByte!3750 (_1!3611 lt!124991)) (currentBit!3745 (_1!3611 lt!124991))) (bitIndex!0 (size!1540 (buf!1930 (_2!3610 lt!124990))) (currentByte!3750 (_2!3610 lt!124990)) (currentBit!3745 (_2!3610 lt!124990)))))))

(assert (= (and d!24610 res!64477) b!78058))

(assert (= (and b!78058 res!64474) b!78059))

(assert (= (and b!78059 res!64476) b!78060))

(assert (= (and b!78060 res!64475) b!78061))

(declare-fun m!123677 () Bool)

(assert (=> b!78060 m!123677))

(assert (=> b!78060 m!123677))

(declare-fun m!123679 () Bool)

(assert (=> b!78060 m!123679))

(declare-fun m!123681 () Bool)

(assert (=> b!78059 m!123681))

(declare-fun m!123683 () Bool)

(assert (=> b!78061 m!123683))

(declare-fun m!123685 () Bool)

(assert (=> b!78061 m!123685))

(declare-fun m!123687 () Bool)

(assert (=> d!24610 m!123687))

(assert (=> d!24610 m!123615))

(assert (=> b!78058 m!123685))

(assert (=> b!78058 m!123611))

(assert (=> b!77982 d!24610))

(declare-fun d!24620 () Bool)

(declare-fun e!51232 () Bool)

(assert (=> d!24620 e!51232))

(declare-fun res!64487 () Bool)

(assert (=> d!24620 (=> (not res!64487) (not e!51232))))

(declare-fun lt!125018 () (_ BitVec 64))

(declare-fun lt!125019 () (_ BitVec 64))

(declare-fun lt!125020 () (_ BitVec 64))

(assert (=> d!24620 (= res!64487 (= lt!125018 (bvsub lt!125020 lt!125019)))))

(assert (=> d!24620 (or (= (bvand lt!125020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125019 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125020 lt!125019) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24620 (= lt!125019 (remainingBits!0 ((_ sign_extend 32) (size!1540 (buf!1930 (_1!3611 lt!124919)))) ((_ sign_extend 32) (currentByte!3750 (_1!3611 lt!124919))) ((_ sign_extend 32) (currentBit!3745 (_1!3611 lt!124919)))))))

(declare-fun lt!125022 () (_ BitVec 64))

(declare-fun lt!125017 () (_ BitVec 64))

(assert (=> d!24620 (= lt!125020 (bvmul lt!125022 lt!125017))))

(assert (=> d!24620 (or (= lt!125022 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125017 (bvsdiv (bvmul lt!125022 lt!125017) lt!125022)))))

(assert (=> d!24620 (= lt!125017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24620 (= lt!125022 ((_ sign_extend 32) (size!1540 (buf!1930 (_1!3611 lt!124919)))))))

(assert (=> d!24620 (= lt!125018 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3750 (_1!3611 lt!124919))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3745 (_1!3611 lt!124919)))))))

(assert (=> d!24620 (invariant!0 (currentBit!3745 (_1!3611 lt!124919)) (currentByte!3750 (_1!3611 lt!124919)) (size!1540 (buf!1930 (_1!3611 lt!124919))))))

(assert (=> d!24620 (= (bitIndex!0 (size!1540 (buf!1930 (_1!3611 lt!124919))) (currentByte!3750 (_1!3611 lt!124919)) (currentBit!3745 (_1!3611 lt!124919))) lt!125018)))

(declare-fun b!78070 () Bool)

(declare-fun res!64486 () Bool)

(assert (=> b!78070 (=> (not res!64486) (not e!51232))))

(assert (=> b!78070 (= res!64486 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125018))))

(declare-fun b!78071 () Bool)

(declare-fun lt!125021 () (_ BitVec 64))

(assert (=> b!78071 (= e!51232 (bvsle lt!125018 (bvmul lt!125021 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78071 (or (= lt!125021 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125021 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125021)))))

(assert (=> b!78071 (= lt!125021 ((_ sign_extend 32) (size!1540 (buf!1930 (_1!3611 lt!124919)))))))

(assert (= (and d!24620 res!64487) b!78070))

(assert (= (and b!78070 res!64486) b!78071))

(declare-fun m!123691 () Bool)

(assert (=> d!24620 m!123691))

(declare-fun m!123693 () Bool)

(assert (=> d!24620 m!123693))

(assert (=> b!77987 d!24620))

(declare-fun d!24626 () Bool)

(assert (=> d!24626 (= (inv!12 thiss!1107) (invariant!0 (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107) (size!1540 (buf!1930 thiss!1107))))))

(declare-fun bs!5983 () Bool)

(assert (= bs!5983 d!24626))

(declare-fun m!123695 () Bool)

(assert (=> bs!5983 m!123695))

(assert (=> start!15292 d!24626))

(declare-fun d!24628 () Bool)

(declare-fun e!51234 () Bool)

(assert (=> d!24628 e!51234))

(declare-fun res!64491 () Bool)

(assert (=> d!24628 (=> (not res!64491) (not e!51234))))

(declare-fun lt!125030 () (_ BitVec 64))

(declare-fun lt!125031 () (_ BitVec 64))

(declare-fun lt!125032 () (_ BitVec 64))

(assert (=> d!24628 (= res!64491 (= lt!125030 (bvsub lt!125032 lt!125031)))))

(assert (=> d!24628 (or (= (bvand lt!125032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125031 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125032 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125032 lt!125031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24628 (= lt!125031 (remainingBits!0 ((_ sign_extend 32) (size!1540 (buf!1930 (_2!3610 lt!124918)))) ((_ sign_extend 32) (currentByte!3750 (_2!3610 lt!124918))) ((_ sign_extend 32) (currentBit!3745 (_2!3610 lt!124918)))))))

(declare-fun lt!125034 () (_ BitVec 64))

(declare-fun lt!125029 () (_ BitVec 64))

(assert (=> d!24628 (= lt!125032 (bvmul lt!125034 lt!125029))))

(assert (=> d!24628 (or (= lt!125034 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125029 (bvsdiv (bvmul lt!125034 lt!125029) lt!125034)))))

(assert (=> d!24628 (= lt!125029 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24628 (= lt!125034 ((_ sign_extend 32) (size!1540 (buf!1930 (_2!3610 lt!124918)))))))

(assert (=> d!24628 (= lt!125030 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3750 (_2!3610 lt!124918))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3745 (_2!3610 lt!124918)))))))

(assert (=> d!24628 (invariant!0 (currentBit!3745 (_2!3610 lt!124918)) (currentByte!3750 (_2!3610 lt!124918)) (size!1540 (buf!1930 (_2!3610 lt!124918))))))

(assert (=> d!24628 (= (bitIndex!0 (size!1540 (buf!1930 (_2!3610 lt!124918))) (currentByte!3750 (_2!3610 lt!124918)) (currentBit!3745 (_2!3610 lt!124918))) lt!125030)))

(declare-fun b!78074 () Bool)

(declare-fun res!64490 () Bool)

(assert (=> b!78074 (=> (not res!64490) (not e!51234))))

(assert (=> b!78074 (= res!64490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125030))))

(declare-fun b!78075 () Bool)

(declare-fun lt!125033 () (_ BitVec 64))

(assert (=> b!78075 (= e!51234 (bvsle lt!125030 (bvmul lt!125033 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78075 (or (= lt!125033 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125033 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125033)))))

(assert (=> b!78075 (= lt!125033 ((_ sign_extend 32) (size!1540 (buf!1930 (_2!3610 lt!124918)))))))

(assert (= (and d!24628 res!64491) b!78074))

(assert (= (and b!78074 res!64490) b!78075))

(declare-fun m!123701 () Bool)

(assert (=> d!24628 m!123701))

(assert (=> d!24628 m!123613))

(assert (=> b!77988 d!24628))

(declare-fun d!24632 () Bool)

(declare-fun e!51236 () Bool)

(assert (=> d!24632 e!51236))

(declare-fun res!64495 () Bool)

(assert (=> d!24632 (=> (not res!64495) (not e!51236))))

(declare-fun lt!125043 () (_ BitVec 64))

(declare-fun lt!125044 () (_ BitVec 64))

(declare-fun lt!125042 () (_ BitVec 64))

(assert (=> d!24632 (= res!64495 (= lt!125042 (bvsub lt!125044 lt!125043)))))

(assert (=> d!24632 (or (= (bvand lt!125044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!125043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!125044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!125044 lt!125043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!24632 (= lt!125043 (remainingBits!0 ((_ sign_extend 32) (size!1540 (buf!1930 thiss!1107))) ((_ sign_extend 32) (currentByte!3750 thiss!1107)) ((_ sign_extend 32) (currentBit!3745 thiss!1107))))))

(declare-fun lt!125046 () (_ BitVec 64))

(declare-fun lt!125041 () (_ BitVec 64))

(assert (=> d!24632 (= lt!125044 (bvmul lt!125046 lt!125041))))

(assert (=> d!24632 (or (= lt!125046 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!125041 (bvsdiv (bvmul lt!125046 lt!125041) lt!125046)))))

(assert (=> d!24632 (= lt!125041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!24632 (= lt!125046 ((_ sign_extend 32) (size!1540 (buf!1930 thiss!1107))))))

(assert (=> d!24632 (= lt!125042 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3750 thiss!1107)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3745 thiss!1107))))))

(assert (=> d!24632 (invariant!0 (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107) (size!1540 (buf!1930 thiss!1107)))))

(assert (=> d!24632 (= (bitIndex!0 (size!1540 (buf!1930 thiss!1107)) (currentByte!3750 thiss!1107) (currentBit!3745 thiss!1107)) lt!125042)))

(declare-fun b!78078 () Bool)

(declare-fun res!64494 () Bool)

(assert (=> b!78078 (=> (not res!64494) (not e!51236))))

(assert (=> b!78078 (= res!64494 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!125042))))

(declare-fun b!78079 () Bool)

(declare-fun lt!125045 () (_ BitVec 64))

(assert (=> b!78079 (= e!51236 (bvsle lt!125042 (bvmul lt!125045 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!78079 (or (= lt!125045 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!125045 #b0000000000000000000000000000000000000000000000000000000000001000) lt!125045)))))

(assert (=> b!78079 (= lt!125045 ((_ sign_extend 32) (size!1540 (buf!1930 thiss!1107))))))

(assert (= (and d!24632 res!64495) b!78078))

(assert (= (and b!78078 res!64494) b!78079))

(assert (=> d!24632 m!123647))

(assert (=> d!24632 m!123695))

(assert (=> b!77988 d!24632))

(declare-fun d!24636 () Bool)

(declare-datatypes ((tuple2!6954 0))(
  ( (tuple2!6955 (_1!3614 Bool) (_2!3614 BitStream!2642)) )
))
(declare-fun lt!125055 () tuple2!6954)

(declare-fun readBit!0 (BitStream!2642) tuple2!6954)

(assert (=> d!24636 (= lt!125055 (readBit!0 (readerFrom!0 (_2!3610 lt!124918) (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107))))))

(assert (=> d!24636 (= (readBitPure!0 (readerFrom!0 (_2!3610 lt!124918) (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107))) (tuple2!6949 (_2!3614 lt!125055) (_1!3614 lt!125055)))))

(declare-fun bs!5984 () Bool)

(assert (= bs!5984 d!24636))

(assert (=> bs!5984 m!123617))

(declare-fun m!123705 () Bool)

(assert (=> bs!5984 m!123705))

(assert (=> b!77983 d!24636))

(declare-fun d!24640 () Bool)

(declare-fun e!51240 () Bool)

(assert (=> d!24640 e!51240))

(declare-fun res!64501 () Bool)

(assert (=> d!24640 (=> (not res!64501) (not e!51240))))

(assert (=> d!24640 (= res!64501 (invariant!0 (currentBit!3745 (_2!3610 lt!124918)) (currentByte!3750 (_2!3610 lt!124918)) (size!1540 (buf!1930 (_2!3610 lt!124918)))))))

(assert (=> d!24640 (= (readerFrom!0 (_2!3610 lt!124918) (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107)) (BitStream!2643 (buf!1930 (_2!3610 lt!124918)) (currentByte!3750 thiss!1107) (currentBit!3745 thiss!1107)))))

(declare-fun b!78084 () Bool)

(assert (=> b!78084 (= e!51240 (invariant!0 (currentBit!3745 thiss!1107) (currentByte!3750 thiss!1107) (size!1540 (buf!1930 (_2!3610 lt!124918)))))))

(assert (= (and d!24640 res!64501) b!78084))

(assert (=> d!24640 m!123613))

(declare-fun m!123707 () Bool)

(assert (=> b!78084 m!123707))

(assert (=> b!77983 d!24640))

(declare-fun d!24642 () Bool)

(assert (=> d!24642 (= (array_inv!1386 (buf!1930 thiss!1107)) (bvsge (size!1540 (buf!1930 thiss!1107)) #b00000000000000000000000000000000))))

(assert (=> b!77985 d!24642))

(declare-fun d!24644 () Bool)

(declare-fun res!64510 () Bool)

(declare-fun e!51246 () Bool)

(assert (=> d!24644 (=> (not res!64510) (not e!51246))))

(assert (=> d!24644 (= res!64510 (= (size!1540 (buf!1930 thiss!1107)) (size!1540 (buf!1930 (_2!3610 lt!124918)))))))

(assert (=> d!24644 (= (isPrefixOf!0 thiss!1107 (_2!3610 lt!124918)) e!51246)))

(declare-fun b!78091 () Bool)

(declare-fun res!64509 () Bool)

(assert (=> b!78091 (=> (not res!64509) (not e!51246))))

(assert (=> b!78091 (= res!64509 (bvsle (bitIndex!0 (size!1540 (buf!1930 thiss!1107)) (currentByte!3750 thiss!1107) (currentBit!3745 thiss!1107)) (bitIndex!0 (size!1540 (buf!1930 (_2!3610 lt!124918))) (currentByte!3750 (_2!3610 lt!124918)) (currentBit!3745 (_2!3610 lt!124918)))))))

