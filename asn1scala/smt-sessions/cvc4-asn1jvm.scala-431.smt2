; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11686 () Bool)

(assert start!11686)

(declare-fun b!57691 () Bool)

(declare-fun e!38272 () Bool)

(declare-fun e!38271 () Bool)

(assert (=> b!57691 (= e!38272 e!38271)))

(declare-fun res!47918 () Bool)

(assert (=> b!57691 (=> res!47918 e!38271)))

(declare-datatypes ((array!2636 0))(
  ( (array!2637 (arr!1756 (Array (_ BitVec 32) (_ BitVec 8))) (size!1195 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2078 0))(
  ( (BitStream!2079 (buf!1573 array!2636) (currentByte!3185 (_ BitVec 32)) (currentBit!3180 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2078)

(declare-datatypes ((Unit!3989 0))(
  ( (Unit!3990) )
))
(declare-datatypes ((tuple2!5254 0))(
  ( (tuple2!5255 (_1!2738 Unit!3989) (_2!2738 BitStream!2078)) )
))
(declare-fun lt!91211 () tuple2!5254)

(declare-fun isPrefixOf!0 (BitStream!2078 BitStream!2078) Bool)

(assert (=> b!57691 (= res!47918 (not (isPrefixOf!0 thiss!1379 (_2!2738 lt!91211))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57691 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91213 () Unit!3989)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2078 BitStream!2078 (_ BitVec 64) (_ BitVec 64)) Unit!3989)

(assert (=> b!57691 (= lt!91213 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2738 lt!91211) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2636)

(declare-fun appendBitFromByte!0 (BitStream!2078 (_ BitVec 8) (_ BitVec 32)) tuple2!5254)

(assert (=> b!57691 (= lt!91211 (appendBitFromByte!0 thiss!1379 (select (arr!1756 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!57692 () Bool)

(declare-fun e!38276 () Bool)

(assert (=> b!57692 (= e!38271 e!38276)))

(declare-fun res!47911 () Bool)

(assert (=> b!57692 (=> res!47911 e!38276)))

(declare-fun lt!91205 () tuple2!5254)

(assert (=> b!57692 (= res!47911 (not (isPrefixOf!0 (_2!2738 lt!91211) (_2!2738 lt!91205))))))

(assert (=> b!57692 (isPrefixOf!0 thiss!1379 (_2!2738 lt!91205))))

(declare-fun lt!91207 () Unit!3989)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2078 BitStream!2078 BitStream!2078) Unit!3989)

(assert (=> b!57692 (= lt!91207 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2738 lt!91211) (_2!2738 lt!91205)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2078 array!2636 (_ BitVec 64) (_ BitVec 64)) tuple2!5254)

(assert (=> b!57692 (= lt!91205 (appendBitsMSBFirstLoop!0 (_2!2738 lt!91211) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38270 () Bool)

(assert (=> b!57692 e!38270))

(declare-fun res!47913 () Bool)

(assert (=> b!57692 (=> (not res!47913) (not e!38270))))

(assert (=> b!57692 (= res!47913 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91210 () Unit!3989)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2078 array!2636 (_ BitVec 64)) Unit!3989)

(assert (=> b!57692 (= lt!91210 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1573 (_2!2738 lt!91211)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5256 0))(
  ( (tuple2!5257 (_1!2739 BitStream!2078) (_2!2739 BitStream!2078)) )
))
(declare-fun lt!91209 () tuple2!5256)

(declare-fun reader!0 (BitStream!2078 BitStream!2078) tuple2!5256)

(assert (=> b!57692 (= lt!91209 (reader!0 thiss!1379 (_2!2738 lt!91211)))))

(declare-fun b!57693 () Bool)

(declare-fun e!38268 () Bool)

(assert (=> b!57693 (= e!38276 e!38268)))

(declare-fun res!47916 () Bool)

(assert (=> b!57693 (=> res!47916 e!38268)))

(declare-fun lt!91208 () (_ BitVec 64))

(declare-fun lt!91206 () (_ BitVec 64))

(assert (=> b!57693 (= res!47916 (not (= lt!91208 (bvsub (bvadd lt!91206 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!57693 (= lt!91208 (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91205))) (currentByte!3185 (_2!2738 lt!91205)) (currentBit!3180 (_2!2738 lt!91205))))))

(declare-fun b!57694 () Bool)

(declare-fun res!47912 () Bool)

(declare-fun e!38274 () Bool)

(assert (=> b!57694 (=> (not res!47912) (not e!38274))))

(assert (=> b!57694 (= res!47912 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 thiss!1379))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!57696 () Bool)

(declare-fun res!47919 () Bool)

(assert (=> b!57696 (=> res!47919 e!38268)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!57696 (= res!47919 (not (invariant!0 (currentBit!3180 (_2!2738 lt!91205)) (currentByte!3185 (_2!2738 lt!91205)) (size!1195 (buf!1573 (_2!2738 lt!91205))))))))

(declare-fun b!57697 () Bool)

(declare-datatypes ((List!614 0))(
  ( (Nil!611) (Cons!610 (h!729 Bool) (t!1364 List!614)) )
))
(declare-fun head!433 (List!614) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2078 array!2636 (_ BitVec 64) (_ BitVec 64)) List!614)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2078 BitStream!2078 (_ BitVec 64)) List!614)

(assert (=> b!57697 (= e!38270 (= (head!433 (byteArrayBitContentToList!0 (_2!2738 lt!91211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!433 (bitStreamReadBitsIntoList!0 (_2!2738 lt!91211) (_1!2739 lt!91209) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!57698 () Bool)

(declare-fun e!38269 () Bool)

(declare-fun array_inv!1098 (array!2636) Bool)

(assert (=> b!57698 (= e!38269 (array_inv!1098 (buf!1573 thiss!1379)))))

(declare-fun b!57699 () Bool)

(assert (=> b!57699 (= e!38268 (= lt!91208 (bvsub (bvsub (bvadd (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57699 (= (size!1195 (buf!1573 (_2!2738 lt!91205))) (size!1195 (buf!1573 thiss!1379)))))

(declare-fun b!57700 () Bool)

(assert (=> b!57700 (= e!38274 (not e!38272))))

(declare-fun res!47917 () Bool)

(assert (=> b!57700 (=> res!47917 e!38272)))

(assert (=> b!57700 (= res!47917 (bvsge i!635 to!314))))

(assert (=> b!57700 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!91212 () Unit!3989)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2078) Unit!3989)

(assert (=> b!57700 (= lt!91212 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!57700 (= lt!91206 (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)))))

(declare-fun res!47914 () Bool)

(assert (=> start!11686 (=> (not res!47914) (not e!38274))))

(assert (=> start!11686 (= res!47914 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1195 srcBuffer!2))))))))

(assert (=> start!11686 e!38274))

(assert (=> start!11686 true))

(assert (=> start!11686 (array_inv!1098 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2078) Bool)

(assert (=> start!11686 (and (inv!12 thiss!1379) e!38269)))

(declare-fun b!57695 () Bool)

(declare-fun res!47915 () Bool)

(assert (=> b!57695 (=> res!47915 e!38268)))

(assert (=> b!57695 (= res!47915 (not (= (size!1195 (buf!1573 thiss!1379)) (size!1195 (buf!1573 (_2!2738 lt!91205))))))))

(assert (= (and start!11686 res!47914) b!57694))

(assert (= (and b!57694 res!47912) b!57700))

(assert (= (and b!57700 (not res!47917)) b!57691))

(assert (= (and b!57691 (not res!47918)) b!57692))

(assert (= (and b!57692 res!47913) b!57697))

(assert (= (and b!57692 (not res!47911)) b!57693))

(assert (= (and b!57693 (not res!47916)) b!57696))

(assert (= (and b!57696 (not res!47919)) b!57695))

(assert (= (and b!57695 (not res!47915)) b!57699))

(assert (= start!11686 b!57698))

(declare-fun m!90975 () Bool)

(assert (=> b!57697 m!90975))

(assert (=> b!57697 m!90975))

(declare-fun m!90977 () Bool)

(assert (=> b!57697 m!90977))

(declare-fun m!90979 () Bool)

(assert (=> b!57697 m!90979))

(assert (=> b!57697 m!90979))

(declare-fun m!90981 () Bool)

(assert (=> b!57697 m!90981))

(declare-fun m!90983 () Bool)

(assert (=> b!57694 m!90983))

(declare-fun m!90985 () Bool)

(assert (=> b!57699 m!90985))

(declare-fun m!90987 () Bool)

(assert (=> b!57692 m!90987))

(declare-fun m!90989 () Bool)

(assert (=> b!57692 m!90989))

(declare-fun m!90991 () Bool)

(assert (=> b!57692 m!90991))

(declare-fun m!90993 () Bool)

(assert (=> b!57692 m!90993))

(declare-fun m!90995 () Bool)

(assert (=> b!57692 m!90995))

(declare-fun m!90997 () Bool)

(assert (=> b!57692 m!90997))

(declare-fun m!90999 () Bool)

(assert (=> b!57692 m!90999))

(declare-fun m!91001 () Bool)

(assert (=> b!57696 m!91001))

(declare-fun m!91003 () Bool)

(assert (=> b!57700 m!91003))

(declare-fun m!91005 () Bool)

(assert (=> b!57700 m!91005))

(declare-fun m!91007 () Bool)

(assert (=> b!57700 m!91007))

(declare-fun m!91009 () Bool)

(assert (=> b!57693 m!91009))

(declare-fun m!91011 () Bool)

(assert (=> b!57698 m!91011))

(declare-fun m!91013 () Bool)

(assert (=> b!57691 m!91013))

(declare-fun m!91015 () Bool)

(assert (=> b!57691 m!91015))

(declare-fun m!91017 () Bool)

(assert (=> b!57691 m!91017))

(assert (=> b!57691 m!91015))

(declare-fun m!91019 () Bool)

(assert (=> b!57691 m!91019))

(declare-fun m!91021 () Bool)

(assert (=> b!57691 m!91021))

(declare-fun m!91023 () Bool)

(assert (=> start!11686 m!91023))

(declare-fun m!91025 () Bool)

(assert (=> start!11686 m!91025))

(push 1)

(assert (not b!57692))

(assert (not b!57697))

(assert (not b!57696))

(assert (not b!57699))

(assert (not b!57691))

(assert (not b!57694))

(assert (not b!57693))

(assert (not b!57700))

(assert (not start!11686))

(assert (not b!57698))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18432 () Bool)

(assert (=> d!18432 (= (invariant!0 (currentBit!3180 (_2!2738 lt!91205)) (currentByte!3185 (_2!2738 lt!91205)) (size!1195 (buf!1573 (_2!2738 lt!91205)))) (and (bvsge (currentBit!3180 (_2!2738 lt!91205)) #b00000000000000000000000000000000) (bvslt (currentBit!3180 (_2!2738 lt!91205)) #b00000000000000000000000000001000) (bvsge (currentByte!3185 (_2!2738 lt!91205)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3185 (_2!2738 lt!91205)) (size!1195 (buf!1573 (_2!2738 lt!91205)))) (and (= (currentBit!3180 (_2!2738 lt!91205)) #b00000000000000000000000000000000) (= (currentByte!3185 (_2!2738 lt!91205)) (size!1195 (buf!1573 (_2!2738 lt!91205))))))))))

(assert (=> b!57696 d!18432))

(declare-fun d!18434 () Bool)

(assert (=> d!18434 (= (array_inv!1098 srcBuffer!2) (bvsge (size!1195 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11686 d!18434))

(declare-fun d!18436 () Bool)

(assert (=> d!18436 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3180 thiss!1379) (currentByte!3185 thiss!1379) (size!1195 (buf!1573 thiss!1379))))))

(declare-fun bs!4583 () Bool)

(assert (= bs!4583 d!18436))

(declare-fun m!91057 () Bool)

(assert (=> bs!4583 m!91057))

(assert (=> start!11686 d!18436))

(declare-fun d!18438 () Bool)

(assert (=> d!18438 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91276 () Unit!3989)

(declare-fun choose!9 (BitStream!2078 array!2636 (_ BitVec 64) BitStream!2078) Unit!3989)

(assert (=> d!18438 (= lt!91276 (choose!9 thiss!1379 (buf!1573 (_2!2738 lt!91211)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2079 (buf!1573 (_2!2738 lt!91211)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379))))))

(assert (=> d!18438 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1573 (_2!2738 lt!91211)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91276)))

(declare-fun bs!4584 () Bool)

(assert (= bs!4584 d!18438))

(assert (=> bs!4584 m!90999))

(declare-fun m!91059 () Bool)

(assert (=> bs!4584 m!91059))

(assert (=> b!57692 d!18438))

(declare-fun b!57864 () Bool)

(declare-fun res!48042 () Bool)

(declare-fun e!38353 () Bool)

(assert (=> b!57864 (=> (not res!48042) (not e!38353))))

(declare-fun lt!91758 () tuple2!5254)

(assert (=> b!57864 (= res!48042 (invariant!0 (currentBit!3180 (_2!2738 lt!91758)) (currentByte!3185 (_2!2738 lt!91758)) (size!1195 (buf!1573 (_2!2738 lt!91758)))))))

(declare-fun b!57865 () Bool)

(declare-fun e!38354 () tuple2!5254)

(declare-fun Unit!4007 () Unit!3989)

(assert (=> b!57865 (= e!38354 (tuple2!5255 Unit!4007 (_2!2738 lt!91211)))))

(assert (=> b!57865 (= (size!1195 (buf!1573 (_2!2738 lt!91211))) (size!1195 (buf!1573 (_2!2738 lt!91211))))))

(declare-fun lt!91770 () Unit!3989)

(declare-fun Unit!4008 () Unit!3989)

(assert (=> b!57865 (= lt!91770 Unit!4008)))

(declare-fun call!762 () tuple2!5256)

(declare-fun checkByteArrayBitContent!0 (BitStream!2078 array!2636 array!2636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5272 0))(
  ( (tuple2!5273 (_1!2747 array!2636) (_2!2747 BitStream!2078)) )
))
(declare-fun readBits!0 (BitStream!2078 (_ BitVec 64)) tuple2!5272)

(assert (=> b!57865 (checkByteArrayBitContent!0 (_2!2738 lt!91211) srcBuffer!2 (_1!2747 (readBits!0 (_1!2739 call!762) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!18440 () Bool)

(assert (=> d!18440 e!38353))

(declare-fun res!48041 () Bool)

(assert (=> d!18440 (=> (not res!48041) (not e!38353))))

(declare-fun lt!91774 () (_ BitVec 64))

(assert (=> d!18440 (= res!48041 (= (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91758))) (currentByte!3185 (_2!2738 lt!91758)) (currentBit!3180 (_2!2738 lt!91758))) (bvsub lt!91774 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18440 (or (= (bvand lt!91774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91774 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91774 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!91733 () (_ BitVec 64))

(assert (=> d!18440 (= lt!91774 (bvadd lt!91733 to!314))))

(assert (=> d!18440 (or (not (= (bvand lt!91733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!91733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!91733 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18440 (= lt!91733 (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211))))))

(assert (=> d!18440 (= lt!91758 e!38354)))

(declare-fun c!4205 () Bool)

(assert (=> d!18440 (= c!4205 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!91766 () Unit!3989)

(declare-fun lt!91771 () Unit!3989)

(assert (=> d!18440 (= lt!91766 lt!91771)))

(assert (=> d!18440 (isPrefixOf!0 (_2!2738 lt!91211) (_2!2738 lt!91211))))

(assert (=> d!18440 (= lt!91771 (lemmaIsPrefixRefl!0 (_2!2738 lt!91211)))))

(declare-fun lt!91749 () (_ BitVec 64))

(assert (=> d!18440 (= lt!91749 (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211))))))

(assert (=> d!18440 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18440 (= (appendBitsMSBFirstLoop!0 (_2!2738 lt!91211) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!91758)))

(declare-fun bm!759 () Bool)

(declare-fun lt!91737 () tuple2!5254)

(declare-fun lt!91753 () tuple2!5254)

(assert (=> bm!759 (= call!762 (reader!0 (ite c!4205 (_2!2738 lt!91753) (_2!2738 lt!91211)) (ite c!4205 (_2!2738 lt!91737) (_2!2738 lt!91211))))))

(declare-fun b!57866 () Bool)

(declare-fun res!48040 () Bool)

(assert (=> b!57866 (=> (not res!48040) (not e!38353))))

(assert (=> b!57866 (= res!48040 (= (size!1195 (buf!1573 (_2!2738 lt!91211))) (size!1195 (buf!1573 (_2!2738 lt!91758)))))))

(declare-fun b!57867 () Bool)

(declare-fun res!48038 () Bool)

(assert (=> b!57867 (=> (not res!48038) (not e!38353))))

(assert (=> b!57867 (= res!48038 (isPrefixOf!0 (_2!2738 lt!91211) (_2!2738 lt!91758)))))

(declare-fun b!57868 () Bool)

(declare-fun res!48043 () Bool)

(assert (=> b!57868 (=> (not res!48043) (not e!38353))))

(assert (=> b!57868 (= res!48043 (= (size!1195 (buf!1573 (_2!2738 lt!91758))) (size!1195 (buf!1573 (_2!2738 lt!91211)))))))

(declare-fun lt!91740 () tuple2!5256)

(declare-fun b!57869 () Bool)

(assert (=> b!57869 (= e!38353 (= (bitStreamReadBitsIntoList!0 (_2!2738 lt!91758) (_1!2739 lt!91740) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2738 lt!91758) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57869 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57869 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!91763 () Unit!3989)

(declare-fun lt!91748 () Unit!3989)

(assert (=> b!57869 (= lt!91763 lt!91748)))

(declare-fun lt!91755 () (_ BitVec 64))

(assert (=> b!57869 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91758)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211))) lt!91755)))

(assert (=> b!57869 (= lt!91748 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2738 lt!91211) (buf!1573 (_2!2738 lt!91758)) lt!91755))))

(declare-fun e!38355 () Bool)

(assert (=> b!57869 e!38355))

(declare-fun res!48039 () Bool)

(assert (=> b!57869 (=> (not res!48039) (not e!38355))))

(assert (=> b!57869 (= res!48039 (and (= (size!1195 (buf!1573 (_2!2738 lt!91211))) (size!1195 (buf!1573 (_2!2738 lt!91758)))) (bvsge lt!91755 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57869 (= lt!91755 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57869 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57869 (= lt!91740 (reader!0 (_2!2738 lt!91211) (_2!2738 lt!91758)))))

(declare-fun b!57870 () Bool)

(declare-fun Unit!4009 () Unit!3989)

(assert (=> b!57870 (= e!38354 (tuple2!5255 Unit!4009 (_2!2738 lt!91737)))))

(assert (=> b!57870 (= lt!91753 (appendBitFromByte!0 (_2!2738 lt!91211) (select (arr!1756 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!91742 () (_ BitVec 64))

(assert (=> b!57870 (= lt!91742 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91745 () (_ BitVec 64))

(assert (=> b!57870 (= lt!91745 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91775 () Unit!3989)

(assert (=> b!57870 (= lt!91775 (validateOffsetBitsIneqLemma!0 (_2!2738 lt!91211) (_2!2738 lt!91753) lt!91742 lt!91745))))

(assert (=> b!57870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91753)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91753))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91753))) (bvsub lt!91742 lt!91745))))

(declare-fun lt!91757 () Unit!3989)

(assert (=> b!57870 (= lt!91757 lt!91775)))

(declare-fun lt!91744 () tuple2!5256)

(assert (=> b!57870 (= lt!91744 (reader!0 (_2!2738 lt!91211) (_2!2738 lt!91753)))))

(declare-fun lt!91734 () (_ BitVec 64))

(assert (=> b!57870 (= lt!91734 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91762 () Unit!3989)

(assert (=> b!57870 (= lt!91762 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2738 lt!91211) (buf!1573 (_2!2738 lt!91753)) lt!91734))))

(assert (=> b!57870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91753)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211))) lt!91734)))

(declare-fun lt!91765 () Unit!3989)

(assert (=> b!57870 (= lt!91765 lt!91762)))

(assert (=> b!57870 (= (head!433 (byteArrayBitContentToList!0 (_2!2738 lt!91753) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!433 (bitStreamReadBitsIntoList!0 (_2!2738 lt!91753) (_1!2739 lt!91744) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91768 () Unit!3989)

(declare-fun Unit!4010 () Unit!3989)

(assert (=> b!57870 (= lt!91768 Unit!4010)))

(assert (=> b!57870 (= lt!91737 (appendBitsMSBFirstLoop!0 (_2!2738 lt!91753) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!91735 () Unit!3989)

(assert (=> b!57870 (= lt!91735 (lemmaIsPrefixTransitive!0 (_2!2738 lt!91211) (_2!2738 lt!91753) (_2!2738 lt!91737)))))

(assert (=> b!57870 (isPrefixOf!0 (_2!2738 lt!91211) (_2!2738 lt!91737))))

(declare-fun lt!91760 () Unit!3989)

(assert (=> b!57870 (= lt!91760 lt!91735)))

(assert (=> b!57870 (= (size!1195 (buf!1573 (_2!2738 lt!91737))) (size!1195 (buf!1573 (_2!2738 lt!91211))))))

(declare-fun lt!91773 () Unit!3989)

(declare-fun Unit!4011 () Unit!3989)

(assert (=> b!57870 (= lt!91773 Unit!4011)))

(assert (=> b!57870 (= (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91737))) (currentByte!3185 (_2!2738 lt!91737)) (currentBit!3180 (_2!2738 lt!91737))) (bvsub (bvadd (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91767 () Unit!3989)

(declare-fun Unit!4012 () Unit!3989)

(assert (=> b!57870 (= lt!91767 Unit!4012)))

(assert (=> b!57870 (= (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91737))) (currentByte!3185 (_2!2738 lt!91737)) (currentBit!3180 (_2!2738 lt!91737))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91753))) (currentByte!3185 (_2!2738 lt!91753)) (currentBit!3180 (_2!2738 lt!91753))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91738 () Unit!3989)

(declare-fun Unit!4013 () Unit!3989)

(assert (=> b!57870 (= lt!91738 Unit!4013)))

(declare-fun lt!91769 () tuple2!5256)

(assert (=> b!57870 (= lt!91769 (reader!0 (_2!2738 lt!91211) (_2!2738 lt!91737)))))

(declare-fun lt!91756 () (_ BitVec 64))

(assert (=> b!57870 (= lt!91756 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91764 () Unit!3989)

(assert (=> b!57870 (= lt!91764 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2738 lt!91211) (buf!1573 (_2!2738 lt!91737)) lt!91756))))

(assert (=> b!57870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91737)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211))) lt!91756)))

(declare-fun lt!91741 () Unit!3989)

(assert (=> b!57870 (= lt!91741 lt!91764)))

(declare-fun lt!91761 () tuple2!5256)

(assert (=> b!57870 (= lt!91761 call!762)))

(declare-fun lt!91751 () (_ BitVec 64))

(assert (=> b!57870 (= lt!91751 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91754 () Unit!3989)

(assert (=> b!57870 (= lt!91754 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2738 lt!91753) (buf!1573 (_2!2738 lt!91737)) lt!91751))))

(assert (=> b!57870 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91737)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91753))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91753))) lt!91751)))

(declare-fun lt!91743 () Unit!3989)

(assert (=> b!57870 (= lt!91743 lt!91754)))

(declare-fun lt!91739 () List!614)

(assert (=> b!57870 (= lt!91739 (byteArrayBitContentToList!0 (_2!2738 lt!91737) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!91752 () List!614)

(assert (=> b!57870 (= lt!91752 (byteArrayBitContentToList!0 (_2!2738 lt!91737) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91732 () List!614)

(assert (=> b!57870 (= lt!91732 (bitStreamReadBitsIntoList!0 (_2!2738 lt!91737) (_1!2739 lt!91769) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!91759 () List!614)

(assert (=> b!57870 (= lt!91759 (bitStreamReadBitsIntoList!0 (_2!2738 lt!91737) (_1!2739 lt!91761) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91750 () (_ BitVec 64))

(assert (=> b!57870 (= lt!91750 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91772 () Unit!3989)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2078 BitStream!2078 BitStream!2078 BitStream!2078 (_ BitVec 64) List!614) Unit!3989)

(assert (=> b!57870 (= lt!91772 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2738 lt!91737) (_2!2738 lt!91737) (_1!2739 lt!91769) (_1!2739 lt!91761) lt!91750 lt!91732))))

(declare-fun tail!281 (List!614) List!614)

(assert (=> b!57870 (= (bitStreamReadBitsIntoList!0 (_2!2738 lt!91737) (_1!2739 lt!91761) (bvsub lt!91750 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!281 lt!91732))))

(declare-fun lt!91736 () Unit!3989)

(assert (=> b!57870 (= lt!91736 lt!91772)))

(declare-fun lt!91747 () Unit!3989)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2636 array!2636 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3989)

(assert (=> b!57870 (= lt!91747 (arrayBitRangesEqImpliesEq!0 (buf!1573 (_2!2738 lt!91753)) (buf!1573 (_2!2738 lt!91737)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!91749 (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91753))) (currentByte!3185 (_2!2738 lt!91753)) (currentBit!3180 (_2!2738 lt!91753)))))))

(declare-fun bitAt!0 (array!2636 (_ BitVec 64)) Bool)

(assert (=> b!57870 (= (bitAt!0 (buf!1573 (_2!2738 lt!91753)) lt!91749) (bitAt!0 (buf!1573 (_2!2738 lt!91737)) lt!91749))))

(declare-fun lt!91746 () Unit!3989)

(assert (=> b!57870 (= lt!91746 lt!91747)))

(declare-fun b!57871 () Bool)

(assert (=> b!57871 (= e!38355 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211))) lt!91755))))

(assert (= (and d!18440 c!4205) b!57870))

(assert (= (and d!18440 (not c!4205)) b!57865))

(assert (= (or b!57870 b!57865) bm!759))

(assert (= (and d!18440 res!48041) b!57864))

(assert (= (and b!57864 res!48042) b!57866))

(assert (= (and b!57866 res!48040) b!57867))

(assert (= (and b!57867 res!48038) b!57868))

(assert (= (and b!57868 res!48043) b!57869))

(assert (= (and b!57869 res!48039) b!57871))

(declare-fun m!91235 () Bool)

(assert (=> bm!759 m!91235))

(declare-fun m!91237 () Bool)

(assert (=> b!57864 m!91237))

(declare-fun m!91239 () Bool)

(assert (=> d!18440 m!91239))

(assert (=> d!18440 m!90985))

(declare-fun m!91241 () Bool)

(assert (=> d!18440 m!91241))

(declare-fun m!91243 () Bool)

(assert (=> d!18440 m!91243))

(declare-fun m!91245 () Bool)

(assert (=> b!57867 m!91245))

(declare-fun m!91247 () Bool)

(assert (=> b!57869 m!91247))

(declare-fun m!91249 () Bool)

(assert (=> b!57869 m!91249))

(declare-fun m!91251 () Bool)

(assert (=> b!57869 m!91251))

(declare-fun m!91253 () Bool)

(assert (=> b!57869 m!91253))

(declare-fun m!91255 () Bool)

(assert (=> b!57869 m!91255))

(declare-fun m!91257 () Bool)

(assert (=> b!57870 m!91257))

(declare-fun m!91259 () Bool)

(assert (=> b!57870 m!91259))

(declare-fun m!91261 () Bool)

(assert (=> b!57870 m!91261))

(declare-fun m!91263 () Bool)

(assert (=> b!57870 m!91263))

(declare-fun m!91265 () Bool)

(assert (=> b!57870 m!91265))

(declare-fun m!91267 () Bool)

(assert (=> b!57870 m!91267))

(declare-fun m!91269 () Bool)

(assert (=> b!57870 m!91269))

(declare-fun m!91271 () Bool)

(assert (=> b!57870 m!91271))

(declare-fun m!91275 () Bool)

(assert (=> b!57870 m!91275))

(declare-fun m!91277 () Bool)

(assert (=> b!57870 m!91277))

(declare-fun m!91279 () Bool)

(assert (=> b!57870 m!91279))

(declare-fun m!91281 () Bool)

(assert (=> b!57870 m!91281))

(declare-fun m!91283 () Bool)

(assert (=> b!57870 m!91283))

(assert (=> b!57870 m!91281))

(declare-fun m!91285 () Bool)

(assert (=> b!57870 m!91285))

(declare-fun m!91287 () Bool)

(assert (=> b!57870 m!91287))

(assert (=> b!57870 m!91275))

(declare-fun m!91289 () Bool)

(assert (=> b!57870 m!91289))

(assert (=> b!57870 m!91257))

(declare-fun m!91291 () Bool)

(assert (=> b!57870 m!91291))

(declare-fun m!91293 () Bool)

(assert (=> b!57870 m!91293))

(declare-fun m!91295 () Bool)

(assert (=> b!57870 m!91295))

(declare-fun m!91297 () Bool)

(assert (=> b!57870 m!91297))

(assert (=> b!57870 m!90985))

(declare-fun m!91299 () Bool)

(assert (=> b!57870 m!91299))

(declare-fun m!91303 () Bool)

(assert (=> b!57870 m!91303))

(declare-fun m!91305 () Bool)

(assert (=> b!57870 m!91305))

(declare-fun m!91307 () Bool)

(assert (=> b!57870 m!91307))

(declare-fun m!91309 () Bool)

(assert (=> b!57870 m!91309))

(declare-fun m!91311 () Bool)

(assert (=> b!57870 m!91311))

(declare-fun m!91313 () Bool)

(assert (=> b!57870 m!91313))

(declare-fun m!91315 () Bool)

(assert (=> b!57870 m!91315))

(declare-fun m!91317 () Bool)

(assert (=> b!57870 m!91317))

(assert (=> b!57870 m!91295))

(declare-fun m!91319 () Bool)

(assert (=> b!57870 m!91319))

(declare-fun m!91321 () Bool)

(assert (=> b!57870 m!91321))

(declare-fun m!91323 () Bool)

(assert (=> b!57865 m!91323))

(declare-fun m!91325 () Bool)

(assert (=> b!57865 m!91325))

(declare-fun m!91329 () Bool)

(assert (=> b!57871 m!91329))

(assert (=> b!57692 d!18440))

(declare-fun d!18470 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18470 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4590 () Bool)

(assert (= bs!4590 d!18470))

(declare-fun m!91333 () Bool)

(assert (=> bs!4590 m!91333))

(assert (=> b!57692 d!18470))

(declare-fun d!18474 () Bool)

(assert (=> d!18474 (isPrefixOf!0 thiss!1379 (_2!2738 lt!91205))))

(declare-fun lt!91827 () Unit!3989)

(declare-fun choose!30 (BitStream!2078 BitStream!2078 BitStream!2078) Unit!3989)

(assert (=> d!18474 (= lt!91827 (choose!30 thiss!1379 (_2!2738 lt!91211) (_2!2738 lt!91205)))))

(assert (=> d!18474 (isPrefixOf!0 thiss!1379 (_2!2738 lt!91211))))

(assert (=> d!18474 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2738 lt!91211) (_2!2738 lt!91205)) lt!91827)))

(declare-fun bs!4591 () Bool)

(assert (= bs!4591 d!18474))

(assert (=> bs!4591 m!90991))

(declare-fun m!91335 () Bool)

(assert (=> bs!4591 m!91335))

(assert (=> bs!4591 m!91017))

(assert (=> b!57692 d!18474))

(declare-fun d!18476 () Bool)

(declare-fun res!48066 () Bool)

(declare-fun e!38371 () Bool)

(assert (=> d!18476 (=> (not res!48066) (not e!38371))))

(assert (=> d!18476 (= res!48066 (= (size!1195 (buf!1573 thiss!1379)) (size!1195 (buf!1573 (_2!2738 lt!91205)))))))

(assert (=> d!18476 (= (isPrefixOf!0 thiss!1379 (_2!2738 lt!91205)) e!38371)))

(declare-fun b!57895 () Bool)

(declare-fun res!48065 () Bool)

(assert (=> b!57895 (=> (not res!48065) (not e!38371))))

(assert (=> b!57895 (= res!48065 (bvsle (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)) (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91205))) (currentByte!3185 (_2!2738 lt!91205)) (currentBit!3180 (_2!2738 lt!91205)))))))

(declare-fun b!57896 () Bool)

(declare-fun e!38370 () Bool)

(assert (=> b!57896 (= e!38371 e!38370)))

(declare-fun res!48067 () Bool)

(assert (=> b!57896 (=> res!48067 e!38370)))

(assert (=> b!57896 (= res!48067 (= (size!1195 (buf!1573 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57897 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2636 array!2636 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57897 (= e!38370 (arrayBitRangesEq!0 (buf!1573 thiss!1379) (buf!1573 (_2!2738 lt!91205)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379))))))

(assert (= (and d!18476 res!48066) b!57895))

(assert (= (and b!57895 res!48065) b!57896))

(assert (= (and b!57896 (not res!48067)) b!57897))

(assert (=> b!57895 m!91007))

(assert (=> b!57895 m!91009))

(assert (=> b!57897 m!91007))

(assert (=> b!57897 m!91007))

(declare-fun m!91427 () Bool)

(assert (=> b!57897 m!91427))

(assert (=> b!57692 d!18476))

(declare-fun d!18484 () Bool)

(declare-fun res!48069 () Bool)

(declare-fun e!38373 () Bool)

(assert (=> d!18484 (=> (not res!48069) (not e!38373))))

(assert (=> d!18484 (= res!48069 (= (size!1195 (buf!1573 (_2!2738 lt!91211))) (size!1195 (buf!1573 (_2!2738 lt!91205)))))))

(assert (=> d!18484 (= (isPrefixOf!0 (_2!2738 lt!91211) (_2!2738 lt!91205)) e!38373)))

(declare-fun b!57898 () Bool)

(declare-fun res!48068 () Bool)

(assert (=> b!57898 (=> (not res!48068) (not e!38373))))

(assert (=> b!57898 (= res!48068 (bvsle (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211))) (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91205))) (currentByte!3185 (_2!2738 lt!91205)) (currentBit!3180 (_2!2738 lt!91205)))))))

(declare-fun b!57899 () Bool)

(declare-fun e!38372 () Bool)

(assert (=> b!57899 (= e!38373 e!38372)))

(declare-fun res!48070 () Bool)

(assert (=> b!57899 (=> res!48070 e!38372)))

(assert (=> b!57899 (= res!48070 (= (size!1195 (buf!1573 (_2!2738 lt!91211))) #b00000000000000000000000000000000))))

(declare-fun b!57900 () Bool)

(assert (=> b!57900 (= e!38372 (arrayBitRangesEq!0 (buf!1573 (_2!2738 lt!91211)) (buf!1573 (_2!2738 lt!91205)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211)))))))

(assert (= (and d!18484 res!48069) b!57898))

(assert (= (and b!57898 res!48068) b!57899))

(assert (= (and b!57899 (not res!48070)) b!57900))

(assert (=> b!57898 m!90985))

(assert (=> b!57898 m!91009))

(assert (=> b!57900 m!90985))

(assert (=> b!57900 m!90985))

(declare-fun m!91429 () Bool)

(assert (=> b!57900 m!91429))

(assert (=> b!57692 d!18484))

(declare-fun b!57935 () Bool)

(declare-fun res!48084 () Bool)

(declare-fun e!38392 () Bool)

(assert (=> b!57935 (=> (not res!48084) (not e!38392))))

(declare-fun lt!91883 () tuple2!5256)

(assert (=> b!57935 (= res!48084 (isPrefixOf!0 (_1!2739 lt!91883) thiss!1379))))

(declare-fun b!57936 () Bool)

(declare-fun e!38391 () Unit!3989)

(declare-fun Unit!4014 () Unit!3989)

(assert (=> b!57936 (= e!38391 Unit!4014)))

(declare-fun b!57937 () Bool)

(declare-fun res!48085 () Bool)

(assert (=> b!57937 (=> (not res!48085) (not e!38392))))

(assert (=> b!57937 (= res!48085 (isPrefixOf!0 (_2!2739 lt!91883) (_2!2738 lt!91211)))))

(declare-fun b!57938 () Bool)

(declare-fun lt!91886 () Unit!3989)

(assert (=> b!57938 (= e!38391 lt!91886)))

(declare-fun lt!91894 () (_ BitVec 64))

(assert (=> b!57938 (= lt!91894 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91887 () (_ BitVec 64))

(assert (=> b!57938 (= lt!91887 (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2636 array!2636 (_ BitVec 64) (_ BitVec 64)) Unit!3989)

(assert (=> b!57938 (= lt!91886 (arrayBitRangesEqSymmetric!0 (buf!1573 thiss!1379) (buf!1573 (_2!2738 lt!91211)) lt!91894 lt!91887))))

(assert (=> b!57938 (arrayBitRangesEq!0 (buf!1573 (_2!2738 lt!91211)) (buf!1573 thiss!1379) lt!91894 lt!91887)))

(declare-fun d!18486 () Bool)

(assert (=> d!18486 e!38392))

(declare-fun res!48083 () Bool)

(assert (=> d!18486 (=> (not res!48083) (not e!38392))))

(assert (=> d!18486 (= res!48083 (isPrefixOf!0 (_1!2739 lt!91883) (_2!2739 lt!91883)))))

(declare-fun lt!91895 () BitStream!2078)

(assert (=> d!18486 (= lt!91883 (tuple2!5257 lt!91895 (_2!2738 lt!91211)))))

(declare-fun lt!91900 () Unit!3989)

(declare-fun lt!91897 () Unit!3989)

(assert (=> d!18486 (= lt!91900 lt!91897)))

(assert (=> d!18486 (isPrefixOf!0 lt!91895 (_2!2738 lt!91211))))

(assert (=> d!18486 (= lt!91897 (lemmaIsPrefixTransitive!0 lt!91895 (_2!2738 lt!91211) (_2!2738 lt!91211)))))

(declare-fun lt!91889 () Unit!3989)

(declare-fun lt!91881 () Unit!3989)

(assert (=> d!18486 (= lt!91889 lt!91881)))

(assert (=> d!18486 (isPrefixOf!0 lt!91895 (_2!2738 lt!91211))))

(assert (=> d!18486 (= lt!91881 (lemmaIsPrefixTransitive!0 lt!91895 thiss!1379 (_2!2738 lt!91211)))))

(declare-fun lt!91893 () Unit!3989)

(assert (=> d!18486 (= lt!91893 e!38391)))

(declare-fun c!4218 () Bool)

(assert (=> d!18486 (= c!4218 (not (= (size!1195 (buf!1573 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!91888 () Unit!3989)

(declare-fun lt!91885 () Unit!3989)

(assert (=> d!18486 (= lt!91888 lt!91885)))

(assert (=> d!18486 (isPrefixOf!0 (_2!2738 lt!91211) (_2!2738 lt!91211))))

(assert (=> d!18486 (= lt!91885 (lemmaIsPrefixRefl!0 (_2!2738 lt!91211)))))

(declare-fun lt!91891 () Unit!3989)

(declare-fun lt!91898 () Unit!3989)

(assert (=> d!18486 (= lt!91891 lt!91898)))

(assert (=> d!18486 (= lt!91898 (lemmaIsPrefixRefl!0 (_2!2738 lt!91211)))))

(declare-fun lt!91884 () Unit!3989)

(declare-fun lt!91896 () Unit!3989)

(assert (=> d!18486 (= lt!91884 lt!91896)))

(assert (=> d!18486 (isPrefixOf!0 lt!91895 lt!91895)))

(assert (=> d!18486 (= lt!91896 (lemmaIsPrefixRefl!0 lt!91895))))

(declare-fun lt!91899 () Unit!3989)

(declare-fun lt!91890 () Unit!3989)

(assert (=> d!18486 (= lt!91899 lt!91890)))

(assert (=> d!18486 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18486 (= lt!91890 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18486 (= lt!91895 (BitStream!2079 (buf!1573 (_2!2738 lt!91211)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)))))

(assert (=> d!18486 (isPrefixOf!0 thiss!1379 (_2!2738 lt!91211))))

(assert (=> d!18486 (= (reader!0 thiss!1379 (_2!2738 lt!91211)) lt!91883)))

(declare-fun b!57939 () Bool)

(declare-fun lt!91892 () (_ BitVec 64))

(declare-fun lt!91882 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2078 (_ BitVec 64)) BitStream!2078)

(assert (=> b!57939 (= e!38392 (= (_1!2739 lt!91883) (withMovedBitIndex!0 (_2!2739 lt!91883) (bvsub lt!91882 lt!91892))))))

(assert (=> b!57939 (or (= (bvand lt!91882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91892 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91882 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91882 lt!91892) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57939 (= lt!91892 (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211))))))

(assert (=> b!57939 (= lt!91882 (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)))))

(assert (= (and d!18486 c!4218) b!57938))

(assert (= (and d!18486 (not c!4218)) b!57936))

(assert (= (and d!18486 res!48083) b!57935))

(assert (= (and b!57935 res!48084) b!57937))

(assert (= (and b!57937 res!48085) b!57939))

(assert (=> d!18486 m!91017))

(declare-fun m!91447 () Bool)

(assert (=> d!18486 m!91447))

(declare-fun m!91449 () Bool)

(assert (=> d!18486 m!91449))

(declare-fun m!91451 () Bool)

(assert (=> d!18486 m!91451))

(assert (=> d!18486 m!91241))

(assert (=> d!18486 m!91243))

(declare-fun m!91453 () Bool)

(assert (=> d!18486 m!91453))

(assert (=> d!18486 m!91003))

(assert (=> d!18486 m!91005))

(declare-fun m!91455 () Bool)

(assert (=> d!18486 m!91455))

(declare-fun m!91457 () Bool)

(assert (=> d!18486 m!91457))

(declare-fun m!91459 () Bool)

(assert (=> b!57937 m!91459))

(declare-fun m!91461 () Bool)

(assert (=> b!57935 m!91461))

(assert (=> b!57938 m!91007))

(declare-fun m!91463 () Bool)

(assert (=> b!57938 m!91463))

(declare-fun m!91465 () Bool)

(assert (=> b!57938 m!91465))

(declare-fun m!91467 () Bool)

(assert (=> b!57939 m!91467))

(assert (=> b!57939 m!90985))

(assert (=> b!57939 m!91007))

(assert (=> b!57692 d!18486))

(declare-fun d!18500 () Bool)

(assert (=> d!18500 (= (head!433 (byteArrayBitContentToList!0 (_2!2738 lt!91211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!729 (byteArrayBitContentToList!0 (_2!2738 lt!91211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57697 d!18500))

(declare-fun d!18502 () Bool)

(declare-fun c!4221 () Bool)

(assert (=> d!18502 (= c!4221 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38395 () List!614)

(assert (=> d!18502 (= (byteArrayBitContentToList!0 (_2!2738 lt!91211) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!38395)))

(declare-fun b!57944 () Bool)

(assert (=> b!57944 (= e!38395 Nil!611)))

(declare-fun b!57945 () Bool)

(assert (=> b!57945 (= e!38395 (Cons!610 (not (= (bvand ((_ sign_extend 24) (select (arr!1756 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2738 lt!91211) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18502 c!4221) b!57944))

(assert (= (and d!18502 (not c!4221)) b!57945))

(assert (=> b!57945 m!91015))

(declare-fun m!91469 () Bool)

(assert (=> b!57945 m!91469))

(declare-fun m!91471 () Bool)

(assert (=> b!57945 m!91471))

(assert (=> b!57697 d!18502))

(declare-fun d!18504 () Bool)

(assert (=> d!18504 (= (head!433 (bitStreamReadBitsIntoList!0 (_2!2738 lt!91211) (_1!2739 lt!91209) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!729 (bitStreamReadBitsIntoList!0 (_2!2738 lt!91211) (_1!2739 lt!91209) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57697 d!18504))

(declare-fun b!57957 () Bool)

(declare-fun e!38401 () Bool)

(declare-fun lt!91907 () List!614)

(declare-fun length!293 (List!614) Int)

(assert (=> b!57957 (= e!38401 (> (length!293 lt!91907) 0))))

(declare-fun d!18506 () Bool)

(assert (=> d!18506 e!38401))

(declare-fun c!4227 () Bool)

(assert (=> d!18506 (= c!4227 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5276 0))(
  ( (tuple2!5277 (_1!2749 List!614) (_2!2749 BitStream!2078)) )
))
(declare-fun e!38400 () tuple2!5276)

(assert (=> d!18506 (= lt!91907 (_1!2749 e!38400))))

(declare-fun c!4226 () Bool)

(assert (=> d!18506 (= c!4226 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18506 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18506 (= (bitStreamReadBitsIntoList!0 (_2!2738 lt!91211) (_1!2739 lt!91209) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91907)))

(declare-fun b!57954 () Bool)

(assert (=> b!57954 (= e!38400 (tuple2!5277 Nil!611 (_1!2739 lt!91209)))))

(declare-fun b!57955 () Bool)

(declare-datatypes ((tuple2!5278 0))(
  ( (tuple2!5279 (_1!2750 Bool) (_2!2750 BitStream!2078)) )
))
(declare-fun lt!91908 () tuple2!5278)

(declare-fun lt!91909 () (_ BitVec 64))

(assert (=> b!57955 (= e!38400 (tuple2!5277 (Cons!610 (_1!2750 lt!91908) (bitStreamReadBitsIntoList!0 (_2!2738 lt!91211) (_2!2750 lt!91908) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!91909))) (_2!2750 lt!91908)))))

(declare-fun readBit!0 (BitStream!2078) tuple2!5278)

(assert (=> b!57955 (= lt!91908 (readBit!0 (_1!2739 lt!91209)))))

(assert (=> b!57955 (= lt!91909 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!57956 () Bool)

(declare-fun isEmpty!179 (List!614) Bool)

(assert (=> b!57956 (= e!38401 (isEmpty!179 lt!91907))))

(assert (= (and d!18506 c!4226) b!57954))

(assert (= (and d!18506 (not c!4226)) b!57955))

(assert (= (and d!18506 c!4227) b!57956))

(assert (= (and d!18506 (not c!4227)) b!57957))

(declare-fun m!91473 () Bool)

(assert (=> b!57957 m!91473))

(declare-fun m!91475 () Bool)

(assert (=> b!57955 m!91475))

(declare-fun m!91477 () Bool)

(assert (=> b!57955 m!91477))

(declare-fun m!91479 () Bool)

(assert (=> b!57956 m!91479))

(assert (=> b!57697 d!18506))

(declare-fun d!18508 () Bool)

(declare-fun res!48087 () Bool)

(declare-fun e!38403 () Bool)

(assert (=> d!18508 (=> (not res!48087) (not e!38403))))

(assert (=> d!18508 (= res!48087 (= (size!1195 (buf!1573 thiss!1379)) (size!1195 (buf!1573 (_2!2738 lt!91211)))))))

(assert (=> d!18508 (= (isPrefixOf!0 thiss!1379 (_2!2738 lt!91211)) e!38403)))

(declare-fun b!57958 () Bool)

(declare-fun res!48086 () Bool)

(assert (=> b!57958 (=> (not res!48086) (not e!38403))))

(assert (=> b!57958 (= res!48086 (bvsle (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)) (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211)))))))

(declare-fun b!57959 () Bool)

(declare-fun e!38402 () Bool)

(assert (=> b!57959 (= e!38403 e!38402)))

(declare-fun res!48088 () Bool)

(assert (=> b!57959 (=> res!48088 e!38402)))

(assert (=> b!57959 (= res!48088 (= (size!1195 (buf!1573 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57960 () Bool)

(assert (=> b!57960 (= e!38402 (arrayBitRangesEq!0 (buf!1573 thiss!1379) (buf!1573 (_2!2738 lt!91211)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379))))))

(assert (= (and d!18508 res!48087) b!57958))

(assert (= (and b!57958 res!48086) b!57959))

(assert (= (and b!57959 (not res!48088)) b!57960))

(assert (=> b!57958 m!91007))

(assert (=> b!57958 m!90985))

(assert (=> b!57960 m!91007))

(assert (=> b!57960 m!91007))

(declare-fun m!91481 () Bool)

(assert (=> b!57960 m!91481))

(assert (=> b!57691 d!18508))

(declare-fun d!18510 () Bool)

(assert (=> d!18510 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4594 () Bool)

(assert (= bs!4594 d!18510))

(declare-fun m!91483 () Bool)

(assert (=> bs!4594 m!91483))

(assert (=> b!57691 d!18510))

(declare-fun d!18512 () Bool)

(declare-fun e!38406 () Bool)

(assert (=> d!18512 e!38406))

(declare-fun res!48091 () Bool)

(assert (=> d!18512 (=> (not res!48091) (not e!38406))))

(assert (=> d!18512 (= res!48091 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!91912 () Unit!3989)

(declare-fun choose!27 (BitStream!2078 BitStream!2078 (_ BitVec 64) (_ BitVec 64)) Unit!3989)

(assert (=> d!18512 (= lt!91912 (choose!27 thiss!1379 (_2!2738 lt!91211) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18512 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18512 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2738 lt!91211) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91912)))

(declare-fun b!57963 () Bool)

(assert (=> b!57963 (= e!38406 (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18512 res!48091) b!57963))

(declare-fun m!91485 () Bool)

(assert (=> d!18512 m!91485))

(assert (=> b!57963 m!91021))

(assert (=> b!57691 d!18512))

(declare-fun b!58019 () Bool)

(declare-fun e!38437 () Bool)

(declare-fun e!38435 () Bool)

(assert (=> b!58019 (= e!38437 e!38435)))

(declare-fun res!48152 () Bool)

(assert (=> b!58019 (=> (not res!48152) (not e!38435))))

(declare-datatypes ((tuple2!5280 0))(
  ( (tuple2!5281 (_1!2751 BitStream!2078) (_2!2751 Bool)) )
))
(declare-fun lt!92016 () tuple2!5280)

(declare-fun lt!92012 () tuple2!5254)

(declare-fun lt!92013 () Bool)

(assert (=> b!58019 (= res!48152 (and (= (_2!2751 lt!92016) lt!92013) (= (_1!2751 lt!92016) (_2!2738 lt!92012))))))

(declare-fun readBitPure!0 (BitStream!2078) tuple2!5280)

(declare-fun readerFrom!0 (BitStream!2078 (_ BitVec 32) (_ BitVec 32)) BitStream!2078)

(assert (=> b!58019 (= lt!92016 (readBitPure!0 (readerFrom!0 (_2!2738 lt!92012) (currentBit!3180 thiss!1379) (currentByte!3185 thiss!1379))))))

(declare-fun b!58020 () Bool)

(declare-fun e!38436 () Bool)

(declare-fun e!38434 () Bool)

(assert (=> b!58020 (= e!38436 e!38434)))

(declare-fun res!48151 () Bool)

(assert (=> b!58020 (=> (not res!48151) (not e!38434))))

(declare-fun lt!92011 () tuple2!5254)

(declare-fun lt!92006 () tuple2!5280)

(declare-fun lt!92007 () (_ BitVec 8))

(assert (=> b!58020 (= res!48151 (and (= (_2!2751 lt!92006) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1756 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!92007)) #b00000000000000000000000000000000))) (= (_1!2751 lt!92006) (_2!2738 lt!92011))))))

(declare-fun lt!92014 () tuple2!5272)

(declare-fun lt!92015 () BitStream!2078)

(assert (=> b!58020 (= lt!92014 (readBits!0 lt!92015 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58020 (= lt!92006 (readBitPure!0 lt!92015))))

(assert (=> b!58020 (= lt!92015 (readerFrom!0 (_2!2738 lt!92011) (currentBit!3180 thiss!1379) (currentByte!3185 thiss!1379)))))

(declare-fun b!58021 () Bool)

(declare-fun res!48147 () Bool)

(assert (=> b!58021 (=> (not res!48147) (not e!38437))))

(assert (=> b!58021 (= res!48147 (isPrefixOf!0 thiss!1379 (_2!2738 lt!92012)))))

(declare-fun b!58022 () Bool)

(declare-fun res!48146 () Bool)

(assert (=> b!58022 (=> (not res!48146) (not e!38436))))

(declare-fun lt!92010 () (_ BitVec 64))

(declare-fun lt!92017 () (_ BitVec 64))

(assert (=> b!58022 (= res!48146 (= (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!92011))) (currentByte!3185 (_2!2738 lt!92011)) (currentBit!3180 (_2!2738 lt!92011))) (bvadd lt!92010 lt!92017)))))

(assert (=> b!58022 (or (not (= (bvand lt!92010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!92017 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!92010 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!92010 lt!92017) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!58022 (= lt!92017 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!58022 (= lt!92010 (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)))))

(declare-fun d!18514 () Bool)

(assert (=> d!18514 e!38436))

(declare-fun res!48148 () Bool)

(assert (=> d!18514 (=> (not res!48148) (not e!38436))))

(assert (=> d!18514 (= res!48148 (= (size!1195 (buf!1573 (_2!2738 lt!92011))) (size!1195 (buf!1573 thiss!1379))))))

(declare-fun lt!92008 () array!2636)

(assert (=> d!18514 (= lt!92007 (select (arr!1756 lt!92008) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18514 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1195 lt!92008)))))

(assert (=> d!18514 (= lt!92008 (array!2637 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!92009 () tuple2!5254)

(assert (=> d!18514 (= lt!92011 (tuple2!5255 (_1!2738 lt!92009) (_2!2738 lt!92009)))))

(assert (=> d!18514 (= lt!92009 lt!92012)))

(assert (=> d!18514 e!38437))

(declare-fun res!48149 () Bool)

(assert (=> d!18514 (=> (not res!48149) (not e!38437))))

(assert (=> d!18514 (= res!48149 (= (size!1195 (buf!1573 thiss!1379)) (size!1195 (buf!1573 (_2!2738 lt!92012)))))))

(declare-fun appendBit!0 (BitStream!2078 Bool) tuple2!5254)

(assert (=> d!18514 (= lt!92012 (appendBit!0 thiss!1379 lt!92013))))

(assert (=> d!18514 (= lt!92013 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1756 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18514 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18514 (= (appendBitFromByte!0 thiss!1379 (select (arr!1756 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!92011)))

(declare-fun b!58023 () Bool)

(declare-fun res!48150 () Bool)

(assert (=> b!58023 (=> (not res!48150) (not e!38437))))

(assert (=> b!58023 (= res!48150 (= (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!92012))) (currentByte!3185 (_2!2738 lt!92012)) (currentBit!3180 (_2!2738 lt!92012))) (bvadd (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58024 () Bool)

(assert (=> b!58024 (= e!38435 (= (bitIndex!0 (size!1195 (buf!1573 (_1!2751 lt!92016))) (currentByte!3185 (_1!2751 lt!92016)) (currentBit!3180 (_1!2751 lt!92016))) (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!92012))) (currentByte!3185 (_2!2738 lt!92012)) (currentBit!3180 (_2!2738 lt!92012)))))))

(declare-fun b!58025 () Bool)

(declare-fun res!48145 () Bool)

(assert (=> b!58025 (=> (not res!48145) (not e!38436))))

(assert (=> b!58025 (= res!48145 (isPrefixOf!0 thiss!1379 (_2!2738 lt!92011)))))

(declare-fun b!58026 () Bool)

(assert (=> b!58026 (= e!38434 (= (bitIndex!0 (size!1195 (buf!1573 (_1!2751 lt!92006))) (currentByte!3185 (_1!2751 lt!92006)) (currentBit!3180 (_1!2751 lt!92006))) (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!92011))) (currentByte!3185 (_2!2738 lt!92011)) (currentBit!3180 (_2!2738 lt!92011)))))))

(assert (= (and d!18514 res!48149) b!58023))

(assert (= (and b!58023 res!48150) b!58021))

(assert (= (and b!58021 res!48147) b!58019))

(assert (= (and b!58019 res!48152) b!58024))

(assert (= (and d!18514 res!48148) b!58022))

(assert (= (and b!58022 res!48146) b!58025))

(assert (= (and b!58025 res!48145) b!58020))

(assert (= (and b!58020 res!48151) b!58026))

(declare-fun m!91525 () Bool)

(assert (=> b!58019 m!91525))

(assert (=> b!58019 m!91525))

(declare-fun m!91527 () Bool)

(assert (=> b!58019 m!91527))

(declare-fun m!91529 () Bool)

(assert (=> b!58021 m!91529))

(declare-fun m!91531 () Bool)

(assert (=> d!18514 m!91531))

(declare-fun m!91533 () Bool)

(assert (=> d!18514 m!91533))

(assert (=> d!18514 m!91469))

(declare-fun m!91535 () Bool)

(assert (=> b!58024 m!91535))

(declare-fun m!91537 () Bool)

(assert (=> b!58024 m!91537))

(declare-fun m!91539 () Bool)

(assert (=> b!58020 m!91539))

(declare-fun m!91541 () Bool)

(assert (=> b!58020 m!91541))

(declare-fun m!91543 () Bool)

(assert (=> b!58020 m!91543))

(assert (=> b!58023 m!91537))

(assert (=> b!58023 m!91007))

(declare-fun m!91545 () Bool)

(assert (=> b!58022 m!91545))

(assert (=> b!58022 m!91007))

(declare-fun m!91547 () Bool)

(assert (=> b!58026 m!91547))

(assert (=> b!58026 m!91545))

(declare-fun m!91549 () Bool)

(assert (=> b!58025 m!91549))

(assert (=> b!57691 d!18514))

(declare-fun d!18536 () Bool)

(declare-fun e!38440 () Bool)

(assert (=> d!18536 e!38440))

(declare-fun res!48158 () Bool)

(assert (=> d!18536 (=> (not res!48158) (not e!38440))))

(declare-fun lt!92030 () (_ BitVec 64))

(declare-fun lt!92034 () (_ BitVec 64))

(declare-fun lt!92035 () (_ BitVec 64))

(assert (=> d!18536 (= res!48158 (= lt!92030 (bvsub lt!92035 lt!92034)))))

(assert (=> d!18536 (or (= (bvand lt!92035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!92034 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!92035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!92035 lt!92034) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18536 (= lt!92034 (remainingBits!0 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91205)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91205))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91205)))))))

(declare-fun lt!92033 () (_ BitVec 64))

(declare-fun lt!92031 () (_ BitVec 64))

(assert (=> d!18536 (= lt!92035 (bvmul lt!92033 lt!92031))))

(assert (=> d!18536 (or (= lt!92033 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!92031 (bvsdiv (bvmul lt!92033 lt!92031) lt!92033)))))

(assert (=> d!18536 (= lt!92031 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18536 (= lt!92033 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91205)))))))

(assert (=> d!18536 (= lt!92030 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91205))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91205)))))))

(assert (=> d!18536 (invariant!0 (currentBit!3180 (_2!2738 lt!91205)) (currentByte!3185 (_2!2738 lt!91205)) (size!1195 (buf!1573 (_2!2738 lt!91205))))))

(assert (=> d!18536 (= (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91205))) (currentByte!3185 (_2!2738 lt!91205)) (currentBit!3180 (_2!2738 lt!91205))) lt!92030)))

(declare-fun b!58031 () Bool)

(declare-fun res!48157 () Bool)

(assert (=> b!58031 (=> (not res!48157) (not e!38440))))

(assert (=> b!58031 (= res!48157 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!92030))))

(declare-fun b!58032 () Bool)

(declare-fun lt!92032 () (_ BitVec 64))

(assert (=> b!58032 (= e!38440 (bvsle lt!92030 (bvmul lt!92032 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!58032 (or (= lt!92032 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!92032 #b0000000000000000000000000000000000000000000000000000000000001000) lt!92032)))))

(assert (=> b!58032 (= lt!92032 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91205)))))))

(assert (= (and d!18536 res!48158) b!58031))

(assert (= (and b!58031 res!48157) b!58032))

(declare-fun m!91551 () Bool)

(assert (=> d!18536 m!91551))

(assert (=> d!18536 m!91001))

(assert (=> b!57693 d!18536))

(declare-fun d!18538 () Bool)

(assert (=> d!18538 (= (array_inv!1098 (buf!1573 thiss!1379)) (bvsge (size!1195 (buf!1573 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!57698 d!18538))

(declare-fun d!18540 () Bool)

(declare-fun res!48160 () Bool)

(declare-fun e!38442 () Bool)

(assert (=> d!18540 (=> (not res!48160) (not e!38442))))

(assert (=> d!18540 (= res!48160 (= (size!1195 (buf!1573 thiss!1379)) (size!1195 (buf!1573 thiss!1379))))))

(assert (=> d!18540 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!38442)))

(declare-fun b!58033 () Bool)

(declare-fun res!48159 () Bool)

(assert (=> b!58033 (=> (not res!48159) (not e!38442))))

(assert (=> b!58033 (= res!48159 (bvsle (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)) (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379))))))

(declare-fun b!58034 () Bool)

(declare-fun e!38441 () Bool)

(assert (=> b!58034 (= e!38442 e!38441)))

(declare-fun res!48161 () Bool)

(assert (=> b!58034 (=> res!48161 e!38441)))

(assert (=> b!58034 (= res!48161 (= (size!1195 (buf!1573 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!58035 () Bool)

(assert (=> b!58035 (= e!38441 (arrayBitRangesEq!0 (buf!1573 thiss!1379) (buf!1573 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379))))))

(assert (= (and d!18540 res!48160) b!58033))

(assert (= (and b!58033 res!48159) b!58034))

(assert (= (and b!58034 (not res!48161)) b!58035))

(assert (=> b!58033 m!91007))

(assert (=> b!58033 m!91007))

(assert (=> b!58035 m!91007))

(assert (=> b!58035 m!91007))

(declare-fun m!91553 () Bool)

(assert (=> b!58035 m!91553))

(assert (=> b!57700 d!18540))

(declare-fun d!18542 () Bool)

(assert (=> d!18542 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92038 () Unit!3989)

(declare-fun choose!11 (BitStream!2078) Unit!3989)

(assert (=> d!18542 (= lt!92038 (choose!11 thiss!1379))))

(assert (=> d!18542 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!92038)))

(declare-fun bs!4600 () Bool)

(assert (= bs!4600 d!18542))

(assert (=> bs!4600 m!91003))

(declare-fun m!91555 () Bool)

(assert (=> bs!4600 m!91555))

(assert (=> b!57700 d!18542))

(declare-fun d!18544 () Bool)

(declare-fun e!38443 () Bool)

(assert (=> d!18544 e!38443))

(declare-fun res!48163 () Bool)

(assert (=> d!18544 (=> (not res!48163) (not e!38443))))

(declare-fun lt!92039 () (_ BitVec 64))

(declare-fun lt!92043 () (_ BitVec 64))

(declare-fun lt!92044 () (_ BitVec 64))

(assert (=> d!18544 (= res!48163 (= lt!92039 (bvsub lt!92044 lt!92043)))))

(assert (=> d!18544 (or (= (bvand lt!92044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!92043 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!92044 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!92044 lt!92043) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18544 (= lt!92043 (remainingBits!0 ((_ sign_extend 32) (size!1195 (buf!1573 thiss!1379))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379))))))

(declare-fun lt!92042 () (_ BitVec 64))

(declare-fun lt!92040 () (_ BitVec 64))

(assert (=> d!18544 (= lt!92044 (bvmul lt!92042 lt!92040))))

(assert (=> d!18544 (or (= lt!92042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!92040 (bvsdiv (bvmul lt!92042 lt!92040) lt!92042)))))

(assert (=> d!18544 (= lt!92040 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18544 (= lt!92042 ((_ sign_extend 32) (size!1195 (buf!1573 thiss!1379))))))

(assert (=> d!18544 (= lt!92039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3185 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3180 thiss!1379))))))

(assert (=> d!18544 (invariant!0 (currentBit!3180 thiss!1379) (currentByte!3185 thiss!1379) (size!1195 (buf!1573 thiss!1379)))))

(assert (=> d!18544 (= (bitIndex!0 (size!1195 (buf!1573 thiss!1379)) (currentByte!3185 thiss!1379) (currentBit!3180 thiss!1379)) lt!92039)))

(declare-fun b!58036 () Bool)

(declare-fun res!48162 () Bool)

(assert (=> b!58036 (=> (not res!48162) (not e!38443))))

(assert (=> b!58036 (= res!48162 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!92039))))

(declare-fun b!58037 () Bool)

(declare-fun lt!92041 () (_ BitVec 64))

(assert (=> b!58037 (= e!38443 (bvsle lt!92039 (bvmul lt!92041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!58037 (or (= lt!92041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!92041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!92041)))))

(assert (=> b!58037 (= lt!92041 ((_ sign_extend 32) (size!1195 (buf!1573 thiss!1379))))))

(assert (= (and d!18544 res!48163) b!58036))

(assert (= (and b!58036 res!48162) b!58037))

(declare-fun m!91557 () Bool)

(assert (=> d!18544 m!91557))

(assert (=> d!18544 m!91057))

(assert (=> b!57700 d!18544))

(declare-fun d!18546 () Bool)

(assert (=> d!18546 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1195 (buf!1573 thiss!1379))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1195 (buf!1573 thiss!1379))) ((_ sign_extend 32) (currentByte!3185 thiss!1379)) ((_ sign_extend 32) (currentBit!3180 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4601 () Bool)

(assert (= bs!4601 d!18546))

(assert (=> bs!4601 m!91557))

(assert (=> b!57694 d!18546))

(declare-fun d!18548 () Bool)

(declare-fun e!38444 () Bool)

(assert (=> d!18548 e!38444))

(declare-fun res!48165 () Bool)

(assert (=> d!18548 (=> (not res!48165) (not e!38444))))

(declare-fun lt!92045 () (_ BitVec 64))

(declare-fun lt!92050 () (_ BitVec 64))

(declare-fun lt!92049 () (_ BitVec 64))

(assert (=> d!18548 (= res!48165 (= lt!92045 (bvsub lt!92050 lt!92049)))))

(assert (=> d!18548 (or (= (bvand lt!92050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!92049 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!92050 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!92050 lt!92049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18548 (= lt!92049 (remainingBits!0 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))) ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211)))))))

(declare-fun lt!92048 () (_ BitVec 64))

(declare-fun lt!92046 () (_ BitVec 64))

(assert (=> d!18548 (= lt!92050 (bvmul lt!92048 lt!92046))))

(assert (=> d!18548 (or (= lt!92048 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!92046 (bvsdiv (bvmul lt!92048 lt!92046) lt!92048)))))

(assert (=> d!18548 (= lt!92046 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18548 (= lt!92048 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))))))

(assert (=> d!18548 (= lt!92045 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3185 (_2!2738 lt!91211))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3180 (_2!2738 lt!91211)))))))

(assert (=> d!18548 (invariant!0 (currentBit!3180 (_2!2738 lt!91211)) (currentByte!3185 (_2!2738 lt!91211)) (size!1195 (buf!1573 (_2!2738 lt!91211))))))

(assert (=> d!18548 (= (bitIndex!0 (size!1195 (buf!1573 (_2!2738 lt!91211))) (currentByte!3185 (_2!2738 lt!91211)) (currentBit!3180 (_2!2738 lt!91211))) lt!92045)))

(declare-fun b!58038 () Bool)

(declare-fun res!48164 () Bool)

(assert (=> b!58038 (=> (not res!48164) (not e!38444))))

(assert (=> b!58038 (= res!48164 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!92045))))

(declare-fun b!58039 () Bool)

(declare-fun lt!92047 () (_ BitVec 64))

(assert (=> b!58039 (= e!38444 (bvsle lt!92045 (bvmul lt!92047 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!58039 (or (= lt!92047 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!92047 #b0000000000000000000000000000000000000000000000000000000000001000) lt!92047)))))

(assert (=> b!58039 (= lt!92047 ((_ sign_extend 32) (size!1195 (buf!1573 (_2!2738 lt!91211)))))))

(assert (= (and d!18548 res!48165) b!58038))

(assert (= (and b!58038 res!48164) b!58039))

(assert (=> d!18548 m!91483))

(declare-fun m!91559 () Bool)

(assert (=> d!18548 m!91559))

(assert (=> b!57699 d!18548))

(push 1)

(assert (not b!57958))

(assert (not d!18470))

(assert (not b!57956))

(assert (not d!18548))

(assert (not d!18474))

(assert (not d!18510))

(assert (not b!57937))

(assert (not b!58022))

(assert (not b!57869))

(assert (not d!18514))

(assert (not b!57864))

(assert (not b!57867))

(assert (not b!58020))

(assert (not b!58019))

(assert (not b!57963))

(assert (not b!58025))

(assert (not b!58026))

(assert (not b!57938))

(assert (not b!57960))

(assert (not b!57945))

(assert (not d!18512))

(assert (not b!57939))

(assert (not b!57957))

(assert (not b!57897))

(assert (not b!57898))

(assert (not d!18542))

(assert (not d!18536))

(assert (not b!58035))

(assert (not b!58023))

(assert (not d!18544))

(assert (not b!58024))

(assert (not d!18546))

(assert (not b!57870))

(assert (not d!18438))

(assert (not b!57935))

(assert (not b!57895))

(assert (not d!18486))

(assert (not b!58021))

(assert (not b!57900))

(assert (not d!18436))

(assert (not bm!759))

(assert (not b!57871))

(assert (not b!57955))

(assert (not b!58033))

(assert (not b!57865))

(assert (not d!18440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

