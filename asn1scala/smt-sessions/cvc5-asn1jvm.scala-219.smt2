; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4516 () Bool)

(assert start!4516)

(declare-fun res!16143 () Bool)

(declare-fun e!11762 () Bool)

(assert (=> start!4516 (=> (not res!16143) (not e!11762))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4516 (= res!16143 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4516 e!11762))

(assert (=> start!4516 true))

(declare-datatypes ((array!1220 0))(
  ( (array!1221 (arr!955 (Array (_ BitVec 32) (_ BitVec 8))) (size!514 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!898 0))(
  ( (BitStream!899 (buf!832 array!1220) (currentByte!2083 (_ BitVec 32)) (currentBit!2078 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!898)

(declare-fun e!11763 () Bool)

(declare-fun inv!12 (BitStream!898) Bool)

(assert (=> start!4516 (and (inv!12 thiss!1917) e!11763)))

(declare-fun b!18413 () Bool)

(declare-fun array_inv!484 (array!1220) Bool)

(assert (=> b!18413 (= e!11763 (array_inv!484 (buf!832 thiss!1917)))))

(declare-fun b!18411 () Bool)

(declare-fun e!11761 () Bool)

(assert (=> b!18411 (= e!11762 (not e!11761))))

(declare-fun res!16145 () Bool)

(assert (=> b!18411 (=> res!16145 e!11761)))

(declare-datatypes ((tuple2!2126 0))(
  ( (tuple2!2127 (_1!1142 array!1220) (_2!1142 BitStream!898)) )
))
(declare-fun lt!26674 () tuple2!2126)

(assert (=> b!18411 (= res!16145 (= (currentByte!2083 thiss!1917) (size!514 (buf!832 (_2!1142 lt!26674)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18411 (invariant!0 (currentBit!2078 (_2!1142 lt!26674)) (currentByte!2083 (_2!1142 lt!26674)) (size!514 (buf!832 (_2!1142 lt!26674))))))

(declare-fun readBits!0 (BitStream!898 (_ BitVec 64)) tuple2!2126)

(assert (=> b!18411 (= lt!26674 (readBits!0 thiss!1917 nBits!604))))

(declare-fun b!18412 () Bool)

(assert (=> b!18412 (= e!11761 (inv!12 (BitStream!899 (buf!832 (_2!1142 lt!26674)) (currentByte!2083 thiss!1917) (currentBit!2078 thiss!1917))))))

(declare-fun b!18410 () Bool)

(declare-fun res!16144 () Bool)

(assert (=> b!18410 (=> (not res!16144) (not e!11762))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18410 (= res!16144 (validate_offset_bits!1 ((_ sign_extend 32) (size!514 (buf!832 thiss!1917))) ((_ sign_extend 32) (currentByte!2083 thiss!1917)) ((_ sign_extend 32) (currentBit!2078 thiss!1917)) nBits!604))))

(assert (= (and start!4516 res!16143) b!18410))

(assert (= (and b!18410 res!16144) b!18411))

(assert (= (and b!18411 (not res!16145)) b!18412))

(assert (= start!4516 b!18413))

(declare-fun m!24811 () Bool)

(assert (=> b!18412 m!24811))

(declare-fun m!24813 () Bool)

(assert (=> b!18413 m!24813))

(declare-fun m!24815 () Bool)

(assert (=> b!18410 m!24815))

(declare-fun m!24817 () Bool)

(assert (=> start!4516 m!24817))

(declare-fun m!24819 () Bool)

(assert (=> b!18411 m!24819))

(declare-fun m!24821 () Bool)

(assert (=> b!18411 m!24821))

(push 1)

(assert (not start!4516))

(assert (not b!18412))

(assert (not b!18413))

(assert (not b!18411))

(assert (not b!18410))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6084 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6084 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!514 (buf!832 thiss!1917))) ((_ sign_extend 32) (currentByte!2083 thiss!1917)) ((_ sign_extend 32) (currentBit!2078 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!514 (buf!832 thiss!1917))) ((_ sign_extend 32) (currentByte!2083 thiss!1917)) ((_ sign_extend 32) (currentBit!2078 thiss!1917))) nBits!604))))

(declare-fun bs!1713 () Bool)

(assert (= bs!1713 d!6084))

(declare-fun m!24847 () Bool)

(assert (=> bs!1713 m!24847))

(assert (=> b!18410 d!6084))

(declare-fun d!6088 () Bool)

(assert (=> d!6088 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2078 thiss!1917) (currentByte!2083 thiss!1917) (size!514 (buf!832 thiss!1917))))))

(declare-fun bs!1715 () Bool)

(assert (= bs!1715 d!6088))

(declare-fun m!24851 () Bool)

(assert (=> bs!1715 m!24851))

(assert (=> start!4516 d!6088))

(declare-fun d!6094 () Bool)

(assert (=> d!6094 (= (array_inv!484 (buf!832 thiss!1917)) (bvsge (size!514 (buf!832 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18413 d!6094))

(declare-fun d!6100 () Bool)

(assert (=> d!6100 (= (invariant!0 (currentBit!2078 (_2!1142 lt!26674)) (currentByte!2083 (_2!1142 lt!26674)) (size!514 (buf!832 (_2!1142 lt!26674)))) (and (bvsge (currentBit!2078 (_2!1142 lt!26674)) #b00000000000000000000000000000000) (bvslt (currentBit!2078 (_2!1142 lt!26674)) #b00000000000000000000000000001000) (bvsge (currentByte!2083 (_2!1142 lt!26674)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2083 (_2!1142 lt!26674)) (size!514 (buf!832 (_2!1142 lt!26674)))) (and (= (currentBit!2078 (_2!1142 lt!26674)) #b00000000000000000000000000000000) (= (currentByte!2083 (_2!1142 lt!26674)) (size!514 (buf!832 (_2!1142 lt!26674))))))))))

(assert (=> b!18411 d!6100))

(declare-fun b!18478 () Bool)

(declare-fun res!16197 () Bool)

(declare-fun e!11796 () Bool)

(assert (=> b!18478 (=> (not res!16197) (not e!11796))))

(declare-fun lt!26757 () tuple2!2126)

(assert (=> b!18478 (= res!16197 (invariant!0 (currentBit!2078 (_2!1142 lt!26757)) (currentByte!2083 (_2!1142 lt!26757)) (size!514 (buf!832 (_2!1142 lt!26757)))))))

(declare-fun b!18479 () Bool)

(declare-fun res!16195 () Bool)

(assert (=> b!18479 (=> (not res!16195) (not e!11796))))

(assert (=> b!18479 (= res!16195 (bvsle (currentByte!2083 thiss!1917) (currentByte!2083 (_2!1142 lt!26757))))))

(declare-fun b!18480 () Bool)

(declare-fun res!16207 () Bool)

(assert (=> b!18480 (=> (not res!16207) (not e!11796))))

(declare-fun lt!26754 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18480 (= res!16207 (= (bvadd lt!26754 nBits!604) (bitIndex!0 (size!514 (buf!832 (_2!1142 lt!26757))) (currentByte!2083 (_2!1142 lt!26757)) (currentBit!2078 (_2!1142 lt!26757)))))))

(assert (=> b!18480 (or (not (= (bvand lt!26754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26754 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26754 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18480 (= lt!26754 (bitIndex!0 (size!514 (buf!832 thiss!1917)) (currentByte!2083 thiss!1917) (currentBit!2078 thiss!1917)))))

(declare-fun b!18482 () Bool)

(declare-fun res!16206 () Bool)

(assert (=> b!18482 (=> (not res!16206) (not e!11796))))

(declare-fun lt!26759 () (_ BitVec 64))

(assert (=> b!18482 (= res!16206 (= (size!514 (_1!1142 lt!26757)) ((_ extract 31 0) lt!26759)))))

(assert (=> b!18482 (and (bvslt lt!26759 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26759 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26761 () (_ BitVec 64))

(declare-fun lt!26755 () (_ BitVec 64))

(assert (=> b!18482 (= lt!26759 (bvsdiv lt!26761 lt!26755))))

(assert (=> b!18482 (and (not (= lt!26755 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26761 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26755 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18482 (= lt!26755 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26752 () (_ BitVec 64))

(declare-fun lt!26750 () (_ BitVec 64))

(assert (=> b!18482 (= lt!26761 (bvsub lt!26752 lt!26750))))

(assert (=> b!18482 (or (= (bvand lt!26752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26750 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26752 lt!26750) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18482 (= lt!26750 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26760 () (_ BitVec 64))

(assert (=> b!18482 (= lt!26752 (bvadd nBits!604 lt!26760))))

(assert (=> b!18482 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26760 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18482 (= lt!26760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18481 () Bool)

(declare-datatypes ((List!207 0))(
  ( (Nil!204) (Cons!203 (h!322 Bool) (t!957 List!207)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!898 array!1220 (_ BitVec 64) (_ BitVec 64)) List!207)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!898 BitStream!898 (_ BitVec 64)) List!207)

(assert (=> b!18481 (= e!11796 (= (byteArrayBitContentToList!0 (_2!1142 lt!26757) (_1!1142 lt!26757) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1142 lt!26757) thiss!1917 nBits!604)))))

(declare-fun d!6108 () Bool)

(assert (=> d!6108 e!11796))

(declare-fun res!16208 () Bool)

(assert (=> d!6108 (=> (not res!16208) (not e!11796))))

(assert (=> d!6108 (= res!16208 (= (buf!832 (_2!1142 lt!26757)) (buf!832 thiss!1917)))))

(declare-datatypes ((Unit!1636 0))(
  ( (Unit!1637) )
))
(declare-datatypes ((tuple3!150 0))(
  ( (tuple3!151 (_1!1147 Unit!1636) (_2!1147 BitStream!898) (_3!81 array!1220)) )
))
(declare-fun lt!26748 () tuple3!150)

(assert (=> d!6108 (= lt!26757 (tuple2!2127 (_3!81 lt!26748) (_2!1147 lt!26748)))))

(declare-fun readBitsLoop!0 (BitStream!898 (_ BitVec 64) array!1220 (_ BitVec 64) (_ BitVec 64)) tuple3!150)

(assert (=> d!6108 (= lt!26748 (readBitsLoop!0 thiss!1917 nBits!604 (array!1221 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6108 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6108 (= (readBits!0 thiss!1917 nBits!604) lt!26757)))

(assert (= (and d!6108 res!16208) b!18480))

(assert (= (and b!18480 res!16207) b!18478))

(assert (= (and b!18478 res!16197) b!18482))

(assert (= (and b!18482 res!16206) b!18479))

(assert (= (and b!18479 res!16195) b!18481))

(declare-fun m!24861 () Bool)

(assert (=> b!18478 m!24861))

(declare-fun m!24865 () Bool)

(assert (=> b!18480 m!24865))

(declare-fun m!24871 () Bool)

(assert (=> b!18480 m!24871))

(declare-fun m!24875 () Bool)

(assert (=> b!18481 m!24875))

(declare-fun m!24881 () Bool)

(assert (=> b!18481 m!24881))

(declare-fun m!24889 () Bool)

(assert (=> d!6108 m!24889))

(assert (=> b!18411 d!6108))

(declare-fun d!6118 () Bool)

(assert (=> d!6118 (= (inv!12 (BitStream!899 (buf!832 (_2!1142 lt!26674)) (currentByte!2083 thiss!1917) (currentBit!2078 thiss!1917))) (invariant!0 (currentBit!2078 (BitStream!899 (buf!832 (_2!1142 lt!26674)) (currentByte!2083 thiss!1917) (currentBit!2078 thiss!1917))) (currentByte!2083 (BitStream!899 (buf!832 (_2!1142 lt!26674)) (currentByte!2083 thiss!1917) (currentBit!2078 thiss!1917))) (size!514 (buf!832 (BitStream!899 (buf!832 (_2!1142 lt!26674)) (currentByte!2083 thiss!1917) (currentBit!2078 thiss!1917))))))))

(declare-fun bs!1719 () Bool)

(assert (= bs!1719 d!6118))

(declare-fun m!24897 () Bool)

(assert (=> bs!1719 m!24897))

(assert (=> b!18412 d!6118))

(push 1)

(assert (not b!18480))

(assert (not d!6084))

(assert (not d!6108))

(assert (not b!18478))

(assert (not d!6088))

(assert (not d!6118))

(assert (not b!18481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

