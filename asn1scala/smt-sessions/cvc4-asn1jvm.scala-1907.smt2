; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50016 () Bool)

(assert start!50016)

(declare-fun res!196565 () Bool)

(declare-fun e!162487 () Bool)

(assert (=> start!50016 (=> (not res!196565) (not e!162487))))

(declare-fun i!546 () (_ BitVec 32))

(declare-fun nBits!274 () (_ BitVec 32))

(assert (=> start!50016 (= res!196565 (and (bvsle #b00000000000000000000000000000000 i!546) (bvslt i!546 nBits!274) (bvsle nBits!274 #b00000000000000000000000001000000)))))

(assert (=> start!50016 e!162487))

(assert (=> start!50016 true))

(declare-datatypes ((array!12345 0))(
  ( (array!12346 (arr!6408 (Array (_ BitVec 32) (_ BitVec 8))) (size!5421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9806 0))(
  ( (BitStream!9807 (buf!5896 array!12345) (currentByte!10987 (_ BitVec 32)) (currentBit!10982 (_ BitVec 32))) )
))
(declare-fun bs!63 () BitStream!9806)

(declare-fun e!162488 () Bool)

(declare-fun inv!12 (BitStream!9806) Bool)

(assert (=> start!50016 (and (inv!12 bs!63) e!162488)))

(declare-fun b!235038 () Bool)

(declare-fun res!196566 () Bool)

(assert (=> b!235038 (=> (not res!196566) (not e!162487))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235038 (= res!196566 (validate_offset_bits!1 ((_ sign_extend 32) (size!5421 (buf!5896 bs!63))) ((_ sign_extend 32) (currentByte!10987 bs!63)) ((_ sign_extend 32) (currentBit!10982 bs!63)) ((_ sign_extend 32) (bvsub nBits!274 i!546))))))

(declare-fun b!235039 () Bool)

(assert (=> b!235039 (= e!162487 (and (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand i!546 #b10000000000000000000000000000000))) (not (= (bvand nBits!274 #b10000000000000000000000000000000) (bvand (bvsub nBits!274 i!546) #b10000000000000000000000000000000)))))))

(declare-fun b!235040 () Bool)

(declare-fun array_inv!5162 (array!12345) Bool)

(assert (=> b!235040 (= e!162488 (array_inv!5162 (buf!5896 bs!63)))))

(assert (= (and start!50016 res!196565) b!235038))

(assert (= (and b!235038 res!196566) b!235039))

(assert (= start!50016 b!235040))

(declare-fun m!357679 () Bool)

(assert (=> start!50016 m!357679))

(declare-fun m!357681 () Bool)

(assert (=> b!235038 m!357681))

(declare-fun m!357683 () Bool)

(assert (=> b!235040 m!357683))

(push 1)

(assert (not b!235040))

(assert (not start!50016))

(assert (not b!235038))

(check-sat)

(pop 1)

(push 1)

(check-sat)

