; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57520 () Bool)

(assert start!57520)

(declare-fun b!263677 () Bool)

(declare-fun e!183874 () Bool)

(declare-datatypes ((array!14712 0))(
  ( (array!14713 (arr!7407 (Array (_ BitVec 32) (_ BitVec 8))) (size!6420 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11654 0))(
  ( (BitStream!11655 (buf!6888 array!14712) (currentByte!12749 (_ BitVec 32)) (currentBit!12744 (_ BitVec 32))) )
))
(declare-fun w1!584 () BitStream!11654)

(declare-fun w2!580 () BitStream!11654)

(declare-fun arrayBitRangesEq!0 (array!14712 array!14712 (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!263677 (= e!183874 (not (arrayBitRangesEq!0 (buf!6888 w1!584) (buf!6888 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584)))))))

(declare-fun b!263678 () Bool)

(declare-datatypes ((Unit!18791 0))(
  ( (Unit!18792) )
))
(declare-fun e!183875 () Unit!18791)

(declare-fun lt!405107 () Unit!18791)

(assert (=> b!263678 (= e!183875 lt!405107)))

(declare-fun lt!405110 () (_ BitVec 64))

(assert (=> b!263678 (= lt!405110 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!14712 array!14712 (_ BitVec 64) (_ BitVec 64)) Unit!18791)

(assert (=> b!263678 (= lt!405107 (arrayBitRangesEqSymmetric!0 (buf!6888 w1!584) (buf!6888 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110))))

(assert (=> b!263678 (arrayBitRangesEq!0 (buf!6888 w2!580) (buf!6888 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110)))

(declare-fun b!263679 () Bool)

(declare-fun e!183877 () Bool)

(declare-fun array_inv!6144 (array!14712) Bool)

(assert (=> b!263679 (= e!183877 (array_inv!6144 (buf!6888 w1!584)))))

(declare-fun b!263680 () Bool)

(declare-fun e!183873 () Bool)

(declare-fun e!183879 () Bool)

(assert (=> b!263680 (= e!183873 e!183879)))

(declare-fun res!220542 () Bool)

(assert (=> b!263680 (=> res!220542 e!183879)))

(assert (=> b!263680 (= res!220542 (= (size!6420 (buf!6888 w1!584)) #b00000000000000000000000000000000))))

(declare-fun lt!405111 () Unit!18791)

(assert (=> b!263680 (= lt!405111 e!183875)))

(declare-fun c!12054 () Bool)

(assert (=> b!263680 (= c!12054 (not (= (size!6420 (buf!6888 w1!584)) #b00000000000000000000000000000000)))))

(declare-fun b!263681 () Bool)

(declare-fun e!183871 () Bool)

(assert (=> b!263681 (= e!183871 (array_inv!6144 (buf!6888 w2!580)))))

(declare-fun b!263682 () Bool)

(declare-fun lt!405112 () (_ BitVec 64))

(assert (=> b!263682 (= e!183879 (or (bvsgt (size!6420 (buf!6888 w2!580)) (size!6420 (buf!6888 w1!584))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405112) (bvsle lt!405112 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6420 (buf!6888 w2!580))))))))))

(assert (=> b!263682 (= lt!405112 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584)))))

(declare-fun res!220543 () Bool)

(declare-fun e!183876 () Bool)

(assert (=> start!57520 (=> (not res!220543) (not e!183876))))

(declare-fun isPrefixOf!0 (BitStream!11654 BitStream!11654) Bool)

(assert (=> start!57520 (= res!220543 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57520 e!183876))

(declare-fun inv!12 (BitStream!11654) Bool)

(assert (=> start!57520 (and (inv!12 w1!584) e!183877)))

(assert (=> start!57520 (and (inv!12 w2!580) e!183871)))

(declare-fun b!263683 () Bool)

(declare-fun Unit!18793 () Unit!18791)

(assert (=> b!263683 (= e!183875 Unit!18793)))

(declare-fun b!263684 () Bool)

(assert (=> b!263684 (= e!183876 (not e!183873))))

(declare-fun res!220541 () Bool)

(assert (=> b!263684 (=> res!220541 e!183873)))

(assert (=> b!263684 (= res!220541 e!183874)))

(declare-fun res!220540 () Bool)

(assert (=> b!263684 (=> (not res!220540) (not e!183874))))

(assert (=> b!263684 (= res!220540 (not (= (size!6420 (buf!6888 w1!584)) #b00000000000000000000000000000000)))))

(assert (=> b!263684 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405108 () Unit!18791)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11654) Unit!18791)

(assert (=> b!263684 (= lt!405108 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!405109 () BitStream!11654)

(assert (=> b!263684 (isPrefixOf!0 lt!405109 lt!405109)))

(declare-fun lt!405113 () Unit!18791)

(assert (=> b!263684 (= lt!405113 (lemmaIsPrefixRefl!0 lt!405109))))

(assert (=> b!263684 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405106 () Unit!18791)

(assert (=> b!263684 (= lt!405106 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!263684 (= lt!405109 (BitStream!11655 (buf!6888 w2!580) (currentByte!12749 w1!584) (currentBit!12744 w1!584)))))

(assert (= (and start!57520 res!220543) b!263684))

(assert (= (and b!263684 res!220540) b!263677))

(assert (= (and b!263684 (not res!220541)) b!263680))

(assert (= (and b!263680 c!12054) b!263678))

(assert (= (and b!263680 (not c!12054)) b!263683))

(assert (= (and b!263680 (not res!220542)) b!263682))

(assert (= start!57520 b!263679))

(assert (= start!57520 b!263681))

(declare-fun m!394007 () Bool)

(assert (=> b!263681 m!394007))

(declare-fun m!394009 () Bool)

(assert (=> b!263677 m!394009))

(assert (=> b!263677 m!394009))

(declare-fun m!394011 () Bool)

(assert (=> b!263677 m!394011))

(declare-fun m!394013 () Bool)

(assert (=> b!263679 m!394013))

(declare-fun m!394015 () Bool)

(assert (=> b!263684 m!394015))

(declare-fun m!394017 () Bool)

(assert (=> b!263684 m!394017))

(declare-fun m!394019 () Bool)

(assert (=> b!263684 m!394019))

(declare-fun m!394021 () Bool)

(assert (=> b!263684 m!394021))

(declare-fun m!394023 () Bool)

(assert (=> b!263684 m!394023))

(declare-fun m!394025 () Bool)

(assert (=> b!263684 m!394025))

(assert (=> b!263682 m!394009))

(assert (=> b!263678 m!394009))

(declare-fun m!394027 () Bool)

(assert (=> b!263678 m!394027))

(declare-fun m!394029 () Bool)

(assert (=> b!263678 m!394029))

(declare-fun m!394031 () Bool)

(assert (=> start!57520 m!394031))

(declare-fun m!394033 () Bool)

(assert (=> start!57520 m!394033))

(declare-fun m!394035 () Bool)

(assert (=> start!57520 m!394035))

(push 1)

(assert (not b!263682))

(assert (not start!57520))

(assert (not b!263679))

(assert (not b!263684))

(assert (not b!263678))

(assert (not b!263681))

(assert (not b!263677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88996 () Bool)

(assert (=> d!88996 (= (array_inv!6144 (buf!6888 w1!584)) (bvsge (size!6420 (buf!6888 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!263679 d!88996))

(declare-fun d!88998 () Bool)

(assert (=> d!88998 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!405137 () Unit!18791)

(declare-fun choose!11 (BitStream!11654) Unit!18791)

(assert (=> d!88998 (= lt!405137 (choose!11 w2!580))))

(assert (=> d!88998 (= (lemmaIsPrefixRefl!0 w2!580) lt!405137)))

(declare-fun bs!22584 () Bool)

(assert (= bs!22584 d!88998))

(assert (=> bs!22584 m!394023))

(declare-fun m!394059 () Bool)

(assert (=> bs!22584 m!394059))

(assert (=> b!263684 d!88998))

(declare-fun d!89002 () Bool)

(assert (=> d!89002 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!405138 () Unit!18791)

(assert (=> d!89002 (= lt!405138 (choose!11 w1!584))))

(assert (=> d!89002 (= (lemmaIsPrefixRefl!0 w1!584) lt!405138)))

(declare-fun bs!22585 () Bool)

(assert (= bs!22585 d!89002))

(assert (=> bs!22585 m!394019))

(declare-fun m!394061 () Bool)

(assert (=> bs!22585 m!394061))

(assert (=> b!263684 d!89002))

(declare-fun d!89004 () Bool)

(declare-fun res!220581 () Bool)

(declare-fun e!183911 () Bool)

(assert (=> d!89004 (=> (not res!220581) (not e!183911))))

(assert (=> d!89004 (= res!220581 (= (size!6420 (buf!6888 lt!405109)) (size!6420 (buf!6888 lt!405109))))))

(assert (=> d!89004 (= (isPrefixOf!0 lt!405109 lt!405109) e!183911)))

(declare-fun b!263727 () Bool)

(declare-fun res!220580 () Bool)

(assert (=> b!263727 (=> (not res!220580) (not e!183911))))

(assert (=> b!263727 (= res!220580 (bvsle (bitIndex!0 (size!6420 (buf!6888 lt!405109)) (currentByte!12749 lt!405109) (currentBit!12744 lt!405109)) (bitIndex!0 (size!6420 (buf!6888 lt!405109)) (currentByte!12749 lt!405109) (currentBit!12744 lt!405109))))))

(declare-fun b!263728 () Bool)

(declare-fun e!183912 () Bool)

(assert (=> b!263728 (= e!183911 e!183912)))

(declare-fun res!220582 () Bool)

(assert (=> b!263728 (=> res!220582 e!183912)))

(assert (=> b!263728 (= res!220582 (= (size!6420 (buf!6888 lt!405109)) #b00000000000000000000000000000000))))

(declare-fun b!263729 () Bool)

(assert (=> b!263729 (= e!183912 (arrayBitRangesEq!0 (buf!6888 lt!405109) (buf!6888 lt!405109) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 lt!405109)) (currentByte!12749 lt!405109) (currentBit!12744 lt!405109))))))

(assert (= (and d!89004 res!220581) b!263727))

(assert (= (and b!263727 res!220580) b!263728))

(assert (= (and b!263728 (not res!220582)) b!263729))

(declare-fun m!394067 () Bool)

(assert (=> b!263727 m!394067))

(assert (=> b!263727 m!394067))

(assert (=> b!263729 m!394067))

(assert (=> b!263729 m!394067))

(declare-fun m!394069 () Bool)

(assert (=> b!263729 m!394069))

(assert (=> b!263684 d!89004))

(declare-fun d!89010 () Bool)

(assert (=> d!89010 (isPrefixOf!0 lt!405109 lt!405109)))

(declare-fun lt!405148 () Unit!18791)

(assert (=> d!89010 (= lt!405148 (choose!11 lt!405109))))

(assert (=> d!89010 (= (lemmaIsPrefixRefl!0 lt!405109) lt!405148)))

(declare-fun bs!22587 () Bool)

(assert (= bs!22587 d!89010))

(assert (=> bs!22587 m!394021))

(declare-fun m!394071 () Bool)

(assert (=> bs!22587 m!394071))

(assert (=> b!263684 d!89010))

(declare-fun d!89012 () Bool)

(declare-fun res!220584 () Bool)

(declare-fun e!183913 () Bool)

(assert (=> d!89012 (=> (not res!220584) (not e!183913))))

(assert (=> d!89012 (= res!220584 (= (size!6420 (buf!6888 w1!584)) (size!6420 (buf!6888 w1!584))))))

(assert (=> d!89012 (= (isPrefixOf!0 w1!584 w1!584) e!183913)))

(declare-fun b!263730 () Bool)

(declare-fun res!220583 () Bool)

(assert (=> b!263730 (=> (not res!220583) (not e!183913))))

(assert (=> b!263730 (= res!220583 (bvsle (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584)) (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584))))))

(declare-fun b!263731 () Bool)

(declare-fun e!183914 () Bool)

(assert (=> b!263731 (= e!183913 e!183914)))

(declare-fun res!220585 () Bool)

(assert (=> b!263731 (=> res!220585 e!183914)))

(assert (=> b!263731 (= res!220585 (= (size!6420 (buf!6888 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263732 () Bool)

(assert (=> b!263732 (= e!183914 (arrayBitRangesEq!0 (buf!6888 w1!584) (buf!6888 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584))))))

(assert (= (and d!89012 res!220584) b!263730))

(assert (= (and b!263730 res!220583) b!263731))

(assert (= (and b!263731 (not res!220585)) b!263732))

(assert (=> b!263730 m!394009))

(assert (=> b!263730 m!394009))

(assert (=> b!263732 m!394009))

(assert (=> b!263732 m!394009))

(declare-fun m!394073 () Bool)

(assert (=> b!263732 m!394073))

(assert (=> b!263684 d!89012))

(declare-fun d!89014 () Bool)

(declare-fun res!220587 () Bool)

(declare-fun e!183915 () Bool)

(assert (=> d!89014 (=> (not res!220587) (not e!183915))))

(assert (=> d!89014 (= res!220587 (= (size!6420 (buf!6888 w2!580)) (size!6420 (buf!6888 w2!580))))))

(assert (=> d!89014 (= (isPrefixOf!0 w2!580 w2!580) e!183915)))

(declare-fun b!263733 () Bool)

(declare-fun res!220586 () Bool)

(assert (=> b!263733 (=> (not res!220586) (not e!183915))))

(assert (=> b!263733 (= res!220586 (bvsle (bitIndex!0 (size!6420 (buf!6888 w2!580)) (currentByte!12749 w2!580) (currentBit!12744 w2!580)) (bitIndex!0 (size!6420 (buf!6888 w2!580)) (currentByte!12749 w2!580) (currentBit!12744 w2!580))))))

(declare-fun b!263734 () Bool)

(declare-fun e!183916 () Bool)

(assert (=> b!263734 (= e!183915 e!183916)))

(declare-fun res!220588 () Bool)

(assert (=> b!263734 (=> res!220588 e!183916)))

(assert (=> b!263734 (= res!220588 (= (size!6420 (buf!6888 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!263735 () Bool)

(assert (=> b!263735 (= e!183916 (arrayBitRangesEq!0 (buf!6888 w2!580) (buf!6888 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 w2!580)) (currentByte!12749 w2!580) (currentBit!12744 w2!580))))))

(assert (= (and d!89014 res!220587) b!263733))

(assert (= (and b!263733 res!220586) b!263734))

(assert (= (and b!263734 (not res!220588)) b!263735))

(declare-fun m!394075 () Bool)

(assert (=> b!263733 m!394075))

(assert (=> b!263733 m!394075))

(assert (=> b!263735 m!394075))

(assert (=> b!263735 m!394075))

(declare-fun m!394077 () Bool)

(assert (=> b!263735 m!394077))

(assert (=> b!263684 d!89014))

(declare-fun d!89016 () Bool)

(declare-fun e!183940 () Bool)

(assert (=> d!89016 e!183940))

(declare-fun res!220619 () Bool)

(assert (=> d!89016 (=> (not res!220619) (not e!183940))))

(declare-fun lt!405187 () (_ BitVec 64))

(declare-fun lt!405188 () (_ BitVec 64))

(declare-fun lt!405190 () (_ BitVec 64))

(assert (=> d!89016 (= res!220619 (= lt!405188 (bvsub lt!405190 lt!405187)))))

(assert (=> d!89016 (or (= (bvand lt!405190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!405187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!405190 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!405190 lt!405187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!89016 (= lt!405187 (remainingBits!0 ((_ sign_extend 32) (size!6420 (buf!6888 w1!584))) ((_ sign_extend 32) (currentByte!12749 w1!584)) ((_ sign_extend 32) (currentBit!12744 w1!584))))))

(declare-fun lt!405186 () (_ BitVec 64))

(declare-fun lt!405185 () (_ BitVec 64))

(assert (=> d!89016 (= lt!405190 (bvmul lt!405186 lt!405185))))

(assert (=> d!89016 (or (= lt!405186 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!405185 (bvsdiv (bvmul lt!405186 lt!405185) lt!405186)))))

(assert (=> d!89016 (= lt!405185 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!89016 (= lt!405186 ((_ sign_extend 32) (size!6420 (buf!6888 w1!584))))))

(assert (=> d!89016 (= lt!405188 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12749 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12744 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!89016 (invariant!0 (currentBit!12744 w1!584) (currentByte!12749 w1!584) (size!6420 (buf!6888 w1!584)))))

(assert (=> d!89016 (= (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584)) lt!405188)))

(declare-fun b!263769 () Bool)

(declare-fun res!220618 () Bool)

(assert (=> b!263769 (=> (not res!220618) (not e!183940))))

(assert (=> b!263769 (= res!220618 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405188))))

(declare-fun b!263770 () Bool)

(declare-fun lt!405189 () (_ BitVec 64))

(assert (=> b!263770 (= e!183940 (bvsle lt!405188 (bvmul lt!405189 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263770 (or (= lt!405189 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405189 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405189)))))

(assert (=> b!263770 (= lt!405189 ((_ sign_extend 32) (size!6420 (buf!6888 w1!584))))))

(assert (= (and d!89016 res!220619) b!263769))

(assert (= (and b!263769 res!220618) b!263770))

(declare-fun m!394087 () Bool)

(assert (=> d!89016 m!394087))

(declare-fun m!394089 () Bool)

(assert (=> d!89016 m!394089))

(assert (=> b!263678 d!89016))

(declare-fun d!89028 () Bool)

(assert (=> d!89028 (arrayBitRangesEq!0 (buf!6888 w2!580) (buf!6888 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110)))

(declare-fun lt!405201 () Unit!18791)

(declare-fun choose!8 (array!14712 array!14712 (_ BitVec 64) (_ BitVec 64)) Unit!18791)

(assert (=> d!89028 (= lt!405201 (choose!8 (buf!6888 w1!584) (buf!6888 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110))))

(assert (=> d!89028 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110))))

(assert (=> d!89028 (= (arrayBitRangesEqSymmetric!0 (buf!6888 w1!584) (buf!6888 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110) lt!405201)))

(declare-fun bs!22594 () Bool)

(assert (= bs!22594 d!89028))

(assert (=> bs!22594 m!394029))

(declare-fun m!394121 () Bool)

(assert (=> bs!22594 m!394121))

(assert (=> b!263678 d!89028))

(declare-fun d!89046 () Bool)

(declare-fun res!220664 () Bool)

(declare-fun e!183985 () Bool)

(assert (=> d!89046 (=> res!220664 e!183985)))

(assert (=> d!89046 (= res!220664 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110))))

(assert (=> d!89046 (= (arrayBitRangesEq!0 (buf!6888 w2!580) (buf!6888 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110) e!183985)))

(declare-fun b!263824 () Bool)

(declare-fun e!183984 () Bool)

(declare-fun e!183987 () Bool)

(assert (=> b!263824 (= e!183984 e!183987)))

(declare-fun c!12065 () Bool)

(declare-datatypes ((tuple4!340 0))(
  ( (tuple4!341 (_1!12150 (_ BitVec 32)) (_2!12150 (_ BitVec 32)) (_3!950 (_ BitVec 32)) (_4!170 (_ BitVec 32))) )
))
(declare-fun lt!405222 () tuple4!340)

(assert (=> b!263824 (= c!12065 (= (_3!950 lt!405222) (_4!170 lt!405222)))))

(declare-fun b!263825 () Bool)

(declare-fun res!220666 () Bool)

(declare-fun lt!405223 () (_ BitVec 32))

(assert (=> b!263825 (= res!220666 (= lt!405223 #b00000000000000000000000000000000))))

(declare-fun e!183986 () Bool)

(assert (=> b!263825 (=> res!220666 e!183986)))

(declare-fun e!183983 () Bool)

(assert (=> b!263825 (= e!183983 e!183986)))

(declare-fun b!263826 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263826 (= e!183986 (byteRangesEq!0 (select (arr!7407 (buf!6888 w2!580)) (_4!170 lt!405222)) (select (arr!7407 (buf!6888 w1!584)) (_4!170 lt!405222)) #b00000000000000000000000000000000 lt!405223))))

(declare-fun b!263827 () Bool)

(declare-fun call!4069 () Bool)

(assert (=> b!263827 (= e!183987 call!4069)))

(declare-fun b!263828 () Bool)

(assert (=> b!263828 (= e!183987 e!183983)))

(declare-fun res!220667 () Bool)

(assert (=> b!263828 (= res!220667 call!4069)))

(assert (=> b!263828 (=> (not res!220667) (not e!183983))))

(declare-fun e!183988 () Bool)

(declare-fun b!263829 () Bool)

(declare-fun arrayRangesEq!1006 (array!14712 array!14712 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!263829 (= e!183988 (arrayRangesEq!1006 (buf!6888 w2!580) (buf!6888 w1!584) (_1!12150 lt!405222) (_2!12150 lt!405222)))))

(declare-fun b!263830 () Bool)

(assert (=> b!263830 (= e!183985 e!183984)))

(declare-fun res!220663 () Bool)

(assert (=> b!263830 (=> (not res!220663) (not e!183984))))

(assert (=> b!263830 (= res!220663 e!183988)))

(declare-fun res!220665 () Bool)

(assert (=> b!263830 (=> res!220665 e!183988)))

(assert (=> b!263830 (= res!220665 (bvsge (_1!12150 lt!405222) (_2!12150 lt!405222)))))

(assert (=> b!263830 (= lt!405223 ((_ extract 31 0) (bvsrem lt!405110 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405224 () (_ BitVec 32))

(assert (=> b!263830 (= lt!405224 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!340)

(assert (=> b!263830 (= lt!405222 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!405110))))

(declare-fun bm!4066 () Bool)

(assert (=> bm!4066 (= call!4069 (byteRangesEq!0 (select (arr!7407 (buf!6888 w2!580)) (_3!950 lt!405222)) (select (arr!7407 (buf!6888 w1!584)) (_3!950 lt!405222)) lt!405224 (ite c!12065 lt!405223 #b00000000000000000000000000001000)))))

(assert (= (and d!89046 (not res!220664)) b!263830))

(assert (= (and b!263830 (not res!220665)) b!263829))

(assert (= (and b!263830 res!220663) b!263824))

(assert (= (and b!263824 c!12065) b!263827))

(assert (= (and b!263824 (not c!12065)) b!263828))

(assert (= (and b!263828 res!220667) b!263825))

(assert (= (and b!263825 (not res!220666)) b!263826))

(assert (= (or b!263827 b!263828) bm!4066))

(declare-fun m!394171 () Bool)

(assert (=> b!263826 m!394171))

(declare-fun m!394173 () Bool)

(assert (=> b!263826 m!394173))

(assert (=> b!263826 m!394171))

(assert (=> b!263826 m!394173))

(declare-fun m!394175 () Bool)

(assert (=> b!263826 m!394175))

(declare-fun m!394177 () Bool)

(assert (=> b!263829 m!394177))

(declare-fun m!394179 () Bool)

(assert (=> b!263830 m!394179))

(declare-fun m!394181 () Bool)

(assert (=> bm!4066 m!394181))

(declare-fun m!394183 () Bool)

(assert (=> bm!4066 m!394183))

(assert (=> bm!4066 m!394181))

(assert (=> bm!4066 m!394183))

(declare-fun m!394185 () Bool)

(assert (=> bm!4066 m!394185))

(assert (=> b!263678 d!89046))

(declare-fun d!89066 () Bool)

(declare-fun res!220669 () Bool)

(declare-fun e!183991 () Bool)

(assert (=> d!89066 (=> res!220669 e!183991)))

(assert (=> d!89066 (= res!220669 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584))))))

(assert (=> d!89066 (= (arrayBitRangesEq!0 (buf!6888 w1!584) (buf!6888 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584))) e!183991)))

(declare-fun b!263831 () Bool)

(declare-fun e!183990 () Bool)

(declare-fun e!183993 () Bool)

(assert (=> b!263831 (= e!183990 e!183993)))

(declare-fun c!12066 () Bool)

(declare-fun lt!405225 () tuple4!340)

(assert (=> b!263831 (= c!12066 (= (_3!950 lt!405225) (_4!170 lt!405225)))))

(declare-fun b!263832 () Bool)

(declare-fun res!220671 () Bool)

(declare-fun lt!405226 () (_ BitVec 32))

(assert (=> b!263832 (= res!220671 (= lt!405226 #b00000000000000000000000000000000))))

(declare-fun e!183992 () Bool)

(assert (=> b!263832 (=> res!220671 e!183992)))

(declare-fun e!183989 () Bool)

(assert (=> b!263832 (= e!183989 e!183992)))

(declare-fun b!263833 () Bool)

(assert (=> b!263833 (= e!183992 (byteRangesEq!0 (select (arr!7407 (buf!6888 w1!584)) (_4!170 lt!405225)) (select (arr!7407 (buf!6888 w2!580)) (_4!170 lt!405225)) #b00000000000000000000000000000000 lt!405226))))

(declare-fun b!263834 () Bool)

(declare-fun call!4070 () Bool)

(assert (=> b!263834 (= e!183993 call!4070)))

(declare-fun b!263835 () Bool)

(assert (=> b!263835 (= e!183993 e!183989)))

(declare-fun res!220672 () Bool)

(assert (=> b!263835 (= res!220672 call!4070)))

(assert (=> b!263835 (=> (not res!220672) (not e!183989))))

(declare-fun e!183994 () Bool)

(declare-fun b!263836 () Bool)

(assert (=> b!263836 (= e!183994 (arrayRangesEq!1006 (buf!6888 w1!584) (buf!6888 w2!580) (_1!12150 lt!405225) (_2!12150 lt!405225)))))

(declare-fun b!263837 () Bool)

(assert (=> b!263837 (= e!183991 e!183990)))

(declare-fun res!220668 () Bool)

(assert (=> b!263837 (=> (not res!220668) (not e!183990))))

(assert (=> b!263837 (= res!220668 e!183994)))

(declare-fun res!220670 () Bool)

(assert (=> b!263837 (=> res!220670 e!183994)))

(assert (=> b!263837 (= res!220670 (bvsge (_1!12150 lt!405225) (_2!12150 lt!405225)))))

(assert (=> b!263837 (= lt!405226 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!405227 () (_ BitVec 32))

(assert (=> b!263837 (= lt!405227 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!263837 (= lt!405225 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584))))))

(declare-fun bm!4067 () Bool)

(assert (=> bm!4067 (= call!4070 (byteRangesEq!0 (select (arr!7407 (buf!6888 w1!584)) (_3!950 lt!405225)) (select (arr!7407 (buf!6888 w2!580)) (_3!950 lt!405225)) lt!405227 (ite c!12066 lt!405226 #b00000000000000000000000000001000)))))

(assert (= (and d!89066 (not res!220669)) b!263837))

(assert (= (and b!263837 (not res!220670)) b!263836))

(assert (= (and b!263837 res!220668) b!263831))

(assert (= (and b!263831 c!12066) b!263834))

(assert (= (and b!263831 (not c!12066)) b!263835))

(assert (= (and b!263835 res!220672) b!263832))

(assert (= (and b!263832 (not res!220671)) b!263833))

(assert (= (or b!263834 b!263835) bm!4067))

(declare-fun m!394187 () Bool)

(assert (=> b!263833 m!394187))

(declare-fun m!394189 () Bool)

(assert (=> b!263833 m!394189))

(assert (=> b!263833 m!394187))

(assert (=> b!263833 m!394189))

(declare-fun m!394191 () Bool)

(assert (=> b!263833 m!394191))

(declare-fun m!394193 () Bool)

(assert (=> b!263836 m!394193))

(assert (=> b!263837 m!394009))

(declare-fun m!394195 () Bool)

(assert (=> b!263837 m!394195))

(declare-fun m!394197 () Bool)

(assert (=> bm!4067 m!394197))

(declare-fun m!394199 () Bool)

(assert (=> bm!4067 m!394199))

(assert (=> bm!4067 m!394197))

(assert (=> bm!4067 m!394199))

(declare-fun m!394201 () Bool)

(assert (=> bm!4067 m!394201))

(assert (=> b!263677 d!89066))

(assert (=> b!263677 d!89016))

(assert (=> b!263682 d!89016))

(declare-fun d!89068 () Bool)

(assert (=> d!89068 (= (array_inv!6144 (buf!6888 w2!580)) (bvsge (size!6420 (buf!6888 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!263681 d!89068))

(declare-fun d!89070 () Bool)

(declare-fun res!220674 () Bool)

(declare-fun e!183995 () Bool)

(assert (=> d!89070 (=> (not res!220674) (not e!183995))))

(assert (=> d!89070 (= res!220674 (= (size!6420 (buf!6888 w1!584)) (size!6420 (buf!6888 w2!580))))))

(assert (=> d!89070 (= (isPrefixOf!0 w1!584 w2!580) e!183995)))

(declare-fun b!263838 () Bool)

(declare-fun res!220673 () Bool)

(assert (=> b!263838 (=> (not res!220673) (not e!183995))))

(assert (=> b!263838 (= res!220673 (bvsle (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584)) (bitIndex!0 (size!6420 (buf!6888 w2!580)) (currentByte!12749 w2!580) (currentBit!12744 w2!580))))))

(declare-fun b!263839 () Bool)

(declare-fun e!183996 () Bool)

(assert (=> b!263839 (= e!183995 e!183996)))

(declare-fun res!220675 () Bool)

(assert (=> b!263839 (=> res!220675 e!183996)))

(assert (=> b!263839 (= res!220675 (= (size!6420 (buf!6888 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!263840 () Bool)

(assert (=> b!263840 (= e!183996 (arrayBitRangesEq!0 (buf!6888 w1!584) (buf!6888 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6420 (buf!6888 w1!584)) (currentByte!12749 w1!584) (currentBit!12744 w1!584))))))

(assert (= (and d!89070 res!220674) b!263838))

(assert (= (and b!263838 res!220673) b!263839))

(assert (= (and b!263839 (not res!220675)) b!263840))

(assert (=> b!263838 m!394009))

(assert (=> b!263838 m!394075))

(assert (=> b!263840 m!394009))

(assert (=> b!263840 m!394009))

(assert (=> b!263840 m!394011))

(assert (=> start!57520 d!89070))

(declare-fun d!89072 () Bool)

(assert (=> d!89072 (= (inv!12 w1!584) (invariant!0 (currentBit!12744 w1!584) (currentByte!12749 w1!584) (size!6420 (buf!6888 w1!584))))))

(declare-fun bs!22600 () Bool)

(assert (= bs!22600 d!89072))

(assert (=> bs!22600 m!394089))

(assert (=> start!57520 d!89072))

(declare-fun d!89074 () Bool)

(assert (=> d!89074 (= (inv!12 w2!580) (invariant!0 (currentBit!12744 w2!580) (currentByte!12749 w2!580) (size!6420 (buf!6888 w2!580))))))

(declare-fun bs!22601 () Bool)

(assert (= bs!22601 d!89074))

(declare-fun m!394203 () Bool)

(assert (=> bs!22601 m!394203))

(assert (=> start!57520 d!89074))

(push 1)

(assert (not b!263733))

(assert (not d!89002))

(assert (not b!263735))

(assert (not bm!4066))

(assert (not b!263836))

(assert (not b!263729))

(assert (not b!263826))

(assert (not b!263833))

(assert (not d!88998))

(assert (not b!263727))

(assert (not b!263837))

(assert (not b!263732))

(assert (not d!89010))

(assert (not b!263730))

(assert (not d!89072))

(assert (not b!263840))

(assert (not bm!4067))

(assert (not d!89074))

(assert (not d!89028))

(assert (not b!263829))

(assert (not d!89016))

(assert (not b!263830))

(assert (not b!263838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

