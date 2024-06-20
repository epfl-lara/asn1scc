; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58496 () Bool)

(assert start!58496)

(declare-datatypes ((array!14971 0))(
  ( (array!14972 (arr!7514 (Array (_ BitVec 32) (_ BitVec 8))) (size!6527 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11868 0))(
  ( (BitStream!11869 (buf!6995 array!14971) (currentByte!12919 (_ BitVec 32)) (currentBit!12914 (_ BitVec 32))) )
))
(declare-fun w3!25 () BitStream!11868)

(declare-fun b!268542 () Bool)

(declare-fun w2!587 () BitStream!11868)

(declare-fun e!188529 () Bool)

(declare-fun w1!591 () BitStream!11868)

(assert (=> b!268542 (= e!188529 (= ((_ sign_extend 24) (select (arr!7514 (buf!6995 w2!587)) (currentByte!12919 w1!591))) ((_ sign_extend 24) (select (arr!7514 (buf!6995 w3!25)) (currentByte!12919 w1!591)))))))

(assert (=> b!268542 (= (select (arr!7514 (buf!6995 w2!587)) (currentByte!12919 w1!591)) (select (arr!7514 (buf!6995 w3!25)) (currentByte!12919 w1!591)))))

(declare-datatypes ((Unit!19033 0))(
  ( (Unit!19034) )
))
(declare-fun lt!408553 () Unit!19033)

(declare-fun arrayRangesEqImpliesEq!152 (array!14971 array!14971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19033)

(assert (=> b!268542 (= lt!408553 (arrayRangesEqImpliesEq!152 (buf!6995 w2!587) (buf!6995 w3!25) #b00000000000000000000000000000000 (currentByte!12919 w1!591) (currentByte!12919 w2!587)))))

(declare-fun b!268543 () Bool)

(declare-fun e!188528 () Bool)

(declare-fun array_inv!6251 (array!14971) Bool)

(assert (=> b!268543 (= e!188528 (array_inv!6251 (buf!6995 w3!25)))))

(declare-fun b!268544 () Bool)

(declare-fun res!223968 () Bool)

(declare-fun e!188526 () Bool)

(assert (=> b!268544 (=> (not res!223968) (not e!188526))))

(declare-fun isPrefixOf!0 (BitStream!11868 BitStream!11868) Bool)

(assert (=> b!268544 (= res!223968 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun res!223967 () Bool)

(assert (=> start!58496 (=> (not res!223967) (not e!188526))))

(assert (=> start!58496 (= res!223967 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58496 e!188526))

(declare-fun e!188523 () Bool)

(declare-fun inv!12 (BitStream!11868) Bool)

(assert (=> start!58496 (and (inv!12 w1!591) e!188523)))

(declare-fun e!188522 () Bool)

(assert (=> start!58496 (and (inv!12 w2!587) e!188522)))

(assert (=> start!58496 (and (inv!12 w3!25) e!188528)))

(declare-fun b!268545 () Bool)

(assert (=> b!268545 (= e!188526 (not e!188529))))

(declare-fun res!223969 () Bool)

(assert (=> b!268545 (=> res!223969 e!188529)))

(assert (=> b!268545 (= res!223969 (or (bvsge (currentByte!12919 w1!591) (size!6527 (buf!6995 w1!591))) (bvsge (currentByte!12919 w1!591) (currentByte!12919 w2!587))))))

(declare-fun arrayRangesEq!1062 (array!14971 array!14971 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!268545 (arrayRangesEq!1062 (buf!6995 w1!591) (buf!6995 w3!25) #b00000000000000000000000000000000 (currentByte!12919 w1!591))))

(declare-fun lt!408554 () Unit!19033)

(declare-fun arrayRangesEqTransitive!337 (array!14971 array!14971 array!14971 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!19033)

(assert (=> b!268545 (= lt!408554 (arrayRangesEqTransitive!337 (buf!6995 w1!591) (buf!6995 w2!587) (buf!6995 w3!25) #b00000000000000000000000000000000 (currentByte!12919 w1!591) (currentByte!12919 w2!587)))))

(declare-fun b!268546 () Bool)

(assert (=> b!268546 (= e!188522 (array_inv!6251 (buf!6995 w2!587)))))

(declare-fun b!268547 () Bool)

(assert (=> b!268547 (= e!188523 (array_inv!6251 (buf!6995 w1!591)))))

(assert (= (and start!58496 res!223967) b!268544))

(assert (= (and b!268544 res!223968) b!268545))

(assert (= (and b!268545 (not res!223969)) b!268542))

(assert (= start!58496 b!268547))

(assert (= start!58496 b!268546))

(assert (= start!58496 b!268543))

(declare-fun m!400015 () Bool)

(assert (=> b!268543 m!400015))

(declare-fun m!400017 () Bool)

(assert (=> b!268547 m!400017))

(declare-fun m!400019 () Bool)

(assert (=> start!58496 m!400019))

(declare-fun m!400021 () Bool)

(assert (=> start!58496 m!400021))

(declare-fun m!400023 () Bool)

(assert (=> start!58496 m!400023))

(declare-fun m!400025 () Bool)

(assert (=> start!58496 m!400025))

(declare-fun m!400027 () Bool)

(assert (=> b!268544 m!400027))

(declare-fun m!400029 () Bool)

(assert (=> b!268542 m!400029))

(declare-fun m!400031 () Bool)

(assert (=> b!268542 m!400031))

(declare-fun m!400033 () Bool)

(assert (=> b!268542 m!400033))

(declare-fun m!400035 () Bool)

(assert (=> b!268546 m!400035))

(declare-fun m!400037 () Bool)

(assert (=> b!268545 m!400037))

(declare-fun m!400039 () Bool)

(assert (=> b!268545 m!400039))

(check-sat (not b!268543) (not b!268542) (not b!268546) (not b!268544) (not b!268547) (not start!58496) (not b!268545))
(check-sat)
