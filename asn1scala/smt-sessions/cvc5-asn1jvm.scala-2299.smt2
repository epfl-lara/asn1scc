; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58254 () Bool)

(assert start!58254)

(declare-fun b!267586 () Bool)

(declare-fun e!187548 () Bool)

(declare-datatypes ((array!14912 0))(
  ( (array!14913 (arr!7489 (Array (_ BitVec 32) (_ BitVec 8))) (size!6502 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11818 0))(
  ( (BitStream!11819 (buf!6970 array!14912) (currentByte!12876 (_ BitVec 32)) (currentBit!12871 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11818)

(declare-fun array_inv!6226 (array!14912) Bool)

(assert (=> b!267586 (= e!187548 (array_inv!6226 (buf!6970 w1!591)))))

(declare-fun res!223326 () Bool)

(declare-fun e!187543 () Bool)

(assert (=> start!58254 (=> (not res!223326) (not e!187543))))

(declare-fun w2!587 () BitStream!11818)

(declare-fun isPrefixOf!0 (BitStream!11818 BitStream!11818) Bool)

(assert (=> start!58254 (= res!223326 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58254 e!187543))

(declare-fun inv!12 (BitStream!11818) Bool)

(assert (=> start!58254 (and (inv!12 w1!591) e!187548)))

(declare-fun e!187545 () Bool)

(assert (=> start!58254 (and (inv!12 w2!587) e!187545)))

(declare-fun w3!25 () BitStream!11818)

(declare-fun e!187542 () Bool)

(assert (=> start!58254 (and (inv!12 w3!25) e!187542)))

(declare-fun b!267587 () Bool)

(assert (=> b!267587 (= e!187543 (not true))))

(declare-fun arrayRangesEq!1037 (array!14912 array!14912 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!267587 (arrayRangesEq!1037 (buf!6970 w1!591) (buf!6970 w3!25) #b00000000000000000000000000000000 (currentByte!12876 w1!591))))

(declare-datatypes ((Unit!18977 0))(
  ( (Unit!18978) )
))
(declare-fun lt!408023 () Unit!18977)

(declare-fun arrayRangesEqTransitive!312 (array!14912 array!14912 array!14912 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18977)

(assert (=> b!267587 (= lt!408023 (arrayRangesEqTransitive!312 (buf!6970 w1!591) (buf!6970 w2!587) (buf!6970 w3!25) #b00000000000000000000000000000000 (currentByte!12876 w1!591) (currentByte!12876 w2!587)))))

(declare-fun b!267588 () Bool)

(declare-fun res!223327 () Bool)

(assert (=> b!267588 (=> (not res!223327) (not e!187543))))

(assert (=> b!267588 (= res!223327 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267589 () Bool)

(assert (=> b!267589 (= e!187542 (array_inv!6226 (buf!6970 w3!25)))))

(declare-fun b!267590 () Bool)

(assert (=> b!267590 (= e!187545 (array_inv!6226 (buf!6970 w2!587)))))

(assert (= (and start!58254 res!223326) b!267588))

(assert (= (and b!267588 res!223327) b!267587))

(assert (= start!58254 b!267586))

(assert (= start!58254 b!267590))

(assert (= start!58254 b!267589))

(declare-fun m!398825 () Bool)

(assert (=> b!267588 m!398825))

(declare-fun m!398827 () Bool)

(assert (=> b!267590 m!398827))

(declare-fun m!398829 () Bool)

(assert (=> b!267587 m!398829))

(declare-fun m!398831 () Bool)

(assert (=> b!267587 m!398831))

(declare-fun m!398833 () Bool)

(assert (=> b!267586 m!398833))

(declare-fun m!398835 () Bool)

(assert (=> start!58254 m!398835))

(declare-fun m!398837 () Bool)

(assert (=> start!58254 m!398837))

(declare-fun m!398839 () Bool)

(assert (=> start!58254 m!398839))

(declare-fun m!398841 () Bool)

(assert (=> start!58254 m!398841))

(declare-fun m!398843 () Bool)

(assert (=> b!267589 m!398843))

(push 1)

(assert (not b!267588))

(assert (not b!267590))

(assert (not start!58254))

(assert (not b!267587))

(assert (not b!267586))

(assert (not b!267589))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

