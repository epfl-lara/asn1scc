; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!59086 () Bool)

(assert start!59086)

(declare-fun b!270783 () Bool)

(declare-fun e!190653 () Bool)

(declare-fun e!190651 () Bool)

(assert (=> b!270783 (= e!190653 (not e!190651))))

(declare-fun res!225645 () Bool)

(assert (=> b!270783 (=> res!225645 e!190651)))

(declare-datatypes ((array!15091 0))(
  ( (array!15092 (arr!7556 (Array (_ BitVec 32) (_ BitVec 8))) (size!6569 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11952 0))(
  ( (BitStream!11953 (buf!7037 array!15091) (currentByte!13011 (_ BitVec 32)) (currentBit!13006 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11952)

(declare-fun w2!587 () BitStream!11952)

(assert (=> b!270783 (= res!225645 (or (bvsge (currentByte!13011 w1!591) (size!6569 (buf!7037 w1!591))) (bvsge (currentByte!13011 w1!591) (currentByte!13011 w2!587))))))

(declare-fun w3!25 () BitStream!11952)

(declare-fun arrayRangesEq!1101 (array!15091 array!15091 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270783 (arrayRangesEq!1101 (buf!7037 w1!591) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591))))

(declare-datatypes ((Unit!19093 0))(
  ( (Unit!19094) )
))
(declare-fun lt!409622 () Unit!19093)

(declare-fun arrayRangesEqTransitive!364 (array!15091 array!15091 array!15091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19093)

(assert (=> b!270783 (= lt!409622 (arrayRangesEqTransitive!364 (buf!7037 w1!591) (buf!7037 w2!587) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591) (currentByte!13011 w2!587)))))

(declare-fun b!270784 () Bool)

(declare-fun e!190647 () Bool)

(declare-fun array_inv!6293 (array!15091) Bool)

(assert (=> b!270784 (= e!190647 (array_inv!6293 (buf!7037 w1!591)))))

(declare-fun b!270785 () Bool)

(declare-fun e!190654 () Bool)

(assert (=> b!270785 (= e!190654 (array_inv!6293 (buf!7037 w3!25)))))

(declare-fun b!270786 () Bool)

(declare-fun res!225646 () Bool)

(assert (=> b!270786 (=> (not res!225646) (not e!190653))))

(declare-fun isPrefixOf!0 (BitStream!11952 BitStream!11952) Bool)

(assert (=> b!270786 (= res!225646 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270787 () Bool)

(declare-fun e!190650 () Bool)

(assert (=> b!270787 (= e!190650 (array_inv!6293 (buf!7037 w2!587)))))

(declare-fun b!270788 () Bool)

(assert (=> b!270788 (= e!190651 (and (bvsge (currentByte!13011 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13011 w1!591) (size!6569 (buf!7037 w3!25)))))))

(assert (=> b!270788 (= (select (arr!7556 (buf!7037 w2!587)) (currentByte!13011 w1!591)) (select (arr!7556 (buf!7037 w3!25)) (currentByte!13011 w1!591)))))

(declare-fun lt!409621 () Unit!19093)

(declare-fun arrayRangesEqImpliesEq!161 (array!15091 array!15091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19093)

(assert (=> b!270788 (= lt!409621 (arrayRangesEqImpliesEq!161 (buf!7037 w2!587) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591) (currentByte!13011 w2!587)))))

(declare-fun res!225644 () Bool)

(assert (=> start!59086 (=> (not res!225644) (not e!190653))))

(assert (=> start!59086 (= res!225644 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59086 e!190653))

(declare-fun inv!12 (BitStream!11952) Bool)

(assert (=> start!59086 (and (inv!12 w1!591) e!190647)))

(assert (=> start!59086 (and (inv!12 w2!587) e!190650)))

(assert (=> start!59086 (and (inv!12 w3!25) e!190654)))

(assert (= (and start!59086 res!225644) b!270786))

(assert (= (and b!270786 res!225646) b!270783))

(assert (= (and b!270783 (not res!225645)) b!270788))

(assert (= start!59086 b!270784))

(assert (= start!59086 b!270787))

(assert (= start!59086 b!270785))

(declare-fun m!402869 () Bool)

(assert (=> b!270788 m!402869))

(declare-fun m!402871 () Bool)

(assert (=> b!270788 m!402871))

(declare-fun m!402873 () Bool)

(assert (=> b!270788 m!402873))

(declare-fun m!402875 () Bool)

(assert (=> start!59086 m!402875))

(declare-fun m!402877 () Bool)

(assert (=> start!59086 m!402877))

(declare-fun m!402879 () Bool)

(assert (=> start!59086 m!402879))

(declare-fun m!402881 () Bool)

(assert (=> start!59086 m!402881))

(declare-fun m!402883 () Bool)

(assert (=> b!270787 m!402883))

(declare-fun m!402885 () Bool)

(assert (=> b!270784 m!402885))

(declare-fun m!402887 () Bool)

(assert (=> b!270786 m!402887))

(declare-fun m!402889 () Bool)

(assert (=> b!270785 m!402889))

(declare-fun m!402891 () Bool)

(assert (=> b!270783 m!402891))

(declare-fun m!402893 () Bool)

(assert (=> b!270783 m!402893))

(check-sat (not b!270783) (not b!270787) (not b!270785) (not b!270784) (not start!59086) (not b!270788) (not b!270786))
(check-sat)
(get-model)

(declare-fun d!92120 () Bool)

(assert (=> d!92120 (= (array_inv!6293 (buf!7037 w2!587)) (bvsge (size!6569 (buf!7037 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270787 d!92120))

(declare-fun d!92122 () Bool)

(assert (=> d!92122 (and (bvsge (currentByte!13011 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13011 w1!591) (size!6569 (buf!7037 w2!587))) (bvslt (currentByte!13011 w1!591) (size!6569 (buf!7037 w3!25))) (= (select (arr!7556 (buf!7037 w2!587)) (currentByte!13011 w1!591)) (select (arr!7556 (buf!7037 w3!25)) (currentByte!13011 w1!591))))))

(declare-fun lt!409631 () Unit!19093)

(declare-fun choose!403 (array!15091 array!15091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19093)

(assert (=> d!92122 (= lt!409631 (choose!403 (buf!7037 w2!587) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591) (currentByte!13011 w2!587)))))

(assert (=> d!92122 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13011 w2!587)))))

(assert (=> d!92122 (= (arrayRangesEqImpliesEq!161 (buf!7037 w2!587) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591) (currentByte!13011 w2!587)) lt!409631)))

(declare-fun bs!23257 () Bool)

(assert (= bs!23257 d!92122))

(assert (=> bs!23257 m!402869))

(assert (=> bs!23257 m!402871))

(declare-fun m!402921 () Bool)

(assert (=> bs!23257 m!402921))

(assert (=> b!270788 d!92122))

(declare-fun d!92124 () Bool)

(declare-fun res!225660 () Bool)

(declare-fun e!190683 () Bool)

(assert (=> d!92124 (=> res!225660 e!190683)))

(assert (=> d!92124 (= res!225660 (= #b00000000000000000000000000000000 (currentByte!13011 w1!591)))))

(assert (=> d!92124 (= (arrayRangesEq!1101 (buf!7037 w1!591) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591)) e!190683)))

(declare-fun b!270811 () Bool)

(declare-fun e!190684 () Bool)

(assert (=> b!270811 (= e!190683 e!190684)))

(declare-fun res!225661 () Bool)

(assert (=> b!270811 (=> (not res!225661) (not e!190684))))

(assert (=> b!270811 (= res!225661 (= (select (arr!7556 (buf!7037 w1!591)) #b00000000000000000000000000000000) (select (arr!7556 (buf!7037 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270812 () Bool)

(assert (=> b!270812 (= e!190684 (arrayRangesEq!1101 (buf!7037 w1!591) (buf!7037 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13011 w1!591)))))

(assert (= (and d!92124 (not res!225660)) b!270811))

(assert (= (and b!270811 res!225661) b!270812))

(declare-fun m!402923 () Bool)

(assert (=> b!270811 m!402923))

(declare-fun m!402925 () Bool)

(assert (=> b!270811 m!402925))

(declare-fun m!402927 () Bool)

(assert (=> b!270812 m!402927))

(assert (=> b!270783 d!92124))

(declare-fun d!92128 () Bool)

(assert (=> d!92128 (arrayRangesEq!1101 (buf!7037 w1!591) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591))))

(declare-fun lt!409634 () Unit!19093)

(declare-fun choose!404 (array!15091 array!15091 array!15091 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19093)

(assert (=> d!92128 (= lt!409634 (choose!404 (buf!7037 w1!591) (buf!7037 w2!587) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591) (currentByte!13011 w2!587)))))

(assert (=> d!92128 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13011 w1!591)) (bvsle (currentByte!13011 w1!591) (currentByte!13011 w2!587)))))

(assert (=> d!92128 (= (arrayRangesEqTransitive!364 (buf!7037 w1!591) (buf!7037 w2!587) (buf!7037 w3!25) #b00000000000000000000000000000000 (currentByte!13011 w1!591) (currentByte!13011 w2!587)) lt!409634)))

(declare-fun bs!23258 () Bool)

(assert (= bs!23258 d!92128))

(assert (=> bs!23258 m!402891))

(declare-fun m!402929 () Bool)

(assert (=> bs!23258 m!402929))

(assert (=> b!270783 d!92128))

(declare-fun d!92130 () Bool)

(assert (=> d!92130 (= (array_inv!6293 (buf!7037 w1!591)) (bvsge (size!6569 (buf!7037 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270784 d!92130))

(declare-fun d!92132 () Bool)

(declare-fun res!225679 () Bool)

(declare-fun e!190695 () Bool)

(assert (=> d!92132 (=> (not res!225679) (not e!190695))))

(assert (=> d!92132 (= res!225679 (= (size!6569 (buf!7037 w1!591)) (size!6569 (buf!7037 w2!587))))))

(assert (=> d!92132 (= (isPrefixOf!0 w1!591 w2!587) e!190695)))

(declare-fun b!270828 () Bool)

(declare-fun res!225678 () Bool)

(assert (=> b!270828 (=> (not res!225678) (not e!190695))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270828 (= res!225678 (bvsle (bitIndex!0 (size!6569 (buf!7037 w1!591)) (currentByte!13011 w1!591) (currentBit!13006 w1!591)) (bitIndex!0 (size!6569 (buf!7037 w2!587)) (currentByte!13011 w2!587) (currentBit!13006 w2!587))))))

(declare-fun b!270829 () Bool)

(declare-fun e!190696 () Bool)

(assert (=> b!270829 (= e!190695 e!190696)))

(declare-fun res!225677 () Bool)

(assert (=> b!270829 (=> res!225677 e!190696)))

(assert (=> b!270829 (= res!225677 (= (size!6569 (buf!7037 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270830 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15091 array!15091 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270830 (= e!190696 (arrayBitRangesEq!0 (buf!7037 w1!591) (buf!7037 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6569 (buf!7037 w1!591)) (currentByte!13011 w1!591) (currentBit!13006 w1!591))))))

(assert (= (and d!92132 res!225679) b!270828))

(assert (= (and b!270828 res!225678) b!270829))

(assert (= (and b!270829 (not res!225677)) b!270830))

(declare-fun m!402937 () Bool)

(assert (=> b!270828 m!402937))

(declare-fun m!402939 () Bool)

(assert (=> b!270828 m!402939))

(assert (=> b!270830 m!402937))

(assert (=> b!270830 m!402937))

(declare-fun m!402941 () Bool)

(assert (=> b!270830 m!402941))

(assert (=> start!59086 d!92132))

(declare-fun d!92140 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92140 (= (inv!12 w1!591) (invariant!0 (currentBit!13006 w1!591) (currentByte!13011 w1!591) (size!6569 (buf!7037 w1!591))))))

(declare-fun bs!23259 () Bool)

(assert (= bs!23259 d!92140))

(declare-fun m!402943 () Bool)

(assert (=> bs!23259 m!402943))

(assert (=> start!59086 d!92140))

(declare-fun d!92142 () Bool)

(assert (=> d!92142 (= (inv!12 w2!587) (invariant!0 (currentBit!13006 w2!587) (currentByte!13011 w2!587) (size!6569 (buf!7037 w2!587))))))

(declare-fun bs!23260 () Bool)

(assert (= bs!23260 d!92142))

(declare-fun m!402945 () Bool)

(assert (=> bs!23260 m!402945))

(assert (=> start!59086 d!92142))

(declare-fun d!92144 () Bool)

(assert (=> d!92144 (= (inv!12 w3!25) (invariant!0 (currentBit!13006 w3!25) (currentByte!13011 w3!25) (size!6569 (buf!7037 w3!25))))))

(declare-fun bs!23261 () Bool)

(assert (= bs!23261 d!92144))

(declare-fun m!402947 () Bool)

(assert (=> bs!23261 m!402947))

(assert (=> start!59086 d!92144))

(declare-fun d!92146 () Bool)

(assert (=> d!92146 (= (array_inv!6293 (buf!7037 w3!25)) (bvsge (size!6569 (buf!7037 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270785 d!92146))

(declare-fun d!92148 () Bool)

(declare-fun res!225683 () Bool)

(declare-fun e!190699 () Bool)

(assert (=> d!92148 (=> (not res!225683) (not e!190699))))

(assert (=> d!92148 (= res!225683 (= (size!6569 (buf!7037 w2!587)) (size!6569 (buf!7037 w3!25))))))

(assert (=> d!92148 (= (isPrefixOf!0 w2!587 w3!25) e!190699)))

(declare-fun b!270831 () Bool)

(declare-fun res!225681 () Bool)

(assert (=> b!270831 (=> (not res!225681) (not e!190699))))

(assert (=> b!270831 (= res!225681 (bvsle (bitIndex!0 (size!6569 (buf!7037 w2!587)) (currentByte!13011 w2!587) (currentBit!13006 w2!587)) (bitIndex!0 (size!6569 (buf!7037 w3!25)) (currentByte!13011 w3!25) (currentBit!13006 w3!25))))))

(declare-fun b!270832 () Bool)

(declare-fun e!190700 () Bool)

(assert (=> b!270832 (= e!190699 e!190700)))

(declare-fun res!225680 () Bool)

(assert (=> b!270832 (=> res!225680 e!190700)))

(assert (=> b!270832 (= res!225680 (= (size!6569 (buf!7037 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270833 () Bool)

(assert (=> b!270833 (= e!190700 (arrayBitRangesEq!0 (buf!7037 w2!587) (buf!7037 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6569 (buf!7037 w2!587)) (currentByte!13011 w2!587) (currentBit!13006 w2!587))))))

(assert (= (and d!92148 res!225683) b!270831))

(assert (= (and b!270831 res!225681) b!270832))

(assert (= (and b!270832 (not res!225680)) b!270833))

(assert (=> b!270831 m!402939))

(declare-fun m!402949 () Bool)

(assert (=> b!270831 m!402949))

(assert (=> b!270833 m!402939))

(assert (=> b!270833 m!402939))

(declare-fun m!402953 () Bool)

(assert (=> b!270833 m!402953))

(assert (=> b!270786 d!92148))

(check-sat (not d!92122) (not b!270833) (not d!92140) (not b!270828) (not d!92142) (not b!270830) (not b!270812) (not d!92128) (not d!92144) (not b!270831))
(check-sat)
