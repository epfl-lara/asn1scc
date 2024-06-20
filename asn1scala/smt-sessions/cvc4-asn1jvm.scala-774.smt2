; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22318 () Bool)

(assert start!22318)

(declare-fun b!112834 () Bool)

(declare-fun e!74030 () Bool)

(declare-datatypes ((array!5109 0))(
  ( (array!5110 (arr!2915 (Array (_ BitVec 32) (_ BitVec 8))) (size!2322 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4118 0))(
  ( (BitStream!4119 (buf!2730 array!5109) (currentByte!5304 (_ BitVec 32)) (currentBit!5299 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4118)

(declare-fun array_inv!2124 (array!5109) Bool)

(assert (=> b!112834 (= e!74030 (array_inv!2124 (buf!2730 thiss!1305)))))

(declare-fun b!112831 () Bool)

(declare-fun res!93166 () Bool)

(declare-fun e!74031 () Bool)

(assert (=> b!112831 (=> (not res!93166) (not e!74031))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!112831 (= res!93166 (validate_offset_bits!1 ((_ sign_extend 32) (size!2322 (buf!2730 thiss!1305))) ((_ sign_extend 32) (currentByte!5304 thiss!1305)) ((_ sign_extend 32) (currentBit!5299 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!112832 () Bool)

(declare-fun res!93167 () Bool)

(assert (=> b!112832 (=> (not res!93167) (not e!74031))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!112832 (= res!93167 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!112833 () Bool)

(assert (=> b!112833 (= e!74031 (and (bvslt i!615 nBits!396) (not (= (bvand nBits!396 #b10000000000000000000000000000000) #b00000000000000000000000000000000)) (not (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 #b00000000000000000000000000000001) #b10000000000000000000000000000000)))))))

(declare-fun res!93165 () Bool)

(assert (=> start!22318 (=> (not res!93165) (not e!74031))))

(assert (=> start!22318 (= res!93165 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22318 e!74031))

(assert (=> start!22318 true))

(declare-fun inv!12 (BitStream!4118) Bool)

(assert (=> start!22318 (and (inv!12 thiss!1305) e!74030)))

(assert (= (and start!22318 res!93165) b!112831))

(assert (= (and b!112831 res!93166) b!112832))

(assert (= (and b!112832 res!93167) b!112833))

(assert (= start!22318 b!112834))

(declare-fun m!168929 () Bool)

(assert (=> b!112834 m!168929))

(declare-fun m!168931 () Bool)

(assert (=> b!112831 m!168931))

(declare-fun m!168933 () Bool)

(assert (=> b!112832 m!168933))

(declare-fun m!168935 () Bool)

(assert (=> start!22318 m!168935))

(push 1)

(assert (not start!22318))

(assert (not b!112831))

(assert (not b!112832))

(assert (not b!112834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

