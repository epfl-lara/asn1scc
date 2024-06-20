; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50212 () Bool)

(assert start!50212)

(declare-fun b!235783 () Bool)

(declare-fun e!162996 () Bool)

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> b!235783 (= e!162996 (bvsgt #b00000000000000000000000000000000 nBits!593))))

(declare-fun res!197098 () Bool)

(assert (=> start!50212 (=> (not res!197098) (not e!162996))))

(declare-fun i!756 () (_ BitVec 32))

(assert (=> start!50212 (= res!197098 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50212 e!162996))

(assert (=> start!50212 true))

(declare-datatypes ((array!12430 0))(
  ( (array!12431 (arr!6447 (Array (_ BitVec 32) (_ BitVec 8))) (size!5460 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9884 0))(
  ( (BitStream!9885 (buf!5935 array!12430) (currentByte!11044 (_ BitVec 32)) (currentBit!11039 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9884)

(declare-fun e!162998 () Bool)

(declare-fun inv!12 (BitStream!9884) Bool)

(assert (=> start!50212 (and (inv!12 thiss!1848) e!162998)))

(declare-fun b!235781 () Bool)

(declare-fun res!197100 () Bool)

(assert (=> b!235781 (=> (not res!197100) (not e!162996))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235781 (= res!197100 (validate_offset_bits!1 ((_ sign_extend 32) (size!5460 (buf!5935 thiss!1848))) ((_ sign_extend 32) (currentByte!11044 thiss!1848)) ((_ sign_extend 32) (currentBit!11039 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235784 () Bool)

(declare-fun array_inv!5201 (array!12430) Bool)

(assert (=> b!235784 (= e!162998 (array_inv!5201 (buf!5935 thiss!1848)))))

(declare-fun b!235782 () Bool)

(declare-fun res!197099 () Bool)

(assert (=> b!235782 (=> (not res!197099) (not e!162996))))

(declare-fun acc!174 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235782 (= res!197099 (= (bvand acc!174 (onesLSBLong!0 (bvsub nBits!593 i!756))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50212 res!197098) b!235781))

(assert (= (and b!235781 res!197100) b!235782))

(assert (= (and b!235782 res!197099) b!235783))

(assert (= start!50212 b!235784))

(declare-fun m!358447 () Bool)

(assert (=> start!50212 m!358447))

(declare-fun m!358449 () Bool)

(assert (=> b!235781 m!358449))

(declare-fun m!358451 () Bool)

(assert (=> b!235784 m!358451))

(declare-fun m!358453 () Bool)

(assert (=> b!235782 m!358453))

(push 1)

(assert (not b!235782))

(assert (not b!235781))

(assert (not b!235784))

(assert (not start!50212))

(check-sat)

(pop 1)

(push 1)

(check-sat)

