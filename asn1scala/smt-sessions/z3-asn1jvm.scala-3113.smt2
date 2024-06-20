; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71578 () Bool)

(assert start!71578)

(declare-fun res!264051 () Bool)

(declare-fun e!231816 () Bool)

(assert (=> start!71578 (=> (not res!264051) (not e!231816))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(declare-datatypes ((array!20478 0))(
  ( (array!20479 (arr!10007 (Array (_ BitVec 32) (_ BitVec 8))) (size!8915 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13992 0))(
  ( (BitStream!13993 (buf!8057 array!20478) (currentByte!14856 (_ BitVec 32)) (currentBit!14851 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!13992)

(assert (=> start!71578 (= res!264051 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000) (bvsle ((_ sign_extend 32) (size!8915 (buf!8057 thiss!1793))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!14856 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!14851 thiss!1793)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!8915 (buf!8057 thiss!1793))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!14856 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!14851 thiss!1793)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!71578 e!231816))

(assert (=> start!71578 true))

(declare-fun e!231815 () Bool)

(declare-fun inv!12 (BitStream!13992) Bool)

(assert (=> start!71578 (and (inv!12 thiss!1793) e!231815)))

(declare-fun b!321674 () Bool)

(declare-fun res!264052 () Bool)

(assert (=> b!321674 (=> (not res!264052) (not e!231816))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!321674 (= res!264052 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!14851 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!14856 thiss!1793))) ((_ extract 31 0) ((_ sign_extend 32) (size!8915 (buf!8057 thiss!1793))))))))

(declare-fun b!321675 () Bool)

(assert (=> b!321675 (= e!231816 (bvslt ((_ sign_extend 32) (bvsub nBits!548 i!743)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!321676 () Bool)

(declare-fun array_inv!8467 (array!20478) Bool)

(assert (=> b!321676 (= e!231815 (array_inv!8467 (buf!8057 thiss!1793)))))

(assert (= (and start!71578 res!264051) b!321674))

(assert (= (and b!321674 res!264052) b!321675))

(assert (= start!71578 b!321676))

(declare-fun m!460029 () Bool)

(assert (=> start!71578 m!460029))

(declare-fun m!460031 () Bool)

(assert (=> b!321674 m!460031))

(declare-fun m!460033 () Bool)

(assert (=> b!321676 m!460033))

(check-sat (not start!71578) (not b!321676) (not b!321674))
(check-sat)
