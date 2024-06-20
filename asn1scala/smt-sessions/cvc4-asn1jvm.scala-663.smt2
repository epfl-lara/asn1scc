; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18664 () Bool)

(assert start!18664)

(declare-fun b!92628 () Bool)

(declare-fun e!60874 () Bool)

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> b!92628 (= e!60874 (bvslt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!92629 () Bool)

(declare-fun res!76466 () Bool)

(assert (=> b!92629 (=> (not res!76466) (not e!60874))))

(declare-datatypes ((array!4336 0))(
  ( (array!4337 (arr!2585 (Array (_ BitVec 32) (_ BitVec 8))) (size!1962 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3458 0))(
  ( (BitStream!3459 (buf!2338 array!4336) (currentByte!4663 (_ BitVec 32)) (currentBit!4658 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3458)

(assert (=> b!92629 (= res!76466 (and (bvsle ((_ sign_extend 32) (size!1962 (buf!2338 bitStream1!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4663 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4658 bitStream1!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1962 (buf!2338 bitStream1!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4663 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4658 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!92630 () Bool)

(declare-fun e!60872 () Bool)

(declare-fun array_inv!1794 (array!4336) Bool)

(assert (=> b!92630 (= e!60872 (array_inv!1794 (buf!2338 bitStream1!8)))))

(declare-fun b!92631 () Bool)

(declare-fun res!76469 () Bool)

(assert (=> b!92631 (=> (not res!76469) (not e!60874))))

(declare-datatypes ((List!835 0))(
  ( (Nil!832) (Cons!831 (h!950 Bool) (t!1585 List!835)) )
))
(declare-fun listBits!13 () List!835)

(declare-fun length!426 (List!835) Int)

(assert (=> b!92631 (= res!76469 (> (length!426 listBits!13) 0))))

(declare-fun b!92632 () Bool)

(declare-fun res!76467 () Bool)

(assert (=> b!92632 (=> (not res!76467) (not e!60874))))

(declare-fun bitStream2!8 () BitStream!3458)

(declare-fun base!8 () BitStream!3458)

(assert (=> b!92632 (= res!76467 (and (= (buf!2338 bitStream1!8) (buf!2338 bitStream2!8)) (= (buf!2338 bitStream1!8) (buf!2338 base!8))))))

(declare-fun b!92633 () Bool)

(declare-fun res!76464 () Bool)

(assert (=> b!92633 (=> (not res!76464) (not e!60874))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!92633 (= res!76464 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4658 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4663 bitStream1!8))) ((_ extract 31 0) ((_ sign_extend 32) (size!1962 (buf!2338 bitStream1!8))))))))

(declare-fun b!92634 () Bool)

(declare-fun res!76468 () Bool)

(assert (=> b!92634 (=> (not res!76468) (not e!60874))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92634 (= res!76468 (bvslt (bitIndex!0 (size!1962 (buf!2338 base!8)) (currentByte!4663 base!8) (currentBit!4658 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92635 () Bool)

(declare-fun res!76465 () Bool)

(assert (=> b!92635 (=> (not res!76465) (not e!60874))))

(declare-fun isPrefixOf!0 (BitStream!3458 BitStream!3458) Bool)

(assert (=> b!92635 (= res!76465 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92636 () Bool)

(declare-fun res!76472 () Bool)

(assert (=> b!92636 (=> (not res!76472) (not e!60874))))

(assert (=> b!92636 (= res!76472 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1962 (buf!2338 bitStream1!8)) (currentByte!4663 bitStream1!8) (currentBit!4658 bitStream1!8))) (bitIndex!0 (size!1962 (buf!2338 bitStream2!8)) (currentByte!4663 bitStream2!8) (currentBit!4658 bitStream2!8))))))

(declare-fun res!76463 () Bool)

(assert (=> start!18664 (=> (not res!76463) (not e!60874))))

(assert (=> start!18664 (= res!76463 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18664 e!60874))

(assert (=> start!18664 true))

(declare-fun inv!12 (BitStream!3458) Bool)

(assert (=> start!18664 (and (inv!12 bitStream1!8) e!60872)))

(declare-fun e!60875 () Bool)

(assert (=> start!18664 (and (inv!12 bitStream2!8) e!60875)))

(declare-fun e!60876 () Bool)

(assert (=> start!18664 (and (inv!12 base!8) e!60876)))

(declare-fun b!92637 () Bool)

(assert (=> b!92637 (= e!60876 (array_inv!1794 (buf!2338 base!8)))))

(declare-fun b!92638 () Bool)

(declare-fun res!76470 () Bool)

(assert (=> b!92638 (=> (not res!76470) (not e!60874))))

(assert (=> b!92638 (= res!76470 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92639 () Bool)

(declare-fun res!76471 () Bool)

(assert (=> b!92639 (=> (not res!76471) (not e!60874))))

(assert (=> b!92639 (= res!76471 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92640 () Bool)

(assert (=> b!92640 (= e!60875 (array_inv!1794 (buf!2338 bitStream2!8)))))

(assert (= (and start!18664 res!76463) b!92631))

(assert (= (and b!92631 res!76469) b!92638))

(assert (= (and b!92638 res!76470) b!92635))

(assert (= (and b!92635 res!76465) b!92639))

(assert (= (and b!92639 res!76471) b!92632))

(assert (= (and b!92632 res!76467) b!92634))

(assert (= (and b!92634 res!76468) b!92636))

(assert (= (and b!92636 res!76472) b!92629))

(assert (= (and b!92629 res!76466) b!92633))

(assert (= (and b!92633 res!76464) b!92628))

(assert (= start!18664 b!92630))

(assert (= start!18664 b!92640))

(assert (= start!18664 b!92637))

(declare-fun m!136561 () Bool)

(assert (=> b!92631 m!136561))

(declare-fun m!136563 () Bool)

(assert (=> b!92635 m!136563))

(declare-fun m!136565 () Bool)

(assert (=> b!92633 m!136565))

(declare-fun m!136567 () Bool)

(assert (=> b!92634 m!136567))

(declare-fun m!136569 () Bool)

(assert (=> b!92638 m!136569))

(declare-fun m!136571 () Bool)

(assert (=> b!92640 m!136571))

(declare-fun m!136573 () Bool)

(assert (=> b!92636 m!136573))

(declare-fun m!136575 () Bool)

(assert (=> b!92636 m!136575))

(declare-fun m!136577 () Bool)

(assert (=> b!92630 m!136577))

(declare-fun m!136579 () Bool)

(assert (=> b!92639 m!136579))

(declare-fun m!136581 () Bool)

(assert (=> b!92637 m!136581))

(declare-fun m!136583 () Bool)

(assert (=> start!18664 m!136583))

(declare-fun m!136585 () Bool)

(assert (=> start!18664 m!136585))

(declare-fun m!136587 () Bool)

(assert (=> start!18664 m!136587))

(push 1)

(assert (not b!92637))

(assert (not b!92635))

(assert (not b!92634))

(assert (not b!92638))

(assert (not b!92636))

(assert (not start!18664))

(assert (not b!92631))

(assert (not b!92639))

(assert (not b!92630))

(assert (not b!92633))

(assert (not b!92640))

(check-sat)

(pop 1)

(push 1)

