; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4416 () Bool)

(assert start!4416)

(declare-fun b!18089 () Bool)

(declare-fun e!11595 () Bool)

(declare-fun e!11596 () Bool)

(assert (=> b!18089 (= e!11595 e!11596)))

(declare-fun res!15914 () Bool)

(assert (=> b!18089 (=> (not res!15914) (not e!11596))))

(declare-datatypes ((array!1204 0))(
  ( (array!1205 (arr!944 (Array (_ BitVec 32) (_ BitVec 8))) (size!509 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!888 0))(
  ( (BitStream!889 (buf!827 array!1204) (currentByte!2060 (_ BitVec 32)) (currentBit!2055 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2098 0))(
  ( (tuple2!2099 (_1!1122 array!1204) (_2!1122 BitStream!888)) )
))
(declare-fun lt!26074 () tuple2!2098)

(declare-fun thiss!1917 () BitStream!888)

(assert (=> b!18089 (= res!15914 (and (= (currentBit!2055 (_2!1122 lt!26074)) #b00000000000000000000000000000000) (= (currentBit!2055 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun b!18090 () Bool)

(declare-fun e!11599 () Bool)

(declare-fun array_inv!479 (array!1204) Bool)

(assert (=> b!18090 (= e!11599 (array_inv!479 (buf!827 thiss!1917)))))

(declare-fun b!18092 () Bool)

(declare-fun res!15909 () Bool)

(declare-fun e!11601 () Bool)

(assert (=> b!18092 (=> (not res!15909) (not e!11601))))

(declare-fun nBits!604 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18092 (= res!15909 (validate_offset_bits!1 ((_ sign_extend 32) (size!509 (buf!827 thiss!1917))) ((_ sign_extend 32) (currentByte!2060 thiss!1917)) ((_ sign_extend 32) (currentBit!2055 thiss!1917)) nBits!604))))

(declare-fun b!18093 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18093 (= e!11596 (invariant!0 (currentBit!2055 thiss!1917) (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074)))))))

(declare-fun b!18094 () Bool)

(declare-fun e!11598 () Bool)

(assert (=> b!18094 (= e!11598 e!11595)))

(declare-fun res!15913 () Bool)

(assert (=> b!18094 (=> res!15913 e!11595)))

(assert (=> b!18094 (= res!15913 (not (= (currentByte!2060 thiss!1917) (size!509 (buf!827 (_2!1122 lt!26074))))))))

(declare-fun b!18095 () Bool)

(declare-fun e!11600 () Bool)

(declare-fun inv!12 (BitStream!888) Bool)

(assert (=> b!18095 (= e!11600 (inv!12 (BitStream!889 (buf!827 (_2!1122 lt!26074)) (currentByte!2060 thiss!1917) (currentBit!2055 thiss!1917))))))

(declare-fun res!15911 () Bool)

(assert (=> start!4416 (=> (not res!15911) (not e!11601))))

(assert (=> start!4416 (= res!15911 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4416 e!11601))

(assert (=> start!4416 true))

(assert (=> start!4416 (and (inv!12 thiss!1917) e!11599)))

(declare-fun b!18091 () Bool)

(assert (=> b!18091 (= e!11601 (not e!11600))))

(declare-fun res!15912 () Bool)

(assert (=> b!18091 (=> res!15912 e!11600)))

(assert (=> b!18091 (= res!15912 (not (= (currentByte!2060 thiss!1917) (size!509 (buf!827 (_2!1122 lt!26074))))))))

(assert (=> b!18091 e!11598))

(declare-fun res!15910 () Bool)

(assert (=> b!18091 (=> (not res!15910) (not e!11598))))

(assert (=> b!18091 (= res!15910 (invariant!0 (currentBit!2055 (_2!1122 lt!26074)) (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074)))))))

(declare-fun readBits!0 (BitStream!888 (_ BitVec 64)) tuple2!2098)

(assert (=> b!18091 (= lt!26074 (readBits!0 thiss!1917 nBits!604))))

(assert (= (and start!4416 res!15911) b!18092))

(assert (= (and b!18092 res!15909) b!18091))

(assert (= (and b!18091 res!15910) b!18094))

(assert (= (and b!18094 (not res!15913)) b!18089))

(assert (= (and b!18089 res!15914) b!18093))

(assert (= (and b!18091 (not res!15912)) b!18095))

(assert (= start!4416 b!18090))

(declare-fun m!24429 () Bool)

(assert (=> b!18093 m!24429))

(declare-fun m!24431 () Bool)

(assert (=> b!18090 m!24431))

(declare-fun m!24433 () Bool)

(assert (=> b!18091 m!24433))

(declare-fun m!24435 () Bool)

(assert (=> b!18091 m!24435))

(declare-fun m!24437 () Bool)

(assert (=> b!18095 m!24437))

(declare-fun m!24439 () Bool)

(assert (=> start!4416 m!24439))

(declare-fun m!24441 () Bool)

(assert (=> b!18092 m!24441))

(check-sat (not b!18091) (not b!18090) (not b!18092) (not b!18093) (not b!18095) (not start!4416))
(check-sat)
(get-model)

(declare-fun d!5954 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!5954 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!509 (buf!827 thiss!1917))) ((_ sign_extend 32) (currentByte!2060 thiss!1917)) ((_ sign_extend 32) (currentBit!2055 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!509 (buf!827 thiss!1917))) ((_ sign_extend 32) (currentByte!2060 thiss!1917)) ((_ sign_extend 32) (currentBit!2055 thiss!1917))) nBits!604))))

