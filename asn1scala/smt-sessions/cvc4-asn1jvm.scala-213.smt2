; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4274 () Bool)

(assert start!4274)

(declare-fun res!15539 () Bool)

(declare-fun e!11313 () Bool)

(assert (=> start!4274 (=> (not res!15539) (not e!11313))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4274 (= res!15539 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4274 e!11313))

(assert (=> start!4274 true))

(declare-datatypes ((array!1173 0))(
  ( (array!1174 (arr!927 (Array (_ BitVec 32) (_ BitVec 8))) (size!498 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!866 0))(
  ( (BitStream!867 (buf!816 array!1173) (currentByte!2025 (_ BitVec 32)) (currentBit!2020 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!866)

(declare-fun e!11311 () Bool)

(declare-fun inv!12 (BitStream!866) Bool)

(assert (=> start!4274 (and (inv!12 thiss!1917) e!11311)))

(declare-fun b!17613 () Bool)

(declare-fun res!15538 () Bool)

(assert (=> b!17613 (=> (not res!15538) (not e!11313))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!17613 (= res!15538 (validate_offset_bits!1 ((_ sign_extend 32) (size!498 (buf!816 thiss!1917))) ((_ sign_extend 32) (currentByte!2025 thiss!1917)) ((_ sign_extend 32) (currentBit!2020 thiss!1917)) nBits!604))))

(declare-fun b!17614 () Bool)

(declare-datatypes ((tuple2!2058 0))(
  ( (tuple2!2059 (_1!1093 array!1173) (_2!1093 BitStream!866)) )
))
(declare-fun lt!25375 () tuple2!2058)

(assert (=> b!17614 (= e!11313 (not (or (not (= (currentByte!2025 thiss!1917) (size!498 (buf!816 (_2!1093 lt!25375))))) (= (currentBit!2020 (_2!1093 lt!25375)) #b00000000000000000000000000000000))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!17614 (invariant!0 (currentBit!2020 (_2!1093 lt!25375)) (currentByte!2025 (_2!1093 lt!25375)) (size!498 (buf!816 (_2!1093 lt!25375))))))

(declare-fun readBits!0 (BitStream!866 (_ BitVec 64)) tuple2!2058)

(assert (=> b!17614 (= lt!25375 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!17615 () Bool)

(declare-fun array_inv!468 (array!1173) Bool)

(assert (=> b!17615 (= e!11311 (array_inv!468 (buf!816 thiss!1917)))))

(assert (= (and start!4274 res!15539) b!17613))

(assert (= (and b!17613 res!15538) b!17614))

(assert (= start!4274 b!17615))

(declare-fun m!23937 () Bool)

(assert (=> start!4274 m!23937))

(declare-fun m!23939 () Bool)

(assert (=> b!17613 m!23939))

(declare-fun m!23941 () Bool)

(assert (=> b!17614 m!23941))

(declare-fun m!23943 () Bool)

(assert (=> b!17614 m!23943))

(declare-fun m!23945 () Bool)

(assert (=> b!17615 m!23945))

(push 1)

(assert (not b!17613))

(assert (not b!17614))

(assert (not start!4274))

(assert (not b!17615))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!5792 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5792 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!498 (buf!816 thiss!1917))) ((_ sign_extend 32) (currentByte!2025 thiss!1917)) ((_ sign_extend 32) (currentBit!2020 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!498 (buf!816 thiss!1917))) ((_ sign_extend 32) (currentByte!2025 thiss!1917)) ((_ sign_extend 32) (currentBit!2020 thiss!1917))) nBits!604))))

(declare-fun bs!1657 () Bool)

(assert (= bs!1657 d!5792))

(declare-fun m!23949 () Bool)

(assert (=> bs!1657 m!23949))

(assert (=> b!17613 d!5792))

(declare-fun d!5798 () Bool)

(assert (=> d!5798 (= (invariant!0 (currentBit!2020 (_2!1093 lt!25375)) (currentByte!2025 (_2!1093 lt!25375)) (size!498 (buf!816 (_2!1093 lt!25375)))) (and (bvsge (currentBit!2020 (_2!1093 lt!25375)) #b00000000000000000000000000000000) (bvslt (currentBit!2020 (_2!1093 lt!25375)) #b00000000000000000000000000001000) (bvsge (currentByte!2025 (_2!1093 lt!25375)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2025 (_2!1093 lt!25375)) (size!498 (buf!816 (_2!1093 lt!25375)))) (and (= (currentBit!2020 (_2!1093 lt!25375)) #b00000000000000000000000000000000) (= (currentByte!2025 (_2!1093 lt!25375)) (size!498 (buf!816 (_2!1093 lt!25375))))))))))

(assert (=> b!17614 d!5798))

(declare-fun b!17646 () Bool)

(declare-fun lt!25433 () tuple2!2058)

(declare-fun e!11321 () Bool)

(declare-datatypes ((List!193 0))(
  ( (Nil!190) (Cons!189 (h!308 Bool) (t!943 List!193)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!866 array!1173 (_ BitVec 64) (_ BitVec 64)) List!193)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!866 BitStream!866 (_ BitVec 64)) List!193)

(assert (=> b!17646 (= e!11321 (= (byteArrayBitContentToList!0 (_2!1093 lt!25433) (_1!1093 lt!25433) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1093 lt!25433) thiss!1917 nBits!604)))))

(declare-fun b!17647 () Bool)

(declare-fun res!15571 () Bool)

(assert (=> b!17647 (=> (not res!15571) (not e!11321))))

(declare-fun lt!25441 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!17647 (= res!15571 (= (bvadd lt!25441 nBits!604) (bitIndex!0 (size!498 (buf!816 (_2!1093 lt!25433))) (currentByte!2025 (_2!1093 lt!25433)) (currentBit!2020 (_2!1093 lt!25433)))))))

(assert (=> b!17647 (or (not (= (bvand lt!25441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!25441 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!25441 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17647 (= lt!25441 (bitIndex!0 (size!498 (buf!816 thiss!1917)) (currentByte!2025 thiss!1917) (currentBit!2020 thiss!1917)))))

(declare-fun b!17648 () Bool)

(declare-fun res!15572 () Bool)

(assert (=> b!17648 (=> (not res!15572) (not e!11321))))

(assert (=> b!17648 (= res!15572 (bvsle (currentByte!2025 thiss!1917) (currentByte!2025 (_2!1093 lt!25433))))))

(declare-fun b!17649 () Bool)

(declare-fun res!15570 () Bool)

(assert (=> b!17649 (=> (not res!15570) (not e!11321))))

(declare-fun lt!25435 () (_ BitVec 64))

(assert (=> b!17649 (= res!15570 (= (size!498 (_1!1093 lt!25433)) ((_ extract 31 0) lt!25435)))))

(assert (=> b!17649 (and (bvslt lt!25435 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!25435 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!25430 () (_ BitVec 64))

(declare-fun lt!25444 () (_ BitVec 64))

(assert (=> b!17649 (= lt!25435 (bvsdiv lt!25430 lt!25444))))

(assert (=> b!17649 (and (not (= lt!25444 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!25430 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!25444 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!17649 (= lt!25444 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!25443 () (_ BitVec 64))

(declare-fun lt!25442 () (_ BitVec 64))

(assert (=> b!17649 (= lt!25430 (bvsub lt!25443 lt!25442))))

(assert (=> b!17649 (or (= (bvand lt!25443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25442 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!25443 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!25443 lt!25442) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17649 (= lt!25442 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!25439 () (_ BitVec 64))

(assert (=> b!17649 (= lt!25443 (bvadd nBits!604 lt!25439))))

(assert (=> b!17649 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!25439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!25439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!17649 (= lt!25439 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!17650 () Bool)

(declare-fun res!15576 () Bool)

(assert (=> b!17650 (=> (not res!15576) (not e!11321))))

(assert (=> b!17650 (= res!15576 (invariant!0 (currentBit!2020 (_2!1093 lt!25433)) (currentByte!2025 (_2!1093 lt!25433)) (size!498 (buf!816 (_2!1093 lt!25433)))))))

(declare-fun d!5806 () Bool)

(assert (=> d!5806 e!11321))

(declare-fun res!15573 () Bool)

(assert (=> d!5806 (=> (not res!15573) (not e!11321))))

(assert (=> d!5806 (= res!15573 (= (buf!816 (_2!1093 lt!25433)) (buf!816 thiss!1917)))))

(declare-datatypes ((Unit!1582 0))(
  ( (Unit!1583) )
))
(declare-datatypes ((tuple3!120 0))(
  ( (tuple3!121 (_1!1096 Unit!1582) (_2!1096 BitStream!866) (_3!66 array!1173)) )
))
(declare-fun lt!25431 () tuple3!120)

(assert (=> d!5806 (= lt!25433 (tuple2!2059 (_3!66 lt!25431) (_2!1096 lt!25431)))))

(declare-fun readBitsLoop!0 (BitStream!866 (_ BitVec 64) array!1173 (_ BitVec 64) (_ BitVec 64)) tuple3!120)

(assert (=> d!5806 (= lt!25431 (readBitsLoop!0 thiss!1917 nBits!604 (array!1174 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5806 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5806 (= (readBits!0 thiss!1917 nBits!604) lt!25433)))

(assert (= (and d!5806 res!15573) b!17647))

(assert (= (and b!17647 res!15571) b!17650))

(assert (= (and b!17650 res!15576) b!17649))

(assert (= (and b!17649 res!15570) b!17648))

(assert (= (and b!17648 res!15572) b!17646))

(declare-fun m!23953 () Bool)

(assert (=> b!17646 m!23953))

(declare-fun m!23959 () Bool)

(assert (=> b!17646 m!23959))

(declare-fun m!23965 () Bool)

(assert (=> b!17647 m!23965))

(declare-fun m!23971 () Bool)

(assert (=> b!17647 m!23971))

(declare-fun m!23979 () Bool)

(assert (=> b!17650 m!23979))

(declare-fun m!23985 () Bool)

(assert (=> d!5806 m!23985))

(assert (=> b!17614 d!5806))

(declare-fun d!5811 () Bool)

(assert (=> d!5811 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2020 thiss!1917) (currentByte!2025 thiss!1917) (size!498 (buf!816 thiss!1917))))))

(declare-fun bs!1660 () Bool)

(assert (= bs!1660 d!5811))

(declare-fun m!23991 () Bool)

(assert (=> bs!1660 m!23991))

(assert (=> start!4274 d!5811))

(declare-fun d!5816 () Bool)

(assert (=> d!5816 (= (array_inv!468 (buf!816 thiss!1917)) (bvsge (size!498 (buf!816 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!17615 d!5816))

(push 1)

(assert (not b!17647))

(assert (not b!17650))

(assert (not b!17646))

(assert (not d!5792))

(assert (not d!5806))

(assert (not d!5811))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

