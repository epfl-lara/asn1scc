; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19086 () Bool)

(assert start!19086)

(declare-fun b!95332 () Bool)

(declare-fun res!78460 () Bool)

(declare-fun e!62483 () Bool)

(assert (=> b!95332 (=> (not res!78460) (not e!62483))))

(declare-datatypes ((array!4453 0))(
  ( (array!4454 (arr!2633 (Array (_ BitVec 32) (_ BitVec 8))) (size!2031 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3554 0))(
  ( (BitStream!3555 (buf!2386 array!4453) (currentByte!4761 (_ BitVec 32)) (currentBit!4756 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3554)

(declare-fun base!8 () BitStream!3554)

(declare-fun isPrefixOf!0 (BitStream!3554 BitStream!3554) Bool)

(assert (=> b!95332 (= res!78460 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!95333 () Bool)

(declare-fun e!62482 () Bool)

(declare-fun array_inv!1842 (array!4453) Bool)

(assert (=> b!95333 (= e!62482 (array_inv!1842 (buf!2386 base!8)))))

(declare-fun res!78462 () Bool)

(assert (=> start!19086 (=> (not res!78462) (not e!62483))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!19086 (= res!78462 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19086 e!62483))

(assert (=> start!19086 true))

(declare-fun e!62479 () Bool)

(declare-fun inv!12 (BitStream!3554) Bool)

(assert (=> start!19086 (and (inv!12 bitStream1!8) e!62479)))

(declare-fun bitStream2!8 () BitStream!3554)

(declare-fun e!62478 () Bool)

(assert (=> start!19086 (and (inv!12 bitStream2!8) e!62478)))

(assert (=> start!19086 (and (inv!12 base!8) e!62482)))

(declare-fun b!95334 () Bool)

(declare-fun res!78458 () Bool)

(assert (=> b!95334 (=> (not res!78458) (not e!62483))))

(assert (=> b!95334 (= res!78458 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95335 () Bool)

(assert (=> b!95335 (= e!62483 (and (= (buf!2386 bitStream1!8) (buf!2386 bitStream2!8)) (= (buf!2386 bitStream1!8) (buf!2386 base!8)) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!95336 () Bool)

(declare-fun res!78461 () Bool)

(assert (=> b!95336 (=> (not res!78461) (not e!62483))))

(assert (=> b!95336 (= res!78461 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95337 () Bool)

(assert (=> b!95337 (= e!62479 (array_inv!1842 (buf!2386 bitStream1!8)))))

(declare-fun b!95338 () Bool)

(assert (=> b!95338 (= e!62478 (array_inv!1842 (buf!2386 bitStream2!8)))))

(declare-fun b!95339 () Bool)

(declare-fun res!78459 () Bool)

(assert (=> b!95339 (=> (not res!78459) (not e!62483))))

(declare-datatypes ((List!883 0))(
  ( (Nil!880) (Cons!879 (h!998 Bool) (t!1633 List!883)) )
))
(declare-fun listBits!13 () List!883)

(declare-fun length!474 (List!883) Int)

(assert (=> b!95339 (= res!78459 (> (length!474 listBits!13) 0))))

(assert (= (and start!19086 res!78462) b!95339))

(assert (= (and b!95339 res!78459) b!95332))

(assert (= (and b!95332 res!78460) b!95334))

(assert (= (and b!95334 res!78458) b!95336))

(assert (= (and b!95336 res!78461) b!95335))

(assert (= start!19086 b!95337))

(assert (= start!19086 b!95338))

(assert (= start!19086 b!95333))

(declare-fun m!138765 () Bool)

(assert (=> b!95337 m!138765))

(declare-fun m!138767 () Bool)

(assert (=> b!95339 m!138767))

(declare-fun m!138769 () Bool)

(assert (=> b!95333 m!138769))

(declare-fun m!138771 () Bool)

(assert (=> b!95336 m!138771))

(declare-fun m!138773 () Bool)

(assert (=> b!95338 m!138773))

(declare-fun m!138775 () Bool)

(assert (=> b!95334 m!138775))

(declare-fun m!138777 () Bool)

(assert (=> start!19086 m!138777))

(declare-fun m!138779 () Bool)

(assert (=> start!19086 m!138779))

(declare-fun m!138781 () Bool)

(assert (=> start!19086 m!138781))

(declare-fun m!138783 () Bool)

(assert (=> b!95332 m!138783))

(push 1)

(assert (not b!95339))

(assert (not b!95337))

(assert (not start!19086))

(assert (not b!95334))

(assert (not b!95333))

(assert (not b!95338))

(assert (not b!95336))

(assert (not b!95332))

(check-sat)

