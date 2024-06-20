; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49676 () Bool)

(assert start!49676)

(declare-fun res!195989 () Bool)

(declare-fun e!161992 () Bool)

(assert (=> start!49676 (=> (not res!195989) (not e!161992))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!49676 (= res!195989 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!49676 e!161992))

(assert (=> start!49676 true))

(declare-datatypes ((array!12272 0))(
  ( (array!12273 (arr!6379 (Array (_ BitVec 32) (_ BitVec 8))) (size!5392 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9748 0))(
  ( (BitStream!9749 (buf!5867 array!12272) (currentByte!10922 (_ BitVec 32)) (currentBit!10917 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9748)

(declare-fun e!161993 () Bool)

(declare-fun inv!12 (BitStream!9748) Bool)

(assert (=> start!49676 (and (inv!12 bs!63) e!161993)))

(declare-fun b!234333 () Bool)

(declare-fun res!195990 () Bool)

(assert (=> b!234333 (=> (not res!195990) (not e!161992))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!234333 (= res!195990 (validate_offset_bits!1 ((_ sign_extend 32) (size!5392 (buf!5867 bs!63))) ((_ sign_extend 32) (currentByte!10922 bs!63)) ((_ sign_extend 32) (currentBit!10917 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!234334 () Bool)

(assert (=> b!234334 (= e!161992 (or (bvsgt #b00000000000000000000000000000000 (bvsub nBits!274 i!546)) (bvsgt (bvsub nBits!274 i!546) #b00000000000000000000000001000000)))))

(declare-fun b!234335 () Bool)

(declare-fun array_inv!5133 (array!12272) Bool)

(assert (=> b!234335 (= e!161993 (array_inv!5133 (buf!5867 bs!63)))))

(assert (= (and start!49676 res!195989) b!234333))

(assert (= (and b!234333 res!195990) b!234334))

(assert (= start!49676 b!234335))

(declare-fun m!356971 () Bool)

(assert (=> start!49676 m!356971))

(declare-fun m!356973 () Bool)

(assert (=> b!234333 m!356973))

(declare-fun m!356975 () Bool)

(assert (=> b!234335 m!356975))

(push 1)

(assert (not b!234335))

(assert (not b!234333))

(assert (not start!49676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

