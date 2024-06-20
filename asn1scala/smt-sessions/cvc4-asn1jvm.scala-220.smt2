; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4556 () Bool)

(assert start!4556)

(declare-fun b!18531 () Bool)

(declare-fun e!11848 () Bool)

(declare-datatypes ((array!1233 0))(
  ( (array!1234 (arr!960 (Array (_ BitVec 32) (_ BitVec 8))) (size!519 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!908 0))(
  ( (BitStream!909 (buf!837 array!1233) (currentByte!2094 (_ BitVec 32)) (currentBit!2089 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!908)

(declare-fun array_inv!489 (array!1233) Bool)

(assert (=> b!18531 (= e!11848 (array_inv!489 (buf!837 thiss!1917)))))

(declare-fun b!18532 () Bool)

(declare-fun res!16251 () Bool)

(declare-fun e!11846 () Bool)

(assert (=> b!18532 (=> (not res!16251) (not e!11846))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18532 (= res!16251 (validate_offset_bits!1 ((_ sign_extend 32) (size!519 (buf!837 thiss!1917))) ((_ sign_extend 32) (currentByte!2094 thiss!1917)) ((_ sign_extend 32) (currentBit!2089 thiss!1917)) nBits!604))))

(declare-fun b!18533 () Bool)

(declare-fun e!11847 () Bool)

(declare-datatypes ((tuple2!2136 0))(
  ( (tuple2!2137 (_1!1150 array!1233) (_2!1150 BitStream!908)) )
))
(declare-fun lt!26770 () tuple2!2136)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18533 (= e!11847 (invariant!0 (currentBit!2089 thiss!1917) (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770)))))))

(declare-fun b!18534 () Bool)

(assert (=> b!18534 (= e!11846 (not (= thiss!1917 (BitStream!909 (buf!837 (_2!1150 lt!26770)) (currentByte!2094 thiss!1917) (currentBit!2089 thiss!1917)))))))

(declare-fun e!11850 () Bool)

(assert (=> b!18534 e!11850))

(declare-fun res!16253 () Bool)

(assert (=> b!18534 (=> (not res!16253) (not e!11850))))

(assert (=> b!18534 (= res!16253 (invariant!0 (currentBit!2089 (_2!1150 lt!26770)) (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770)))))))

(declare-fun readBits!0 (BitStream!908 (_ BitVec 64)) tuple2!2136)

(assert (=> b!18534 (= lt!26770 (readBits!0 thiss!1917 nBits!604))))

(declare-fun res!16250 () Bool)

(assert (=> start!4556 (=> (not res!16250) (not e!11846))))

(assert (=> start!4556 (= res!16250 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4556 e!11846))

(assert (=> start!4556 true))

(declare-fun inv!12 (BitStream!908) Bool)

(assert (=> start!4556 (and (inv!12 thiss!1917) e!11848)))

(declare-fun b!18535 () Bool)

(declare-fun e!11849 () Bool)

(assert (=> b!18535 (= e!11849 e!11847)))

(declare-fun res!16249 () Bool)

(assert (=> b!18535 (=> (not res!16249) (not e!11847))))

(assert (=> b!18535 (= res!16249 (and (= (currentBit!2089 (_2!1150 lt!26770)) #b00000000000000000000000000000000) (= (currentBit!2089 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun b!18536 () Bool)

(assert (=> b!18536 (= e!11850 e!11849)))

(declare-fun res!16252 () Bool)

(assert (=> b!18536 (=> res!16252 e!11849)))

(assert (=> b!18536 (= res!16252 (not (= (currentByte!2094 thiss!1917) (size!519 (buf!837 (_2!1150 lt!26770))))))))

(assert (= (and start!4556 res!16250) b!18532))

(assert (= (and b!18532 res!16251) b!18534))

(assert (= (and b!18534 res!16253) b!18536))

(assert (= (and b!18536 (not res!16252)) b!18535))

(assert (= (and b!18535 res!16249) b!18533))

(assert (= start!4556 b!18531))

(declare-fun m!24925 () Bool)

(assert (=> b!18533 m!24925))

(declare-fun m!24927 () Bool)

(assert (=> start!4556 m!24927))

(declare-fun m!24929 () Bool)

(assert (=> b!18531 m!24929))

(declare-fun m!24931 () Bool)

(assert (=> b!18532 m!24931))

(declare-fun m!24933 () Bool)

(assert (=> b!18534 m!24933))

(declare-fun m!24935 () Bool)

(assert (=> b!18534 m!24935))

(push 1)

(assert (not start!4556))

(assert (not b!18532))

(assert (not b!18533))

(assert (not b!18534))

(assert (not b!18531))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6136 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6136 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!519 (buf!837 thiss!1917))) ((_ sign_extend 32) (currentByte!2094 thiss!1917)) ((_ sign_extend 32) (currentBit!2089 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!519 (buf!837 thiss!1917))) ((_ sign_extend 32) (currentByte!2094 thiss!1917)) ((_ sign_extend 32) (currentBit!2089 thiss!1917))) nBits!604))))

