; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29510 () Bool)

(assert start!29510)

(declare-fun res!127860 () Bool)

(declare-fun e!102012 () Bool)

(assert (=> start!29510 (=> (not res!127860) (not e!102012))))

(declare-datatypes ((array!6807 0))(
  ( (array!6808 (arr!3901 (Array (_ BitVec 32) (_ BitVec 8))) (size!3078 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5414 0))(
  ( (BitStream!5415 (buf!3581 array!6807) (currentByte!6531 (_ BitVec 32)) (currentBit!6526 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5414)

(declare-fun bs2!18 () BitStream!5414)

(assert (=> start!29510 (= res!127860 (= (size!3078 (buf!3581 bs1!10)) (size!3078 (buf!3581 bs2!18))))))

(assert (=> start!29510 e!102012))

(declare-fun e!102010 () Bool)

(declare-fun inv!12 (BitStream!5414) Bool)

(assert (=> start!29510 (and (inv!12 bs1!10) e!102010)))

(declare-fun e!102009 () Bool)

(assert (=> start!29510 (and (inv!12 bs2!18) e!102009)))

(declare-fun b!152517 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!152517 (= e!102012 (not (invariant!0 (currentBit!6526 bs1!10) (currentByte!6531 bs1!10) (size!3078 (buf!3581 bs1!10)))))))

(declare-fun b!152518 () Bool)

(declare-fun array_inv!2867 (array!6807) Bool)

(assert (=> b!152518 (= e!102010 (array_inv!2867 (buf!3581 bs1!10)))))

(declare-fun b!152519 () Bool)

(assert (=> b!152519 (= e!102009 (array_inv!2867 (buf!3581 bs2!18)))))

(assert (= (and start!29510 res!127860) b!152517))

(assert (= start!29510 b!152518))

(assert (= start!29510 b!152519))

(declare-fun m!238377 () Bool)

(assert (=> start!29510 m!238377))

(declare-fun m!238379 () Bool)

(assert (=> start!29510 m!238379))

(declare-fun m!238381 () Bool)

(assert (=> b!152517 m!238381))

(declare-fun m!238383 () Bool)

(assert (=> b!152518 m!238383))

(declare-fun m!238385 () Bool)

(assert (=> b!152519 m!238385))

(push 1)

(assert (not b!152517))

(assert (not start!29510))

(assert (not b!152518))

(assert (not b!152519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50086 () Bool)

