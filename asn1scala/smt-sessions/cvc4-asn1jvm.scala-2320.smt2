; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59046 () Bool)

(assert start!59046)

(declare-fun b!270693 () Bool)

(declare-fun e!190562 () Bool)

(declare-datatypes ((array!15084 0))(
  ( (array!15085 (arr!7554 (Array (_ BitVec 32) (_ BitVec 8))) (size!6567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11948 0))(
  ( (BitStream!11949 (buf!7035 array!15084) (currentByte!13009 (_ BitVec 32)) (currentBit!13004 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11948)

(declare-fun array_inv!6291 (array!15084) Bool)

(assert (=> b!270693 (= e!190562 (array_inv!6291 (buf!7035 w2!587)))))

(declare-fun b!270694 () Bool)

(declare-fun res!225572 () Bool)

(declare-fun e!190557 () Bool)

(assert (=> b!270694 (=> (not res!225572) (not e!190557))))

(declare-fun w3!25 () BitStream!11948)

(declare-fun isPrefixOf!0 (BitStream!11948 BitStream!11948) Bool)

(assert (=> b!270694 (= res!225572 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!270695 () Bool)

(declare-fun e!190564 () Bool)

(declare-fun w1!591 () BitStream!11948)

(assert (=> b!270695 (= e!190564 (and (bvsge (currentByte!13009 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13009 w1!591) (size!6567 (buf!7035 w2!587)))))))

(assert (=> b!270695 (= (select (arr!7554 (buf!7035 w2!587)) (currentByte!13009 w1!591)) (select (arr!7554 (buf!7035 w3!25)) (currentByte!13009 w1!591)))))

(declare-datatypes ((Unit!19089 0))(
  ( (Unit!19090) )
))
(declare-fun lt!409592 () Unit!19089)

(declare-fun arrayRangesEqImpliesEq!159 (array!15084 array!15084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19089)

(assert (=> b!270695 (= lt!409592 (arrayRangesEqImpliesEq!159 (buf!7035 w2!587) (buf!7035 w3!25) #b00000000000000000000000000000000 (currentByte!13009 w1!591) (currentByte!13009 w2!587)))))

(declare-fun res!225574 () Bool)

(assert (=> start!59046 (=> (not res!225574) (not e!190557))))

(assert (=> start!59046 (= res!225574 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!59046 e!190557))

(declare-fun e!190563 () Bool)

(declare-fun inv!12 (BitStream!11948) Bool)

(assert (=> start!59046 (and (inv!12 w1!591) e!190563)))

(assert (=> start!59046 (and (inv!12 w2!587) e!190562)))

(declare-fun e!190560 () Bool)

(assert (=> start!59046 (and (inv!12 w3!25) e!190560)))

(declare-fun b!270696 () Bool)

(assert (=> b!270696 (= e!190557 (not e!190564))))

(declare-fun res!225573 () Bool)

(assert (=> b!270696 (=> res!225573 e!190564)))

(assert (=> b!270696 (= res!225573 (or (bvsge (currentByte!13009 w1!591) (size!6567 (buf!7035 w1!591))) (bvsge (currentByte!13009 w1!591) (currentByte!13009 w2!587))))))

(declare-fun arrayRangesEq!1099 (array!15084 array!15084 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!270696 (arrayRangesEq!1099 (buf!7035 w1!591) (buf!7035 w3!25) #b00000000000000000000000000000000 (currentByte!13009 w1!591))))

(declare-fun lt!409591 () Unit!19089)

(declare-fun arrayRangesEqTransitive!362 (array!15084 array!15084 array!15084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19089)

(assert (=> b!270696 (= lt!409591 (arrayRangesEqTransitive!362 (buf!7035 w1!591) (buf!7035 w2!587) (buf!7035 w3!25) #b00000000000000000000000000000000 (currentByte!13009 w1!591) (currentByte!13009 w2!587)))))

(declare-fun b!270697 () Bool)

(assert (=> b!270697 (= e!190563 (array_inv!6291 (buf!7035 w1!591)))))

(declare-fun b!270698 () Bool)

(assert (=> b!270698 (= e!190560 (array_inv!6291 (buf!7035 w3!25)))))

(assert (= (and start!59046 res!225574) b!270694))

(assert (= (and b!270694 res!225572) b!270696))

(assert (= (and b!270696 (not res!225573)) b!270695))

(assert (= start!59046 b!270697))

(assert (= start!59046 b!270693))

(assert (= start!59046 b!270698))

(declare-fun m!402739 () Bool)

(assert (=> b!270696 m!402739))

(declare-fun m!402741 () Bool)

(assert (=> b!270696 m!402741))

(declare-fun m!402743 () Bool)

(assert (=> b!270697 m!402743))

(declare-fun m!402745 () Bool)

(assert (=> b!270694 m!402745))

(declare-fun m!402747 () Bool)

(assert (=> b!270693 m!402747))

(declare-fun m!402749 () Bool)

(assert (=> start!59046 m!402749))

(declare-fun m!402751 () Bool)

(assert (=> start!59046 m!402751))

(declare-fun m!402753 () Bool)

(assert (=> start!59046 m!402753))

(declare-fun m!402755 () Bool)

(assert (=> start!59046 m!402755))

(declare-fun m!402757 () Bool)

(assert (=> b!270695 m!402757))

(declare-fun m!402759 () Bool)

(assert (=> b!270695 m!402759))

(declare-fun m!402761 () Bool)

(assert (=> b!270695 m!402761))

(declare-fun m!402763 () Bool)

(assert (=> b!270698 m!402763))

(push 1)

(assert (not b!270693))

(assert (not start!59046))

(assert (not b!270695))

(assert (not b!270698))

(assert (not b!270696))

(assert (not b!270694))

(assert (not b!270697))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!92064 () Bool)

(declare-fun res!225587 () Bool)

(declare-fun e!190574 () Bool)

(assert (=> d!92064 (=> (not res!225587) (not e!190574))))

(assert (=> d!92064 (= res!225587 (= (size!6567 (buf!7035 w1!591)) (size!6567 (buf!7035 w2!587))))))

(assert (=> d!92064 (= (isPrefixOf!0 w1!591 w2!587) e!190574)))

(declare-fun b!270711 () Bool)

(declare-fun res!225589 () Bool)

(assert (=> b!270711 (=> (not res!225589) (not e!190574))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!270711 (= res!225589 (bvsle (bitIndex!0 (size!6567 (buf!7035 w1!591)) (currentByte!13009 w1!591) (currentBit!13004 w1!591)) (bitIndex!0 (size!6567 (buf!7035 w2!587)) (currentByte!13009 w2!587) (currentBit!13004 w2!587))))))

(declare-fun b!270712 () Bool)

(declare-fun e!190573 () Bool)

(assert (=> b!270712 (= e!190574 e!190573)))

(declare-fun res!225588 () Bool)

(assert (=> b!270712 (=> res!225588 e!190573)))

(assert (=> b!270712 (= res!225588 (= (size!6567 (buf!7035 w1!591)) #b00000000000000000000000000000000))))

(declare-fun b!270713 () Bool)

(declare-fun arrayBitRangesEq!0 (array!15084 array!15084 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!270713 (= e!190573 (arrayBitRangesEq!0 (buf!7035 w1!591) (buf!7035 w2!587) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6567 (buf!7035 w1!591)) (currentByte!13009 w1!591) (currentBit!13004 w1!591))))))

(assert (= (and d!92064 res!225587) b!270711))

(assert (= (and b!270711 res!225589) b!270712))

(assert (= (and b!270712 (not res!225588)) b!270713))

(declare-fun m!402767 () Bool)

(assert (=> b!270711 m!402767))

(declare-fun m!402769 () Bool)

(assert (=> b!270711 m!402769))

(assert (=> b!270713 m!402767))

(assert (=> b!270713 m!402767))

(declare-fun m!402771 () Bool)

(assert (=> b!270713 m!402771))

(assert (=> start!59046 d!92064))

(declare-fun d!92068 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!92068 (= (inv!12 w1!591) (invariant!0 (currentBit!13004 w1!591) (currentByte!13009 w1!591) (size!6567 (buf!7035 w1!591))))))

(declare-fun bs!23240 () Bool)

(assert (= bs!23240 d!92068))

(declare-fun m!402773 () Bool)

(assert (=> bs!23240 m!402773))

(assert (=> start!59046 d!92068))

(declare-fun d!92070 () Bool)

(assert (=> d!92070 (= (inv!12 w2!587) (invariant!0 (currentBit!13004 w2!587) (currentByte!13009 w2!587) (size!6567 (buf!7035 w2!587))))))

(declare-fun bs!23241 () Bool)

(assert (= bs!23241 d!92070))

(declare-fun m!402775 () Bool)

(assert (=> bs!23241 m!402775))

(assert (=> start!59046 d!92070))

(declare-fun d!92072 () Bool)

(assert (=> d!92072 (= (inv!12 w3!25) (invariant!0 (currentBit!13004 w3!25) (currentByte!13009 w3!25) (size!6567 (buf!7035 w3!25))))))

(declare-fun bs!23242 () Bool)

(assert (= bs!23242 d!92072))

(declare-fun m!402777 () Bool)

(assert (=> bs!23242 m!402777))

(assert (=> start!59046 d!92072))

(declare-fun d!92074 () Bool)

(declare-fun res!225602 () Bool)

(declare-fun e!190584 () Bool)

(assert (=> d!92074 (=> (not res!225602) (not e!190584))))

(assert (=> d!92074 (= res!225602 (= (size!6567 (buf!7035 w2!587)) (size!6567 (buf!7035 w3!25))))))

(assert (=> d!92074 (= (isPrefixOf!0 w2!587 w3!25) e!190584)))

(declare-fun b!270726 () Bool)

(declare-fun res!225604 () Bool)

(assert (=> b!270726 (=> (not res!225604) (not e!190584))))

(assert (=> b!270726 (= res!225604 (bvsle (bitIndex!0 (size!6567 (buf!7035 w2!587)) (currentByte!13009 w2!587) (currentBit!13004 w2!587)) (bitIndex!0 (size!6567 (buf!7035 w3!25)) (currentByte!13009 w3!25) (currentBit!13004 w3!25))))))

(declare-fun b!270727 () Bool)

(declare-fun e!190583 () Bool)

(assert (=> b!270727 (= e!190584 e!190583)))

(declare-fun res!225603 () Bool)

(assert (=> b!270727 (=> res!225603 e!190583)))

(assert (=> b!270727 (= res!225603 (= (size!6567 (buf!7035 w2!587)) #b00000000000000000000000000000000))))

(declare-fun b!270728 () Bool)

(assert (=> b!270728 (= e!190583 (arrayBitRangesEq!0 (buf!7035 w2!587) (buf!7035 w3!25) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6567 (buf!7035 w2!587)) (currentByte!13009 w2!587) (currentBit!13004 w2!587))))))

(assert (= (and d!92074 res!225602) b!270726))

(assert (= (and b!270726 res!225604) b!270727))

(assert (= (and b!270727 (not res!225603)) b!270728))

(assert (=> b!270726 m!402769))

(declare-fun m!402791 () Bool)

(assert (=> b!270726 m!402791))

(assert (=> b!270728 m!402769))

(assert (=> b!270728 m!402769))

(declare-fun m!402793 () Bool)

(assert (=> b!270728 m!402793))

(assert (=> b!270694 d!92074))

(declare-fun d!92080 () Bool)

(assert (=> d!92080 (and (bvsge (currentByte!13009 w1!591) #b00000000000000000000000000000000) (bvslt (currentByte!13009 w1!591) (size!6567 (buf!7035 w2!587))) (bvslt (currentByte!13009 w1!591) (size!6567 (buf!7035 w3!25))) (= (select (arr!7554 (buf!7035 w2!587)) (currentByte!13009 w1!591)) (select (arr!7554 (buf!7035 w3!25)) (currentByte!13009 w1!591))))))

(declare-fun lt!409601 () Unit!19089)

(declare-fun choose!402 (array!15084 array!15084 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19089)

(assert (=> d!92080 (= lt!409601 (choose!402 (buf!7035 w2!587) (buf!7035 w3!25) #b00000000000000000000000000000000 (currentByte!13009 w1!591) (currentByte!13009 w2!587)))))

(assert (=> d!92080 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (currentByte!13009 w2!587)))))

(assert (=> d!92080 (= (arrayRangesEqImpliesEq!159 (buf!7035 w2!587) (buf!7035 w3!25) #b00000000000000000000000000000000 (currentByte!13009 w1!591) (currentByte!13009 w2!587)) lt!409601)))

(declare-fun bs!23250 () Bool)

(assert (= bs!23250 d!92080))

(assert (=> bs!23250 m!402757))

(assert (=> bs!23250 m!402759))

(declare-fun m!402816 () Bool)

