; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4520 () Bool)

(assert start!4520)

(declare-fun res!16163 () Bool)

(declare-fun e!11786 () Bool)

(assert (=> start!4520 (=> (not res!16163) (not e!11786))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4520 (= res!16163 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4520 e!11786))

(assert (=> start!4520 true))

(declare-datatypes ((array!1224 0))(
  ( (array!1225 (arr!957 (Array (_ BitVec 32) (_ BitVec 8))) (size!516 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!902 0))(
  ( (BitStream!903 (buf!834 array!1224) (currentByte!2085 (_ BitVec 32)) (currentBit!2080 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!902)

(declare-fun e!11784 () Bool)

(declare-fun inv!12 (BitStream!902) Bool)

(assert (=> start!4520 (and (inv!12 thiss!1917) e!11784)))

(declare-fun b!18435 () Bool)

(declare-fun e!11787 () Bool)

(assert (=> b!18435 (= e!11786 (not e!11787))))

(declare-fun res!16161 () Bool)

(assert (=> b!18435 (=> res!16161 e!11787)))

(declare-datatypes ((tuple2!2130 0))(
  ( (tuple2!2131 (_1!1144 array!1224) (_2!1144 BitStream!902)) )
))
(declare-fun lt!26680 () tuple2!2130)

(assert (=> b!18435 (= res!16161 (= (currentByte!2085 thiss!1917) (size!516 (buf!834 (_2!1144 lt!26680)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18435 (invariant!0 (currentBit!2080 (_2!1144 lt!26680)) (currentByte!2085 (_2!1144 lt!26680)) (size!516 (buf!834 (_2!1144 lt!26680))))))

(declare-fun readBits!0 (BitStream!902 (_ BitVec 64)) tuple2!2130)

(assert (=> b!18435 (= lt!26680 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!18437 () Bool)

(declare-fun array_inv!486 (array!1224) Bool)

(assert (=> b!18437 (= e!11784 (array_inv!486 (buf!834 thiss!1917)))))

(declare-fun b!18436 () Bool)

(assert (=> b!18436 (= e!11787 (inv!12 (BitStream!903 (buf!834 (_2!1144 lt!26680)) (currentByte!2085 thiss!1917) (currentBit!2080 thiss!1917))))))

(declare-fun b!18434 () Bool)

(declare-fun res!16162 () Bool)

(assert (=> b!18434 (=> (not res!16162) (not e!11786))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18434 (= res!16162 (validate_offset_bits!1 ((_ sign_extend 32) (size!516 (buf!834 thiss!1917))) ((_ sign_extend 32) (currentByte!2085 thiss!1917)) ((_ sign_extend 32) (currentBit!2080 thiss!1917)) nBits!604))))

(assert (= (and start!4520 res!16163) b!18434))

(assert (= (and b!18434 res!16162) b!18435))

(assert (= (and b!18435 (not res!16161)) b!18436))

(assert (= start!4520 b!18437))

(declare-fun m!24835 () Bool)

(assert (=> b!18436 m!24835))

(declare-fun m!24837 () Bool)

(assert (=> b!18435 m!24837))

(declare-fun m!24839 () Bool)

(assert (=> b!18435 m!24839))

(declare-fun m!24841 () Bool)

(assert (=> start!4520 m!24841))

(declare-fun m!24843 () Bool)

(assert (=> b!18437 m!24843))

(declare-fun m!24845 () Bool)

(assert (=> b!18434 m!24845))

(push 1)

(assert (not start!4520))

(assert (not b!18436))

(assert (not b!18437))

(assert (not b!18435))

(assert (not b!18434))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6086 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6086 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!516 (buf!834 thiss!1917))) ((_ sign_extend 32) (currentByte!2085 thiss!1917)) ((_ sign_extend 32) (currentBit!2080 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!516 (buf!834 thiss!1917))) ((_ sign_extend 32) (currentByte!2085 thiss!1917)) ((_ sign_extend 32) (currentBit!2080 thiss!1917))) nBits!604))))

(declare-fun bs!1714 () Bool)

(assert (= bs!1714 d!6086))

(declare-fun m!24849 () Bool)

(assert (=> bs!1714 m!24849))

(assert (=> b!18434 d!6086))

(declare-fun d!6092 () Bool)

(assert (=> d!6092 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2080 thiss!1917) (currentByte!2085 thiss!1917) (size!516 (buf!834 thiss!1917))))))

(declare-fun bs!1717 () Bool)

(assert (= bs!1717 d!6092))

(declare-fun m!24855 () Bool)

(assert (=> bs!1717 m!24855))

(assert (=> start!4520 d!6092))

(declare-fun d!6098 () Bool)

(assert (=> d!6098 (= (array_inv!486 (buf!834 thiss!1917)) (bvsge (size!516 (buf!834 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18437 d!6098))

(declare-fun d!6102 () Bool)

(assert (=> d!6102 (= (invariant!0 (currentBit!2080 (_2!1144 lt!26680)) (currentByte!2085 (_2!1144 lt!26680)) (size!516 (buf!834 (_2!1144 lt!26680)))) (and (bvsge (currentBit!2080 (_2!1144 lt!26680)) #b00000000000000000000000000000000) (bvslt (currentBit!2080 (_2!1144 lt!26680)) #b00000000000000000000000000001000) (bvsge (currentByte!2085 (_2!1144 lt!26680)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2085 (_2!1144 lt!26680)) (size!516 (buf!834 (_2!1144 lt!26680)))) (and (= (currentBit!2080 (_2!1144 lt!26680)) #b00000000000000000000000000000000) (= (currentByte!2085 (_2!1144 lt!26680)) (size!516 (buf!834 (_2!1144 lt!26680))))))))))

(assert (=> b!18435 d!6102))

(declare-fun b!18473 () Bool)

(declare-fun res!16198 () Bool)

(declare-fun e!11795 () Bool)

(assert (=> b!18473 (=> (not res!16198) (not e!11795))))

(declare-fun lt!26758 () tuple2!2130)

(assert (=> b!18473 (= res!16198 (invariant!0 (currentBit!2080 (_2!1144 lt!26758)) (currentByte!2085 (_2!1144 lt!26758)) (size!516 (buf!834 (_2!1144 lt!26758)))))))

(declare-fun d!6110 () Bool)

(assert (=> d!6110 e!11795))

(declare-fun res!16204 () Bool)

(assert (=> d!6110 (=> (not res!16204) (not e!11795))))

(assert (=> d!6110 (= res!16204 (= (buf!834 (_2!1144 lt!26758)) (buf!834 thiss!1917)))))

(declare-datatypes ((Unit!1634 0))(
  ( (Unit!1635) )
))
(declare-datatypes ((tuple3!148 0))(
  ( (tuple3!149 (_1!1146 Unit!1634) (_2!1146 BitStream!902) (_3!80 array!1224)) )
))
(declare-fun lt!26753 () tuple3!148)

(assert (=> d!6110 (= lt!26758 (tuple2!2131 (_3!80 lt!26753) (_2!1146 lt!26753)))))

(declare-fun readBitsLoop!0 (BitStream!902 (_ BitVec 64) array!1224 (_ BitVec 64) (_ BitVec 64)) tuple3!148)

(assert (=> d!6110 (= lt!26753 (readBitsLoop!0 thiss!1917 nBits!604 (array!1225 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6110 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6110 (= (readBits!0 thiss!1917 nBits!604) lt!26758)))

(declare-fun b!18474 () Bool)

(declare-datatypes ((List!208 0))(
  ( (Nil!205) (Cons!204 (h!323 Bool) (t!958 List!208)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!902 array!1224 (_ BitVec 64) (_ BitVec 64)) List!208)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!902 BitStream!902 (_ BitVec 64)) List!208)

(assert (=> b!18474 (= e!11795 (= (byteArrayBitContentToList!0 (_2!1144 lt!26758) (_1!1144 lt!26758) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1144 lt!26758) thiss!1917 nBits!604)))))

(declare-fun b!18475 () Bool)

(declare-fun res!16200 () Bool)

(assert (=> b!18475 (=> (not res!16200) (not e!11795))))

(declare-fun lt!26735 () (_ BitVec 64))

(assert (=> b!18475 (= res!16200 (= (size!516 (_1!1144 lt!26758)) ((_ extract 31 0) lt!26735)))))

(assert (=> b!18475 (and (bvslt lt!26735 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26735 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26736 () (_ BitVec 64))

(declare-fun lt!26756 () (_ BitVec 64))

(assert (=> b!18475 (= lt!26735 (bvsdiv lt!26736 lt!26756))))

(assert (=> b!18475 (and (not (= lt!26756 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26736 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26756 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18475 (= lt!26756 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26749 () (_ BitVec 64))

(declare-fun lt!26747 () (_ BitVec 64))

(assert (=> b!18475 (= lt!26736 (bvsub lt!26749 lt!26747))))

(assert (=> b!18475 (or (= (bvand lt!26749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26749 lt!26747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18475 (= lt!26747 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26737 () (_ BitVec 64))

(assert (=> b!18475 (= lt!26749 (bvadd nBits!604 lt!26737))))

(assert (=> b!18475 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26737 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26737) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18475 (= lt!26737 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18476 () Bool)

(declare-fun res!16205 () Bool)

(assert (=> b!18476 (=> (not res!16205) (not e!11795))))

(assert (=> b!18476 (= res!16205 (bvsle (currentByte!2085 thiss!1917) (currentByte!2085 (_2!1144 lt!26758))))))

(declare-fun b!18477 () Bool)

(declare-fun res!16202 () Bool)

(assert (=> b!18477 (=> (not res!16202) (not e!11795))))

(declare-fun lt!26751 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18477 (= res!16202 (= (bvadd lt!26751 nBits!604) (bitIndex!0 (size!516 (buf!834 (_2!1144 lt!26758))) (currentByte!2085 (_2!1144 lt!26758)) (currentBit!2080 (_2!1144 lt!26758)))))))

(assert (=> b!18477 (or (not (= (bvand lt!26751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26751 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18477 (= lt!26751 (bitIndex!0 (size!516 (buf!834 thiss!1917)) (currentByte!2085 thiss!1917) (currentBit!2080 thiss!1917)))))

(assert (= (and d!6110 res!16204) b!18477))

(assert (= (and b!18477 res!16202) b!18473))

(assert (= (and b!18473 res!16198) b!18475))

(assert (= (and b!18475 res!16200) b!18476))

(assert (= (and b!18476 res!16205) b!18474))

(declare-fun m!24863 () Bool)

(assert (=> b!18473 m!24863))

(declare-fun m!24869 () Bool)

(assert (=> d!6110 m!24869))

(declare-fun m!24873 () Bool)

(assert (=> b!18474 m!24873))

(declare-fun m!24879 () Bool)

(assert (=> b!18474 m!24879))

(declare-fun m!24885 () Bool)

(assert (=> b!18477 m!24885))

(declare-fun m!24893 () Bool)

(assert (=> b!18477 m!24893))

(assert (=> b!18435 d!6110))

(declare-fun d!6115 () Bool)

(assert (=> d!6115 (= (inv!12 (BitStream!903 (buf!834 (_2!1144 lt!26680)) (currentByte!2085 thiss!1917) (currentBit!2080 thiss!1917))) (invariant!0 (currentBit!2080 (BitStream!903 (buf!834 (_2!1144 lt!26680)) (currentByte!2085 thiss!1917) (currentBit!2080 thiss!1917))) (currentByte!2085 (BitStream!903 (buf!834 (_2!1144 lt!26680)) (currentByte!2085 thiss!1917) (currentBit!2080 thiss!1917))) (size!516 (buf!834 (BitStream!903 (buf!834 (_2!1144 lt!26680)) (currentByte!2085 thiss!1917) (currentBit!2080 thiss!1917))))))))

(declare-fun bs!1721 () Bool)

(assert (= bs!1721 d!6115))

(declare-fun m!24899 () Bool)

(assert (=> bs!1721 m!24899))

(assert (=> b!18436 d!6115))

(push 1)

