; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19082 () Bool)

(assert start!19082)

(declare-fun b!95284 () Bool)

(declare-fun e!62436 () Bool)

(declare-datatypes ((array!4449 0))(
  ( (array!4450 (arr!2631 (Array (_ BitVec 32) (_ BitVec 8))) (size!2029 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3550 0))(
  ( (BitStream!3551 (buf!2384 array!4449) (currentByte!4759 (_ BitVec 32)) (currentBit!4754 (_ BitVec 32))) )
))
(declare-fun bitStream2!8 () BitStream!3550)

(declare-fun array_inv!1840 (array!4449) Bool)

(assert (=> b!95284 (= e!62436 (array_inv!1840 (buf!2384 bitStream2!8)))))

(declare-fun b!95285 () Bool)

(declare-fun e!62441 () Bool)

(declare-fun bitStream1!8 () BitStream!3550)

(assert (=> b!95285 (= e!62441 (array_inv!1840 (buf!2384 bitStream1!8)))))

(declare-fun b!95286 () Bool)

(declare-fun res!78431 () Bool)

(declare-fun e!62442 () Bool)

(assert (=> b!95286 (=> (not res!78431) (not e!62442))))

(declare-fun base!8 () BitStream!3550)

(declare-fun isPrefixOf!0 (BitStream!3550 BitStream!3550) Bool)

(assert (=> b!95286 (= res!78431 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!95287 () Bool)

(declare-fun res!78428 () Bool)

(assert (=> b!95287 (=> (not res!78428) (not e!62442))))

(assert (=> b!95287 (= res!78428 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!95288 () Bool)

(declare-fun res!78430 () Bool)

(assert (=> b!95288 (=> (not res!78430) (not e!62442))))

(assert (=> b!95288 (= res!78430 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun b!95289 () Bool)

(assert (=> b!95289 (= e!62442 (and (= (buf!2384 bitStream1!8) (buf!2384 bitStream2!8)) (= (buf!2384 bitStream1!8) (buf!2384 base!8)) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand nBits!484 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (bvand (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!95290 () Bool)

(declare-fun res!78432 () Bool)

(assert (=> b!95290 (=> (not res!78432) (not e!62442))))

(declare-datatypes ((List!881 0))(
  ( (Nil!878) (Cons!877 (h!996 Bool) (t!1631 List!881)) )
))
(declare-fun listBits!13 () List!881)

(declare-fun length!472 (List!881) Int)

(assert (=> b!95290 (= res!78432 (> (length!472 listBits!13) 0))))

(declare-fun b!95291 () Bool)

(declare-fun e!62438 () Bool)

(assert (=> b!95291 (= e!62438 (array_inv!1840 (buf!2384 base!8)))))

(declare-fun res!78429 () Bool)

(assert (=> start!19082 (=> (not res!78429) (not e!62442))))

(assert (=> start!19082 (= res!78429 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!19082 e!62442))

(assert (=> start!19082 true))

(declare-fun inv!12 (BitStream!3550) Bool)

(assert (=> start!19082 (and (inv!12 bitStream1!8) e!62441)))

(assert (=> start!19082 (and (inv!12 bitStream2!8) e!62436)))

(assert (=> start!19082 (and (inv!12 base!8) e!62438)))

(assert (= (and start!19082 res!78429) b!95290))

(assert (= (and b!95290 res!78432) b!95288))

(assert (= (and b!95288 res!78430) b!95286))

(assert (= (and b!95286 res!78431) b!95287))

(assert (= (and b!95287 res!78428) b!95289))

(assert (= start!19082 b!95285))

(assert (= start!19082 b!95284))

(assert (= start!19082 b!95291))

(declare-fun m!138725 () Bool)

(assert (=> b!95284 m!138725))

(declare-fun m!138727 () Bool)

(assert (=> b!95286 m!138727))

(declare-fun m!138729 () Bool)

(assert (=> b!95288 m!138729))

(declare-fun m!138731 () Bool)

(assert (=> b!95285 m!138731))

(declare-fun m!138733 () Bool)

(assert (=> b!95290 m!138733))

(declare-fun m!138735 () Bool)

(assert (=> start!19082 m!138735))

(declare-fun m!138737 () Bool)

(assert (=> start!19082 m!138737))

(declare-fun m!138739 () Bool)

(assert (=> start!19082 m!138739))

(declare-fun m!138741 () Bool)

(assert (=> b!95287 m!138741))

(declare-fun m!138743 () Bool)

(assert (=> b!95291 m!138743))

(push 1)

(assert (not start!19082))

(assert (not b!95286))

(assert (not b!95288))

(assert (not b!95285))

(assert (not b!95284))

(assert (not b!95291))

(assert (not b!95290))

(assert (not b!95287))

(check-sat)

(pop 1)

