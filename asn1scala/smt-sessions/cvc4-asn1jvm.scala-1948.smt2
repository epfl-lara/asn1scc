; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50772 () Bool)

(assert start!50772)

(declare-fun b!237408 () Bool)

(declare-fun res!198431 () Bool)

(declare-fun e!164114 () Bool)

(assert (=> b!237408 (=> (not res!198431) (not e!164114))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237408 (= res!198431 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!237409 () Bool)

(declare-fun e!164112 () Bool)

(assert (=> b!237409 (= e!164112 e!164114)))

(declare-fun res!198433 () Bool)

(assert (=> b!237409 (=> (not res!198433) (not e!164114))))

(declare-datatypes ((array!12617 0))(
  ( (array!12618 (arr!6525 (Array (_ BitVec 32) (_ BitVec 8))) (size!5538 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10040 0))(
  ( (BitStream!10041 (buf!6013 array!12617) (currentByte!11193 (_ BitVec 32)) (currentBit!11188 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10040)

(declare-fun lt!372821 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!237409 (= res!198433 (validate_offset_bits!1 ((_ sign_extend 32) (size!5538 (buf!6013 thiss!1830))) ((_ sign_extend 32) (currentByte!11193 thiss!1830)) ((_ sign_extend 32) (currentBit!11188 thiss!1830)) lt!372821))))

(assert (=> b!237409 (= lt!372821 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun b!237410 () Bool)

(declare-fun res!198434 () Bool)

(assert (=> b!237410 (=> (not res!198434) (not e!164114))))

(assert (=> b!237410 (= res!198434 (= nBits!581 i!752))))

(declare-fun b!237411 () Bool)

(declare-fun e!164113 () Bool)

(declare-fun array_inv!5279 (array!12617) Bool)

(assert (=> b!237411 (= e!164113 (array_inv!5279 (buf!6013 thiss!1830)))))

(declare-fun b!237412 () Bool)

(declare-fun lt!372822 () (_ BitVec 64))

(assert (=> b!237412 (= e!164114 (and (= lt!372822 (bvadd lt!372822 lt!372821)) (bvsgt lt!372821 #b0000000000000000000000000000000000000000000000000000000001000000)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!237412 (= lt!372822 (bitIndex!0 (size!5538 (buf!6013 thiss!1830)) (currentByte!11193 thiss!1830) (currentBit!11188 thiss!1830)))))

(declare-fun res!198435 () Bool)

(assert (=> start!50772 (=> (not res!198435) (not e!164112))))

(assert (=> start!50772 (= res!198435 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50772 e!164112))

(assert (=> start!50772 true))

(declare-fun inv!12 (BitStream!10040) Bool)

(assert (=> start!50772 (and (inv!12 thiss!1830) e!164113)))

(declare-fun b!237413 () Bool)

(declare-fun res!198432 () Bool)

(assert (=> b!237413 (=> (not res!198432) (not e!164114))))

(assert (=> b!237413 (= res!198432 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50772 res!198435) b!237409))

(assert (= (and b!237409 res!198433) b!237408))

(assert (= (and b!237408 res!198431) b!237413))

(assert (= (and b!237413 res!198432) b!237410))

(assert (= (and b!237410 res!198434) b!237412))

(assert (= start!50772 b!237411))

(declare-fun m!359871 () Bool)

(assert (=> b!237413 m!359871))

(declare-fun m!359873 () Bool)

(assert (=> b!237409 m!359873))

(declare-fun m!359875 () Bool)

(assert (=> b!237412 m!359875))

(declare-fun m!359877 () Bool)

(assert (=> start!50772 m!359877))

(declare-fun m!359879 () Bool)

(assert (=> b!237411 m!359879))

(declare-fun m!359881 () Bool)

(assert (=> b!237408 m!359881))

(push 1)

(assert (not b!237411))

(assert (not b!237409))

(assert (not b!237408))

(assert (not b!237413))

(assert (not b!237412))

(assert (not start!50772))

(check-sat)

(pop 1)

(push 1)

(check-sat)

