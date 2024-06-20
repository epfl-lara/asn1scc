; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58560 () Bool)

(assert start!58560)

(declare-fun b!268807 () Bool)

(declare-fun e!188780 () Bool)

(declare-datatypes ((array!14984 0))(
  ( (array!14985 (arr!7519 (Array (_ BitVec 32) (_ BitVec 8))) (size!6532 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11878 0))(
  ( (BitStream!11879 (buf!7000 array!14984) (currentByte!12930 (_ BitVec 32)) (currentBit!12925 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11878)

(declare-fun w3!25 () BitStream!11878)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268807 (= e!188780 (byteRangesEq!0 (select (arr!7519 (buf!7000 w1!591)) (currentByte!12930 w1!591)) (select (arr!7519 (buf!7000 w3!25)) (currentByte!12930 w1!591)) #b00000000000000000000000000000000 (currentBit!12925 w1!591)))))

(declare-fun b!268808 () Bool)

(declare-datatypes ((Unit!19043 0))(
  ( (Unit!19044) )
))
(declare-fun e!188784 () Unit!19043)

(declare-fun Unit!19045 () Unit!19043)

(assert (=> b!268808 (= e!188784 Unit!19045)))

(declare-fun w2!587 () BitStream!11878)

(declare-fun lt!408711 () Unit!19043)

(declare-fun arrayRangesEqImpliesEq!154 (array!14984 array!14984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19043)

(assert (=> b!268808 (= lt!408711 (arrayRangesEqImpliesEq!154 (buf!7000 w2!587) (buf!7000 w3!25) #b00000000000000000000000000000000 (currentByte!12930 w1!591) (currentByte!12930 w2!587)))))

(declare-fun res!224162 () Bool)

(assert (=> b!268808 (= res!224162 (= (select (arr!7519 (buf!7000 w2!587)) (currentByte!12930 w1!591)) (select (arr!7519 (buf!7000 w3!25)) (currentByte!12930 w1!591))))))

(declare-fun e!188786 () Bool)

(assert (=> b!268808 (=> (not res!224162) (not e!188786))))

(assert (=> b!268808 e!188786))

(declare-fun b!268809 () Bool)

(declare-fun e!188778 () Bool)

(declare-fun array_inv!6256 (array!14984) Bool)

(assert (=> b!268809 (= e!188778 (array_inv!6256 (buf!7000 w3!25)))))

(declare-fun b!268810 () Bool)

(declare-fun res!224160 () Bool)

(declare-fun e!188787 () Bool)

(assert (=> b!268810 (=> (not res!224160) (not e!188787))))

(declare-fun isPrefixOf!0 (BitStream!11878 BitStream!11878) Bool)

(assert (=> b!268810 (= res!224160 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!268811 () Bool)

(declare-fun Unit!19046 () Unit!19043)

(assert (=> b!268811 (= e!188784 Unit!19046)))

(declare-fun b!268812 () Bool)

(assert (=> b!268812 (= e!188786 (byteRangesEq!0 (select (arr!7519 (buf!7000 w1!591)) (currentByte!12930 w1!591)) (select (arr!7519 (buf!7000 w3!25)) (currentByte!12930 w1!591)) #b00000000000000000000000000000000 (currentBit!12925 w1!591)))))

(declare-fun b!268813 () Bool)

(declare-fun e!188782 () Bool)

(assert (=> b!268813 (= e!188782 (array_inv!6256 (buf!7000 w1!591)))))

(declare-fun b!268814 () Bool)

(declare-fun e!188776 () Bool)

(assert (=> b!268814 (= e!188776 (byteRangesEq!0 (select (arr!7519 (buf!7000 w1!591)) (currentByte!12930 w1!591)) (select (arr!7519 (buf!7000 w3!25)) (currentByte!12930 w1!591)) #b00000000000000000000000000000000 (currentBit!12925 w1!591)))))

(declare-fun b!268815 () Bool)

(declare-fun e!188783 () Bool)

(assert (=> b!268815 (= e!188783 e!188776)))

(declare-fun res!224164 () Bool)

(assert (=> b!268815 (=> res!224164 e!188776)))

(assert (=> b!268815 (= res!224164 (or (bvsge (currentByte!12930 w1!591) (size!6532 (buf!7000 w1!591))) (bvslt (currentByte!12930 w1!591) (currentByte!12930 w2!587))))))

(declare-fun b!268816 () Bool)

(assert (=> b!268816 (= e!188787 (not e!188780))))

(declare-fun res!224163 () Bool)

(assert (=> b!268816 (=> res!224163 e!188780)))

(assert (=> b!268816 (= res!224163 (bvsge (currentByte!12930 w1!591) (size!6532 (buf!7000 w1!591))))))

(declare-fun lt!408713 () Unit!19043)

(assert (=> b!268816 (= lt!408713 e!188784)))

(declare-fun c!12402 () Bool)

(assert (=> b!268816 (= c!12402 (and (bvslt (currentByte!12930 w1!591) (size!6532 (buf!7000 w1!591))) (bvslt (currentByte!12930 w1!591) (currentByte!12930 w2!587))))))

(assert (=> b!268816 e!188783))

(declare-fun res!224159 () Bool)

(assert (=> b!268816 (=> (not res!224159) (not e!188783))))

(declare-fun arrayRangesEq!1067 (array!14984 array!14984 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268816 (= res!224159 (arrayRangesEq!1067 (buf!7000 w1!591) (buf!7000 w3!25) #b00000000000000000000000000000000 (currentByte!12930 w1!591)))))

(declare-fun lt!408712 () Unit!19043)

(declare-fun arrayRangesEqTransitive!342 (array!14984 array!14984 array!14984 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19043)

(assert (=> b!268816 (= lt!408712 (arrayRangesEqTransitive!342 (buf!7000 w1!591) (buf!7000 w2!587) (buf!7000 w3!25) #b00000000000000000000000000000000 (currentByte!12930 w1!591) (currentByte!12930 w2!587)))))

(declare-fun b!268817 () Bool)

(declare-fun e!188781 () Bool)

(assert (=> b!268817 (= e!188781 (array_inv!6256 (buf!7000 w2!587)))))

(declare-fun res!224161 () Bool)

(assert (=> start!58560 (=> (not res!224161) (not e!188787))))

(assert (=> start!58560 (= res!224161 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58560 e!188787))

(declare-fun inv!12 (BitStream!11878) Bool)

(assert (=> start!58560 (and (inv!12 w1!591) e!188782)))

(assert (=> start!58560 (and (inv!12 w2!587) e!188781)))

(assert (=> start!58560 (and (inv!12 w3!25) e!188778)))

(assert (= (and start!58560 res!224161) b!268810))

(assert (= (and b!268810 res!224160) b!268816))

(assert (= (and b!268816 res!224159) b!268815))

(assert (= (and b!268815 (not res!224164)) b!268814))

(assert (= (and b!268816 c!12402) b!268808))

(assert (= (and b!268816 (not c!12402)) b!268811))

(assert (= (and b!268808 res!224162) b!268812))

(assert (= (and b!268816 (not res!224163)) b!268807))

(assert (= start!58560 b!268813))

(assert (= start!58560 b!268817))

(assert (= start!58560 b!268809))

(declare-fun m!400331 () Bool)

(assert (=> b!268808 m!400331))

(declare-fun m!400333 () Bool)

(assert (=> b!268808 m!400333))

(declare-fun m!400335 () Bool)

(assert (=> b!268808 m!400335))

(declare-fun m!400337 () Bool)

(assert (=> start!58560 m!400337))

(declare-fun m!400339 () Bool)

(assert (=> start!58560 m!400339))

(declare-fun m!400341 () Bool)

(assert (=> start!58560 m!400341))

(declare-fun m!400343 () Bool)

(assert (=> start!58560 m!400343))

(declare-fun m!400345 () Bool)

(assert (=> b!268814 m!400345))

(assert (=> b!268814 m!400335))

(assert (=> b!268814 m!400345))

(assert (=> b!268814 m!400335))

(declare-fun m!400347 () Bool)

(assert (=> b!268814 m!400347))

(declare-fun m!400349 () Bool)

(assert (=> b!268816 m!400349))

(declare-fun m!400351 () Bool)

(assert (=> b!268816 m!400351))

(declare-fun m!400353 () Bool)

(assert (=> b!268809 m!400353))

(assert (=> b!268812 m!400345))

(assert (=> b!268812 m!400335))

(assert (=> b!268812 m!400345))

(assert (=> b!268812 m!400335))

(assert (=> b!268812 m!400347))

(declare-fun m!400355 () Bool)

(assert (=> b!268810 m!400355))

(declare-fun m!400357 () Bool)

(assert (=> b!268817 m!400357))

(declare-fun m!400359 () Bool)

(assert (=> b!268813 m!400359))

(assert (=> b!268807 m!400345))

(assert (=> b!268807 m!400335))

(assert (=> b!268807 m!400345))

(assert (=> b!268807 m!400335))

(assert (=> b!268807 m!400347))

(push 1)

(assert (not b!268814))

(assert (not b!268812))

(assert (not start!58560))

(assert (not b!268813))

(assert (not b!268816))

(assert (not b!268809))

(assert (not b!268810))

(assert (not b!268817))

(assert (not b!268807))

(assert (not b!268808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

