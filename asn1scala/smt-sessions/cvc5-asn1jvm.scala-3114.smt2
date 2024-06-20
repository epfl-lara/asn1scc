; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71582 () Bool)

(assert start!71582)

(declare-fun res!264064 () Bool)

(declare-fun e!231834 () Bool)

(assert (=> start!71582 (=> (not res!264064) (not e!231834))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!71582 (= res!264064 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!71582 e!231834))

(assert (=> start!71582 true))

(declare-datatypes ((array!20482 0))(
  ( (array!20483 (arr!10009 (Array (_ BitVec 32) (_ BitVec 8))) (size!8917 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13996 0))(
  ( (BitStream!13997 (buf!8059 array!20482) (currentByte!14858 (_ BitVec 32)) (currentBit!14853 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13996)

(declare-fun e!231833 () Bool)

(declare-fun inv!12 (BitStream!13996) Bool)

(assert (=> start!71582 (and (inv!12 thiss!1793) e!231833)))

(declare-fun b!321692 () Bool)

(declare-fun res!264063 () Bool)

(assert (=> b!321692 (=> (not res!264063) (not e!231834))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321692 (= res!264063 (validate_offset_bits!1 ((_ sign_extend 32) (size!8917 (buf!8059 thiss!1793))) ((_ sign_extend 32) (currentByte!14858 thiss!1793)) ((_ sign_extend 32) (currentBit!14853 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!321693 () Bool)

(assert (=> b!321693 (= e!231834 (bvsgt #b00000000000000000000000000000000 (bvsub #b00000000000000000000000001000000 i!743)))))

(declare-fun b!321694 () Bool)

(declare-fun array_inv!8469 (array!20482) Bool)

(assert (=> b!321694 (= e!231833 (array_inv!8469 (buf!8059 thiss!1793)))))

(assert (= (and start!71582 res!264064) b!321692))

(assert (= (and b!321692 res!264063) b!321693))

(assert (= start!71582 b!321694))

(declare-fun m!460041 () Bool)

(assert (=> start!71582 m!460041))

(declare-fun m!460043 () Bool)

(assert (=> b!321692 m!460043))

(declare-fun m!460045 () Bool)

(assert (=> b!321694 m!460045))

(push 1)

(assert (not b!321692))

(assert (not start!71582))

(assert (not b!321694))

(check-sat)

(pop 1)

(push 1)

(check-sat)

