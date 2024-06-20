; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58244 () Bool)

(assert start!58244)

(declare-fun res!223309 () Bool)

(declare-fun e!187440 () Bool)

(assert (=> start!58244 (=> (not res!223309) (not e!187440))))

(declare-datatypes ((array!14902 0))(
  ( (array!14903 (arr!7484 (Array (_ BitVec 32) (_ BitVec 8))) (size!6497 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11808 0))(
  ( (BitStream!11809 (buf!6965 array!14902) (currentByte!12871 (_ BitVec 32)) (currentBit!12866 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11808)

(declare-fun w2!587 () BitStream!11808)

(declare-fun isPrefixOf!0 (BitStream!11808 BitStream!11808) Bool)

(assert (=> start!58244 (= res!223309 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58244 e!187440))

(declare-fun e!187439 () Bool)

(declare-fun inv!12 (BitStream!11808) Bool)

(assert (=> start!58244 (and (inv!12 w1!591) e!187439)))

(declare-fun e!187438 () Bool)

(assert (=> start!58244 (and (inv!12 w2!587) e!187438)))

(declare-fun w3!25 () BitStream!11808)

(declare-fun e!187441 () Bool)

(assert (=> start!58244 (and (inv!12 w3!25) e!187441)))

(declare-fun b!267526 () Bool)

(declare-fun array_inv!6221 (array!14902) Bool)

(assert (=> b!267526 (= e!187438 (array_inv!6221 (buf!6965 w2!587)))))

(declare-fun b!267524 () Bool)

(assert (=> b!267524 (= e!187440 false)))

(declare-fun lt!408008 () Bool)

(assert (=> b!267524 (= lt!408008 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267527 () Bool)

(assert (=> b!267527 (= e!187441 (array_inv!6221 (buf!6965 w3!25)))))

(declare-fun b!267525 () Bool)

(assert (=> b!267525 (= e!187439 (array_inv!6221 (buf!6965 w1!591)))))

(assert (= (and start!58244 res!223309) b!267524))

(assert (= start!58244 b!267525))

(assert (= start!58244 b!267526))

(assert (= start!58244 b!267527))

(declare-fun m!398745 () Bool)

(assert (=> start!58244 m!398745))

(declare-fun m!398747 () Bool)

(assert (=> start!58244 m!398747))

(declare-fun m!398749 () Bool)

(assert (=> start!58244 m!398749))

(declare-fun m!398751 () Bool)

(assert (=> start!58244 m!398751))

(declare-fun m!398753 () Bool)

(assert (=> b!267525 m!398753))

(declare-fun m!398755 () Bool)

(assert (=> b!267527 m!398755))

(declare-fun m!398757 () Bool)

(assert (=> b!267524 m!398757))

(declare-fun m!398759 () Bool)

(assert (=> b!267526 m!398759))

(check-sat (not b!267524) (not b!267527) (not b!267526) (not start!58244) (not b!267525))
