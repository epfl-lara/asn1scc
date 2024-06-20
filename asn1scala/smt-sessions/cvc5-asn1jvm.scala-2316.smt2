; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58832 () Bool)

(assert start!58832)

(declare-fun b!269974 () Bool)

(declare-fun e!189860 () Bool)

(declare-datatypes ((array!15044 0))(
  ( (array!15045 (arr!7540 (Array (_ BitVec 32) (_ BitVec 8))) (size!6553 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11920 0))(
  ( (BitStream!11921 (buf!7021 array!15044) (currentByte!12980 (_ BitVec 32)) (currentBit!12975 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11920)

(declare-fun array_inv!6277 (array!15044) Bool)

(assert (=> b!269974 (= e!189860 (array_inv!6277 (buf!7021 w3!25)))))

(declare-fun b!269975 () Bool)

(declare-fun e!189858 () Bool)

(declare-fun w1!591 () BitStream!11920)

(assert (=> b!269975 (= e!189858 (array_inv!6277 (buf!7021 w1!591)))))

(declare-fun b!269976 () Bool)

(declare-fun res!225027 () Bool)

(declare-fun e!189857 () Bool)

(assert (=> b!269976 (=> (not res!225027) (not e!189857))))

(declare-fun w2!587 () BitStream!11920)

(declare-fun isPrefixOf!0 (BitStream!11920 BitStream!11920) Bool)

(assert (=> b!269976 (= res!225027 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!225028 () Bool)

(assert (=> start!58832 (=> (not res!225028) (not e!189857))))

(assert (=> start!58832 (= res!225028 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58832 e!189857))

(declare-fun inv!12 (BitStream!11920) Bool)

(assert (=> start!58832 (and (inv!12 w1!591) e!189858)))

(declare-fun e!189856 () Bool)

(assert (=> start!58832 (and (inv!12 w2!587) e!189856)))

(assert (=> start!58832 (and (inv!12 w3!25) e!189860)))

(declare-fun b!269977 () Bool)

(assert (=> b!269977 (= e!189856 (array_inv!6277 (buf!7021 w2!587)))))

(declare-fun b!269978 () Bool)

(assert (=> b!269978 (= e!189857 (not (or (bvsge (currentByte!12980 w1!591) (size!6553 (buf!7021 w1!591))) (bvsge (currentByte!12980 w1!591) (currentByte!12980 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12980 w2!587)) (bvsle (size!6553 (buf!7021 w2!587)) (size!6553 (buf!7021 w3!25))))))))

(declare-fun arrayRangesEq!1085 (array!15044 array!15044 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269978 (arrayRangesEq!1085 (buf!7021 w1!591) (buf!7021 w3!25) #b00000000000000000000000000000000 (currentByte!12980 w1!591))))

(declare-datatypes ((Unit!19061 0))(
  ( (Unit!19062) )
))
(declare-fun lt!409253 () Unit!19061)

(declare-fun arrayRangesEqTransitive!348 (array!15044 array!15044 array!15044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19061)

(assert (=> b!269978 (= lt!409253 (arrayRangesEqTransitive!348 (buf!7021 w1!591) (buf!7021 w2!587) (buf!7021 w3!25) #b00000000000000000000000000000000 (currentByte!12980 w1!591) (currentByte!12980 w2!587)))))

(assert (= (and start!58832 res!225028) b!269976))

(assert (= (and b!269976 res!225027) b!269978))

(assert (= start!58832 b!269975))

(assert (= start!58832 b!269977))

(assert (= start!58832 b!269974))

(declare-fun m!401757 () Bool)

(assert (=> b!269974 m!401757))

(declare-fun m!401759 () Bool)

(assert (=> start!58832 m!401759))

(declare-fun m!401761 () Bool)

(assert (=> start!58832 m!401761))

(declare-fun m!401763 () Bool)

(assert (=> start!58832 m!401763))

(declare-fun m!401765 () Bool)

(assert (=> start!58832 m!401765))

(declare-fun m!401767 () Bool)

(assert (=> b!269977 m!401767))

(declare-fun m!401769 () Bool)

(assert (=> b!269976 m!401769))

(declare-fun m!401771 () Bool)

(assert (=> b!269975 m!401771))

(declare-fun m!401773 () Bool)

(assert (=> b!269978 m!401773))

(declare-fun m!401775 () Bool)

(assert (=> b!269978 m!401775))

(push 1)

(assert (not b!269976))

(assert (not b!269975))

(assert (not start!58832))

(assert (not b!269978))

(assert (not b!269974))

(assert (not b!269977))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91594 () Bool)

(assert (=> d!91594 (= (array_inv!6277 (buf!7021 w3!25)) (bvsge (size!6553 (buf!7021 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269974 d!91594))

(declare-fun d!91596 () Bool)

(declare-fun res!225045 () Bool)

(declare-fun e!189909 () Bool)

(assert (=> d!91596 (=> res!225045 e!189909)))

(assert (=> d!91596 (= res!225045 (= #b00000000000000000000000000000000 (currentByte!12980 w1!591)))))

(assert (=> d!91596 (= (arrayRangesEq!1085 (buf!7021 w1!591) (buf!7021 w3!25) #b00000000000000000000000000000000 (currentByte!12980 w1!591)) e!189909)))

(declare-fun b!270013 () Bool)

(declare-fun e!189910 () Bool)

(assert (=> b!270013 (= e!189909 e!189910)))

(declare-fun res!225046 () Bool)

(assert (=> b!270013 (=> (not res!225046) (not e!189910))))

(assert (=> b!270013 (= res!225046 (= (select (arr!7540 (buf!7021 w1!591)) #b00000000000000000000000000000000) (select (arr!7540 (buf!7021 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270014 () Bool)

(assert (=> b!270014 (= e!189910 (arrayRangesEq!1085 (buf!7021 w1!591) (buf!7021 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12980 w1!591)))))

(assert (= (and d!91596 (not res!225045)) b!270013))

(assert (= (and b!270013 res!225046) b!270014))

(declare-fun m!401817 () Bool)

(assert (=> b!270013 m!401817))

(declare-fun m!401819 () Bool)

(assert (=> b!270013 m!401819))

(declare-fun m!401821 () Bool)

(assert (=> b!270014 m!401821))

(assert (=> b!269978 d!91596))

(declare-fun d!91604 () Bool)

(assert (=> d!91604 (arrayRangesEq!1085 (buf!7021 w1!591) (buf!7021 w3!25) #b00000000000000000000000000000000 (currentByte!12980 w1!591))))

(declare-fun lt!409262 () Unit!19061)

(declare-fun choose!386 (array!15044 array!15044 array!15044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19061)

(assert (=> d!91604 (= lt!409262 (choose!386 (buf!7021 w1!591) (buf!7021 w2!587) (buf!7021 w3!25) #b00000000000000000000000000000000 (currentByte!12980 w1!591) (currentByte!12980 w2!587)))))

(assert (=> d!91604 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12980 w1!591)) (bvsle (currentByte!12980 w1!591) (currentByte!12980 w2!587)))))

(assert (=> d!91604 (= (arrayRangesEqTransitive!348 (buf!7021 w1!591) (buf!7021 w2!587) (buf!7021 w3!25) #b00000000000000000000000000000000 (currentByte!12980 w1!591) (currentByte!12980 w2!587)) lt!409262)))

(declare-fun bs!23161 () Bool)

(assert (= bs!23161 d!91604))

(assert (=> bs!23161 m!401773))

(declare-fun m!401823 () Bool)

(assert (=> bs!23161 m!401823))

(assert (=> b!269978 d!91604))

(declare-fun d!91606 () Bool)

(assert (=> d!91606 (= (array_inv!6277 (buf!7021 w2!587)) (bvsge (size!6553 (buf!7021 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269977 d!91606))

(declare-fun d!91608 () Bool)

(declare-fun res!225068 () Bool)

(declare-fun e!189927 () Bool)

(assert (=> d!91608 (=> (not res!225068) (not e!189927))))

(assert (=> d!91608 (= res!225068 (= (size!6553 (buf!7021 w1!591)) (size!6553 (buf!7021 w2!587))))))

(assert (=> d!91608 (= (isPrefixOf!0 w1!591 w2!587) e!189927)))

(declare-fun b!270036 () Bool)

(declare-fun res!225070 () Bool)

(assert (=> b!270036 (=> (not res!225070) (not e!189927))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270036 (= res!225070 (bvsle (bitIndex!0 (size!6553 (buf!7021 w1!591)) (currentByte!12980 w1!591) (currentBit!12975 w1!591)) (bitIndex!0 (size!6553 (buf!7021 w2!587)) (currentByte!12980 w2!587) (currentBit!12975 w2!587))))))

(declare-fun b!270037 () Bool)

(declare-fun e!189928 () Bool)

(assert (=> b!270037 (= e!189927 e!189928)))

(declare-fun res!225069 () Bool)

(assert (=> b!270037 (=> res!225069 e!189928)))

(assert (=> b!270037 (= res!225069 (= (size!6553 (buf!7021 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270038 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15044 array!15044 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270038 (= e!189928 (arrayBitRangesEq!0 (buf!7021 w1!591) (buf!7021 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6553 (buf!7021 w1!591)) (currentByte!12980 w1!591) (currentBit!12975 w1!591))))))

(assert (= (and d!91608 res!225068) b!270036))

(assert (= (and b!270036 res!225070) b!270037))

(assert (= (and b!270037 (not res!225069)) b!270038))

(declare-fun m!401843 () Bool)

(assert (=> b!270036 m!401843))

(declare-fun m!401845 () Bool)

(assert (=> b!270036 m!401845))

(assert (=> b!270038 m!401843))

(assert (=> b!270038 m!401843))

(declare-fun m!401847 () Bool)

(assert (=> b!270038 m!401847))

(assert (=> start!58832 d!91608))

(declare-fun d!91624 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91624 (= (inv!12 w1!591) (invariant!0 (currentBit!12975 w1!591) (currentByte!12980 w1!591) (size!6553 (buf!7021 w1!591))))))

(declare-fun bs!23165 () Bool)

(assert (= bs!23165 d!91624))

(declare-fun m!401849 () Bool)

(assert (=> bs!23165 m!401849))

(assert (=> start!58832 d!91624))

(declare-fun d!91626 () Bool)

(assert (=> d!91626 (= (inv!12 w2!587) (invariant!0 (currentBit!12975 w2!587) (currentByte!12980 w2!587) (size!6553 (buf!7021 w2!587))))))

(declare-fun bs!23166 () Bool)

(assert (= bs!23166 d!91626))

(declare-fun m!401851 () Bool)

(assert (=> bs!23166 m!401851))

(assert (=> start!58832 d!91626))

(declare-fun d!91628 () Bool)

(assert (=> d!91628 (= (inv!12 w3!25) (invariant!0 (currentBit!12975 w3!25) (currentByte!12980 w3!25) (size!6553 (buf!7021 w3!25))))))

(declare-fun bs!23167 () Bool)

(assert (= bs!23167 d!91628))

(declare-fun m!401853 () Bool)

(assert (=> bs!23167 m!401853))

(assert (=> start!58832 d!91628))

(declare-fun d!91630 () Bool)

(declare-fun res!225071 () Bool)

(declare-fun e!189929 () Bool)

(assert (=> d!91630 (=> (not res!225071) (not e!189929))))

(assert (=> d!91630 (= res!225071 (= (size!6553 (buf!7021 w2!587)) (size!6553 (buf!7021 w3!25))))))

(assert (=> d!91630 (= (isPrefixOf!0 w2!587 w3!25) e!189929)))

(declare-fun b!270039 () Bool)

(declare-fun res!225073 () Bool)

(assert (=> b!270039 (=> (not res!225073) (not e!189929))))

(assert (=> b!270039 (= res!225073 (bvsle (bitIndex!0 (size!6553 (buf!7021 w2!587)) (currentByte!12980 w2!587) (currentBit!12975 w2!587)) (bitIndex!0 (size!6553 (buf!7021 w3!25)) (currentByte!12980 w3!25) (currentBit!12975 w3!25))))))

(declare-fun b!270040 () Bool)

(declare-fun e!189930 () Bool)

(assert (=> b!270040 (= e!189929 e!189930)))

(declare-fun res!225072 () Bool)

(assert (=> b!270040 (=> res!225072 e!189930)))

(assert (=> b!270040 (= res!225072 (= (size!6553 (buf!7021 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270041 () Bool)

(assert (=> b!270041 (= e!189930 (arrayBitRangesEq!0 (buf!7021 w2!587) (buf!7021 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6553 (buf!7021 w2!587)) (currentByte!12980 w2!587) (currentBit!12975 w2!587))))))

(assert (= (and d!91630 res!225071) b!270039))

(assert (= (and b!270039 res!225073) b!270040))

(assert (= (and b!270040 (not res!225072)) b!270041))

(assert (=> b!270039 m!401845))

(declare-fun m!401855 () Bool)

(assert (=> b!270039 m!401855))

(assert (=> b!270041 m!401845))

(assert (=> b!270041 m!401845))

(declare-fun m!401857 () Bool)

(assert (=> b!270041 m!401857))

(assert (=> b!269976 d!91630))

(declare-fun d!91632 () Bool)

(assert (=> d!91632 (= (array_inv!6277 (buf!7021 w1!591)) (bvsge (size!6553 (buf!7021 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269975 d!91632))

(push 1)

(assert (not b!270041))

(assert (not d!91624))

(assert (not b!270036))

(assert (not b!270039))

(assert (not d!91626))

(assert (not b!270038))

(assert (not b!270014))

(assert (not d!91628))

(assert (not d!91604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

