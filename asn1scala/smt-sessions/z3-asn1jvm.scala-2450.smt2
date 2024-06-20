; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62150 () Bool)

(assert start!62150)

(declare-fun res!231487 () Bool)

(declare-fun e!198609 () Bool)

(assert (=> start!62150 (=> (not res!231487) (not e!198609))))

(declare-fun from!822 () (_ BitVec 64))

(declare-datatypes ((array!16071 0))(
  ( (array!16072 (arr!7952 (Array (_ BitVec 32) (_ BitVec 8))) (size!6956 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!16071)

(declare-fun a2!699 () array!16071)

(declare-fun to!789 () (_ BitVec 64))

(assert (=> start!62150 (= res!231487 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6956 a1!699) (size!6956 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6956 a1!699))))))))

(assert (=> start!62150 e!198609))

(assert (=> start!62150 true))

(declare-fun array_inv!6680 (array!16071) Bool)

(assert (=> start!62150 (array_inv!6680 a1!699)))

(assert (=> start!62150 (array_inv!6680 a2!699)))

(declare-fun b!278784 () Bool)

(declare-fun res!231488 () Bool)

(assert (=> b!278784 (=> (not res!231488) (not e!198609))))

(declare-fun arrayBitRangesEq!0 (array!16071 array!16071 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!278784 (= res!231488 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!278785 () Bool)

(assert (=> b!278785 (= e!198609 (and (bvslt from!822 to!789) (bvslt (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(assert (= (and start!62150 res!231487) b!278784))

(assert (= (and b!278784 res!231488) b!278785))

(declare-fun m!411913 () Bool)

(assert (=> start!62150 m!411913))

(declare-fun m!411915 () Bool)

(assert (=> start!62150 m!411915))

(declare-fun m!411917 () Bool)

(assert (=> b!278784 m!411917))

(check-sat (not start!62150) (not b!278784))
(check-sat)
