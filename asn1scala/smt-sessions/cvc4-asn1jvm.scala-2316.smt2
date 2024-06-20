; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58836 () Bool)

(assert start!58836)

(declare-fun res!225039 () Bool)

(declare-fun e!189901 () Bool)

(assert (=> start!58836 (=> (not res!225039) (not e!189901))))

(declare-datatypes ((array!15048 0))(
  ( (array!15049 (arr!7542 (Array (_ BitVec 32) (_ BitVec 8))) (size!6555 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11924 0))(
  ( (BitStream!11925 (buf!7023 array!15048) (currentByte!12982 (_ BitVec 32)) (currentBit!12977 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11924)

(declare-fun w2!587 () BitStream!11924)

(declare-fun isPrefixOf!0 (BitStream!11924 BitStream!11924) Bool)

(assert (=> start!58836 (= res!225039 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58836 e!189901))

(declare-fun e!189898 () Bool)

(declare-fun inv!12 (BitStream!11924) Bool)

(assert (=> start!58836 (and (inv!12 w1!591) e!189898)))

(declare-fun e!189900 () Bool)

(assert (=> start!58836 (and (inv!12 w2!587) e!189900)))

(declare-fun w3!25 () BitStream!11924)

(declare-fun e!189902 () Bool)

(assert (=> start!58836 (and (inv!12 w3!25) e!189902)))

(declare-fun b!270004 () Bool)

(declare-fun res!225040 () Bool)

(assert (=> b!270004 (=> (not res!225040) (not e!189901))))

(assert (=> b!270004 (= res!225040 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270005 () Bool)

(assert (=> b!270005 (= e!189901 (not (or (bvsge (currentByte!12982 w1!591) (size!6555 (buf!7023 w1!591))) (bvsge (currentByte!12982 w1!591) (currentByte!12982 w2!587)) (bvsgt #b00000000000000000000000000000000 (currentByte!12982 w2!587)) (bvsle (size!6555 (buf!7023 w2!587)) (size!6555 (buf!7023 w3!25))))))))

(declare-fun arrayRangesEq!1087 (array!15048 array!15048 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270005 (arrayRangesEq!1087 (buf!7023 w1!591) (buf!7023 w3!25) #b00000000000000000000000000000000 (currentByte!12982 w1!591))))

(declare-datatypes ((Unit!19065 0))(
  ( (Unit!19066) )
))
(declare-fun lt!409259 () Unit!19065)

(declare-fun arrayRangesEqTransitive!350 (array!15048 array!15048 array!15048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19065)

(assert (=> b!270005 (= lt!409259 (arrayRangesEqTransitive!350 (buf!7023 w1!591) (buf!7023 w2!587) (buf!7023 w3!25) #b00000000000000000000000000000000 (currentByte!12982 w1!591) (currentByte!12982 w2!587)))))

(declare-fun b!270006 () Bool)

(declare-fun array_inv!6279 (array!15048) Bool)

(assert (=> b!270006 (= e!189898 (array_inv!6279 (buf!7023 w1!591)))))

(declare-fun b!270007 () Bool)

(assert (=> b!270007 (= e!189900 (array_inv!6279 (buf!7023 w2!587)))))

(declare-fun b!270008 () Bool)

(assert (=> b!270008 (= e!189902 (array_inv!6279 (buf!7023 w3!25)))))

(assert (= (and start!58836 res!225039) b!270004))

(assert (= (and b!270004 res!225040) b!270005))

(assert (= start!58836 b!270006))

(assert (= start!58836 b!270007))

(assert (= start!58836 b!270008))

(declare-fun m!401797 () Bool)

(assert (=> b!270006 m!401797))

(declare-fun m!401799 () Bool)

(assert (=> start!58836 m!401799))

(declare-fun m!401801 () Bool)

(assert (=> start!58836 m!401801))

(declare-fun m!401803 () Bool)

(assert (=> start!58836 m!401803))

(declare-fun m!401805 () Bool)

(assert (=> start!58836 m!401805))

(declare-fun m!401807 () Bool)

(assert (=> b!270007 m!401807))

(declare-fun m!401809 () Bool)

(assert (=> b!270005 m!401809))

(declare-fun m!401811 () Bool)

(assert (=> b!270005 m!401811))

(declare-fun m!401813 () Bool)

(assert (=> b!270004 m!401813))

(declare-fun m!401815 () Bool)

(assert (=> b!270008 m!401815))

(push 1)

(assert (not b!270007))

(assert (not start!58836))

(assert (not b!270005))

(assert (not b!270006))

(assert (not b!270004))

(assert (not b!270008))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91598 () Bool)

(assert (=> d!91598 (= (array_inv!6279 (buf!7023 w3!25)) (bvsge (size!6555 (buf!7023 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270008 d!91598))

(declare-fun d!91600 () Bool)

(assert (=> d!91600 (= (array_inv!6279 (buf!7023 w2!587)) (bvsge (size!6555 (buf!7023 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270007 d!91600))

(declare-fun d!91602 () Bool)

(declare-fun res!225054 () Bool)

(declare-fun e!189915 () Bool)

(assert (=> d!91602 (=> (not res!225054) (not e!189915))))

(assert (=> d!91602 (= res!225054 (= (size!6555 (buf!7023 w1!591)) (size!6555 (buf!7023 w2!587))))))

(assert (=> d!91602 (= (isPrefixOf!0 w1!591 w2!587) e!189915)))

(declare-fun b!270021 () Bool)

(declare-fun res!225055 () Bool)

(assert (=> b!270021 (=> (not res!225055) (not e!189915))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270021 (= res!225055 (bvsle (bitIndex!0 (size!6555 (buf!7023 w1!591)) (currentByte!12982 w1!591) (currentBit!12977 w1!591)) (bitIndex!0 (size!6555 (buf!7023 w2!587)) (currentByte!12982 w2!587) (currentBit!12977 w2!587))))))

(declare-fun b!270022 () Bool)

(declare-fun e!189916 () Bool)

(assert (=> b!270022 (= e!189915 e!189916)))

(declare-fun res!225053 () Bool)

(assert (=> b!270022 (=> res!225053 e!189916)))

(assert (=> b!270022 (= res!225053 (= (size!6555 (buf!7023 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270023 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15048 array!15048 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270023 (= e!189916 (arrayBitRangesEq!0 (buf!7023 w1!591) (buf!7023 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6555 (buf!7023 w1!591)) (currentByte!12982 w1!591) (currentBit!12977 w1!591))))))

(assert (= (and d!91602 res!225054) b!270021))

(assert (= (and b!270021 res!225055) b!270022))

(assert (= (and b!270022 (not res!225053)) b!270023))

(declare-fun m!401825 () Bool)

(assert (=> b!270021 m!401825))

(declare-fun m!401827 () Bool)

(assert (=> b!270021 m!401827))

(assert (=> b!270023 m!401825))

(assert (=> b!270023 m!401825))

(declare-fun m!401829 () Bool)

(assert (=> b!270023 m!401829))

(assert (=> start!58836 d!91602))

(declare-fun d!91612 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91612 (= (inv!12 w1!591) (invariant!0 (currentBit!12977 w1!591) (currentByte!12982 w1!591) (size!6555 (buf!7023 w1!591))))))

(declare-fun bs!23162 () Bool)

(assert (= bs!23162 d!91612))

(declare-fun m!401831 () Bool)

(assert (=> bs!23162 m!401831))

(assert (=> start!58836 d!91612))

(declare-fun d!91614 () Bool)

(assert (=> d!91614 (= (inv!12 w2!587) (invariant!0 (currentBit!12977 w2!587) (currentByte!12982 w2!587) (size!6555 (buf!7023 w2!587))))))

(declare-fun bs!23163 () Bool)

(assert (= bs!23163 d!91614))

(declare-fun m!401833 () Bool)

(assert (=> bs!23163 m!401833))

(assert (=> start!58836 d!91614))

(declare-fun d!91616 () Bool)

(assert (=> d!91616 (= (inv!12 w3!25) (invariant!0 (currentBit!12977 w3!25) (currentByte!12982 w3!25) (size!6555 (buf!7023 w3!25))))))

(declare-fun bs!23164 () Bool)

(assert (= bs!23164 d!91616))

(declare-fun m!401835 () Bool)

(assert (=> bs!23164 m!401835))

(assert (=> start!58836 d!91616))

(declare-fun d!91618 () Bool)

(assert (=> d!91618 (= (array_inv!6279 (buf!7023 w1!591)) (bvsge (size!6555 (buf!7023 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270006 d!91618))

(declare-fun d!91620 () Bool)

(declare-fun res!225066 () Bool)

(declare-fun e!189925 () Bool)

(assert (=> d!91620 (=> res!225066 e!189925)))

(assert (=> d!91620 (= res!225066 (= #b00000000000000000000000000000000 (currentByte!12982 w1!591)))))

(assert (=> d!91620 (= (arrayRangesEq!1087 (buf!7023 w1!591) (buf!7023 w3!25) #b00000000000000000000000000000000 (currentByte!12982 w1!591)) e!189925)))

(declare-fun b!270034 () Bool)

(declare-fun e!189926 () Bool)

(assert (=> b!270034 (= e!189925 e!189926)))

(declare-fun res!225067 () Bool)

(assert (=> b!270034 (=> (not res!225067) (not e!189926))))

(assert (=> b!270034 (= res!225067 (= (select (arr!7542 (buf!7023 w1!591)) #b00000000000000000000000000000000) (select (arr!7542 (buf!7023 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270035 () Bool)

(assert (=> b!270035 (= e!189926 (arrayRangesEq!1087 (buf!7023 w1!591) (buf!7023 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12982 w1!591)))))

(assert (= (and d!91620 (not res!225066)) b!270034))

(assert (= (and b!270034 res!225067) b!270035))

(declare-fun m!401837 () Bool)

(assert (=> b!270034 m!401837))

(declare-fun m!401839 () Bool)

(assert (=> b!270034 m!401839))

(declare-fun m!401841 () Bool)

(assert (=> b!270035 m!401841))

(assert (=> b!270005 d!91620))

(declare-fun d!91622 () Bool)

(assert (=> d!91622 (arrayRangesEq!1087 (buf!7023 w1!591) (buf!7023 w3!25) #b00000000000000000000000000000000 (currentByte!12982 w1!591))))

(declare-fun lt!409265 () Unit!19065)

(declare-fun choose!387 (array!15048 array!15048 array!15048 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19065)

(assert (=> d!91622 (= lt!409265 (choose!387 (buf!7023 w1!591) (buf!7023 w2!587) (buf!7023 w3!25) #b00000000000000000000000000000000 (currentByte!12982 w1!591) (currentByte!12982 w2!587)))))

(assert (=> d!91622 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12982 w1!591)) (bvsle (currentByte!12982 w1!591) (currentByte!12982 w2!587)))))

(assert (=> d!91622 (= (arrayRangesEqTransitive!350 (buf!7023 w1!591) (buf!7023 w2!587) (buf!7023 w3!25) #b00000000000000000000000000000000 (currentByte!12982 w1!591) (currentByte!12982 w2!587)) lt!409265)))

(declare-fun bs!23168 () Bool)

(assert (= bs!23168 d!91622))

(assert (=> bs!23168 m!401809))

(declare-fun m!401859 () Bool)

(assert (=> bs!23168 m!401859))

(assert (=> b!270005 d!91622))

(declare-fun d!91634 () Bool)

(declare-fun res!225075 () Bool)

(declare-fun e!189931 () Bool)

(assert (=> d!91634 (=> (not res!225075) (not e!189931))))

(assert (=> d!91634 (= res!225075 (= (size!6555 (buf!7023 w2!587)) (size!6555 (buf!7023 w3!25))))))

(assert (=> d!91634 (= (isPrefixOf!0 w2!587 w3!25) e!189931)))

(declare-fun b!270042 () Bool)

(declare-fun res!225076 () Bool)

(assert (=> b!270042 (=> (not res!225076) (not e!189931))))

(assert (=> b!270042 (= res!225076 (bvsle (bitIndex!0 (size!6555 (buf!7023 w2!587)) (currentByte!12982 w2!587) (currentBit!12977 w2!587)) (bitIndex!0 (size!6555 (buf!7023 w3!25)) (currentByte!12982 w3!25) (currentBit!12977 w3!25))))))

(declare-fun b!270043 () Bool)

(declare-fun e!189932 () Bool)

(assert (=> b!270043 (= e!189931 e!189932)))

(declare-fun res!225074 () Bool)

(assert (=> b!270043 (=> res!225074 e!189932)))

(assert (=> b!270043 (= res!225074 (= (size!6555 (buf!7023 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270044 () Bool)

(assert (=> b!270044 (= e!189932 (arrayBitRangesEq!0 (buf!7023 w2!587) (buf!7023 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6555 (buf!7023 w2!587)) (currentByte!12982 w2!587) (currentBit!12977 w2!587))))))

(assert (= (and d!91634 res!225075) b!270042))

(assert (= (and b!270042 res!225076) b!270043))

(assert (= (and b!270043 (not res!225074)) b!270044))

(assert (=> b!270042 m!401827))

(declare-fun m!401861 () Bool)

(assert (=> b!270042 m!401861))

(assert (=> b!270044 m!401827))

(assert (=> b!270044 m!401827))

(declare-fun m!401863 () Bool)

(assert (=> b!270044 m!401863))

(assert (=> b!270004 d!91634))

(push 1)

(assert (not d!91614))

(assert (not b!270035))

