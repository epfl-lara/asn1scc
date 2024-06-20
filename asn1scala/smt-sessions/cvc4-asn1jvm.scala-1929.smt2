; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50286 () Bool)

(assert start!50286)

(declare-fun b!235986 () Bool)

(declare-fun res!197234 () Bool)

(declare-fun e!163195 () Bool)

(assert (=> b!235986 (=> (not res!197234) (not e!163195))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235986 (= res!197234 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(declare-fun b!235987 () Bool)

(declare-fun res!197235 () Bool)

(assert (=> b!235987 (=> (not res!197235) (not e!163195))))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!235987 (= res!197235 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235988 () Bool)

(declare-fun e!163196 () Bool)

(declare-datatypes ((array!12482 0))(
  ( (array!12483 (arr!6471 (Array (_ BitVec 32) (_ BitVec 8))) (size!5484 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9932 0))(
  ( (BitStream!9933 (buf!5959 array!12482) (currentByte!11070 (_ BitVec 32)) (currentBit!11065 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9932)

(declare-fun array_inv!5225 (array!12482) Bool)

(assert (=> b!235988 (= e!163196 (array_inv!5225 (buf!5959 thiss!1830)))))

(declare-fun b!235989 () Bool)

(declare-fun res!197233 () Bool)

(assert (=> b!235989 (=> (not res!197233) (not e!163195))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235989 (= res!197233 (validate_offset_bits!1 ((_ sign_extend 32) (size!5484 (buf!5959 thiss!1830))) ((_ sign_extend 32) (currentByte!11070 thiss!1830)) ((_ sign_extend 32) (currentBit!11065 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!197231 () Bool)

(assert (=> start!50286 (=> (not res!197231) (not e!163195))))

(assert (=> start!50286 (= res!197231 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50286 e!163195))

(assert (=> start!50286 true))

(declare-fun inv!12 (BitStream!9932) Bool)

(assert (=> start!50286 (and (inv!12 thiss!1830) e!163196)))

(declare-fun b!235990 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235990 (= e!163195 (not (invariant!0 (currentBit!11065 thiss!1830) (currentByte!11070 thiss!1830) (size!5484 (buf!5959 thiss!1830)))))))

(declare-fun b!235991 () Bool)

(declare-fun res!197232 () Bool)

(assert (=> b!235991 (=> (not res!197232) (not e!163195))))

(assert (=> b!235991 (= res!197232 (= nBits!581 i!752))))

(assert (= (and start!50286 res!197231) b!235989))

(assert (= (and b!235989 res!197233) b!235987))

(assert (= (and b!235987 res!197235) b!235986))

(assert (= (and b!235986 res!197234) b!235991))

(assert (= (and b!235991 res!197232) b!235990))

(assert (= start!50286 b!235988))

(declare-fun m!358605 () Bool)

(assert (=> start!50286 m!358605))

(declare-fun m!358607 () Bool)

(assert (=> b!235989 m!358607))

(declare-fun m!358609 () Bool)

(assert (=> b!235986 m!358609))

(declare-fun m!358611 () Bool)

(assert (=> b!235988 m!358611))

(declare-fun m!358613 () Bool)

(assert (=> b!235990 m!358613))

(declare-fun m!358615 () Bool)

(assert (=> b!235987 m!358615))

(push 1)

(assert (not b!235988))

(assert (not b!235986))

(assert (not b!235987))

(assert (not start!50286))

(assert (not b!235989))

(assert (not b!235990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!79624 () Bool)

(assert (=> d!79624 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!235986 d!79624))

(declare-fun d!79630 () Bool)

(assert (=> d!79630 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11065 thiss!1830) (currentByte!11070 thiss!1830) (size!5484 (buf!5959 thiss!1830))))))

(declare-fun bs!19878 () Bool)

(assert (= bs!19878 d!79630))

(assert (=> bs!19878 m!358613))

(assert (=> start!50286 d!79630))

(declare-fun d!79634 () Bool)

(assert (=> d!79634 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!235987 d!79634))

(declare-fun d!79636 () Bool)

(assert (=> d!79636 (= (array_inv!5225 (buf!5959 thiss!1830)) (bvsge (size!5484 (buf!5959 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!235988 d!79636))

(declare-fun d!79638 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79638 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5484 (buf!5959 thiss!1830))) ((_ sign_extend 32) (currentByte!11070 thiss!1830)) ((_ sign_extend 32) (currentBit!11065 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5484 (buf!5959 thiss!1830))) ((_ sign_extend 32) (currentByte!11070 thiss!1830)) ((_ sign_extend 32) (currentBit!11065 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19879 () Bool)

(assert (= bs!19879 d!79638))

(declare-fun m!358621 () Bool)

(assert (=> bs!19879 m!358621))

(assert (=> b!235989 d!79638))

(declare-fun d!79640 () Bool)

(assert (=> d!79640 (= (invariant!0 (currentBit!11065 thiss!1830) (currentByte!11070 thiss!1830) (size!5484 (buf!5959 thiss!1830))) (and (bvsge (currentBit!11065 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11065 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11070 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11070 thiss!1830) (size!5484 (buf!5959 thiss!1830))) (and (= (currentBit!11065 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11070 thiss!1830) (size!5484 (buf!5959 thiss!1830)))))))))

