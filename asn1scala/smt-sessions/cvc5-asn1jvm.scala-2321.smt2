; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59084 () Bool)

(assert start!59084)

(declare-fun b!270765 () Bool)

(declare-fun e!190629 () Bool)

(declare-datatypes ((array!15089 0))(
  ( (array!15090 (arr!7555 (Array (_ BitVec 32) (_ BitVec 8))) (size!6568 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11950 0))(
  ( (BitStream!11951 (buf!7036 array!15089) (currentByte!13010 (_ BitVec 32)) (currentBit!13005 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11950)

(declare-fun array_inv!6292 (array!15089) Bool)

(assert (=> b!270765 (= e!190629 (array_inv!6292 (buf!7036 w1!591)))))

(declare-fun b!270766 () Bool)

(declare-fun e!190630 () Bool)

(declare-fun e!190627 () Bool)

(assert (=> b!270766 (= e!190630 (not e!190627))))

(declare-fun res!225637 () Bool)

(assert (=> b!270766 (=> res!225637 e!190627)))

(declare-fun w2!587 () BitStream!11950)

(assert (=> b!270766 (= res!225637 (or (bvsge (currentByte!13010 w1!591) (size!6568 (buf!7036 w1!591))) (bvsge (currentByte!13010 w1!591) (currentByte!13010 w2!587))))))

(declare-fun w3!25 () BitStream!11950)

(declare-fun arrayRangesEq!1100 (array!15089 array!15089 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270766 (arrayRangesEq!1100 (buf!7036 w1!591) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591))))

(declare-datatypes ((Unit!19091 0))(
  ( (Unit!19092) )
))
(declare-fun lt!409616 () Unit!19091)

(declare-fun arrayRangesEqTransitive!363 (array!15089 array!15089 array!15089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19091)

(assert (=> b!270766 (= lt!409616 (arrayRangesEqTransitive!363 (buf!7036 w1!591) (buf!7036 w2!587) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591) (currentByte!13010 w2!587)))))

(declare-fun b!270767 () Bool)

(declare-fun res!225636 () Bool)

(assert (=> b!270767 (=> (not res!225636) (not e!190630))))

(declare-fun isPrefixOf!0 (BitStream!11950 BitStream!11950) Bool)

(assert (=> b!270767 (= res!225636 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!225635 () Bool)

(assert (=> start!59084 (=> (not res!225635) (not e!190630))))

(assert (=> start!59084 (= res!225635 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59084 e!190630))

(declare-fun inv!12 (BitStream!11950) Bool)

(assert (=> start!59084 (and (inv!12 w1!591) e!190629)))

(declare-fun e!190624 () Bool)

(assert (=> start!59084 (and (inv!12 w2!587) e!190624)))

(declare-fun e!190626 () Bool)

(assert (=> start!59084 (and (inv!12 w3!25) e!190626)))

(declare-fun b!270768 () Bool)

(assert (=> b!270768 (= e!190626 (array_inv!6292 (buf!7036 w3!25)))))

(declare-fun b!270769 () Bool)

(assert (=> b!270769 (= e!190627 (and (bvsge (currentByte!13010 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13010 w1!591) (size!6568 (buf!7036 w3!25)))))))

(assert (=> b!270769 (= (select (arr!7555 (buf!7036 w2!587)) (currentByte!13010 w1!591)) (select (arr!7555 (buf!7036 w3!25)) (currentByte!13010 w1!591)))))

(declare-fun lt!409615 () Unit!19091)

(declare-fun arrayRangesEqImpliesEq!160 (array!15089 array!15089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19091)

(assert (=> b!270769 (= lt!409615 (arrayRangesEqImpliesEq!160 (buf!7036 w2!587) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591) (currentByte!13010 w2!587)))))

(declare-fun b!270770 () Bool)

(assert (=> b!270770 (= e!190624 (array_inv!6292 (buf!7036 w2!587)))))

(assert (= (and start!59084 res!225635) b!270767))

(assert (= (and b!270767 res!225636) b!270766))

(assert (= (and b!270766 (not res!225637)) b!270769))

(assert (= start!59084 b!270765))

(assert (= start!59084 b!270770))

(assert (= start!59084 b!270768))

(declare-fun m!402843 () Bool)

(assert (=> b!270767 m!402843))

(declare-fun m!402845 () Bool)

(assert (=> b!270770 m!402845))

(declare-fun m!402847 () Bool)

(assert (=> b!270768 m!402847))

(declare-fun m!402849 () Bool)

(assert (=> start!59084 m!402849))

(declare-fun m!402851 () Bool)

(assert (=> start!59084 m!402851))

(declare-fun m!402853 () Bool)

(assert (=> start!59084 m!402853))

(declare-fun m!402855 () Bool)

(assert (=> start!59084 m!402855))

(declare-fun m!402857 () Bool)

(assert (=> b!270769 m!402857))

(declare-fun m!402859 () Bool)

(assert (=> b!270769 m!402859))

(declare-fun m!402861 () Bool)

(assert (=> b!270769 m!402861))

(declare-fun m!402863 () Bool)

(assert (=> b!270766 m!402863))

(declare-fun m!402865 () Bool)

(assert (=> b!270766 m!402865))

(declare-fun m!402867 () Bool)

(assert (=> b!270765 m!402867))

(push 1)

(assert (not b!270769))

(assert (not b!270766))

(assert (not b!270767))

(assert (not start!59084))

(assert (not b!270765))

(assert (not b!270768))

(assert (not b!270770))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92126 () Bool)

(declare-fun res!225669 () Bool)

(declare-fun e!190689 () Bool)

(assert (=> d!92126 (=> (not res!225669) (not e!190689))))

(assert (=> d!92126 (= res!225669 (= (size!6568 (buf!7036 w2!587)) (size!6568 (buf!7036 w3!25))))))

(assert (=> d!92126 (= (isPrefixOf!0 w2!587 w3!25) e!190689)))

(declare-fun b!270819 () Bool)

(declare-fun res!225670 () Bool)

(assert (=> b!270819 (=> (not res!225670) (not e!190689))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270819 (= res!225670 (bvsle (bitIndex!0 (size!6568 (buf!7036 w2!587)) (currentByte!13010 w2!587) (currentBit!13005 w2!587)) (bitIndex!0 (size!6568 (buf!7036 w3!25)) (currentByte!13010 w3!25) (currentBit!13005 w3!25))))))

(declare-fun b!270820 () Bool)

(declare-fun e!190690 () Bool)

(assert (=> b!270820 (= e!190689 e!190690)))

(declare-fun res!225668 () Bool)

(assert (=> b!270820 (=> res!225668 e!190690)))

(assert (=> b!270820 (= res!225668 (= (size!6568 (buf!7036 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270821 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15089 array!15089 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270821 (= e!190690 (arrayBitRangesEq!0 (buf!7036 w2!587) (buf!7036 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6568 (buf!7036 w2!587)) (currentByte!13010 w2!587) (currentBit!13005 w2!587))))))

(assert (= (and d!92126 res!225669) b!270819))

(assert (= (and b!270819 res!225670) b!270820))

(assert (= (and b!270820 (not res!225668)) b!270821))

(declare-fun m!402931 () Bool)

(assert (=> b!270819 m!402931))

(declare-fun m!402933 () Bool)

(assert (=> b!270819 m!402933))

(assert (=> b!270821 m!402931))

(assert (=> b!270821 m!402931))

(declare-fun m!402935 () Bool)

(assert (=> b!270821 m!402935))

(assert (=> b!270767 d!92126))

(declare-fun d!92136 () Bool)

(assert (=> d!92136 (= (array_inv!6292 (buf!7036 w3!25)) (bvsge (size!6568 (buf!7036 w3!25)) #b00000000000000000000000000000000))))

(assert (=> b!270768 d!92136))

(declare-fun d!92138 () Bool)

(assert (=> d!92138 (and (bvsge (currentByte!13010 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13010 w1!591) (size!6568 (buf!7036 w2!587))) (bvslt (currentByte!13010 w1!591) (size!6568 (buf!7036 w3!25))) (= (select (arr!7555 (buf!7036 w2!587)) (currentByte!13010 w1!591)) (select (arr!7555 (buf!7036 w3!25)) (currentByte!13010 w1!591))))))

(declare-fun lt!409637 () Unit!19091)

(declare-fun choose!405 (array!15089 array!15089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19091)

(assert (=> d!92138 (= lt!409637 (choose!405 (buf!7036 w2!587) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591) (currentByte!13010 w2!587)))))

(assert (=> d!92138 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13010 w2!587)))))

(assert (=> d!92138 (= (arrayRangesEqImpliesEq!160 (buf!7036 w2!587) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591) (currentByte!13010 w2!587)) lt!409637)))

(declare-fun bs!23262 () Bool)

(assert (= bs!23262 d!92138))

(assert (=> bs!23262 m!402857))

(assert (=> bs!23262 m!402859))

(declare-fun m!402951 () Bool)

(assert (=> bs!23262 m!402951))

(assert (=> b!270769 d!92138))

(declare-fun d!92150 () Bool)

(assert (=> d!92150 (= (array_inv!6292 (buf!7036 w2!587)) (bvsge (size!6568 (buf!7036 w2!587)) #b00000000000000000000000000000000))))

(assert (=> b!270770 d!92150))

(declare-fun d!92152 () Bool)

(assert (=> d!92152 (= (array_inv!6292 (buf!7036 w1!591)) (bvsge (size!6568 (buf!7036 w1!591)) #b00000000000000000000000000000000))))

(assert (=> b!270765 d!92152))

(declare-fun d!92154 () Bool)

(declare-fun res!225696 () Bool)

(declare-fun e!190709 () Bool)

(assert (=> d!92154 (=> res!225696 e!190709)))

(assert (=> d!92154 (= res!225696 (= #b00000000000000000000000000000000 (currentByte!13010 w1!591)))))

(assert (=> d!92154 (= (arrayRangesEq!1100 (buf!7036 w1!591) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591)) e!190709)))

(declare-fun b!270847 () Bool)

(declare-fun e!190710 () Bool)

(assert (=> b!270847 (= e!190709 e!190710)))

(declare-fun res!225697 () Bool)

(assert (=> b!270847 (=> (not res!225697) (not e!190710))))

(assert (=> b!270847 (= res!225697 (= (select (arr!7555 (buf!7036 w1!591)) #b00000000000000000000000000000000) (select (arr!7555 (buf!7036 w3!25)) #b00000000000000000000000000000000)))))

(declare-fun b!270848 () Bool)

(assert (=> b!270848 (= e!190710 (arrayRangesEq!1100 (buf!7036 w1!591) (buf!7036 w3!25) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (currentByte!13010 w1!591)))))

(assert (= (and d!92154 (not res!225696)) b!270847))

(assert (= (and b!270847 res!225697) b!270848))

(declare-fun m!402961 () Bool)

(assert (=> b!270847 m!402961))

(declare-fun m!402963 () Bool)

(assert (=> b!270847 m!402963))

(declare-fun m!402965 () Bool)

(assert (=> b!270848 m!402965))

(assert (=> b!270766 d!92154))

(declare-fun d!92160 () Bool)

(assert (=> d!92160 (arrayRangesEq!1100 (buf!7036 w1!591) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591))))

(declare-fun lt!409642 () Unit!19091)

(declare-fun choose!406 (array!15089 array!15089 array!15089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19091)

(assert (=> d!92160 (= lt!409642 (choose!406 (buf!7036 w1!591) (buf!7036 w2!587) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591) (currentByte!13010 w2!587)))))

(assert (=> d!92160 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13010 w1!591)) (bvsle (currentByte!13010 w1!591) (currentByte!13010 w2!587)))))

(assert (=> d!92160 (= (arrayRangesEqTransitive!363 (buf!7036 w1!591) (buf!7036 w2!587) (buf!7036 w3!25) #b00000000000000000000000000000000 (currentByte!13010 w1!591) (currentByte!13010 w2!587)) lt!409642)))

(declare-fun bs!23263 () Bool)

(assert (= bs!23263 d!92160))

(assert (=> bs!23263 m!402863))

(declare-fun m!402967 () Bool)

(assert (=> bs!23263 m!402967))

(assert (=> b!270766 d!92160))

(declare-fun d!92162 () Bool)

(declare-fun res!225699 () Bool)

(declare-fun e!190711 () Bool)

(assert (=> d!92162 (=> (not res!225699) (not e!190711))))

(assert (=> d!92162 (= res!225699 (= (size!6568 (buf!7036 w1!591)) (size!6568 (buf!7036 w2!587))))))

(assert (=> d!92162 (= (isPrefixOf!0 w1!591 w2!587) e!190711)))

(declare-fun b!270849 () Bool)

(declare-fun res!225700 () Bool)

(assert (=> b!270849 (=> (not res!225700) (not e!190711))))

(assert (=> b!270849 (= res!225700 (bvsle (bitIndex!0 (size!6568 (buf!7036 w1!591)) (currentByte!13010 w1!591) (currentBit!13005 w1!591)) (bitIndex!0 (size!6568 (buf!7036 w2!587)) (currentByte!13010 w2!587) (currentBit!13005 w2!587))))))

(declare-fun b!270850 () Bool)

(declare-fun e!190712 () Bool)

(assert (=> b!270850 (= e!190711 e!190712)))

(declare-fun res!225698 () Bool)

(assert (=> b!270850 (=> res!225698 e!190712)))

(assert (=> b!270850 (= res!225698 (= (size!6568 (buf!7036 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270851 () Bool)

(assert (=> b!270851 (= e!190712 (arrayBitRangesEq!0 (buf!7036 w1!591) (buf!7036 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6568 (buf!7036 w1!591)) (currentByte!13010 w1!591) (currentBit!13005 w1!591))))))

(assert (= (and d!92162 res!225699) b!270849))

(assert (= (and b!270849 res!225700) b!270850))

(assert (= (and b!270850 (not res!225698)) b!270851))

(declare-fun m!402969 () Bool)

(assert (=> b!270849 m!402969))

(assert (=> b!270849 m!402931))

(assert (=> b!270851 m!402969))

(assert (=> b!270851 m!402969))

(declare-fun m!402973 () Bool)

