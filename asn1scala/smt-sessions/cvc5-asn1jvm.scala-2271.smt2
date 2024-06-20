; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57516 () Bool)

(assert start!57516)

(declare-fun b!263629 () Bool)

(declare-fun e!183820 () Bool)

(declare-datatypes ((array!14708 0))(
  ( (array!14709 (arr!7405 (Array (_ BitVec 32) (_ BitVec 8))) (size!6418 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11650 0))(
  ( (BitStream!11651 (buf!6886 array!14708) (currentByte!12747 (_ BitVec 32)) (currentBit!12742 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11650)

(declare-fun w2!580 () BitStream!11650)

(declare-fun arrayBitRangesEq!0 (array!14708 array!14708 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263629 (= e!183820 (not (arrayBitRangesEq!0 (buf!6886 w1!584) (buf!6886 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584)))))))

(declare-fun res!220516 () Bool)

(declare-fun e!183822 () Bool)

(assert (=> start!57516 (=> (not res!220516) (not e!183822))))

(declare-fun isPrefixOf!0 (BitStream!11650 BitStream!11650) Bool)

(assert (=> start!57516 (= res!220516 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57516 e!183822))

(declare-fun e!183825 () Bool)

(declare-fun inv!12 (BitStream!11650) Bool)

(assert (=> start!57516 (and (inv!12 w1!584) e!183825)))

(declare-fun e!183818 () Bool)

(assert (=> start!57516 (and (inv!12 w2!580) e!183818)))

(declare-fun b!263630 () Bool)

(declare-fun array_inv!6142 (array!14708) Bool)

(assert (=> b!263630 (= e!183818 (array_inv!6142 (buf!6886 w2!580)))))

(declare-fun b!263631 () Bool)

(declare-datatypes ((Unit!18785 0))(
  ( (Unit!18786) )
))
(declare-fun e!183824 () Unit!18785)

(declare-fun Unit!18787 () Unit!18785)

(assert (=> b!263631 (= e!183824 Unit!18787)))

(declare-fun b!263632 () Bool)

(declare-fun e!183819 () Bool)

(declare-fun e!183821 () Bool)

(assert (=> b!263632 (= e!183819 e!183821)))

(declare-fun res!220518 () Bool)

(assert (=> b!263632 (=> res!220518 e!183821)))

(assert (=> b!263632 (= res!220518 (= (size!6418 (buf!6886 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!405059 () Unit!18785)

(assert (=> b!263632 (= lt!405059 e!183824)))

(declare-fun c!12048 () Bool)

(assert (=> b!263632 (= c!12048 (not (= (size!6418 (buf!6886 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263633 () Bool)

(assert (=> b!263633 (= e!183825 (array_inv!6142 (buf!6886 w1!584)))))

(declare-fun b!263634 () Bool)

(declare-fun lt!405061 () (_ BitVec 64))

(assert (=> b!263634 (= e!183821 (or (bvsgt (size!6418 (buf!6886 w2!580)) (size!6418 (buf!6886 w1!584))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405061) (bvsle lt!405061 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6418 (buf!6886 w2!580))))))))))

(assert (=> b!263634 (= lt!405061 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584)))))

(declare-fun b!263635 () Bool)

(declare-fun lt!405064 () Unit!18785)

(assert (=> b!263635 (= e!183824 lt!405064)))

(declare-fun lt!405058 () (_ BitVec 64))

(assert (=> b!263635 (= lt!405058 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14708 array!14708 (_ BitVec 64) (_ BitVec 64)) Unit!18785)

(assert (=> b!263635 (= lt!405064 (arrayBitRangesEqSymmetric!0 (buf!6886 w1!584) (buf!6886 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058))))

(assert (=> b!263635 (arrayBitRangesEq!0 (buf!6886 w2!580) (buf!6886 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058)))

(declare-fun b!263636 () Bool)

(assert (=> b!263636 (= e!183822 (not e!183819))))

(declare-fun res!220519 () Bool)

(assert (=> b!263636 (=> res!220519 e!183819)))

(assert (=> b!263636 (= res!220519 e!183820)))

(declare-fun res!220517 () Bool)

(assert (=> b!263636 (=> (not res!220517) (not e!183820))))

(assert (=> b!263636 (= res!220517 (not (= (size!6418 (buf!6886 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263636 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405062 () Unit!18785)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11650) Unit!18785)

(assert (=> b!263636 (= lt!405062 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405063 () BitStream!11650)

(assert (=> b!263636 (isPrefixOf!0 lt!405063 lt!405063)))

(declare-fun lt!405060 () Unit!18785)

(assert (=> b!263636 (= lt!405060 (lemmaIsPrefixRefl!0 lt!405063))))

(assert (=> b!263636 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405065 () Unit!18785)

(assert (=> b!263636 (= lt!405065 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263636 (= lt!405063 (BitStream!11651 (buf!6886 w2!580) (currentByte!12747 w1!584) (currentBit!12742 w1!584)))))

(assert (= (and start!57516 res!220516) b!263636))

(assert (= (and b!263636 res!220517) b!263629))

(assert (= (and b!263636 (not res!220519)) b!263632))

(assert (= (and b!263632 c!12048) b!263635))

(assert (= (and b!263632 (not c!12048)) b!263631))

(assert (= (and b!263632 (not res!220518)) b!263634))

(assert (= start!57516 b!263633))

(assert (= start!57516 b!263630))

(declare-fun m!393947 () Bool)

(assert (=> b!263634 m!393947))

(declare-fun m!393949 () Bool)

(assert (=> b!263630 m!393949))

(declare-fun m!393951 () Bool)

(assert (=> b!263636 m!393951))

(declare-fun m!393953 () Bool)

(assert (=> b!263636 m!393953))

(declare-fun m!393955 () Bool)

(assert (=> b!263636 m!393955))

(declare-fun m!393957 () Bool)

(assert (=> b!263636 m!393957))

(declare-fun m!393959 () Bool)

(assert (=> b!263636 m!393959))

(declare-fun m!393961 () Bool)

(assert (=> b!263636 m!393961))

(assert (=> b!263629 m!393947))

(assert (=> b!263629 m!393947))

(declare-fun m!393963 () Bool)

(assert (=> b!263629 m!393963))

(declare-fun m!393965 () Bool)

(assert (=> start!57516 m!393965))

(declare-fun m!393967 () Bool)

(assert (=> start!57516 m!393967))

(declare-fun m!393969 () Bool)

(assert (=> start!57516 m!393969))

(declare-fun m!393971 () Bool)

(assert (=> b!263633 m!393971))

(assert (=> b!263635 m!393947))

(declare-fun m!393973 () Bool)

(assert (=> b!263635 m!393973))

(declare-fun m!393975 () Bool)

(assert (=> b!263635 m!393975))

(push 1)

(assert (not b!263630))

(assert (not b!263636))

(assert (not b!263633))

(assert (not b!263629))

(assert (not b!263635))

(assert (not b!263634))

(assert (not start!57516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun bm!4058 () Bool)

(declare-fun c!12057 () Bool)

(declare-fun lt!405122 () (_ BitVec 32))

(declare-fun call!4061 () Bool)

(declare-fun lt!405121 () (_ BitVec 32))

(declare-datatypes ((tuple4!336 0))(
  ( (tuple4!337 (_1!12148 (_ BitVec 32)) (_2!12148 (_ BitVec 32)) (_3!948 (_ BitVec 32)) (_4!168 (_ BitVec 32))) )
))
(declare-fun lt!405120 () tuple4!336)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4058 (= call!4061 (byteRangesEq!0 (select (arr!7405 (buf!6886 w1!584)) (_3!948 lt!405120)) (select (arr!7405 (buf!6886 w2!580)) (_3!948 lt!405120)) lt!405122 (ite c!12057 lt!405121 #b00000000000000000000000000001000)))))

(declare-fun b!263708 () Bool)

(declare-fun e!183902 () Bool)

(declare-fun e!183898 () Bool)

(assert (=> b!263708 (= e!183902 e!183898)))

(assert (=> b!263708 (= c!12057 (= (_3!948 lt!405120) (_4!168 lt!405120)))))

(declare-fun b!263709 () Bool)

(assert (=> b!263709 (= e!183898 call!4061)))

(declare-fun b!263710 () Bool)

(declare-fun res!220566 () Bool)

(assert (=> b!263710 (= res!220566 (= lt!405121 #b00000000000000000000000000000000))))

(declare-fun e!183900 () Bool)

(assert (=> b!263710 (=> res!220566 e!183900)))

(declare-fun e!183899 () Bool)

(assert (=> b!263710 (= e!183899 e!183900)))

(declare-fun b!263711 () Bool)

(declare-fun e!183903 () Bool)

(assert (=> b!263711 (= e!183903 e!183902)))

(declare-fun res!220564 () Bool)

(assert (=> b!263711 (=> (not res!220564) (not e!183902))))

(declare-fun e!183901 () Bool)

(assert (=> b!263711 (= res!220564 e!183901)))

(declare-fun res!220565 () Bool)

(assert (=> b!263711 (=> res!220565 e!183901)))

(assert (=> b!263711 (= res!220565 (bvsge (_1!12148 lt!405120) (_2!12148 lt!405120)))))

(assert (=> b!263711 (= lt!405121 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263711 (= lt!405122 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!336)

(assert (=> b!263711 (= lt!405120 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584))))))

(declare-fun d!88988 () Bool)

(declare-fun res!220567 () Bool)

(assert (=> d!88988 (=> res!220567 e!183903)))

(assert (=> d!88988 (= res!220567 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584))))))

(assert (=> d!88988 (= (arrayBitRangesEq!0 (buf!6886 w1!584) (buf!6886 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584))) e!183903)))

(declare-fun b!263712 () Bool)

(declare-fun arrayRangesEq!1004 (array!14708 array!14708 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263712 (= e!183901 (arrayRangesEq!1004 (buf!6886 w1!584) (buf!6886 w2!580) (_1!12148 lt!405120) (_2!12148 lt!405120)))))

(declare-fun b!263713 () Bool)

(assert (=> b!263713 (= e!183898 e!183899)))

(declare-fun res!220563 () Bool)

(assert (=> b!263713 (= res!220563 call!4061)))

(assert (=> b!263713 (=> (not res!220563) (not e!183899))))

(declare-fun b!263714 () Bool)

(assert (=> b!263714 (= e!183900 (byteRangesEq!0 (select (arr!7405 (buf!6886 w1!584)) (_4!168 lt!405120)) (select (arr!7405 (buf!6886 w2!580)) (_4!168 lt!405120)) #b00000000000000000000000000000000 lt!405121))))

(assert (= (and d!88988 (not res!220567)) b!263711))

(assert (= (and b!263711 (not res!220565)) b!263712))

(assert (= (and b!263711 res!220564) b!263708))

(assert (= (and b!263708 c!12057) b!263709))

(assert (= (and b!263708 (not c!12057)) b!263713))

(assert (= (and b!263713 res!220563) b!263710))

(assert (= (and b!263710 (not res!220566)) b!263714))

(assert (= (or b!263709 b!263713) bm!4058))

(declare-fun m!394043 () Bool)

(assert (=> bm!4058 m!394043))

(declare-fun m!394045 () Bool)

(assert (=> bm!4058 m!394045))

(assert (=> bm!4058 m!394043))

(assert (=> bm!4058 m!394045))

(declare-fun m!394047 () Bool)

(assert (=> bm!4058 m!394047))

(assert (=> b!263711 m!393947))

(declare-fun m!394049 () Bool)

(assert (=> b!263711 m!394049))

(declare-fun m!394051 () Bool)

(assert (=> b!263712 m!394051))

(declare-fun m!394053 () Bool)

(assert (=> b!263714 m!394053))

(declare-fun m!394055 () Bool)

(assert (=> b!263714 m!394055))

(assert (=> b!263714 m!394053))

(assert (=> b!263714 m!394055))

(declare-fun m!394057 () Bool)

(assert (=> b!263714 m!394057))

(assert (=> b!263629 d!88988))

(declare-fun d!89000 () Bool)

(declare-fun e!183919 () Bool)

(assert (=> d!89000 e!183919))

(declare-fun res!220593 () Bool)

(assert (=> d!89000 (=> (not res!220593) (not e!183919))))

(declare-fun lt!405162 () (_ BitVec 64))

(declare-fun lt!405161 () (_ BitVec 64))

(declare-fun lt!405165 () (_ BitVec 64))

(assert (=> d!89000 (= res!220593 (= lt!405162 (bvsub lt!405165 lt!405161)))))

(assert (=> d!89000 (or (= (bvand lt!405165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405161 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405165 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405165 lt!405161) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89000 (= lt!405161 (remainingBits!0 ((_ sign_extend 32) (size!6418 (buf!6886 w1!584))) ((_ sign_extend 32) (currentByte!12747 w1!584)) ((_ sign_extend 32) (currentBit!12742 w1!584))))))

(declare-fun lt!405163 () (_ BitVec 64))

(declare-fun lt!405164 () (_ BitVec 64))

(assert (=> d!89000 (= lt!405165 (bvmul lt!405163 lt!405164))))

(assert (=> d!89000 (or (= lt!405163 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405164 (bvsdiv (bvmul lt!405163 lt!405164) lt!405163)))))

(assert (=> d!89000 (= lt!405164 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89000 (= lt!405163 ((_ sign_extend 32) (size!6418 (buf!6886 w1!584))))))

(assert (=> d!89000 (= lt!405162 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12747 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12742 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89000 (invariant!0 (currentBit!12742 w1!584) (currentByte!12747 w1!584) (size!6418 (buf!6886 w1!584)))))

(assert (=> d!89000 (= (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584)) lt!405162)))

(declare-fun b!263740 () Bool)

(declare-fun res!220594 () Bool)

(assert (=> b!263740 (=> (not res!220594) (not e!183919))))

(assert (=> b!263740 (= res!220594 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405162))))

(declare-fun b!263741 () Bool)

(declare-fun lt!405166 () (_ BitVec 64))

(assert (=> b!263741 (= e!183919 (bvsle lt!405162 (bvmul lt!405166 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263741 (or (= lt!405166 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405166 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405166)))))

(assert (=> b!263741 (= lt!405166 ((_ sign_extend 32) (size!6418 (buf!6886 w1!584))))))

(assert (= (and d!89000 res!220593) b!263740))

(assert (= (and b!263740 res!220594) b!263741))

(declare-fun m!394079 () Bool)

(assert (=> d!89000 m!394079))

(declare-fun m!394081 () Bool)

(assert (=> d!89000 m!394081))

(assert (=> b!263629 d!89000))

(assert (=> b!263634 d!89000))

(declare-fun d!89018 () Bool)

(assert (=> d!89018 (= (array_inv!6142 (buf!6886 w1!584)) (bvsge (size!6418 (buf!6886 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263633 d!89018))

(declare-fun d!89020 () Bool)

(declare-fun res!220603 () Bool)

(declare-fun e!183925 () Bool)

(assert (=> d!89020 (=> (not res!220603) (not e!183925))))

(assert (=> d!89020 (= res!220603 (= (size!6418 (buf!6886 w1!584)) (size!6418 (buf!6886 w2!580))))))

(assert (=> d!89020 (= (isPrefixOf!0 w1!584 w2!580) e!183925)))

(declare-fun b!263748 () Bool)

(declare-fun res!220602 () Bool)

(assert (=> b!263748 (=> (not res!220602) (not e!183925))))

(assert (=> b!263748 (= res!220602 (bvsle (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584)) (bitIndex!0 (size!6418 (buf!6886 w2!580)) (currentByte!12747 w2!580) (currentBit!12742 w2!580))))))

(declare-fun b!263749 () Bool)

(declare-fun e!183924 () Bool)

(assert (=> b!263749 (= e!183925 e!183924)))

(declare-fun res!220601 () Bool)

(assert (=> b!263749 (=> res!220601 e!183924)))

(assert (=> b!263749 (= res!220601 (= (size!6418 (buf!6886 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263750 () Bool)

(assert (=> b!263750 (= e!183924 (arrayBitRangesEq!0 (buf!6886 w1!584) (buf!6886 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584))))))

(assert (= (and d!89020 res!220603) b!263748))

(assert (= (and b!263748 res!220602) b!263749))

(assert (= (and b!263749 (not res!220601)) b!263750))

(assert (=> b!263748 m!393947))

(declare-fun m!394083 () Bool)

(assert (=> b!263748 m!394083))

(assert (=> b!263750 m!393947))

(assert (=> b!263750 m!393947))

(assert (=> b!263750 m!393963))

(assert (=> start!57516 d!89020))

(declare-fun d!89022 () Bool)

(assert (=> d!89022 (= (inv!12 w1!584) (invariant!0 (currentBit!12742 w1!584) (currentByte!12747 w1!584) (size!6418 (buf!6886 w1!584))))))

(declare-fun bs!22588 () Bool)

(assert (= bs!22588 d!89022))

(assert (=> bs!22588 m!394081))

(assert (=> start!57516 d!89022))

(declare-fun d!89024 () Bool)

(assert (=> d!89024 (= (inv!12 w2!580) (invariant!0 (currentBit!12742 w2!580) (currentByte!12747 w2!580) (size!6418 (buf!6886 w2!580))))))

(declare-fun bs!22589 () Bool)

(assert (= bs!22589 d!89024))

(declare-fun m!394085 () Bool)

(assert (=> bs!22589 m!394085))

(assert (=> start!57516 d!89024))

(declare-fun d!89026 () Bool)

(assert (=> d!89026 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405193 () Unit!18785)

(declare-fun choose!11 (BitStream!11650) Unit!18785)

(assert (=> d!89026 (= lt!405193 (choose!11 w2!580))))

(assert (=> d!89026 (= (lemmaIsPrefixRefl!0 w2!580) lt!405193)))

(declare-fun bs!22591 () Bool)

(assert (= bs!22591 d!89026))

(assert (=> bs!22591 m!393959))

(declare-fun m!394091 () Bool)

(assert (=> bs!22591 m!394091))

(assert (=> b!263636 d!89026))

(declare-fun d!89030 () Bool)

(assert (=> d!89030 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405194 () Unit!18785)

(assert (=> d!89030 (= lt!405194 (choose!11 w1!584))))

(assert (=> d!89030 (= (lemmaIsPrefixRefl!0 w1!584) lt!405194)))

(declare-fun bs!22592 () Bool)

(assert (= bs!22592 d!89030))

(assert (=> bs!22592 m!393955))

(declare-fun m!394093 () Bool)

(assert (=> bs!22592 m!394093))

(assert (=> b!263636 d!89030))

(declare-fun d!89032 () Bool)

(declare-fun res!220622 () Bool)

(declare-fun e!183942 () Bool)

(assert (=> d!89032 (=> (not res!220622) (not e!183942))))

(assert (=> d!89032 (= res!220622 (= (size!6418 (buf!6886 lt!405063)) (size!6418 (buf!6886 lt!405063))))))

(assert (=> d!89032 (= (isPrefixOf!0 lt!405063 lt!405063) e!183942)))

(declare-fun b!263771 () Bool)

(declare-fun res!220621 () Bool)

(assert (=> b!263771 (=> (not res!220621) (not e!183942))))

(assert (=> b!263771 (= res!220621 (bvsle (bitIndex!0 (size!6418 (buf!6886 lt!405063)) (currentByte!12747 lt!405063) (currentBit!12742 lt!405063)) (bitIndex!0 (size!6418 (buf!6886 lt!405063)) (currentByte!12747 lt!405063) (currentBit!12742 lt!405063))))))

(declare-fun b!263772 () Bool)

(declare-fun e!183941 () Bool)

(assert (=> b!263772 (= e!183942 e!183941)))

(declare-fun res!220620 () Bool)

(assert (=> b!263772 (=> res!220620 e!183941)))

(assert (=> b!263772 (= res!220620 (= (size!6418 (buf!6886 lt!405063)) #b00000000000000000000000000000000))))

(declare-fun b!263773 () Bool)

(assert (=> b!263773 (= e!183941 (arrayBitRangesEq!0 (buf!6886 lt!405063) (buf!6886 lt!405063) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 lt!405063)) (currentByte!12747 lt!405063) (currentBit!12742 lt!405063))))))

(assert (= (and d!89032 res!220622) b!263771))

(assert (= (and b!263771 res!220621) b!263772))

(assert (= (and b!263772 (not res!220620)) b!263773))

(declare-fun m!394095 () Bool)

(assert (=> b!263771 m!394095))

(assert (=> b!263771 m!394095))

(assert (=> b!263773 m!394095))

(assert (=> b!263773 m!394095))

(declare-fun m!394097 () Bool)

(assert (=> b!263773 m!394097))

(assert (=> b!263636 d!89032))

(declare-fun d!89034 () Bool)

(assert (=> d!89034 (isPrefixOf!0 lt!405063 lt!405063)))

(declare-fun lt!405195 () Unit!18785)

(assert (=> d!89034 (= lt!405195 (choose!11 lt!405063))))

(assert (=> d!89034 (= (lemmaIsPrefixRefl!0 lt!405063) lt!405195)))

(declare-fun bs!22593 () Bool)

(assert (= bs!22593 d!89034))

(assert (=> bs!22593 m!393953))

(declare-fun m!394099 () Bool)

(assert (=> bs!22593 m!394099))

(assert (=> b!263636 d!89034))

(declare-fun d!89036 () Bool)

(declare-fun res!220625 () Bool)

(declare-fun e!183944 () Bool)

(assert (=> d!89036 (=> (not res!220625) (not e!183944))))

(assert (=> d!89036 (= res!220625 (= (size!6418 (buf!6886 w1!584)) (size!6418 (buf!6886 w1!584))))))

(assert (=> d!89036 (= (isPrefixOf!0 w1!584 w1!584) e!183944)))

(declare-fun b!263774 () Bool)

(declare-fun res!220624 () Bool)

(assert (=> b!263774 (=> (not res!220624) (not e!183944))))

(assert (=> b!263774 (= res!220624 (bvsle (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584)) (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584))))))

(declare-fun b!263775 () Bool)

(declare-fun e!183943 () Bool)

(assert (=> b!263775 (= e!183944 e!183943)))

(declare-fun res!220623 () Bool)

(assert (=> b!263775 (=> res!220623 e!183943)))

(assert (=> b!263775 (= res!220623 (= (size!6418 (buf!6886 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263776 () Bool)

(assert (=> b!263776 (= e!183943 (arrayBitRangesEq!0 (buf!6886 w1!584) (buf!6886 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 w1!584)) (currentByte!12747 w1!584) (currentBit!12742 w1!584))))))

(assert (= (and d!89036 res!220625) b!263774))

(assert (= (and b!263774 res!220624) b!263775))

(assert (= (and b!263775 (not res!220623)) b!263776))

(assert (=> b!263774 m!393947))

(assert (=> b!263774 m!393947))

(assert (=> b!263776 m!393947))

(assert (=> b!263776 m!393947))

(declare-fun m!394101 () Bool)

(assert (=> b!263776 m!394101))

(assert (=> b!263636 d!89036))

(declare-fun d!89038 () Bool)

(declare-fun res!220633 () Bool)

(declare-fun e!183952 () Bool)

(assert (=> d!89038 (=> (not res!220633) (not e!183952))))

(assert (=> d!89038 (= res!220633 (= (size!6418 (buf!6886 w2!580)) (size!6418 (buf!6886 w2!580))))))

(assert (=> d!89038 (= (isPrefixOf!0 w2!580 w2!580) e!183952)))

(declare-fun b!263784 () Bool)

(declare-fun res!220632 () Bool)

(assert (=> b!263784 (=> (not res!220632) (not e!183952))))

(assert (=> b!263784 (= res!220632 (bvsle (bitIndex!0 (size!6418 (buf!6886 w2!580)) (currentByte!12747 w2!580) (currentBit!12742 w2!580)) (bitIndex!0 (size!6418 (buf!6886 w2!580)) (currentByte!12747 w2!580) (currentBit!12742 w2!580))))))

(declare-fun b!263785 () Bool)

(declare-fun e!183951 () Bool)

(assert (=> b!263785 (= e!183952 e!183951)))

(declare-fun res!220631 () Bool)

(assert (=> b!263785 (=> res!220631 e!183951)))

(assert (=> b!263785 (= res!220631 (= (size!6418 (buf!6886 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263786 () Bool)

(assert (=> b!263786 (= e!183951 (arrayBitRangesEq!0 (buf!6886 w2!580) (buf!6886 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6418 (buf!6886 w2!580)) (currentByte!12747 w2!580) (currentBit!12742 w2!580))))))

(assert (= (and d!89038 res!220633) b!263784))

(assert (= (and b!263784 res!220632) b!263785))

(assert (= (and b!263785 (not res!220631)) b!263786))

(assert (=> b!263784 m!394083))

(assert (=> b!263784 m!394083))

(assert (=> b!263786 m!394083))

(assert (=> b!263786 m!394083))

(declare-fun m!394115 () Bool)

(assert (=> b!263786 m!394115))

(assert (=> b!263636 d!89038))

(declare-fun d!89040 () Bool)

(assert (=> d!89040 (= (array_inv!6142 (buf!6886 w2!580)) (bvsge (size!6418 (buf!6886 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263630 d!89040))

(assert (=> b!263635 d!89000))

(declare-fun d!89042 () Bool)

(assert (=> d!89042 (arrayBitRangesEq!0 (buf!6886 w2!580) (buf!6886 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058)))

(declare-fun lt!405206 () Unit!18785)

(declare-fun choose!8 (array!14708 array!14708 (_ BitVec 64) (_ BitVec 64)) Unit!18785)

(assert (=> d!89042 (= lt!405206 (choose!8 (buf!6886 w1!584) (buf!6886 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058))))

(assert (=> d!89042 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058))))

(assert (=> d!89042 (= (arrayBitRangesEqSymmetric!0 (buf!6886 w1!584) (buf!6886 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058) lt!405206)))

(declare-fun bs!22597 () Bool)

(assert (= bs!22597 d!89042))

(assert (=> bs!22597 m!393975))

(declare-fun m!394125 () Bool)

(assert (=> bs!22597 m!394125))

(assert (=> b!263635 d!89042))

(declare-fun c!12061 () Bool)

(declare-fun lt!405209 () tuple4!336)

(declare-fun call!4065 () Bool)

(declare-fun lt!405210 () (_ BitVec 32))

(declare-fun bm!4062 () Bool)

(declare-fun lt!405211 () (_ BitVec 32))

(assert (=> bm!4062 (= call!4065 (byteRangesEq!0 (select (arr!7405 (buf!6886 w2!580)) (_3!948 lt!405209)) (select (arr!7405 (buf!6886 w1!584)) (_3!948 lt!405209)) lt!405211 (ite c!12061 lt!405210 #b00000000000000000000000000001000)))))

(declare-fun b!263787 () Bool)

(declare-fun e!183957 () Bool)

(declare-fun e!183953 () Bool)

(assert (=> b!263787 (= e!183957 e!183953)))

(assert (=> b!263787 (= c!12061 (= (_3!948 lt!405209) (_4!168 lt!405209)))))

(declare-fun b!263788 () Bool)

(assert (=> b!263788 (= e!183953 call!4065)))

(declare-fun b!263789 () Bool)

(declare-fun res!220637 () Bool)

(assert (=> b!263789 (= res!220637 (= lt!405210 #b00000000000000000000000000000000))))

(declare-fun e!183955 () Bool)

(assert (=> b!263789 (=> res!220637 e!183955)))

(declare-fun e!183954 () Bool)

(assert (=> b!263789 (= e!183954 e!183955)))

(declare-fun b!263790 () Bool)

(declare-fun e!183958 () Bool)

(assert (=> b!263790 (= e!183958 e!183957)))

(declare-fun res!220635 () Bool)

(assert (=> b!263790 (=> (not res!220635) (not e!183957))))

(declare-fun e!183956 () Bool)

(assert (=> b!263790 (= res!220635 e!183956)))

(declare-fun res!220636 () Bool)

(assert (=> b!263790 (=> res!220636 e!183956)))

(assert (=> b!263790 (= res!220636 (bvsge (_1!12148 lt!405209) (_2!12148 lt!405209)))))

(assert (=> b!263790 (= lt!405210 ((_ extract 31 0) (bvsrem lt!405058 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263790 (= lt!405211 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263790 (= lt!405209 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058))))

(declare-fun d!89052 () Bool)

(declare-fun res!220638 () Bool)

(assert (=> d!89052 (=> res!220638 e!183958)))

(assert (=> d!89052 (= res!220638 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058))))

(assert (=> d!89052 (= (arrayBitRangesEq!0 (buf!6886 w2!580) (buf!6886 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405058) e!183958)))

(declare-fun b!263791 () Bool)

(assert (=> b!263791 (= e!183956 (arrayRangesEq!1004 (buf!6886 w2!580) (buf!6886 w1!584) (_1!12148 lt!405209) (_2!12148 lt!405209)))))

(declare-fun b!263792 () Bool)

(assert (=> b!263792 (= e!183953 e!183954)))

(declare-fun res!220634 () Bool)

(assert (=> b!263792 (= res!220634 call!4065)))

(assert (=> b!263792 (=> (not res!220634) (not e!183954))))

(declare-fun b!263793 () Bool)

(assert (=> b!263793 (= e!183955 (byteRangesEq!0 (select (arr!7405 (buf!6886 w2!580)) (_4!168 lt!405209)) (select (arr!7405 (buf!6886 w1!584)) (_4!168 lt!405209)) #b00000000000000000000000000000000 lt!405210))))

(assert (= (and d!89052 (not res!220638)) b!263790))

(assert (= (and b!263790 (not res!220636)) b!263791))

(assert (= (and b!263790 res!220635) b!263787))

(assert (= (and b!263787 c!12061) b!263788))

(assert (= (and b!263787 (not c!12061)) b!263792))

(assert (= (and b!263792 res!220634) b!263789))

(assert (= (and b!263789 (not res!220637)) b!263793))

(assert (= (or b!263788 b!263792) bm!4062))

(declare-fun m!394133 () Bool)

(assert (=> bm!4062 m!394133))

(declare-fun m!394135 () Bool)

(assert (=> bm!4062 m!394135))

(assert (=> bm!4062 m!394133))

(assert (=> bm!4062 m!394135))

(declare-fun m!394139 () Bool)

(assert (=> bm!4062 m!394139))

(declare-fun m!394141 () Bool)

(assert (=> b!263790 m!394141))

(declare-fun m!394143 () Bool)

(assert (=> b!263791 m!394143))

(declare-fun m!394145 () Bool)

(assert (=> b!263793 m!394145))

(declare-fun m!394147 () Bool)

(assert (=> b!263793 m!394147))

(assert (=> b!263793 m!394145))

(assert (=> b!263793 m!394147))

(declare-fun m!394149 () Bool)

(assert (=> b!263793 m!394149))

(assert (=> b!263635 d!89052))

(push 1)

(assert (not b!263793))

(assert (not d!89034))

(assert (not b!263712))

(assert (not b!263784))

(assert (not b!263791))

(assert (not d!89030))

(assert (not b!263771))

(assert (not d!89024))

(assert (not b!263774))

(assert (not d!89022))

(assert (not b!263786))

(assert (not b!263773))

(assert (not d!89026))

(assert (not b!263790))

(assert (not b!263776))

(assert (not bm!4062))

(assert (not b!263711))

(assert (not bm!4058))

(assert (not d!89000))

(assert (not b!263748))

(assert (not b!263714))

(assert (not b!263750))

(assert (not d!89042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

