; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22324 () Bool)

(assert start!22324)

(declare-fun b!112870 () Bool)

(declare-fun e!74056 () Bool)

(declare-datatypes ((array!5115 0))(
  ( (array!5116 (arr!2918 (Array (_ BitVec 32) (_ BitVec 8))) (size!2325 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4124 0))(
  ( (BitStream!4125 (buf!2733 array!5115) (currentByte!5307 (_ BitVec 32)) (currentBit!5302 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4124)

(declare-fun array_inv!2127 (array!5115) Bool)

(assert (=> b!112870 (= e!74056 (array_inv!2127 (buf!2733 thiss!1305)))))

(declare-fun b!112868 () Bool)

(declare-fun res!93192 () Bool)

(declare-fun e!74058 () Bool)

(assert (=> b!112868 (=> (not res!93192) (not e!74058))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112868 (= res!93192 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun res!93193 () Bool)

(assert (=> start!22324 (=> (not res!93193) (not e!74058))))

(declare-fun i!615 () (_ BitVec 32))

(assert (=> start!22324 (= res!93193 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22324 e!74058))

(assert (=> start!22324 true))

(declare-fun inv!12 (BitStream!4124) Bool)

(assert (=> start!22324 (and (inv!12 thiss!1305) e!74056)))

(declare-fun b!112867 () Bool)

(declare-fun res!93194 () Bool)

(assert (=> b!112867 (=> (not res!93194) (not e!74058))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112867 (= res!93194 (validate_offset_bits!1 ((_ sign_extend 32) (size!2325 (buf!2733 thiss!1305))) ((_ sign_extend 32) (currentByte!5307 thiss!1305)) ((_ sign_extend 32) (currentBit!5302 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112869 () Bool)

(assert (=> b!112869 (= e!74058 (and (bvslt i!615 nBits!396) (let ((bdg!5564 (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (and (not (= bdg!5564 (bvand i!615 #b10000000000000000000000000000000))) (not (= bdg!5564 (bvand (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615) #b10000000000000000000000000000000)))))))))

(assert (= (and start!22324 res!93193) b!112867))

(assert (= (and b!112867 res!93194) b!112868))

(assert (= (and b!112868 res!93192) b!112869))

(assert (= start!22324 b!112870))

(declare-fun m!168953 () Bool)

(assert (=> b!112870 m!168953))

(declare-fun m!168955 () Bool)

(assert (=> b!112868 m!168955))

(declare-fun m!168957 () Bool)

(assert (=> start!22324 m!168957))

(declare-fun m!168959 () Bool)

(assert (=> b!112867 m!168959))

(push 1)

(assert (not start!22324))

(assert (not b!112867))

(assert (not b!112868))

(assert (not b!112870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

