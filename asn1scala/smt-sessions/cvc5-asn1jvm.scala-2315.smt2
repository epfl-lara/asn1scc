; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58800 () Bool)

(assert start!58800)

(declare-fun b!269878 () Bool)

(declare-fun e!189757 () Bool)

(declare-datatypes ((array!15035 0))(
  ( (array!15036 (arr!7537 (Array (_ BitVec 32) (_ BitVec 8))) (size!6550 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11914 0))(
  ( (BitStream!11915 (buf!7018 array!15035) (currentByte!12977 (_ BitVec 32)) (currentBit!12972 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11914)

(declare-fun array_inv!6274 (array!15035) Bool)

(assert (=> b!269878 (= e!189757 (array_inv!6274 (buf!7018 w1!591)))))

(declare-fun b!269879 () Bool)

(declare-fun e!189759 () Bool)

(declare-fun w2!587 () BitStream!11914)

(assert (=> b!269879 (= e!189759 (array_inv!6274 (buf!7018 w2!587)))))

(declare-fun b!269880 () Bool)

(declare-fun e!189754 () Bool)

(declare-fun w3!25 () BitStream!11914)

(assert (=> b!269880 (= e!189754 (array_inv!6274 (buf!7018 w3!25)))))

(declare-fun res!224959 () Bool)

(declare-fun e!189753 () Bool)

(assert (=> start!58800 (=> (not res!224959) (not e!189753))))

(declare-fun isPrefixOf!0 (BitStream!11914 BitStream!11914) Bool)

(assert (=> start!58800 (= res!224959 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58800 e!189753))

(declare-fun inv!12 (BitStream!11914) Bool)

(assert (=> start!58800 (and (inv!12 w1!591) e!189757)))

(assert (=> start!58800 (and (inv!12 w2!587) e!189759)))

(assert (=> start!58800 (and (inv!12 w3!25) e!189754)))

(declare-fun b!269881 () Bool)

(declare-fun res!224958 () Bool)

(assert (=> b!269881 (=> (not res!224958) (not e!189753))))

(assert (=> b!269881 (= res!224958 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!269882 () Bool)

(assert (=> b!269882 (= e!189753 (not (or (bvsge (currentByte!12977 w1!591) (size!6550 (buf!7018 w1!591))) (bvsge (currentByte!12977 w1!591) (currentByte!12977 w2!587)) (bvsle #b00000000000000000000000000000000 (currentByte!12977 w2!587)))))))

(declare-fun arrayRangesEq!1082 (array!15035 array!15035 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!269882 (arrayRangesEq!1082 (buf!7018 w1!591) (buf!7018 w3!25) #b00000000000000000000000000000000 (currentByte!12977 w1!591))))

(declare-datatypes ((Unit!19055 0))(
  ( (Unit!19056) )
))
(declare-fun lt!409238 () Unit!19055)

(declare-fun arrayRangesEqTransitive!345 (array!15035 array!15035 array!15035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19055)

(assert (=> b!269882 (= lt!409238 (arrayRangesEqTransitive!345 (buf!7018 w1!591) (buf!7018 w2!587) (buf!7018 w3!25) #b00000000000000000000000000000000 (currentByte!12977 w1!591) (currentByte!12977 w2!587)))))

(assert (= (and start!58800 res!224959) b!269881))

(assert (= (and b!269881 res!224958) b!269882))

(assert (= start!58800 b!269878))

(assert (= start!58800 b!269879))

(assert (= start!58800 b!269880))

(declare-fun m!401643 () Bool)

(assert (=> b!269878 m!401643))

(declare-fun m!401645 () Bool)

(assert (=> b!269879 m!401645))

(declare-fun m!401647 () Bool)

(assert (=> start!58800 m!401647))

(declare-fun m!401649 () Bool)

(assert (=> start!58800 m!401649))

(declare-fun m!401651 () Bool)

(assert (=> start!58800 m!401651))

(declare-fun m!401653 () Bool)

(assert (=> start!58800 m!401653))

(declare-fun m!401655 () Bool)

(assert (=> b!269882 m!401655))

(declare-fun m!401657 () Bool)

(assert (=> b!269882 m!401657))

(declare-fun m!401659 () Bool)

(assert (=> b!269881 m!401659))

(declare-fun m!401661 () Bool)

(assert (=> b!269880 m!401661))

(push 1)

(assert (not b!269880))

(assert (not b!269882))

(assert (not start!58800))

(assert (not b!269879))

(assert (not b!269881))

(assert (not b!269878))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!91548 () Bool)

(declare-fun res!224989 () Bool)

(declare-fun e!189813 () Bool)

(assert (=> d!91548 (=> (not res!224989) (not e!189813))))

(assert (=> d!91548 (= res!224989 (= (size!6550 (buf!7018 w2!587)) (size!6550 (buf!7018 w3!25))))))

(assert (=> d!91548 (= (isPrefixOf!0 w2!587 w3!25) e!189813)))

(declare-fun b!269928 () Bool)

(declare-fun res!224987 () Bool)

(assert (=> b!269928 (=> (not res!224987) (not e!189813))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!269928 (= res!224987 (bvsle (bitIndex!0 (size!6550 (buf!7018 w2!587)) (currentByte!12977 w2!587) (currentBit!12972 w2!587)) (bitIndex!0 (size!6550 (buf!7018 w3!25)) (currentByte!12977 w3!25) (currentBit!12972 w3!25))))))

(declare-fun b!269929 () Bool)

(declare-fun e!189812 () Bool)

(assert (=> b!269929 (= e!189813 e!189812)))

(declare-fun res!224988 () Bool)

(assert (=> b!269929 (=> res!224988 e!189812)))

(assert (=> b!269929 (= res!224988 (= (size!6550 (buf!7018 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!269930 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15035 array!15035 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!269930 (= e!189812 (arrayBitRangesEq!0 (buf!7018 w2!587) (buf!7018 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6550 (buf!7018 w2!587)) (currentByte!12977 w2!587) (currentBit!12972 w2!587))))))

(assert (= (and d!91548 res!224989) b!269928))

(assert (= (and b!269928 res!224987) b!269929))

(assert (= (and b!269929 (not res!224988)) b!269930))

(declare-fun m!401705 () Bool)

(assert (=> b!269928 m!401705))

(declare-fun m!401707 () Bool)

(assert (=> b!269928 m!401707))

(assert (=> b!269930 m!401705))

(assert (=> b!269930 m!401705))

(declare-fun m!401711 () Bool)

(assert (=> b!269930 m!401711))

(assert (=> b!269881 d!91548))

(declare-fun d!91551 () Bool)

(assert (=> d!91551 (= (array_inv!6274 (buf!7018 w3!25)) (bvsge (size!6550 (buf!7018 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!269880 d!91551))

(declare-fun d!91554 () Bool)

(declare-fun res!224992 () Bool)

(declare-fun e!189815 () Bool)

(assert (=> d!91554 (=> (not res!224992) (not e!189815))))

(assert (=> d!91554 (= res!224992 (= (size!6550 (buf!7018 w1!591)) (size!6550 (buf!7018 w2!587))))))

(assert (=> d!91554 (= (isPrefixOf!0 w1!591 w2!587) e!189815)))

(declare-fun b!269931 () Bool)

(declare-fun res!224990 () Bool)

(assert (=> b!269931 (=> (not res!224990) (not e!189815))))

(assert (=> b!269931 (= res!224990 (bvsle (bitIndex!0 (size!6550 (buf!7018 w1!591)) (currentByte!12977 w1!591) (currentBit!12972 w1!591)) (bitIndex!0 (size!6550 (buf!7018 w2!587)) (currentByte!12977 w2!587) (currentBit!12972 w2!587))))))

(declare-fun b!269932 () Bool)

(declare-fun e!189814 () Bool)

(assert (=> b!269932 (= e!189815 e!189814)))

(declare-fun res!224991 () Bool)

(assert (=> b!269932 (=> res!224991 e!189814)))

(assert (=> b!269932 (= res!224991 (= (size!6550 (buf!7018 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!269933 () Bool)

(assert (=> b!269933 (= e!189814 (arrayBitRangesEq!0 (buf!7018 w1!591) (buf!7018 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6550 (buf!7018 w1!591)) (currentByte!12977 w1!591) (currentBit!12972 w1!591))))))

(assert (= (and d!91554 res!224992) b!269931))

(assert (= (and b!269931 res!224990) b!269932))

(assert (= (and b!269932 (not res!224991)) b!269933))

(declare-fun m!401717 () Bool)

(assert (=> b!269931 m!401717))

(assert (=> b!269931 m!401705))

(assert (=> b!269933 m!401717))

(assert (=> b!269933 m!401717))

(declare-fun m!401721 () Bool)

(assert (=> b!269933 m!401721))

(assert (=> start!58800 d!91554))

(declare-fun d!91560 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!91560 (= (inv!12 w1!591) (invariant!0 (currentBit!12972 w1!591) (currentByte!12977 w1!591) (size!6550 (buf!7018 w1!591))))))

(declare-fun bs!23153 () Bool)

(assert (= bs!23153 d!91560))

(declare-fun m!401729 () Bool)

(assert (=> bs!23153 m!401729))

(assert (=> start!58800 d!91560))

(declare-fun d!91566 () Bool)

(assert (=> d!91566 (= (inv!12 w2!587) (invariant!0 (currentBit!12972 w2!587) (currentByte!12977 w2!587) (size!6550 (buf!7018 w2!587))))))

(declare-fun bs!23154 () Bool)

(assert (= bs!23154 d!91566))

(declare-fun m!401731 () Bool)

(assert (=> bs!23154 m!401731))

(assert (=> start!58800 d!91566))

(declare-fun d!91568 () Bool)

(assert (=> d!91568 (= (inv!12 w3!25) (invariant!0 (currentBit!12972 w3!25) (currentByte!12977 w3!25) (size!6550 (buf!7018 w3!25))))))

(declare-fun bs!23155 () Bool)

(assert (= bs!23155 d!91568))

(declare-fun m!401733 () Bool)

(assert (=> bs!23155 m!401733))

(assert (=> start!58800 d!91568))

(declare-fun d!91570 () Bool)

(assert (=> d!91570 (= (array_inv!6274 (buf!7018 w2!587)) (bvsge (size!6550 (buf!7018 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!269879 d!91570))

(declare-fun d!91574 () Bool)

(assert (=> d!91574 (= (array_inv!6274 (buf!7018 w1!591)) (bvsge (size!6550 (buf!7018 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!269878 d!91574))

(declare-fun d!91576 () Bool)

(declare-fun res!225006 () Bool)

(declare-fun e!189828 () Bool)

(assert (=> d!91576 (=> res!225006 e!189828)))

(assert (=> d!91576 (= res!225006 (= #b00000000000000000000000000000000 (currentByte!12977 w1!591)))))

(assert (=> d!91576 (= (arrayRangesEq!1082 (buf!7018 w1!591) (buf!7018 w3!25) #b00000000000000000000000000000000 (currentByte!12977 w1!591)) e!189828)))

(declare-fun b!269947 () Bool)

(declare-fun e!189829 () Bool)

(assert (=> b!269947 (= e!189828 e!189829)))

(declare-fun res!225007 () Bool)

(assert (=> b!269947 (=> (not res!225007) (not e!189829))))

(assert (=> b!269947 (= res!225007 (= (select (arr!7537 (buf!7018 w1!591)) #b00000000000000000000000000000000) (select (arr!7537 (buf!7018 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!269948 () Bool)

(assert (=> b!269948 (= e!189829 (arrayRangesEq!1082 (buf!7018 w1!591) (buf!7018 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!12977 w1!591)))))

(assert (= (and d!91576 (not res!225006)) b!269947))

(assert (= (and b!269947 res!225007) b!269948))

(declare-fun m!401741 () Bool)

(assert (=> b!269947 m!401741))

(declare-fun m!401743 () Bool)

(assert (=> b!269947 m!401743))

(declare-fun m!401745 () Bool)

(assert (=> b!269948 m!401745))

(assert (=> b!269882 d!91576))

(declare-fun d!91582 () Bool)

(assert (=> d!91582 (arrayRangesEq!1082 (buf!7018 w1!591) (buf!7018 w3!25) #b00000000000000000000000000000000 (currentByte!12977 w1!591))))

(declare-fun lt!409250 () Unit!19055)

(declare-fun choose!385 (array!15035 array!15035 array!15035 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19055)

(assert (=> d!91582 (= lt!409250 (choose!385 (buf!7018 w1!591) (buf!7018 w2!587) (buf!7018 w3!25) #b00000000000000000000000000000000 (currentByte!12977 w1!591) (currentByte!12977 w2!587)))))

(assert (=> d!91582 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!12977 w1!591)) (bvsle (currentByte!12977 w1!591) (currentByte!12977 w2!587)))))