(declare-fun bs!1690 () Bool)

(assert (= bs!1690 d!5954))

(declare-fun m!24459 () Bool)

(assert (=> bs!1690 m!24459))

(assert (=> b!18092 d!5954))

(declare-fun d!5956 () Bool)

(assert (=> d!5956 (= (invariant!0 (currentBit!2055 (_2!1122 lt!26074)) (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074)))) (and (bvsge (currentBit!2055 (_2!1122 lt!26074)) #b00000000000000000000000000000000) (bvslt (currentBit!2055 (_2!1122 lt!26074)) #b00000000000000000000000000001000) (bvsge (currentByte!2060 (_2!1122 lt!26074)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074)))) (and (= (currentBit!2055 (_2!1122 lt!26074)) #b00000000000000000000000000000000) (= (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074))))))))))

(assert (=> b!18091 d!5956))

(declare-fun b!18152 () Bool)

(declare-fun res!15970 () Bool)

(declare-fun e!11630 () Bool)

(assert (=> b!18152 (=> (not res!15970) (not e!11630))))

(declare-fun lt!26142 () tuple2!2098)

(declare-fun lt!26145 () (_ BitVec 64))

(assert (=> b!18152 (= res!15970 (= (size!509 (_1!1122 lt!26142)) ((_ extract 31 0) lt!26145)))))

(assert (=> b!18152 (and (bvslt lt!26145 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26145 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26147 () (_ BitVec 64))

(declare-fun lt!26141 () (_ BitVec 64))

(assert (=> b!18152 (= lt!26145 (bvsdiv lt!26147 lt!26141))))

(assert (=> b!18152 (and (not (= lt!26141 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26147 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26141 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18152 (= lt!26141 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26143 () (_ BitVec 64))

(declare-fun lt!26148 () (_ BitVec 64))

(assert (=> b!18152 (= lt!26147 (bvsub lt!26143 lt!26148))))

(assert (=> b!18152 (or (= (bvand lt!26143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26148 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26143 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26143 lt!26148) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18152 (= lt!26148 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26146 () (_ BitVec 64))

(assert (=> b!18152 (= lt!26143 (bvadd nBits!604 lt!26146))))

(assert (=> b!18152 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26146 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26146) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18152 (= lt!26146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18153 () Bool)

(declare-fun res!15968 () Bool)

(assert (=> b!18153 (=> (not res!15968) (not e!11630))))

(assert (=> b!18153 (= res!15968 (invariant!0 (currentBit!2055 (_2!1122 lt!26142)) (currentByte!2060 (_2!1122 lt!26142)) (size!509 (buf!827 (_2!1122 lt!26142)))))))

(declare-fun b!18154 () Bool)

(declare-fun res!15971 () Bool)

(assert (=> b!18154 (=> (not res!15971) (not e!11630))))

(declare-fun lt!26149 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18154 (= res!15971 (= (bvadd lt!26149 nBits!604) (bitIndex!0 (size!509 (buf!827 (_2!1122 lt!26142))) (currentByte!2060 (_2!1122 lt!26142)) (currentBit!2055 (_2!1122 lt!26142)))))))

(assert (=> b!18154 (or (not (= (bvand lt!26149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26149 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26149 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18154 (= lt!26149 (bitIndex!0 (size!509 (buf!827 thiss!1917)) (currentByte!2060 thiss!1917) (currentBit!2055 thiss!1917)))))

(declare-fun b!18155 () Bool)

(declare-datatypes ((List!202 0))(
  ( (Nil!199) (Cons!198 (h!317 Bool) (t!952 List!202)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!888 array!1204 (_ BitVec 64) (_ BitVec 64)) List!202)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!888 BitStream!888 (_ BitVec 64)) List!202)

(assert (=> b!18155 (= e!11630 (= (byteArrayBitContentToList!0 (_2!1122 lt!26142) (_1!1122 lt!26142) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1122 lt!26142) thiss!1917 nBits!604)))))

(declare-fun d!5960 () Bool)

(assert (=> d!5960 e!11630))

(declare-fun res!15972 () Bool)

(assert (=> d!5960 (=> (not res!15972) (not e!11630))))

(assert (=> d!5960 (= res!15972 (= (buf!827 (_2!1122 lt!26142)) (buf!827 thiss!1917)))))

(declare-datatypes ((Unit!1610 0))(
  ( (Unit!1611) )
))
(declare-datatypes ((tuple3!136 0))(
  ( (tuple3!137 (_1!1125 Unit!1610) (_2!1125 BitStream!888) (_3!74 array!1204)) )
))
(declare-fun lt!26144 () tuple3!136)

(assert (=> d!5960 (= lt!26142 (tuple2!2099 (_3!74 lt!26144) (_2!1125 lt!26144)))))

(declare-fun readBitsLoop!0 (BitStream!888 (_ BitVec 64) array!1204 (_ BitVec 64) (_ BitVec 64)) tuple3!136)

(assert (=> d!5960 (= lt!26144 (readBitsLoop!0 thiss!1917 nBits!604 (array!1205 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!5960 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!5960 (= (readBits!0 thiss!1917 nBits!604) lt!26142)))

(declare-fun b!18156 () Bool)

(declare-fun res!15969 () Bool)

(assert (=> b!18156 (=> (not res!15969) (not e!11630))))

(assert (=> b!18156 (= res!15969 (bvsle (currentByte!2060 thiss!1917) (currentByte!2060 (_2!1122 lt!26142))))))

(assert (= (and d!5960 res!15972) b!18154))

(assert (= (and b!18154 res!15971) b!18153))

(assert (= (and b!18153 res!15968) b!18152))

(assert (= (and b!18152 res!15970) b!18156))

(assert (= (and b!18156 res!15969) b!18155))

(declare-fun m!24477 () Bool)

(assert (=> b!18153 m!24477))

(declare-fun m!24479 () Bool)

(assert (=> b!18154 m!24479))

(declare-fun m!24481 () Bool)

(assert (=> b!18154 m!24481))

(declare-fun m!24483 () Bool)

(assert (=> b!18155 m!24483))

(declare-fun m!24485 () Bool)

(assert (=> b!18155 m!24485))

(declare-fun m!24487 () Bool)

(assert (=> d!5960 m!24487))

(assert (=> b!18091 d!5960))

(declare-fun d!5974 () Bool)

(assert (=> d!5974 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2055 thiss!1917) (currentByte!2060 thiss!1917) (size!509 (buf!827 thiss!1917))))))

(declare-fun bs!1693 () Bool)

(assert (= bs!1693 d!5974))

(declare-fun m!24501 () Bool)

(assert (=> bs!1693 m!24501))

(assert (=> start!4416 d!5974))

(declare-fun d!5978 () Bool)

(assert (=> d!5978 (= (array_inv!479 (buf!827 thiss!1917)) (bvsge (size!509 (buf!827 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18090 d!5978))

(declare-fun d!5982 () Bool)

(assert (=> d!5982 (= (inv!12 (BitStream!889 (buf!827 (_2!1122 lt!26074)) (currentByte!2060 thiss!1917) (currentBit!2055 thiss!1917))) (invariant!0 (currentBit!2055 (BitStream!889 (buf!827 (_2!1122 lt!26074)) (currentByte!2060 thiss!1917) (currentBit!2055 thiss!1917))) (currentByte!2060 (BitStream!889 (buf!827 (_2!1122 lt!26074)) (currentByte!2060 thiss!1917) (currentBit!2055 thiss!1917))) (size!509 (buf!827 (BitStream!889 (buf!827 (_2!1122 lt!26074)) (currentByte!2060 thiss!1917) (currentBit!2055 thiss!1917))))))))

(declare-fun bs!1694 () Bool)

(assert (= bs!1694 d!5982))

(declare-fun m!24503 () Bool)

(assert (=> bs!1694 m!24503))

(assert (=> b!18095 d!5982))

(declare-fun d!5984 () Bool)

(assert (=> d!5984 (= (invariant!0 (currentBit!2055 thiss!1917) (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074)))) (and (bvsge (currentBit!2055 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2055 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2060 (_2!1122 lt!26074)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074)))) (and (= (currentBit!2055 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2060 (_2!1122 lt!26074)) (size!509 (buf!827 (_2!1122 lt!26074))))))))))

(assert (=> b!18093 d!5984))

(check-sat (not b!18153) (not d!5960) (not b!18155) (not d!5974) (not d!5982) (not b!18154) (not d!5954))
