; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50360 () Bool)

(assert start!50360)

(declare-fun b!236112 () Bool)

(declare-fun res!197339 () Bool)

(declare-fun e!163268 () Bool)

(assert (=> b!236112 (=> (not res!197339) (not e!163268))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236112 (= res!197339 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!236113 () Bool)

(assert (=> b!236113 (= e!163268 false)))

(declare-fun lt!371562 () (_ BitVec 64))

(declare-datatypes ((array!12502 0))(
  ( (array!12503 (arr!6478 (Array (_ BitVec 32) (_ BitVec 8))) (size!5491 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9946 0))(
  ( (BitStream!9947 (buf!5966 array!12502) (currentByte!11089 (_ BitVec 32)) (currentBit!11084 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9946)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!236113 (= lt!371562 (bitIndex!0 (size!5491 (buf!5966 thiss!1830)) (currentByte!11089 thiss!1830) (currentBit!11084 thiss!1830)))))

(declare-fun b!236114 () Bool)

(declare-fun res!197338 () Bool)

(assert (=> b!236114 (=> (not res!197338) (not e!163268))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!236114 (= res!197338 (= nBits!581 i!752))))

(declare-fun b!236115 () Bool)

(declare-fun e!163266 () Bool)

(declare-fun array_inv!5232 (array!12502) Bool)

(assert (=> b!236115 (= e!163266 (array_inv!5232 (buf!5966 thiss!1830)))))

(declare-fun res!197336 () Bool)

(assert (=> start!50360 (=> (not res!197336) (not e!163268))))

(assert (=> start!50360 (= res!197336 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50360 e!163268))

(assert (=> start!50360 true))

(declare-fun inv!12 (BitStream!9946) Bool)

(assert (=> start!50360 (and (inv!12 thiss!1830) e!163266)))

(declare-fun b!236116 () Bool)

(declare-fun res!197340 () Bool)

(assert (=> b!236116 (=> (not res!197340) (not e!163268))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!236116 (= res!197340 (validate_offset_bits!1 ((_ sign_extend 32) (size!5491 (buf!5966 thiss!1830))) ((_ sign_extend 32) (currentByte!11089 thiss!1830)) ((_ sign_extend 32) (currentBit!11084 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun b!236117 () Bool)

(declare-fun res!197337 () Bool)

(assert (=> b!236117 (=> (not res!197337) (not e!163268))))

(assert (=> b!236117 (= res!197337 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!50360 res!197336) b!236116))

(assert (= (and b!236116 res!197340) b!236117))

(assert (= (and b!236117 res!197337) b!236112))

(assert (= (and b!236112 res!197339) b!236114))

(assert (= (and b!236114 res!197338) b!236113))

(assert (= start!50360 b!236115))

(declare-fun m!358701 () Bool)

(assert (=> b!236117 m!358701))

(declare-fun m!358703 () Bool)

(assert (=> b!236113 m!358703))

(declare-fun m!358705 () Bool)

(assert (=> b!236112 m!358705))

(declare-fun m!358707 () Bool)

(assert (=> b!236115 m!358707))

(declare-fun m!358709 () Bool)

(assert (=> start!50360 m!358709))

(declare-fun m!358711 () Bool)

(assert (=> b!236116 m!358711))

(push 1)

(assert (not b!236112))

(assert (not start!50360))

(assert (not b!236116))

(assert (not b!236117))

(assert (not b!236113))

(assert (not b!236115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

