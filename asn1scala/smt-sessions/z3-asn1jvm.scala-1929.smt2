; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50284 () Bool)

(assert start!50284)

(declare-fun b!235968 () Bool)

(declare-fun res!197220 () Bool)

(declare-fun e!163186 () Bool)

(assert (=> b!235968 (=> (not res!197220) (not e!163186))))

(declare-datatypes ((array!12480 0))(
  ( (array!12481 (arr!6470 (Array (_ BitVec 32) (_ BitVec 8))) (size!5483 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9930 0))(
  ( (BitStream!9931 (buf!5958 array!12480) (currentByte!11069 (_ BitVec 32)) (currentBit!11064 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!9930)

(declare-fun i!752 () (_ BitVec 32))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!235968 (= res!197220 (validate_offset_bits!1 ((_ sign_extend 32) (size!5483 (buf!5958 thiss!1830))) ((_ sign_extend 32) (currentByte!11069 thiss!1830)) ((_ sign_extend 32) (currentBit!11064 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun res!197216 () Bool)

(assert (=> start!50284 (=> (not res!197216) (not e!163186))))

(assert (=> start!50284 (= res!197216 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50284 e!163186))

(assert (=> start!50284 true))

(declare-fun e!163187 () Bool)

(declare-fun inv!12 (BitStream!9930) Bool)

(assert (=> start!50284 (and (inv!12 thiss!1830) e!163187)))

(declare-fun b!235969 () Bool)

(declare-fun res!197217 () Bool)

(assert (=> b!235969 (=> (not res!197217) (not e!163186))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!235969 (= res!197217 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!235970 () Bool)

(declare-fun array_inv!5224 (array!12480) Bool)

(assert (=> b!235970 (= e!163187 (array_inv!5224 (buf!5958 thiss!1830)))))

(declare-fun b!235971 () Bool)

(declare-fun res!197219 () Bool)

(assert (=> b!235971 (=> (not res!197219) (not e!163186))))

(assert (=> b!235971 (= res!197219 (= nBits!581 i!752))))

(declare-fun b!235972 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!235972 (= e!163186 (not (invariant!0 (currentBit!11064 thiss!1830) (currentByte!11069 thiss!1830) (size!5483 (buf!5958 thiss!1830)))))))

(declare-fun b!235973 () Bool)

(declare-fun res!197218 () Bool)

(assert (=> b!235973 (=> (not res!197218) (not e!163186))))

(assert (=> b!235973 (= res!197218 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50284 res!197216) b!235968))

(assert (= (and b!235968 res!197220) b!235969))

(assert (= (and b!235969 res!197217) b!235973))

(assert (= (and b!235973 res!197218) b!235971))

(assert (= (and b!235971 res!197219) b!235972))

(assert (= start!50284 b!235970))

(declare-fun m!358593 () Bool)

(assert (=> b!235968 m!358593))

(declare-fun m!358595 () Bool)

(assert (=> b!235973 m!358595))

(declare-fun m!358597 () Bool)

(assert (=> b!235972 m!358597))

(declare-fun m!358599 () Bool)

(assert (=> b!235970 m!358599))

(declare-fun m!358601 () Bool)

(assert (=> start!50284 m!358601))

(declare-fun m!358603 () Bool)

(assert (=> b!235969 m!358603))

(check-sat (not b!235972) (not start!50284) (not b!235968) (not b!235973) (not b!235970) (not b!235969))
(check-sat)
(get-model)

(declare-fun d!79606 () Bool)

(assert (=> d!79606 (= (onesLSBLong!0 (bvsub nBits!581 i!752)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!581 i!752)))))))

(assert (=> b!235969 d!79606))

(declare-fun d!79608 () Bool)

(assert (=> d!79608 (= (array_inv!5224 (buf!5958 thiss!1830)) (bvsge (size!5483 (buf!5958 thiss!1830)) #b00000000000000000000000000000000))))

(assert (=> b!235970 d!79608))

(declare-fun d!79610 () Bool)

(assert (=> d!79610 (= (invariant!0 (currentBit!11064 thiss!1830) (currentByte!11069 thiss!1830) (size!5483 (buf!5958 thiss!1830))) (and (bvsge (currentBit!11064 thiss!1830) #b00000000000000000000000000000000) (bvslt (currentBit!11064 thiss!1830) #b00000000000000000000000000001000) (bvsge (currentByte!11069 thiss!1830) #b00000000000000000000000000000000) (or (bvslt (currentByte!11069 thiss!1830) (size!5483 (buf!5958 thiss!1830))) (and (= (currentBit!11064 thiss!1830) #b00000000000000000000000000000000) (= (currentByte!11069 thiss!1830) (size!5483 (buf!5958 thiss!1830)))))))))

(assert (=> b!235972 d!79610))

(declare-fun d!79618 () Bool)

(assert (=> d!79618 (= (onesLSBLong!0 nBits!581) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!581))))))

(assert (=> b!235973 d!79618))

(declare-fun d!79620 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!79620 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5483 (buf!5958 thiss!1830))) ((_ sign_extend 32) (currentByte!11069 thiss!1830)) ((_ sign_extend 32) (currentBit!11064 thiss!1830)) ((_ sign_extend 32) (bvsub nBits!581 i!752))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5483 (buf!5958 thiss!1830))) ((_ sign_extend 32) (currentByte!11069 thiss!1830)) ((_ sign_extend 32) (currentBit!11064 thiss!1830))) ((_ sign_extend 32) (bvsub nBits!581 i!752))))))

(declare-fun bs!19874 () Bool)

(assert (= bs!19874 d!79620))

(declare-fun m!358617 () Bool)

(assert (=> bs!19874 m!358617))

(assert (=> b!235968 d!79620))

(declare-fun d!79626 () Bool)

(assert (=> d!79626 (= (inv!12 thiss!1830) (invariant!0 (currentBit!11064 thiss!1830) (currentByte!11069 thiss!1830) (size!5483 (buf!5958 thiss!1830))))))

(declare-fun bs!19876 () Bool)

(assert (= bs!19876 d!79626))

(assert (=> bs!19876 m!358597))

(assert (=> start!50284 d!79626))

(check-sat (not d!79626) (not d!79620))
(check-sat)
