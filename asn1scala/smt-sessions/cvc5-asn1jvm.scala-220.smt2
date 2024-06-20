; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4552 () Bool)

(assert start!4552)

(declare-fun b!18495 () Bool)

(declare-fun e!11809 () Bool)

(declare-datatypes ((array!1229 0))(
  ( (array!1230 (arr!958 (Array (_ BitVec 32) (_ BitVec 8))) (size!517 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!904 0))(
  ( (BitStream!905 (buf!835 array!1229) (currentByte!2092 (_ BitVec 32)) (currentBit!2087 (_ BitVec 32))) )
))
(declare-fun thiss!1917 () BitStream!904)

(declare-fun array_inv!487 (array!1229) Bool)

(assert (=> b!18495 (= e!11809 (array_inv!487 (buf!835 thiss!1917)))))

(declare-fun res!16219 () Bool)

(declare-fun e!11813 () Bool)

(assert (=> start!4552 (=> (not res!16219) (not e!11813))))

(declare-fun nBits!604 () (_ BitVec 64))

(assert (=> start!4552 (= res!16219 (bvsge nBits!604 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!4552 e!11813))

(assert (=> start!4552 true))

(declare-fun inv!12 (BitStream!904) Bool)

(assert (=> start!4552 (and (inv!12 thiss!1917) e!11809)))

(declare-fun b!18496 () Bool)

(declare-fun e!11810 () Bool)

(declare-fun e!11812 () Bool)

(assert (=> b!18496 (= e!11810 e!11812)))

(declare-fun res!16221 () Bool)

(assert (=> b!18496 (=> res!16221 e!11812)))

(declare-datatypes ((tuple2!2132 0))(
  ( (tuple2!2133 (_1!1148 array!1229) (_2!1148 BitStream!904)) )
))
(declare-fun lt!26764 () tuple2!2132)

(assert (=> b!18496 (= res!16221 (not (= (currentByte!2092 thiss!1917) (size!517 (buf!835 (_2!1148 lt!26764))))))))

(declare-fun b!18497 () Bool)

(declare-fun e!11811 () Bool)

(assert (=> b!18497 (= e!11812 e!11811)))

(declare-fun res!16220 () Bool)

(assert (=> b!18497 (=> (not res!16220) (not e!11811))))

(assert (=> b!18497 (= res!16220 (and (= (currentBit!2087 (_2!1148 lt!26764)) #b00000000000000000000000000000000) (= (currentBit!2087 thiss!1917) #b00000000000000000000000000000000)))))

(declare-fun b!18498 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!18498 (= e!11811 (invariant!0 (currentBit!2087 thiss!1917) (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764)))))))

(declare-fun b!18499 () Bool)

(declare-fun res!16222 () Bool)

(assert (=> b!18499 (=> (not res!16222) (not e!11813))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!18499 (= res!16222 (validate_offset_bits!1 ((_ sign_extend 32) (size!517 (buf!835 thiss!1917))) ((_ sign_extend 32) (currentByte!2092 thiss!1917)) ((_ sign_extend 32) (currentBit!2087 thiss!1917)) nBits!604))))

(declare-fun b!18500 () Bool)

(assert (=> b!18500 (= e!11813 (not (= thiss!1917 (BitStream!905 (buf!835 (_2!1148 lt!26764)) (currentByte!2092 thiss!1917) (currentBit!2087 thiss!1917)))))))

(assert (=> b!18500 e!11810))

(declare-fun res!16223 () Bool)

(assert (=> b!18500 (=> (not res!16223) (not e!11810))))

(assert (=> b!18500 (= res!16223 (invariant!0 (currentBit!2087 (_2!1148 lt!26764)) (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764)))))))

(declare-fun readBits!0 (BitStream!904 (_ BitVec 64)) tuple2!2132)

(assert (=> b!18500 (= lt!26764 (readBits!0 thiss!1917 nBits!604))))

(assert (= (and start!4552 res!16219) b!18499))

(assert (= (and b!18499 res!16222) b!18500))

(assert (= (and b!18500 res!16223) b!18496))

(assert (= (and b!18496 (not res!16221)) b!18497))

(assert (= (and b!18497 res!16220) b!18498))

(assert (= start!4552 b!18495))

(declare-fun m!24901 () Bool)

(assert (=> b!18498 m!24901))

(declare-fun m!24903 () Bool)

(assert (=> start!4552 m!24903))

(declare-fun m!24905 () Bool)

(assert (=> b!18495 m!24905))

(declare-fun m!24907 () Bool)

(assert (=> b!18500 m!24907))

(declare-fun m!24909 () Bool)

(assert (=> b!18500 m!24909))

(declare-fun m!24911 () Bool)

(assert (=> b!18499 m!24911))

(push 1)

(assert (not b!18500))

(assert (not b!18498))

(assert (not b!18499))

(assert (not start!4552))

(assert (not b!18495))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6134 () Bool)

(assert (=> d!6134 (= (array_inv!487 (buf!835 thiss!1917)) (bvsge (size!517 (buf!835 thiss!1917)) #b00000000000000000000000000000000))))

(assert (=> b!18495 d!6134))

(declare-fun d!6138 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!517 (buf!835 thiss!1917))) ((_ sign_extend 32) (currentByte!2092 thiss!1917)) ((_ sign_extend 32) (currentBit!2087 thiss!1917)) nBits!604) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!517 (buf!835 thiss!1917))) ((_ sign_extend 32) (currentByte!2092 thiss!1917)) ((_ sign_extend 32) (currentBit!2087 thiss!1917))) nBits!604))))

