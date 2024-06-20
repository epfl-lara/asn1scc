; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18662 () Bool)

(assert start!18662)

(declare-fun b!92589 () Bool)

(declare-fun res!76435 () Bool)

(declare-fun e!60853 () Bool)

(assert (=> b!92589 (=> (not res!76435) (not e!60853))))

(declare-datatypes ((array!4334 0))(
  ( (array!4335 (arr!2584 (Array (_ BitVec 32) (_ BitVec 8))) (size!1961 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3456 0))(
  ( (BitStream!3457 (buf!2337 array!4334) (currentByte!4662 (_ BitVec 32)) (currentBit!4657 (_ BitVec 32))) )
))
(declare-fun base!8 () BitStream!3456)

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92589 (= res!76435 (bvslt (bitIndex!0 (size!1961 (buf!2337 base!8)) (currentByte!4662 base!8) (currentBit!4657 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92590 () Bool)

(declare-fun res!76438 () Bool)

(assert (=> b!92590 (=> (not res!76438) (not e!60853))))

(declare-fun bitStream1!8 () BitStream!3456)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92590 (= res!76438 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4657 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4662 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1961 (buf!2337 bitStream1!8))))))))

(declare-fun b!92591 () Bool)

(declare-fun res!76442 () Bool)

(assert (=> b!92591 (=> (not res!76442) (not e!60853))))

(declare-fun isPrefixOf!0 (BitStream!3456 BitStream!3456) Bool)

(assert (=> b!92591 (= res!76442 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92592 () Bool)

(declare-fun res!76436 () Bool)

(assert (=> b!92592 (=> (not res!76436) (not e!60853))))

(declare-datatypes ((List!834 0))(
  ( (Nil!831) (Cons!830 (h!949 Bool) (t!1584 List!834)) )
))
(declare-fun listBits!13 () List!834)

(declare-fun length!425 (List!834) Int)

(assert (=> b!92592 (= res!76436 (> (length!425 listBits!13) 0))))

(declare-fun b!92593 () Bool)

(declare-fun res!76440 () Bool)

(assert (=> b!92593 (=> (not res!76440) (not e!60853))))

(declare-fun bitStream2!8 () BitStream!3456)

(assert (=> b!92593 (= res!76440 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1961 (buf!2337 bitStream1!8)) (currentByte!4662 bitStream1!8) (currentBit!4657 bitStream1!8))) (bitIndex!0 (size!1961 (buf!2337 bitStream2!8)) (currentByte!4662 bitStream2!8) (currentBit!4657 bitStream2!8))))))

(declare-fun b!92594 () Bool)

(declare-fun res!76437 () Bool)

(assert (=> b!92594 (=> (not res!76437) (not e!60853))))

(assert (=> b!92594 (= res!76437 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92595 () Bool)

(declare-fun res!76434 () Bool)

(assert (=> b!92595 (=> (not res!76434) (not e!60853))))

(assert (=> b!92595 (= res!76434 (and (bvsle ((_ sign_extend 32) (size!1961 (buf!2337 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4662 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4657 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1961 (buf!2337 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4662 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4657 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92596 () Bool)

(declare-fun e!60855 () Bool)

(declare-fun array_inv!1793 (array!4334) Bool)

(assert (=> b!92596 (= e!60855 (array_inv!1793 (buf!2337 base!8)))))

(declare-fun b!92597 () Bool)

(declare-fun e!60850 () Bool)

(assert (=> b!92597 (= e!60850 (array_inv!1793 (buf!2337 bitStream2!8)))))

(declare-fun b!92598 () Bool)

(declare-fun e!60851 () Bool)

(assert (=> b!92598 (= e!60851 (array_inv!1793 (buf!2337 bitStream1!8)))))

(declare-fun b!92599 () Bool)

(assert (=> b!92599 (= e!60853 (bvslt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92600 () Bool)

(declare-fun res!76433 () Bool)

(assert (=> b!92600 (=> (not res!76433) (not e!60853))))

(assert (=> b!92600 (= res!76433 (and (= (buf!2337 bitStream1!8) (buf!2337 bitStream2!8)) (= (buf!2337 bitStream1!8) (buf!2337 base!8))))))

(declare-fun b!92601 () Bool)

(declare-fun res!76441 () Bool)

(assert (=> b!92601 (=> (not res!76441) (not e!60853))))

(assert (=> b!92601 (= res!76441 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun res!76439 () Bool)

(assert (=> start!18662 (=> (not res!76439) (not e!60853))))

(assert (=> start!18662 (= res!76439 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18662 e!60853))

(assert (=> start!18662 true))

(declare-fun inv!12 (BitStream!3456) Bool)

(assert (=> start!18662 (and (inv!12 bitStream1!8) e!60851)))

(assert (=> start!18662 (and (inv!12 bitStream2!8) e!60850)))

(assert (=> start!18662 (and (inv!12 base!8) e!60855)))

(assert (= (and start!18662 res!76439) b!92592))

(assert (= (and b!92592 res!76436) b!92591))

(assert (= (and b!92591 res!76442) b!92601))

(assert (= (and b!92601 res!76441) b!92594))

(assert (= (and b!92594 res!76437) b!92600))

(assert (= (and b!92600 res!76433) b!92589))

(assert (= (and b!92589 res!76435) b!92593))

(assert (= (and b!92593 res!76440) b!92595))

(assert (= (and b!92595 res!76434) b!92590))

(assert (= (and b!92590 res!76438) b!92599))

(assert (= start!18662 b!92598))

(assert (= start!18662 b!92597))

(assert (= start!18662 b!92596))

(declare-fun m!136533 () Bool)

(assert (=> b!92597 m!136533))

(declare-fun m!136535 () Bool)

(assert (=> b!92592 m!136535))

(declare-fun m!136537 () Bool)

(assert (=> start!18662 m!136537))

(declare-fun m!136539 () Bool)

(assert (=> start!18662 m!136539))

(declare-fun m!136541 () Bool)

(assert (=> start!18662 m!136541))

(declare-fun m!136543 () Bool)

(assert (=> b!92596 m!136543))

(declare-fun m!136545 () Bool)

(assert (=> b!92591 m!136545))

(declare-fun m!136547 () Bool)

(assert (=> b!92590 m!136547))

(declare-fun m!136549 () Bool)

(assert (=> b!92594 m!136549))

(declare-fun m!136551 () Bool)

(assert (=> b!92589 m!136551))

(declare-fun m!136553 () Bool)

(assert (=> b!92598 m!136553))

(declare-fun m!136555 () Bool)

(assert (=> b!92601 m!136555))

(declare-fun m!136557 () Bool)

(assert (=> b!92593 m!136557))

(declare-fun m!136559 () Bool)

(assert (=> b!92593 m!136559))

(check-sat (not b!92597) (not b!92594) (not b!92598) (not b!92593) (not b!92596) (not b!92589) (not b!92590) (not b!92591) (not start!18662) (not b!92601) (not b!92592))
(check-sat)
