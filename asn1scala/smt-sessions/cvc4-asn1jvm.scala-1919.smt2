; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50206 () Bool)

(assert start!50206)

(declare-fun res!197073 () Bool)

(declare-fun e!162970 () Bool)

(assert (=> start!50206 (=> (not res!197073) (not e!162970))))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50206 (= res!197073 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50206 e!162970))

(assert (=> start!50206 true))

(declare-datatypes ((array!12424 0))(
  ( (array!12425 (arr!6444 (Array (_ BitVec 32) (_ BitVec 8))) (size!5457 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9878 0))(
  ( (BitStream!9879 (buf!5932 array!12424) (currentByte!11041 (_ BitVec 32)) (currentBit!11036 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9878)

(declare-fun e!162969 () Bool)

(declare-fun inv!12 (BitStream!9878) Bool)

(assert (=> start!50206 (and (inv!12 thiss!1848) e!162969)))

(declare-fun b!235746 () Bool)

(declare-fun res!197072 () Bool)

(assert (=> b!235746 (=> (not res!197072) (not e!162970))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235746 (= res!197072 (validate_offset_bits!1 ((_ sign_extend 32) (size!5457 (buf!5932 thiss!1848))) ((_ sign_extend 32) (currentByte!11041 thiss!1848)) ((_ sign_extend 32) (currentBit!11036 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235747 () Bool)

(assert (=> b!235747 (= e!162970 (bvsgt (bvsub nBits!593 i!756) #b00000000000000000000000001000000))))

(declare-fun b!235748 () Bool)

(declare-fun array_inv!5198 (array!12424) Bool)

(assert (=> b!235748 (= e!162969 (array_inv!5198 (buf!5932 thiss!1848)))))

(assert (= (and start!50206 res!197073) b!235746))

(assert (= (and b!235746 res!197072) b!235747))

(assert (= start!50206 b!235748))

(declare-fun m!358425 () Bool)

(assert (=> start!50206 m!358425))

(declare-fun m!358427 () Bool)

(assert (=> b!235746 m!358427))

(declare-fun m!358429 () Bool)

(assert (=> b!235748 m!358429))

(push 1)

(assert (not start!50206))

(assert (not b!235746))

(assert (not b!235748))

(check-sat)

(pop 1)

(push 1)

(check-sat)

