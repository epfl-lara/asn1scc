; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58238 () Bool)

(assert start!58238)

(declare-fun b!267488 () Bool)

(declare-fun e!187376 () Bool)

(assert (=> b!267488 (= e!187376 false)))

(declare-fun lt!407999 () Bool)

(declare-datatypes ((array!14896 0))(
  ( (array!14897 (arr!7481 (Array (_ BitVec 32) (_ BitVec 8))) (size!6494 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11802 0))(
  ( (BitStream!11803 (buf!6962 array!14896) (currentByte!12868 (_ BitVec 32)) (currentBit!12863 (_ BitVec 32))) )
))
(declare-fun w2!587 () BitStream!11802)

(declare-fun w3!25 () BitStream!11802)

(declare-fun isPrefixOf!0 (BitStream!11802 BitStream!11802) Bool)

(assert (=> b!267488 (= lt!407999 (isPrefixOf!0 w2!587 w3!25))))

(declare-fun b!267490 () Bool)

(declare-fun e!187380 () Bool)

(declare-fun array_inv!6218 (array!14896) Bool)

(assert (=> b!267490 (= e!187380 (array_inv!6218 (buf!6962 w2!587)))))

(declare-fun res!223300 () Bool)

(assert (=> start!58238 (=> (not res!223300) (not e!187376))))

(declare-fun w1!591 () BitStream!11802)

(assert (=> start!58238 (= res!223300 (isPrefixOf!0 w1!591 w2!587))))

(assert (=> start!58238 e!187376))

(declare-fun e!187379 () Bool)

(declare-fun inv!12 (BitStream!11802) Bool)

(assert (=> start!58238 (and (inv!12 w1!591) e!187379)))

(assert (=> start!58238 (and (inv!12 w2!587) e!187380)))

(declare-fun e!187377 () Bool)

(assert (=> start!58238 (and (inv!12 w3!25) e!187377)))

(declare-fun b!267489 () Bool)

(assert (=> b!267489 (= e!187379 (array_inv!6218 (buf!6962 w1!591)))))

(declare-fun b!267491 () Bool)

(assert (=> b!267491 (= e!187377 (array_inv!6218 (buf!6962 w3!25)))))

(assert (= (and start!58238 res!223300) b!267488))

(assert (= start!58238 b!267489))

(assert (= start!58238 b!267490))

(assert (= start!58238 b!267491))

(declare-fun m!398697 () Bool)

(assert (=> b!267488 m!398697))

(declare-fun m!398699 () Bool)

(assert (=> b!267490 m!398699))

(declare-fun m!398701 () Bool)

(assert (=> b!267489 m!398701))

(declare-fun m!398703 () Bool)

(assert (=> b!267491 m!398703))

(declare-fun m!398705 () Bool)

(assert (=> start!58238 m!398705))

(declare-fun m!398707 () Bool)

(assert (=> start!58238 m!398707))

(declare-fun m!398709 () Bool)

(assert (=> start!58238 m!398709))

(declare-fun m!398711 () Bool)

(assert (=> start!58238 m!398711))

(check-sat (not start!58238) (not b!267491) (not b!267489) (not b!267488) (not b!267490))
