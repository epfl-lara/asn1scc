; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71534 () Bool)

(assert start!71534)

(declare-fun res!264018 () Bool)

(declare-fun e!231715 () Bool)

(assert (=> start!71534 (=> (not res!264018) (not e!231715))))

(declare-fun i!747 () (_ BitVec 32))

(declare-fun nBits!568 () (_ BitVec 32))

(assert (=> start!71534 (= res!264018 (and (bvsle #b00000000000000000000000000000000 i!747) (bvsle i!747 nBits!568) (bvsle nBits!568 #b00000000000000000000000001000000)))))

(assert (=> start!71534 e!231715))

(assert (=> start!71534 true))

(declare-datatypes ((array!20448 0))(
  ( (array!20449 (arr!9994 (Array (_ BitVec 32) (_ BitVec 8))) (size!8902 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13966 0))(
  ( (BitStream!13967 (buf!8044 array!20448) (currentByte!14841 (_ BitVec 32)) (currentBit!14836 (_ BitVec 32))) )
))
(declare-fun thiss!1811 () BitStream!13966)

(declare-fun e!231717 () Bool)

(declare-fun inv!12 (BitStream!13966) Bool)

(assert (=> start!71534 (and (inv!12 thiss!1811) e!231717)))

(declare-fun b!321602 () Bool)

(declare-fun res!264019 () Bool)

(assert (=> b!321602 (=> (not res!264019) (not e!231715))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!321602 (= res!264019 (validate_offset_bits!1 ((_ sign_extend 32) (size!8902 (buf!8044 thiss!1811))) ((_ sign_extend 32) (currentByte!14841 thiss!1811)) ((_ sign_extend 32) (currentBit!14836 thiss!1811)) ((_ sign_extend 32) (bvsub nBits!568 i!747))))))

(declare-fun b!321603 () Bool)

(assert (=> b!321603 (= e!231715 (and (not (= #b00000000000000000000000000000000 (bvand i!747 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!747) #b10000000000000000000000000000000)))))))

(declare-fun b!321604 () Bool)

(declare-fun array_inv!8454 (array!20448) Bool)

(assert (=> b!321604 (= e!231717 (array_inv!8454 (buf!8044 thiss!1811)))))

(assert (= (and start!71534 res!264018) b!321602))

(assert (= (and b!321602 res!264019) b!321603))

(assert (= start!71534 b!321604))

(declare-fun m!459957 () Bool)

(assert (=> start!71534 m!459957))

(declare-fun m!459959 () Bool)

(assert (=> b!321602 m!459959))

(declare-fun m!459961 () Bool)

(assert (=> b!321604 m!459961))

(push 1)

(assert (not b!321602))

(assert (not start!71534))

(assert (not b!321604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