(declare-fun bs!1727 () Bool)

(assert (= bs!1727 d!6136))

(declare-fun m!24941 () Bool)

(assert (=> bs!1727 m!24941))

(assert (=> b!18532 d!6136))

(declare-fun d!6140 () Bool)

(assert (=> d!6140 (= (array_inv!489 (buf!837 thiss!1917)) (bvsge (size!519 (buf!837 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18531 d!6140))

(declare-fun d!6144 () Bool)

(assert (=> d!6144 (= (invariant!0 (currentBit!2089 thiss!1917) (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770)))) (and (bvsge (currentBit!2089 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2089 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2094 (_2!1150 lt!26770)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770)))) (and (= (currentBit!2089 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770))))))))))

(assert (=> b!18533 d!6144))

(declare-fun d!6148 () Bool)

(assert (=> d!6148 (= (invariant!0 (currentBit!2089 (_2!1150 lt!26770)) (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770)))) (and (bvsge (currentBit!2089 (_2!1150 lt!26770)) #b00000000000000000000000000000000) (bvslt (currentBit!2089 (_2!1150 lt!26770)) #b00000000000000000000000000001000) (bvsge (currentByte!2094 (_2!1150 lt!26770)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770)))) (and (= (currentBit!2089 (_2!1150 lt!26770)) #b00000000000000000000000000000000) (= (currentByte!2094 (_2!1150 lt!26770)) (size!519 (buf!837 (_2!1150 lt!26770))))))))))

(assert (=> b!18534 d!6148))

(declare-fun b!18577 () Bool)

(declare-fun res!16295 () Bool)

(declare-fun e!11859 () Bool)

(assert (=> b!18577 (=> (not res!16295) (not e!11859))))

(declare-fun lt!26843 () tuple2!2136)

(declare-fun lt!26849 () (_ BitVec 64))

(assert (=> b!18577 (= res!16295 (= (size!519 (_1!1150 lt!26843)) ((_ extract 31 0) lt!26849)))))

(assert (=> b!18577 (and (bvslt lt!26849 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26849 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26850 () (_ BitVec 64))

(declare-fun lt!26851 () (_ BitVec 64))

(assert (=> b!18577 (= lt!26849 (bvsdiv lt!26850 lt!26851))))

(assert (=> b!18577 (and (not (= lt!26851 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26850 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26851 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18577 (= lt!26851 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26847 () (_ BitVec 64))

(declare-fun lt!26848 () (_ BitVec 64))

(assert (=> b!18577 (= lt!26850 (bvsub lt!26847 lt!26848))))

(assert (=> b!18577 (or (= (bvand lt!26847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26848 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26847 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26847 lt!26848) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18577 (= lt!26848 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26844 () (_ BitVec 64))

(assert (=> b!18577 (= lt!26847 (bvadd nBits!604 lt!26844))))

(assert (=> b!18577 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26844 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26844) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18577 (= lt!26844 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18578 () Bool)

(declare-fun res!16296 () Bool)

(assert (=> b!18578 (=> (not res!16296) (not e!11859))))

(assert (=> b!18578 (= res!16296 (invariant!0 (currentBit!2089 (_2!1150 lt!26843)) (currentByte!2094 (_2!1150 lt!26843)) (size!519 (buf!837 (_2!1150 lt!26843)))))))

(declare-fun b!18579 () Bool)

(declare-fun res!16294 () Bool)

(assert (=> b!18579 (=> (not res!16294) (not e!11859))))

(declare-fun lt!26846 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18579 (= res!16294 (= (bvadd lt!26846 nBits!604) (bitIndex!0 (size!519 (buf!837 (_2!1150 lt!26843))) (currentByte!2094 (_2!1150 lt!26843)) (currentBit!2089 (_2!1150 lt!26843)))))))

(assert (=> b!18579 (or (not (= (bvand lt!26846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26846 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18579 (= lt!26846 (bitIndex!0 (size!519 (buf!837 thiss!1917)) (currentByte!2094 thiss!1917) (currentBit!2089 thiss!1917)))))

(declare-fun b!18580 () Bool)

(declare-datatypes ((List!212 0))(
  ( (Nil!209) (Cons!208 (h!327 Bool) (t!962 List!212)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!908 array!1233 (_ BitVec 64) (_ BitVec 64)) List!212)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!908 BitStream!908 (_ BitVec 64)) List!212)

(assert (=> b!18580 (= e!11859 (= (byteArrayBitContentToList!0 (_2!1150 lt!26843) (_1!1150 lt!26843) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1150 lt!26843) thiss!1917 nBits!604)))))

(declare-fun d!6150 () Bool)

(assert (=> d!6150 e!11859))

(declare-fun res!16298 () Bool)

(assert (=> d!6150 (=> (not res!16298) (not e!11859))))

(assert (=> d!6150 (= res!16298 (= (buf!837 (_2!1150 lt!26843)) (buf!837 thiss!1917)))))

(declare-datatypes ((Unit!1642 0))(
  ( (Unit!1643) )
))
(declare-datatypes ((tuple3!156 0))(
  ( (tuple3!157 (_1!1153 Unit!1642) (_2!1153 BitStream!908) (_3!84 array!1233)) )
))
(declare-fun lt!26845 () tuple3!156)

(assert (=> d!6150 (= lt!26843 (tuple2!2137 (_3!84 lt!26845) (_2!1153 lt!26845)))))

(declare-fun readBitsLoop!0 (BitStream!908 (_ BitVec 64) array!1233 (_ BitVec 64) (_ BitVec 64)) tuple3!156)

(assert (=> d!6150 (= lt!26845 (readBitsLoop!0 thiss!1917 nBits!604 (array!1234 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6150 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6150 (= (readBits!0 thiss!1917 nBits!604) lt!26843)))

(declare-fun b!18581 () Bool)

(declare-fun res!16297 () Bool)

(assert (=> b!18581 (=> (not res!16297) (not e!11859))))

(assert (=> b!18581 (= res!16297 (bvsle (currentByte!2094 thiss!1917) (currentByte!2094 (_2!1150 lt!26843))))))

(assert (= (and d!6150 res!16298) b!18579))

(assert (= (and b!18579 res!16294) b!18578))

(assert (= (and b!18578 res!16296) b!18577))

(assert (= (and b!18577 res!16295) b!18581))

(assert (= (and b!18581 res!16297) b!18580))

(declare-fun m!24971 () Bool)

(assert (=> b!18578 m!24971))

(declare-fun m!24973 () Bool)

(assert (=> b!18579 m!24973))

(declare-fun m!24975 () Bool)

(assert (=> b!18579 m!24975))

(declare-fun m!24977 () Bool)

(assert (=> b!18580 m!24977))

(declare-fun m!24979 () Bool)

(assert (=> b!18580 m!24979))

(declare-fun m!24981 () Bool)

(assert (=> d!6150 m!24981))

(assert (=> b!18534 d!6150))

(declare-fun d!6156 () Bool)

(assert (=> d!6156 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2089 thiss!1917) (currentByte!2094 thiss!1917) (size!519 (buf!837 thiss!1917))))))

(declare-fun bs!1730 () Bool)

(assert (= bs!1730 d!6156))

(declare-fun m!24983 () Bool)

(assert (=> bs!1730 m!24983))

(assert (=> start!4556 d!6156))

(push 1)

(assert (not d!6156))

(assert (not b!18578))

(assert (not d!6136))

(assert (not b!18580))

(assert (not b!18579))

(assert (not d!6150))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

