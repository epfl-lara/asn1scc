; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50224 () Bool)

(assert start!50224)

(declare-fun res!197117 () Bool)

(declare-fun e!163024 () Bool)

(assert (=> start!50224 (=> (not res!197117) (not e!163024))))

(declare-fun i!756 () (_ BitVec 32))

(declare-fun nBits!593 () (_ BitVec 32))

(assert (=> start!50224 (= res!197117 (and (bvsle #b00000000000000000000000000000000 i!756) (bvsle i!756 nBits!593) (bvsle nBits!593 #b00000000000000000000000001000000)))))

(assert (=> start!50224 e!163024))

(assert (=> start!50224 true))

(declare-datatypes ((array!12436 0))(
  ( (array!12437 (arr!6450 (Array (_ BitVec 32) (_ BitVec 8))) (size!5463 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9890 0))(
  ( (BitStream!9891 (buf!5938 array!12436) (currentByte!11047 (_ BitVec 32)) (currentBit!11042 (_ BitVec 32))) )
))
(declare-fun thiss!1848 () BitStream!9890)

(declare-fun e!163023 () Bool)

(declare-fun inv!12 (BitStream!9890) Bool)

(assert (=> start!50224 (and (inv!12 thiss!1848) e!163023)))

(declare-fun b!235809 () Bool)

(declare-fun res!197118 () Bool)

(assert (=> b!235809 (=> (not res!197118) (not e!163024))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235809 (= res!197118 (validate_offset_bits!1 ((_ sign_extend 32) (size!5463 (buf!5938 thiss!1848))) ((_ sign_extend 32) (currentByte!11047 thiss!1848)) ((_ sign_extend 32) (currentBit!11042 thiss!1848)) ((_ sign_extend 32) (bvsub nBits!593 i!756))))))

(declare-fun b!235810 () Bool)

(assert (=> b!235810 (= e!163024 (and (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand i!756 #b10000000000000000000000000000000))) (not (= (bvand nBits!593 #b10000000000000000000000000000000) (bvand (bvsub nBits!593 i!756) #b10000000000000000000000000000000)))))))

(declare-fun b!235811 () Bool)

(declare-fun array_inv!5204 (array!12436) Bool)

(assert (=> b!235811 (= e!163023 (array_inv!5204 (buf!5938 thiss!1848)))))

(assert (= (and start!50224 res!197117) b!235809))

(assert (= (and b!235809 res!197118) b!235810))

(assert (= start!50224 b!235811))

(declare-fun m!358467 () Bool)

(assert (=> start!50224 m!358467))

(declare-fun m!358469 () Bool)

(assert (=> b!235809 m!358469))

(declare-fun m!358471 () Bool)

(assert (=> b!235811 m!358471))

(push 1)

(assert (not b!235809))

(assert (not b!235811))

(assert (not start!50224))

(check-sat)

(pop 1)

(push 1)

(check-sat)

