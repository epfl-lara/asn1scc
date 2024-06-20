; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49654 () Bool)

(assert start!49654)

(declare-fun res!195960 () Bool)

(declare-fun e!161937 () Bool)

(assert (=> start!49654 (=> (not res!195960) (not e!161937))))

(declare-fun nBits!274 () (_ BitVec 32))

(declare-datatypes ((array!12258 0))(
  ( (array!12259 (arr!6373 (Array (_ BitVec 32) (_ BitVec 8))) (size!5386 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9736 0))(
  ( (BitStream!9737 (buf!5861 array!12258) (currentByte!10914 (_ BitVec 32)) (currentBit!10909 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9736)

(declare-fun i!546 () (_ BitVec 32))

(assert (=> start!49654 (= res!195960 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!5386 (buf!5861 bs!63))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!10914 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!10909 bs!63)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!5386 (buf!5861 bs!63))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!10914 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!10909 bs!63)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!49654 e!161937))

(assert (=> start!49654 true))

(declare-fun e!161938 () Bool)

(declare-fun inv!12 (BitStream!9736) Bool)

(assert (=> start!49654 (and (inv!12 bs!63) e!161938)))

(declare-fun b!234286 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!234286 (= e!161937 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!10909 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!10914 bs!63))) ((_ extract 31 0) ((_ sign_extend 32) (size!5386 (buf!5861 bs!63)))))))))

(declare-fun b!234287 () Bool)

(declare-fun array_inv!5127 (array!12258) Bool)

(assert (=> b!234287 (= e!161938 (array_inv!5127 (buf!5861 bs!63)))))

(assert (= (and start!49654 res!195960) b!234286))

(assert (= start!49654 b!234287))

(declare-fun m!356933 () Bool)

(assert (=> start!49654 m!356933))

(declare-fun m!356935 () Bool)

(assert (=> b!234286 m!356935))

(declare-fun m!356937 () Bool)

(assert (=> b!234287 m!356937))

(push 1)

(assert (not b!234287))

(assert (not b!234286))

(assert (not start!49654))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

