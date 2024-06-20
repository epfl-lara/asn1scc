; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71584 () Bool)

(assert start!71584)

(declare-fun res!264070 () Bool)

(declare-fun e!231841 () Bool)

(assert (=> start!71584 (=> (not res!264070) (not e!231841))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71584 (= res!264070 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71584 e!231841))

(assert (=> start!71584 true))

(declare-datatypes ((array!20484 0))(
  ( (array!20485 (arr!10010 (Array (_ BitVec 32) (_ BitVec 8))) (size!8918 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13998 0))(
  ( (BitStream!13999 (buf!8060 array!20484) (currentByte!14859 (_ BitVec 32)) (currentBit!14854 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13998)

(declare-fun e!231842 () Bool)

(declare-fun inv!12 (BitStream!13998) Bool)

(assert (=> start!71584 (and (inv!12 thiss!1793) e!231842)))

(declare-fun b!321701 () Bool)

(declare-fun res!264069 () Bool)

(assert (=> b!321701 (=> (not res!264069) (not e!231841))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321701 (= res!264069 (validate_offset_bits!1 ((_ sign_extend 32) (size!8918 (buf!8060 thiss!1793))) ((_ sign_extend 32) (currentByte!14859 thiss!1793)) ((_ sign_extend 32) (currentBit!14854 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321702 () Bool)

(assert (=> b!321702 (= e!231841 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!743)))))

(declare-fun b!321703 () Bool)

(declare-fun array_inv!8470 (array!20484) Bool)

(assert (=> b!321703 (= e!231842 (array_inv!8470 (buf!8060 thiss!1793)))))

(assert (= (and start!71584 res!264070) b!321701))

(assert (= (and b!321701 res!264069) b!321702))

(assert (= start!71584 b!321703))

(declare-fun m!460047 () Bool)

(assert (=> start!71584 m!460047))

(declare-fun m!460049 () Bool)

(assert (=> b!321701 m!460049))

(declare-fun m!460051 () Bool)

(assert (=> b!321703 m!460051))

(check-sat (not b!321703) (not b!321701) (not start!71584))
(check-sat)
