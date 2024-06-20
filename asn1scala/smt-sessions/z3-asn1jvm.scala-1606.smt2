; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45654 () Bool)

(assert start!45654)

(declare-fun res!185897 () Bool)

(declare-fun e!149864 () Bool)

(assert (=> start!45654 (=> (not res!185897) (not e!149864))))

(declare-fun i!541 () (_ BitVec 32))

(declare-fun nBits!265 () (_ BitVec 32))

(assert (=> start!45654 (= res!185897 (and (bvsle #b00000000000000000000000000000000 i!541) (bvslt i!541 nBits!265) (bvsle nBits!265 #b00000000000000000000000001000000)))))

(assert (=> start!45654 e!149864))

(assert (=> start!45654 true))

(declare-datatypes ((array!10767 0))(
  ( (array!10768 (arr!5657 (Array (_ BitVec 32) (_ BitVec 8))) (size!4727 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8562 0))(
  ( (BitStream!8563 (buf!5274 array!10767) (currentByte!9910 (_ BitVec 32)) (currentBit!9905 (_ BitVec 32))) )
))
(declare-fun bs!62 () BitStream!8562)

(declare-fun e!149863 () Bool)

(declare-fun inv!12 (BitStream!8562) Bool)

(assert (=> start!45654 (and (inv!12 bs!62) e!149863)))

(declare-fun b!220678 () Bool)

(declare-fun res!185896 () Bool)

(assert (=> b!220678 (=> (not res!185896) (not e!149864))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!220678 (= res!185896 (validate_offset_bits!1 ((_ sign_extend 32) (size!4727 (buf!5274 bs!62))) ((_ sign_extend 32) (currentByte!9910 bs!62)) ((_ sign_extend 32) (currentBit!9905 bs!62)) ((_ sign_extend 32) (bvsub nBits!265 i!541))))))

(declare-fun b!220679 () Bool)

(assert (=> b!220679 (= e!149864 (and (not (= #b00000000000000000000000000000000 (bvand i!541 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!541) #b10000000000000000000000000000000)))))))

(declare-fun b!220680 () Bool)

(declare-fun array_inv!4468 (array!10767) Bool)

(assert (=> b!220680 (= e!149863 (array_inv!4468 (buf!5274 bs!62)))))

(assert (= (and start!45654 res!185897) b!220678))

(assert (= (and b!220678 res!185896) b!220679))

(assert (= start!45654 b!220680))

(declare-fun m!339379 () Bool)

(assert (=> start!45654 m!339379))

(declare-fun m!339381 () Bool)

(assert (=> b!220678 m!339381))

(declare-fun m!339383 () Bool)

(assert (=> b!220680 m!339383))

(check-sat (not b!220678) (not start!45654) (not b!220680))
(check-sat)
