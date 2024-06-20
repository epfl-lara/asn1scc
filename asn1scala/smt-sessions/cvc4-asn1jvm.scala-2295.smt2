; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!58234 () Bool)

(assert start!58234)

(declare-fun res!223294 () Bool)

(declare-fun e!187337 () Bool)

(assert (=> start!58234 (=> (not res!223294) (not e!187337))))

(declare-datatypes ((array!14892 0))(
  ( (array!14893 (arr!7479 (Array (_ BitVec 32) (_ BitVec 8))) (size!6492 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11798 0))(
  ( (BitStream!11799 (buf!6960 array!14892) (currentByte!12866 (_ BitVec 32)) (currentBit!12861 (_ BitVec 32))) )
))
(declare-fun w1!591 () BitStream!11798)

(declare-fun w2!587 () BitStream!11798)

(declare-fun isPrefixOf!0 (BitStream!11798 BitStream!11798) Bool)

(assert (=> start!58234 (= res!223294 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58234 e!187337))

(declare-fun e!187336 () Bool)

(declare-fun inv!12 (BitStream!11798) Bool)

(assert (=> start!58234 (and (inv!12 w1!591) e!187336)))

(declare-fun e!187338 () Bool)

(assert (=> start!58234 (and (inv!12 w2!587) e!187338)))

(declare-fun w3!25 () BitStream!11798)

(declare-fun e!187335 () Bool)

(assert (=> start!58234 (and (inv!12 w3!25) e!187335)))

(declare-fun b!267466 () Bool)

(declare-fun array_inv!6216 (array!14892) Bool)

(assert (=> b!267466 (= e!187338 (array_inv!6216 (buf!6960 w2!587)))))

(declare-fun b!267464 () Bool)

(assert (=> b!267464 (= e!187337 false)))

(declare-fun lt!407993 () Bool)

(assert (=> b!267464 (= lt!407993 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267467 () Bool)

(assert (=> b!267467 (= e!187335 (array_inv!6216 (buf!6960 w3!25)))))

(declare-fun b!267465 () Bool)

(assert (=> b!267465 (= e!187336 (array_inv!6216 (buf!6960 w1!591)))))

(assert (= (and start!58234 res!223294) b!267464))

(assert (= start!58234 b!267465))

(assert (= start!58234 b!267466))

(assert (= start!58234 b!267467))

(declare-fun m!398665 () Bool)

(assert (=> b!267466 m!398665))

(declare-fun m!398667 () Bool)

(assert (=> start!58234 m!398667))

(declare-fun m!398669 () Bool)

(assert (=> start!58234 m!398669))

(declare-fun m!398671 () Bool)

(assert (=> start!58234 m!398671))

(declare-fun m!398673 () Bool)

(assert (=> start!58234 m!398673))

(declare-fun m!398675 () Bool)

(assert (=> b!267465 m!398675))

(declare-fun m!398677 () Bool)

(assert (=> b!267464 m!398677))

(declare-fun m!398679 () Bool)

(assert (=> b!267467 m!398679))

(push 1)

(assert (not b!267464))

(assert (not b!267467))

(assert (not b!267466))

(assert (not b!267465))

(assert (not start!58234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

