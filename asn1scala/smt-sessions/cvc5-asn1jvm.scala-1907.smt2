; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50012 () Bool)

(assert start!50012)

(declare-fun res!196554 () Bool)

(declare-fun e!162470 () Bool)

(assert (=> start!50012 (=> (not res!196554) (not e!162470))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!50012 (= res!196554 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50012 e!162470))

(assert (=> start!50012 true))

(declare-datatypes ((array!12341 0))(
  ( (array!12342 (arr!6406 (Array (_ BitVec 32) (_ BitVec 8))) (size!5419 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9802 0))(
  ( (BitStream!9803 (buf!5894 array!12341) (currentByte!10985 (_ BitVec 32)) (currentBit!10980 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9802)

(declare-fun e!162469 () Bool)

(declare-fun inv!12 (BitStream!9802) Bool)

(assert (=> start!50012 (and (inv!12 bs!63) e!162469)))

(declare-fun b!235020 () Bool)

(declare-fun res!196553 () Bool)

(assert (=> b!235020 (=> (not res!196553) (not e!162470))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235020 (= res!196553 (validate_offset_bits!1 ((_ sign_extend 32) (size!5419 (buf!5894 bs!63))) ((_ sign_extend 32) (currentByte!10985 bs!63)) ((_ sign_extend 32) (currentBit!10980 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235021 () Bool)

(assert (=> b!235021 (= e!162470 (and (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000))) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))))

(declare-fun b!235022 () Bool)

(declare-fun array_inv!5160 (array!12341) Bool)

(assert (=> b!235022 (= e!162469 (array_inv!5160 (buf!5894 bs!63)))))

(assert (= (and start!50012 res!196554) b!235020))

(assert (= (and b!235020 res!196553) b!235021))

(assert (= start!50012 b!235022))

(declare-fun m!357667 () Bool)

(assert (=> start!50012 m!357667))

(declare-fun m!357669 () Bool)

(assert (=> b!235020 m!357669))

(declare-fun m!357671 () Bool)

(assert (=> b!235022 m!357671))

(push 1)

(assert (not b!235022))

(assert (not start!50012))

(assert (not b!235020))

(check-sat)

(pop 1)

(push 1)

(check-sat)