(declare-fun bs!1728 () Bool)

(assert (= bs!1728 d!6138))

(declare-fun m!24943 () Bool)

(assert (=> bs!1728 m!24943))

(assert (=> b!18499 d!6138))

(declare-fun d!6142 () Bool)

(assert (=> d!6142 (= (inv!12 thiss!1917) (invariant!0 (currentBit!2087 thiss!1917) (currentByte!2092 thiss!1917) (size!517 (buf!835 thiss!1917))))))

(declare-fun bs!1729 () Bool)

(assert (= bs!1729 d!6142))

(declare-fun m!24945 () Bool)

(assert (=> bs!1729 m!24945))

(assert (=> start!4552 d!6142))

(declare-fun d!6146 () Bool)

(assert (=> d!6146 (= (invariant!0 (currentBit!2087 (_2!1148 lt!26764)) (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764)))) (and (bvsge (currentBit!2087 (_2!1148 lt!26764)) #b00000000000000000000000000000000) (bvslt (currentBit!2087 (_2!1148 lt!26764)) #b00000000000000000000000000001000) (bvsge (currentByte!2092 (_2!1148 lt!26764)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764)))) (and (= (currentBit!2087 (_2!1148 lt!26764)) #b00000000000000000000000000000000) (= (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764))))))))))

(assert (=> b!18500 d!6146))

(declare-fun b!18572 () Bool)

(declare-fun res!16290 () Bool)

(declare-fun e!11858 () Bool)

(assert (=> b!18572 (=> (not res!16290) (not e!11858))))

(declare-fun lt!26837 () tuple2!2132)

(assert (=> b!18572 (= res!16290 (invariant!0 (currentBit!2087 (_2!1148 lt!26837)) (currentByte!2092 (_2!1148 lt!26837)) (size!517 (buf!835 (_2!1148 lt!26837)))))))

(declare-fun b!18573 () Bool)

(declare-fun res!16291 () Bool)

(assert (=> b!18573 (=> (not res!16291) (not e!11858))))

(declare-fun lt!26841 () (_ BitVec 64))

(assert (=> b!18573 (= res!16291 (= (size!517 (_1!1148 lt!26837)) ((_ extract 31 0) lt!26841)))))

(assert (=> b!18573 (and (bvslt lt!26841 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!26841 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!26835 () (_ BitVec 64))

(declare-fun lt!26834 () (_ BitVec 64))

(assert (=> b!18573 (= lt!26841 (bvsdiv lt!26835 lt!26834))))

(assert (=> b!18573 (and (not (= lt!26834 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!26835 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!26834 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!18573 (= lt!26834 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!26838 () (_ BitVec 64))

(declare-fun lt!26839 () (_ BitVec 64))

(assert (=> b!18573 (= lt!26835 (bvsub lt!26838 lt!26839))))

(assert (=> b!18573 (or (= (bvand lt!26838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!26838 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!26838 lt!26839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18573 (= lt!26839 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!26842 () (_ BitVec 64))

(assert (=> b!18573 (= lt!26838 (bvadd nBits!604 lt!26842))))

(assert (=> b!18573 (or (not (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!26842 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!604 lt!26842) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18573 (= lt!26842 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!18574 () Bool)

(declare-fun res!16289 () Bool)

(assert (=> b!18574 (=> (not res!16289) (not e!11858))))

(assert (=> b!18574 (= res!16289 (bvsle (currentByte!2092 thiss!1917) (currentByte!2092 (_2!1148 lt!26837))))))

(declare-fun d!6152 () Bool)

(assert (=> d!6152 e!11858))

(declare-fun res!16292 () Bool)

(assert (=> d!6152 (=> (not res!16292) (not e!11858))))

(assert (=> d!6152 (= res!16292 (= (buf!835 (_2!1148 lt!26837)) (buf!835 thiss!1917)))))

(declare-datatypes ((Unit!1640 0))(
  ( (Unit!1641) )
))
(declare-datatypes ((tuple3!154 0))(
  ( (tuple3!155 (_1!1152 Unit!1640) (_2!1152 BitStream!904) (_3!83 array!1229)) )
))
(declare-fun lt!26836 () tuple3!154)

(assert (=> d!6152 (= lt!26837 (tuple2!2133 (_3!83 lt!26836) (_2!1152 lt!26836)))))

(declare-fun readBitsLoop!0 (BitStream!904 (_ BitVec 64) array!1229 (_ BitVec 64) (_ BitVec 64)) tuple3!154)

(assert (=> d!6152 (= lt!26836 (readBitsLoop!0 thiss!1917 nBits!604 (array!1230 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!604 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604))))

(assert (=> d!6152 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bvsle nBits!604 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!6152 (= (readBits!0 thiss!1917 nBits!604) lt!26837)))

(declare-fun b!18575 () Bool)

(declare-fun res!16293 () Bool)

(assert (=> b!18575 (=> (not res!16293) (not e!11858))))

(declare-fun lt!26840 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!18575 (= res!16293 (= (bvadd lt!26840 nBits!604) (bitIndex!0 (size!517 (buf!835 (_2!1148 lt!26837))) (currentByte!2092 (_2!1148 lt!26837)) (currentBit!2087 (_2!1148 lt!26837)))))))

(assert (=> b!18575 (or (not (= (bvand lt!26840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!604 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!26840 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!26840 nBits!604) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!18575 (= lt!26840 (bitIndex!0 (size!517 (buf!835 thiss!1917)) (currentByte!2092 thiss!1917) (currentBit!2087 thiss!1917)))))

(declare-fun b!18576 () Bool)

(declare-datatypes ((List!211 0))(
  ( (Nil!208) (Cons!207 (h!326 Bool) (t!961 List!211)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!904 array!1229 (_ BitVec 64) (_ BitVec 64)) List!211)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!904 BitStream!904 (_ BitVec 64)) List!211)

(assert (=> b!18576 (= e!11858 (= (byteArrayBitContentToList!0 (_2!1148 lt!26837) (_1!1148 lt!26837) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!604) (bitStreamReadBitsIntoList!0 (_2!1148 lt!26837) thiss!1917 nBits!604)))))

(assert (= (and d!6152 res!16292) b!18575))

(assert (= (and b!18575 res!16293) b!18572))

(assert (= (and b!18572 res!16290) b!18573))

(assert (= (and b!18573 res!16291) b!18574))

(assert (= (and b!18574 res!16289) b!18576))

(declare-fun m!24959 () Bool)

(assert (=> b!18572 m!24959))

(declare-fun m!24961 () Bool)

(assert (=> d!6152 m!24961))

(declare-fun m!24963 () Bool)

(assert (=> b!18575 m!24963))

(declare-fun m!24965 () Bool)

(assert (=> b!18575 m!24965))

(declare-fun m!24967 () Bool)

(assert (=> b!18576 m!24967))

(declare-fun m!24969 () Bool)

(assert (=> b!18576 m!24969))

(assert (=> b!18500 d!6152))

(declare-fun d!6154 () Bool)

(assert (=> d!6154 (= (invariant!0 (currentBit!2087 thiss!1917) (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764)))) (and (bvsge (currentBit!2087 thiss!1917) #b00000000000000000000000000000000) (bvslt (currentBit!2087 thiss!1917) #b00000000000000000000000000001000) (bvsge (currentByte!2092 (_2!1148 lt!26764)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764)))) (and (= (currentBit!2087 thiss!1917) #b00000000000000000000000000000000) (= (currentByte!2092 (_2!1148 lt!26764)) (size!517 (buf!835 (_2!1148 lt!26764))))))))))

(assert (=> b!18498 d!6154))

(push 1)

(assert (not d!6152))

(assert (not d!6138))

(assert (not d!6142))

(assert (not b!18572))

(assert (not b!18575))

(assert (not b!18576))

(check-sat)

(pop 1)

(push 1)

(check-sat)

