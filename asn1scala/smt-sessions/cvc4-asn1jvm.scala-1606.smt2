; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45656 () Bool)

(assert start!45656)

(declare-fun res!185902 () Bool)

(declare-fun e!149873 () Bool)

(assert (=> start!45656 (=> (not res!185902) (not e!149873))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45656 (= res!185902 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45656 e!149873))

(assert (=> start!45656 true))

(declare-datatypes ((array!10769 0))(
  ( (array!10770 (arr!5658 (Array (_ BitVec 32) (_ BitVec 8))) (size!4728 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8564 0))(
  ( (BitStream!8565 (buf!5275 array!10769) (currentByte!9911 (_ BitVec 32)) (currentBit!9906 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8564)

(declare-fun e!149874 () Bool)

(declare-fun inv!12 (BitStream!8564) Bool)

(assert (=> start!45656 (and (inv!12 bs!62) e!149874)))

(declare-fun b!220687 () Bool)

(declare-fun res!185903 () Bool)

(assert (=> b!220687 (=> (not res!185903) (not e!149873))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220687 (= res!185903 (validate_offset_bits!1 ((_ sign_extend 32) (size!4728 (buf!5275 bs!62))) ((_ sign_extend 32) (currentByte!9911 bs!62)) ((_ sign_extend 32) (currentBit!9906 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220688 () Bool)

(assert (=> b!220688 (= e!149873 (and (not (= #b00000000000000000000000000000000 (bvand i!541 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!541) #b10000000000000000000000000000000)))))))

(declare-fun b!220689 () Bool)

(declare-fun array_inv!4469 (array!10769) Bool)

(assert (=> b!220689 (= e!149874 (array_inv!4469 (buf!5275 bs!62)))))

(assert (= (and start!45656 res!185902) b!220687))

(assert (= (and b!220687 res!185903) b!220688))

(assert (= start!45656 b!220689))

(declare-fun m!339385 () Bool)

(assert (=> start!45656 m!339385))

(declare-fun m!339387 () Bool)

(assert (=> b!220687 m!339387))

(declare-fun m!339389 () Bool)

(assert (=> b!220689 m!339389))

(push 1)

(assert (not start!45656))

(assert (not b!220687))

(assert (not b!220689))

(check-sat)

(pop 1)

(push 1)

(check-sat)

