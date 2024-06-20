; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11682 () Bool)

(assert start!11682)

(declare-fun b!57631 () Bool)

(declare-fun res!47865 () Bool)

(declare-fun e!38217 () Bool)

(assert (=> b!57631 (=> (not res!47865) (not e!38217))))

(declare-datatypes ((array!2632 0))(
  ( (array!2633 (arr!1754 (Array (_ BitVec 32) (_ BitVec 8))) (size!1193 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2074 0))(
  ( (BitStream!2075 (buf!1571 array!2632) (currentByte!3183 (_ BitVec 32)) (currentBit!3178 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2074)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57631 (= res!47865 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 thiss!1379))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!57632 () Bool)

(declare-fun res!47858 () Bool)

(declare-fun e!38219 () Bool)

(assert (=> b!57632 (=> res!47858 e!38219)))

(declare-datatypes ((Unit!3985 0))(
  ( (Unit!3986) )
))
(declare-datatypes ((tuple2!5246 0))(
  ( (tuple2!5247 (_1!2734 Unit!3985) (_2!2734 BitStream!2074)) )
))
(declare-fun lt!91154 () tuple2!5246)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!57632 (= res!47858 (not (invariant!0 (currentBit!3178 (_2!2734 lt!91154)) (currentByte!3183 (_2!2734 lt!91154)) (size!1193 (buf!1571 (_2!2734 lt!91154))))))))

(declare-fun b!57633 () Bool)

(declare-fun e!38220 () Bool)

(declare-fun e!38222 () Bool)

(assert (=> b!57633 (= e!38220 e!38222)))

(declare-fun res!47857 () Bool)

(assert (=> b!57633 (=> res!47857 e!38222)))

(declare-fun lt!91158 () tuple2!5246)

(declare-fun isPrefixOf!0 (BitStream!2074 BitStream!2074) Bool)

(assert (=> b!57633 (= res!47857 (not (isPrefixOf!0 (_2!2734 lt!91158) (_2!2734 lt!91154))))))

(assert (=> b!57633 (isPrefixOf!0 thiss!1379 (_2!2734 lt!91154))))

(declare-fun lt!91151 () Unit!3985)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2074 BitStream!2074 BitStream!2074) Unit!3985)

(assert (=> b!57633 (= lt!91151 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2734 lt!91158) (_2!2734 lt!91154)))))

(declare-fun srcBuffer!2 () array!2632)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2074 array!2632 (_ BitVec 64) (_ BitVec 64)) tuple2!5246)

(assert (=> b!57633 (= lt!91154 (appendBitsMSBFirstLoop!0 (_2!2734 lt!91158) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38218 () Bool)

(assert (=> b!57633 e!38218))

(declare-fun res!47860 () Bool)

(assert (=> b!57633 (=> (not res!47860) (not e!38218))))

(assert (=> b!57633 (= res!47860 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91152 () Unit!3985)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2074 array!2632 (_ BitVec 64)) Unit!3985)

(assert (=> b!57633 (= lt!91152 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1571 (_2!2734 lt!91158)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5248 0))(
  ( (tuple2!5249 (_1!2735 BitStream!2074) (_2!2735 BitStream!2074)) )
))
(declare-fun lt!91157 () tuple2!5248)

(declare-fun reader!0 (BitStream!2074 BitStream!2074) tuple2!5248)

(assert (=> b!57633 (= lt!91157 (reader!0 thiss!1379 (_2!2734 lt!91158)))))

(declare-fun b!57634 () Bool)

(assert (=> b!57634 (= e!38222 e!38219)))

(declare-fun res!47864 () Bool)

(assert (=> b!57634 (=> res!47864 e!38219)))

(declare-fun lt!91155 () (_ BitVec 64))

(declare-fun lt!91153 () (_ BitVec 64))

(assert (=> b!57634 (= res!47864 (not (= lt!91153 (bvsub (bvadd lt!91155 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!57634 (= lt!91153 (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91154))) (currentByte!3183 (_2!2734 lt!91154)) (currentBit!3178 (_2!2734 lt!91154))))))

(declare-fun res!47863 () Bool)

(assert (=> start!11682 (=> (not res!47863) (not e!38217))))

(assert (=> start!11682 (= res!47863 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1193 srcBuffer!2))))))))

(assert (=> start!11682 e!38217))

(assert (=> start!11682 true))

(declare-fun array_inv!1096 (array!2632) Bool)

(assert (=> start!11682 (array_inv!1096 srcBuffer!2)))

(declare-fun e!38221 () Bool)

(declare-fun inv!12 (BitStream!2074) Bool)

(assert (=> start!11682 (and (inv!12 thiss!1379) e!38221)))

(declare-fun b!57635 () Bool)

(declare-datatypes ((List!612 0))(
  ( (Nil!609) (Cons!608 (h!727 Bool) (t!1362 List!612)) )
))
(declare-fun head!431 (List!612) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2074 array!2632 (_ BitVec 64) (_ BitVec 64)) List!612)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2074 BitStream!2074 (_ BitVec 64)) List!612)

(assert (=> b!57635 (= e!38218 (= (head!431 (byteArrayBitContentToList!0 (_2!2734 lt!91158) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!431 (bitStreamReadBitsIntoList!0 (_2!2734 lt!91158) (_1!2735 lt!91157) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!57636 () Bool)

(assert (=> b!57636 (= e!38221 (array_inv!1096 (buf!1571 thiss!1379)))))

(declare-fun b!57637 () Bool)

(assert (=> b!57637 (= e!38219 (= lt!91153 (bvsub (bvsub (bvadd (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57637 (= (size!1193 (buf!1571 (_2!2734 lt!91154))) (size!1193 (buf!1571 thiss!1379)))))

(declare-fun b!57638 () Bool)

(declare-fun e!38215 () Bool)

(assert (=> b!57638 (= e!38217 (not e!38215))))

(declare-fun res!47861 () Bool)

(assert (=> b!57638 (=> res!47861 e!38215)))

(assert (=> b!57638 (= res!47861 (bvsge i!635 to!314))))

(assert (=> b!57638 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!91159 () Unit!3985)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2074) Unit!3985)

(assert (=> b!57638 (= lt!91159 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!57638 (= lt!91155 (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)))))

(declare-fun b!57639 () Bool)

(assert (=> b!57639 (= e!38215 e!38220)))

(declare-fun res!47862 () Bool)

(assert (=> b!57639 (=> res!47862 e!38220)))

(assert (=> b!57639 (= res!47862 (not (isPrefixOf!0 thiss!1379 (_2!2734 lt!91158))))))

(assert (=> b!57639 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91156 () Unit!3985)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2074 BitStream!2074 (_ BitVec 64) (_ BitVec 64)) Unit!3985)

(assert (=> b!57639 (= lt!91156 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2734 lt!91158) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2074 (_ BitVec 8) (_ BitVec 32)) tuple2!5246)

(assert (=> b!57639 (= lt!91158 (appendBitFromByte!0 thiss!1379 (select (arr!1754 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!57640 () Bool)

(declare-fun res!47859 () Bool)

(assert (=> b!57640 (=> res!47859 e!38219)))

(assert (=> b!57640 (= res!47859 (not (= (size!1193 (buf!1571 thiss!1379)) (size!1193 (buf!1571 (_2!2734 lt!91154))))))))

(assert (= (and start!11682 res!47863) b!57631))

(assert (= (and b!57631 res!47865) b!57638))

(assert (= (and b!57638 (not res!47861)) b!57639))

(assert (= (and b!57639 (not res!47862)) b!57633))

(assert (= (and b!57633 res!47860) b!57635))

(assert (= (and b!57633 (not res!47857)) b!57634))

(assert (= (and b!57634 (not res!47864)) b!57632))

(assert (= (and b!57632 (not res!47858)) b!57640))

(assert (= (and b!57640 (not res!47859)) b!57637))

(assert (= start!11682 b!57636))

(declare-fun m!90871 () Bool)

(assert (=> b!57637 m!90871))

(declare-fun m!90873 () Bool)

(assert (=> b!57639 m!90873))

(declare-fun m!90875 () Bool)

(assert (=> b!57639 m!90875))

(declare-fun m!90877 () Bool)

(assert (=> b!57639 m!90877))

(declare-fun m!90879 () Bool)

(assert (=> b!57639 m!90879))

(assert (=> b!57639 m!90877))

(declare-fun m!90881 () Bool)

(assert (=> b!57639 m!90881))

(declare-fun m!90883 () Bool)

(assert (=> b!57631 m!90883))

(declare-fun m!90885 () Bool)

(assert (=> b!57635 m!90885))

(assert (=> b!57635 m!90885))

(declare-fun m!90887 () Bool)

(assert (=> b!57635 m!90887))

(declare-fun m!90889 () Bool)

(assert (=> b!57635 m!90889))

(assert (=> b!57635 m!90889))

(declare-fun m!90891 () Bool)

(assert (=> b!57635 m!90891))

(declare-fun m!90893 () Bool)

(assert (=> b!57636 m!90893))

(declare-fun m!90895 () Bool)

(assert (=> b!57632 m!90895))

(declare-fun m!90897 () Bool)

(assert (=> b!57634 m!90897))

(declare-fun m!90899 () Bool)

(assert (=> b!57633 m!90899))

(declare-fun m!90901 () Bool)

(assert (=> b!57633 m!90901))

(declare-fun m!90903 () Bool)

(assert (=> b!57633 m!90903))

(declare-fun m!90905 () Bool)

(assert (=> b!57633 m!90905))

(declare-fun m!90907 () Bool)

(assert (=> b!57633 m!90907))

(declare-fun m!90909 () Bool)

(assert (=> b!57633 m!90909))

(declare-fun m!90911 () Bool)

(assert (=> b!57633 m!90911))

(declare-fun m!90913 () Bool)

(assert (=> start!11682 m!90913))

(declare-fun m!90915 () Bool)

(assert (=> start!11682 m!90915))

(declare-fun m!90917 () Bool)

(assert (=> b!57638 m!90917))

(declare-fun m!90919 () Bool)

(assert (=> b!57638 m!90919))

(declare-fun m!90921 () Bool)

(assert (=> b!57638 m!90921))

(push 1)

(assert (not b!57637))

(assert (not b!57638))

(assert (not start!11682))

(assert (not b!57634))

(assert (not b!57631))

(assert (not b!57636))

(assert (not b!57639))

(assert (not b!57632))

(assert (not b!57635))

(assert (not b!57633))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!18418 () Bool)

(assert (=> d!18418 (= (head!431 (byteArrayBitContentToList!0 (_2!2734 lt!91158) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!727 (byteArrayBitContentToList!0 (_2!2734 lt!91158) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57635 d!18418))

(declare-fun d!18420 () Bool)

(declare-fun c!4185 () Bool)

(assert (=> d!18420 (= c!4185 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!38293 () List!612)

(assert (=> d!18420 (= (byteArrayBitContentToList!0 (_2!2734 lt!91158) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!38293)))

(declare-fun b!57726 () Bool)

(assert (=> b!57726 (= e!38293 Nil!609)))

(declare-fun b!57727 () Bool)

(assert (=> b!57727 (= e!38293 (Cons!608 (not (= (bvand ((_ sign_extend 24) (select (arr!1754 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!2734 lt!91158) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!18420 c!4185) b!57726))

(assert (= (and d!18420 (not c!4185)) b!57727))

(assert (=> b!57727 m!90877))

(declare-fun m!91041 () Bool)

(assert (=> b!57727 m!91041))

(declare-fun m!91043 () Bool)

(assert (=> b!57727 m!91043))

(assert (=> b!57635 d!18420))

(declare-fun d!18422 () Bool)

(assert (=> d!18422 (= (head!431 (bitStreamReadBitsIntoList!0 (_2!2734 lt!91158) (_1!2735 lt!91157) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!727 (bitStreamReadBitsIntoList!0 (_2!2734 lt!91158) (_1!2735 lt!91157) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!57635 d!18422))

(declare-fun b!57739 () Bool)

(declare-fun e!38299 () Bool)

(declare-fun lt!91246 () List!612)

(declare-fun length!291 (List!612) Int)

(assert (=> b!57739 (= e!38299 (> (length!291 lt!91246) 0))))

(declare-fun b!57736 () Bool)

(declare-datatypes ((tuple2!5262 0))(
  ( (tuple2!5263 (_1!2742 List!612) (_2!2742 BitStream!2074)) )
))
(declare-fun e!38298 () tuple2!5262)

(assert (=> b!57736 (= e!38298 (tuple2!5263 Nil!609 (_1!2735 lt!91157)))))

(declare-fun d!18424 () Bool)

(assert (=> d!18424 e!38299))

(declare-fun c!4191 () Bool)

(assert (=> d!18424 (= c!4191 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18424 (= lt!91246 (_1!2742 e!38298))))

(declare-fun c!4190 () Bool)

(assert (=> d!18424 (= c!4190 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!18424 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18424 (= (bitStreamReadBitsIntoList!0 (_2!2734 lt!91158) (_1!2735 lt!91157) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91246)))

(declare-fun b!57738 () Bool)

(declare-fun isEmpty!177 (List!612) Bool)

(assert (=> b!57738 (= e!38299 (isEmpty!177 lt!91246))))

(declare-fun lt!91245 () (_ BitVec 64))

(declare-fun b!57737 () Bool)

(declare-datatypes ((tuple2!5264 0))(
  ( (tuple2!5265 (_1!2743 Bool) (_2!2743 BitStream!2074)) )
))
(declare-fun lt!91244 () tuple2!5264)

(assert (=> b!57737 (= e!38298 (tuple2!5263 (Cons!608 (_1!2743 lt!91244) (bitStreamReadBitsIntoList!0 (_2!2734 lt!91158) (_2!2743 lt!91244) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!91245))) (_2!2743 lt!91244)))))

(declare-fun readBit!0 (BitStream!2074) tuple2!5264)

(assert (=> b!57737 (= lt!91244 (readBit!0 (_1!2735 lt!91157)))))

(assert (=> b!57737 (= lt!91245 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (= (and d!18424 c!4190) b!57736))

(assert (= (and d!18424 (not c!4190)) b!57737))

(assert (= (and d!18424 c!4191) b!57738))

(assert (= (and d!18424 (not c!4191)) b!57739))

(declare-fun m!91045 () Bool)

(assert (=> b!57739 m!91045))

(declare-fun m!91047 () Bool)

(assert (=> b!57738 m!91047))

(declare-fun m!91049 () Bool)

(assert (=> b!57737 m!91049))

(declare-fun m!91051 () Bool)

(assert (=> b!57737 m!91051))

(assert (=> b!57635 d!18424))

(declare-fun d!18426 () Bool)

(assert (=> d!18426 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91249 () Unit!3985)

(declare-fun choose!9 (BitStream!2074 array!2632 (_ BitVec 64) BitStream!2074) Unit!3985)

(assert (=> d!18426 (= lt!91249 (choose!9 thiss!1379 (buf!1571 (_2!2734 lt!91158)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2075 (buf!1571 (_2!2734 lt!91158)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379))))))

(assert (=> d!18426 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1571 (_2!2734 lt!91158)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91249)))

(declare-fun bs!4582 () Bool)

(assert (= bs!4582 d!18426))

(assert (=> bs!4582 m!90907))

(declare-fun m!91053 () Bool)

(assert (=> bs!4582 m!91053))

(assert (=> b!57633 d!18426))

(declare-fun d!18428 () Bool)

(declare-fun res!47949 () Bool)

(declare-fun e!38304 () Bool)

(assert (=> d!18428 (=> (not res!47949) (not e!38304))))

(assert (=> d!18428 (= res!47949 (= (size!1193 (buf!1571 thiss!1379)) (size!1193 (buf!1571 (_2!2734 lt!91154)))))))

(assert (=> d!18428 (= (isPrefixOf!0 thiss!1379 (_2!2734 lt!91154)) e!38304)))

(declare-fun b!57746 () Bool)

(declare-fun res!47948 () Bool)

(assert (=> b!57746 (=> (not res!47948) (not e!38304))))

(assert (=> b!57746 (= res!47948 (bvsle (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)) (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91154))) (currentByte!3183 (_2!2734 lt!91154)) (currentBit!3178 (_2!2734 lt!91154)))))))

(declare-fun b!57747 () Bool)

(declare-fun e!38305 () Bool)

(assert (=> b!57747 (= e!38304 e!38305)))

(declare-fun res!47947 () Bool)

(assert (=> b!57747 (=> res!47947 e!38305)))

(assert (=> b!57747 (= res!47947 (= (size!1193 (buf!1571 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57748 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2632 array!2632 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!57748 (= e!38305 (arrayBitRangesEq!0 (buf!1571 thiss!1379) (buf!1571 (_2!2734 lt!91154)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379))))))

(assert (= (and d!18428 res!47949) b!57746))

(assert (= (and b!57746 res!47948) b!57747))

(assert (= (and b!57747 (not res!47947)) b!57748))

(assert (=> b!57746 m!90921))

(assert (=> b!57746 m!90897))

(assert (=> b!57748 m!90921))

(assert (=> b!57748 m!90921))

(declare-fun m!91055 () Bool)

(assert (=> b!57748 m!91055))

(assert (=> b!57633 d!18428))

(declare-fun b!57788 () Bool)

(declare-fun e!38324 () Unit!3985)

(declare-fun lt!91355 () Unit!3985)

(assert (=> b!57788 (= e!38324 lt!91355)))

(declare-fun lt!91357 () (_ BitVec 64))

(assert (=> b!57788 (= lt!91357 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!91354 () (_ BitVec 64))

(assert (=> b!57788 (= lt!91354 (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2632 array!2632 (_ BitVec 64) (_ BitVec 64)) Unit!3985)

(assert (=> b!57788 (= lt!91355 (arrayBitRangesEqSymmetric!0 (buf!1571 thiss!1379) (buf!1571 (_2!2734 lt!91158)) lt!91357 lt!91354))))

(assert (=> b!57788 (arrayBitRangesEq!0 (buf!1571 (_2!2734 lt!91158)) (buf!1571 thiss!1379) lt!91357 lt!91354)))

(declare-fun b!57789 () Bool)

(declare-fun lt!91345 () (_ BitVec 64))

(declare-fun lt!91360 () tuple2!5248)

(declare-fun lt!91359 () (_ BitVec 64))

(declare-fun e!38325 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!2074 (_ BitVec 64)) BitStream!2074)

(assert (=> b!57789 (= e!38325 (= (_1!2735 lt!91360) (withMovedBitIndex!0 (_2!2735 lt!91360) (bvsub lt!91345 lt!91359))))))

(assert (=> b!57789 (or (= (bvand lt!91345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91359 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91345 lt!91359) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57789 (= lt!91359 (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158))))))

(assert (=> b!57789 (= lt!91345 (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)))))

(declare-fun b!57790 () Bool)

(declare-fun res!47985 () Bool)

(assert (=> b!57790 (=> (not res!47985) (not e!38325))))

(assert (=> b!57790 (= res!47985 (isPrefixOf!0 (_1!2735 lt!91360) thiss!1379))))

(declare-fun d!18430 () Bool)

(assert (=> d!18430 e!38325))

(declare-fun res!47986 () Bool)

(assert (=> d!18430 (=> (not res!47986) (not e!38325))))

(assert (=> d!18430 (= res!47986 (isPrefixOf!0 (_1!2735 lt!91360) (_2!2735 lt!91360)))))

(declare-fun lt!91343 () BitStream!2074)

(assert (=> d!18430 (= lt!91360 (tuple2!5249 lt!91343 (_2!2734 lt!91158)))))

(declare-fun lt!91351 () Unit!3985)

(declare-fun lt!91344 () Unit!3985)

(assert (=> d!18430 (= lt!91351 lt!91344)))

(assert (=> d!18430 (isPrefixOf!0 lt!91343 (_2!2734 lt!91158))))

(assert (=> d!18430 (= lt!91344 (lemmaIsPrefixTransitive!0 lt!91343 (_2!2734 lt!91158) (_2!2734 lt!91158)))))

(declare-fun lt!91349 () Unit!3985)

(declare-fun lt!91347 () Unit!3985)

(assert (=> d!18430 (= lt!91349 lt!91347)))

(assert (=> d!18430 (isPrefixOf!0 lt!91343 (_2!2734 lt!91158))))

(assert (=> d!18430 (= lt!91347 (lemmaIsPrefixTransitive!0 lt!91343 thiss!1379 (_2!2734 lt!91158)))))

(declare-fun lt!91352 () Unit!3985)

(assert (=> d!18430 (= lt!91352 e!38324)))

(declare-fun c!4194 () Bool)

(assert (=> d!18430 (= c!4194 (not (= (size!1193 (buf!1571 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!91342 () Unit!3985)

(declare-fun lt!91358 () Unit!3985)

(assert (=> d!18430 (= lt!91342 lt!91358)))

(assert (=> d!18430 (isPrefixOf!0 (_2!2734 lt!91158) (_2!2734 lt!91158))))

(assert (=> d!18430 (= lt!91358 (lemmaIsPrefixRefl!0 (_2!2734 lt!91158)))))

(declare-fun lt!91341 () Unit!3985)

(declare-fun lt!91346 () Unit!3985)

(assert (=> d!18430 (= lt!91341 lt!91346)))

(assert (=> d!18430 (= lt!91346 (lemmaIsPrefixRefl!0 (_2!2734 lt!91158)))))

(declare-fun lt!91348 () Unit!3985)

(declare-fun lt!91350 () Unit!3985)

(assert (=> d!18430 (= lt!91348 lt!91350)))

(assert (=> d!18430 (isPrefixOf!0 lt!91343 lt!91343)))

(assert (=> d!18430 (= lt!91350 (lemmaIsPrefixRefl!0 lt!91343))))

(declare-fun lt!91353 () Unit!3985)

(declare-fun lt!91356 () Unit!3985)

(assert (=> d!18430 (= lt!91353 lt!91356)))

(assert (=> d!18430 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!18430 (= lt!91356 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!18430 (= lt!91343 (BitStream!2075 (buf!1571 (_2!2734 lt!91158)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)))))

(assert (=> d!18430 (isPrefixOf!0 thiss!1379 (_2!2734 lt!91158))))

(assert (=> d!18430 (= (reader!0 thiss!1379 (_2!2734 lt!91158)) lt!91360)))

(declare-fun b!57791 () Bool)

(declare-fun Unit!3999 () Unit!3985)

(assert (=> b!57791 (= e!38324 Unit!3999)))

(declare-fun b!57792 () Bool)

(declare-fun res!47984 () Bool)

(assert (=> b!57792 (=> (not res!47984) (not e!38325))))

(assert (=> b!57792 (= res!47984 (isPrefixOf!0 (_2!2735 lt!91360) (_2!2734 lt!91158)))))

(assert (= (and d!18430 c!4194) b!57788))

(assert (= (and d!18430 (not c!4194)) b!57791))

(assert (= (and d!18430 res!47986) b!57790))

(assert (= (and b!57790 res!47985) b!57792))

(assert (= (and b!57792 res!47984) b!57789))

(assert (=> b!57788 m!90921))

(declare-fun m!91093 () Bool)

(assert (=> b!57788 m!91093))

(declare-fun m!91095 () Bool)

(assert (=> b!57788 m!91095))

(declare-fun m!91097 () Bool)

(assert (=> b!57792 m!91097))

(declare-fun m!91099 () Bool)

(assert (=> b!57790 m!91099))

(declare-fun m!91101 () Bool)

(assert (=> b!57789 m!91101))

(assert (=> b!57789 m!90871))

(assert (=> b!57789 m!90921))

(declare-fun m!91103 () Bool)

(assert (=> d!18430 m!91103))

(declare-fun m!91105 () Bool)

(assert (=> d!18430 m!91105))

(declare-fun m!91107 () Bool)

(assert (=> d!18430 m!91107))

(declare-fun m!91109 () Bool)

(assert (=> d!18430 m!91109))

(declare-fun m!91111 () Bool)

(assert (=> d!18430 m!91111))

(assert (=> d!18430 m!90875))

(assert (=> d!18430 m!90917))

(declare-fun m!91113 () Bool)

(assert (=> d!18430 m!91113))

(declare-fun m!91115 () Bool)

(assert (=> d!18430 m!91115))

(declare-fun m!91117 () Bool)

(assert (=> d!18430 m!91117))

(assert (=> d!18430 m!90919))

(assert (=> b!57633 d!18430))

(declare-fun b!57844 () Bool)

(declare-fun res!48023 () Bool)

(declare-fun e!38346 () Bool)

(assert (=> b!57844 (=> (not res!48023) (not e!38346))))

(declare-fun lt!91676 () tuple2!5246)

(assert (=> b!57844 (= res!48023 (= (size!1193 (buf!1571 (_2!2734 lt!91158))) (size!1193 (buf!1571 (_2!2734 lt!91676)))))))

(declare-fun b!57845 () Bool)

(declare-fun res!48024 () Bool)

(assert (=> b!57845 (=> (not res!48024) (not e!38346))))

(assert (=> b!57845 (= res!48024 (isPrefixOf!0 (_2!2734 lt!91158) (_2!2734 lt!91676)))))

(declare-fun lt!91698 () tuple2!5248)

(declare-fun b!57846 () Bool)

(assert (=> b!57846 (= e!38346 (= (bitStreamReadBitsIntoList!0 (_2!2734 lt!91676) (_1!2735 lt!91698) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!2734 lt!91676) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!57846 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57846 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!91699 () Unit!3985)

(declare-fun lt!91684 () Unit!3985)

(assert (=> b!57846 (= lt!91699 lt!91684)))

(declare-fun lt!91700 () (_ BitVec 64))

(assert (=> b!57846 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91676)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158))) lt!91700)))

(assert (=> b!57846 (= lt!91684 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2734 lt!91158) (buf!1571 (_2!2734 lt!91676)) lt!91700))))

(declare-fun e!38348 () Bool)

(assert (=> b!57846 e!38348))

(declare-fun res!48020 () Bool)

(assert (=> b!57846 (=> (not res!48020) (not e!38348))))

(assert (=> b!57846 (= res!48020 (and (= (size!1193 (buf!1571 (_2!2734 lt!91158))) (size!1193 (buf!1571 (_2!2734 lt!91676)))) (bvsge lt!91700 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57846 (= lt!91700 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!57846 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57846 (= lt!91698 (reader!0 (_2!2734 lt!91158) (_2!2734 lt!91676)))))

(declare-fun b!57847 () Bool)

(declare-fun res!48022 () Bool)

(assert (=> b!57847 (=> (not res!48022) (not e!38346))))

(assert (=> b!57847 (= res!48022 (= (size!1193 (buf!1571 (_2!2734 lt!91676))) (size!1193 (buf!1571 (_2!2734 lt!91158)))))))

(declare-fun b!57848 () Bool)

(declare-fun res!48025 () Bool)

(assert (=> b!57848 (=> (not res!48025) (not e!38346))))

(assert (=> b!57848 (= res!48025 (invariant!0 (currentBit!3178 (_2!2734 lt!91676)) (currentByte!3183 (_2!2734 lt!91676)) (size!1193 (buf!1571 (_2!2734 lt!91676)))))))

(declare-fun b!57849 () Bool)

(declare-fun e!38347 () tuple2!5246)

(declare-fun lt!91711 () tuple2!5246)

(declare-fun Unit!4000 () Unit!3985)

(assert (=> b!57849 (= e!38347 (tuple2!5247 Unit!4000 (_2!2734 lt!91711)))))

(declare-fun lt!91680 () tuple2!5246)

(assert (=> b!57849 (= lt!91680 (appendBitFromByte!0 (_2!2734 lt!91158) (select (arr!1754 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!91677 () (_ BitVec 64))

(assert (=> b!57849 (= lt!91677 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91704 () (_ BitVec 64))

(assert (=> b!57849 (= lt!91704 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91681 () Unit!3985)

(assert (=> b!57849 (= lt!91681 (validateOffsetBitsIneqLemma!0 (_2!2734 lt!91158) (_2!2734 lt!91680) lt!91677 lt!91704))))

(assert (=> b!57849 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91680)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91680))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91680))) (bvsub lt!91677 lt!91704))))

(declare-fun lt!91686 () Unit!3985)

(assert (=> b!57849 (= lt!91686 lt!91681)))

(declare-fun lt!91707 () tuple2!5248)

(assert (=> b!57849 (= lt!91707 (reader!0 (_2!2734 lt!91158) (_2!2734 lt!91680)))))

(declare-fun lt!91692 () (_ BitVec 64))

(assert (=> b!57849 (= lt!91692 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!91695 () Unit!3985)

(assert (=> b!57849 (= lt!91695 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2734 lt!91158) (buf!1571 (_2!2734 lt!91680)) lt!91692))))

(assert (=> b!57849 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91680)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158))) lt!91692)))

(declare-fun lt!91691 () Unit!3985)

(assert (=> b!57849 (= lt!91691 lt!91695)))

(assert (=> b!57849 (= (head!431 (byteArrayBitContentToList!0 (_2!2734 lt!91680) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!431 (bitStreamReadBitsIntoList!0 (_2!2734 lt!91680) (_1!2735 lt!91707) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91697 () Unit!3985)

(declare-fun Unit!4001 () Unit!3985)

(assert (=> b!57849 (= lt!91697 Unit!4001)))

(assert (=> b!57849 (= lt!91711 (appendBitsMSBFirstLoop!0 (_2!2734 lt!91680) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!91701 () Unit!3985)

(assert (=> b!57849 (= lt!91701 (lemmaIsPrefixTransitive!0 (_2!2734 lt!91158) (_2!2734 lt!91680) (_2!2734 lt!91711)))))

(assert (=> b!57849 (isPrefixOf!0 (_2!2734 lt!91158) (_2!2734 lt!91711))))

(declare-fun lt!91706 () Unit!3985)

(assert (=> b!57849 (= lt!91706 lt!91701)))

(assert (=> b!57849 (= (size!1193 (buf!1571 (_2!2734 lt!91711))) (size!1193 (buf!1571 (_2!2734 lt!91158))))))

(declare-fun lt!91688 () Unit!3985)

(declare-fun Unit!4002 () Unit!3985)

(assert (=> b!57849 (= lt!91688 Unit!4002)))

(assert (=> b!57849 (= (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91711))) (currentByte!3183 (_2!2734 lt!91711)) (currentBit!3178 (_2!2734 lt!91711))) (bvsub (bvadd (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91708 () Unit!3985)

(declare-fun Unit!4003 () Unit!3985)

(assert (=> b!57849 (= lt!91708 Unit!4003)))

(assert (=> b!57849 (= (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91711))) (currentByte!3183 (_2!2734 lt!91711)) (currentBit!3178 (_2!2734 lt!91711))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91680))) (currentByte!3183 (_2!2734 lt!91680)) (currentBit!3178 (_2!2734 lt!91680))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91689 () Unit!3985)

(declare-fun Unit!4004 () Unit!3985)

(assert (=> b!57849 (= lt!91689 Unit!4004)))

(declare-fun lt!91705 () tuple2!5248)

(assert (=> b!57849 (= lt!91705 (reader!0 (_2!2734 lt!91158) (_2!2734 lt!91711)))))

(declare-fun lt!91719 () (_ BitVec 64))

(assert (=> b!57849 (= lt!91719 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91678 () Unit!3985)

(assert (=> b!57849 (= lt!91678 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2734 lt!91158) (buf!1571 (_2!2734 lt!91711)) lt!91719))))

(assert (=> b!57849 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91711)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158))) lt!91719)))

(declare-fun lt!91685 () Unit!3985)

(assert (=> b!57849 (= lt!91685 lt!91678)))

(declare-fun lt!91714 () tuple2!5248)

(declare-fun call!761 () tuple2!5248)

(assert (=> b!57849 (= lt!91714 call!761)))

(declare-fun lt!91718 () (_ BitVec 64))

(assert (=> b!57849 (= lt!91718 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!91709 () Unit!3985)

(assert (=> b!57849 (= lt!91709 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2734 lt!91680) (buf!1571 (_2!2734 lt!91711)) lt!91718))))

(assert (=> b!57849 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91711)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91680))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91680))) lt!91718)))

(declare-fun lt!91710 () Unit!3985)

(assert (=> b!57849 (= lt!91710 lt!91709)))

(declare-fun lt!91690 () List!612)

(assert (=> b!57849 (= lt!91690 (byteArrayBitContentToList!0 (_2!2734 lt!91711) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!91694 () List!612)

(assert (=> b!57849 (= lt!91694 (byteArrayBitContentToList!0 (_2!2734 lt!91711) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91683 () List!612)

(assert (=> b!57849 (= lt!91683 (bitStreamReadBitsIntoList!0 (_2!2734 lt!91711) (_1!2735 lt!91705) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!91682 () List!612)

(assert (=> b!57849 (= lt!91682 (bitStreamReadBitsIntoList!0 (_2!2734 lt!91711) (_1!2735 lt!91714) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!91713 () (_ BitVec 64))

(assert (=> b!57849 (= lt!91713 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!91717 () Unit!3985)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2074 BitStream!2074 BitStream!2074 BitStream!2074 (_ BitVec 64) List!612) Unit!3985)

(assert (=> b!57849 (= lt!91717 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!2734 lt!91711) (_2!2734 lt!91711) (_1!2735 lt!91705) (_1!2735 lt!91714) lt!91713 lt!91683))))

(declare-fun tail!280 (List!612) List!612)

(assert (=> b!57849 (= (bitStreamReadBitsIntoList!0 (_2!2734 lt!91711) (_1!2735 lt!91714) (bvsub lt!91713 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!280 lt!91683))))

(declare-fun lt!91687 () Unit!3985)

(assert (=> b!57849 (= lt!91687 lt!91717)))

(declare-fun lt!91696 () (_ BitVec 64))

(declare-fun lt!91703 () Unit!3985)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2632 array!2632 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!3985)

(assert (=> b!57849 (= lt!91703 (arrayBitRangesEqImpliesEq!0 (buf!1571 (_2!2734 lt!91680)) (buf!1571 (_2!2734 lt!91711)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!91696 (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91680))) (currentByte!3183 (_2!2734 lt!91680)) (currentBit!3178 (_2!2734 lt!91680)))))))

(declare-fun bitAt!0 (array!2632 (_ BitVec 64)) Bool)

(assert (=> b!57849 (= (bitAt!0 (buf!1571 (_2!2734 lt!91680)) lt!91696) (bitAt!0 (buf!1571 (_2!2734 lt!91711)) lt!91696))))

(declare-fun lt!91693 () Unit!3985)

(assert (=> b!57849 (= lt!91693 lt!91703)))

(declare-fun b!57850 () Bool)

(assert (=> b!57850 (= e!38348 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158))) lt!91700))))

(declare-fun c!4204 () Bool)

(declare-fun bm!758 () Bool)

(assert (=> bm!758 (= call!761 (reader!0 (ite c!4204 (_2!2734 lt!91680) (_2!2734 lt!91158)) (ite c!4204 (_2!2734 lt!91711) (_2!2734 lt!91158))))))

(declare-fun b!57851 () Bool)

(declare-fun Unit!4005 () Unit!3985)

(assert (=> b!57851 (= e!38347 (tuple2!5247 Unit!4005 (_2!2734 lt!91158)))))

(assert (=> b!57851 (= (size!1193 (buf!1571 (_2!2734 lt!91158))) (size!1193 (buf!1571 (_2!2734 lt!91158))))))

(declare-fun lt!91679 () Unit!3985)

(declare-fun Unit!4006 () Unit!3985)

(assert (=> b!57851 (= lt!91679 Unit!4006)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2074 array!2632 array!2632 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5270 0))(
  ( (tuple2!5271 (_1!2746 array!2632) (_2!2746 BitStream!2074)) )
))
(declare-fun readBits!0 (BitStream!2074 (_ BitVec 64)) tuple2!5270)

(assert (=> b!57851 (checkByteArrayBitContent!0 (_2!2734 lt!91158) srcBuffer!2 (_1!2746 (readBits!0 (_1!2735 call!761) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun d!18454 () Bool)

(assert (=> d!18454 e!38346))

(declare-fun res!48021 () Bool)

(assert (=> d!18454 (=> (not res!48021) (not e!38346))))

(declare-fun lt!91702 () (_ BitVec 64))

(assert (=> d!18454 (= res!48021 (= (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91676))) (currentByte!3183 (_2!2734 lt!91676)) (currentBit!3178 (_2!2734 lt!91676))) (bvsub lt!91702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!18454 (or (= (bvand lt!91702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91702 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!91712 () (_ BitVec 64))

(assert (=> d!18454 (= lt!91702 (bvadd lt!91712 to!314))))

(assert (=> d!18454 (or (not (= (bvand lt!91712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!91712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!91712 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18454 (= lt!91712 (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158))))))

(assert (=> d!18454 (= lt!91676 e!38347)))

(assert (=> d!18454 (= c!4204 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!91716 () Unit!3985)

(declare-fun lt!91715 () Unit!3985)

(assert (=> d!18454 (= lt!91716 lt!91715)))

(assert (=> d!18454 (isPrefixOf!0 (_2!2734 lt!91158) (_2!2734 lt!91158))))

(assert (=> d!18454 (= lt!91715 (lemmaIsPrefixRefl!0 (_2!2734 lt!91158)))))

(assert (=> d!18454 (= lt!91696 (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158))))))

(assert (=> d!18454 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!18454 (= (appendBitsMSBFirstLoop!0 (_2!2734 lt!91158) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!91676)))

(assert (= (and d!18454 c!4204) b!57849))

(assert (= (and d!18454 (not c!4204)) b!57851))

(assert (= (or b!57849 b!57851) bm!758))

(assert (= (and d!18454 res!48021) b!57848))

(assert (= (and b!57848 res!48025) b!57844))

(assert (= (and b!57844 res!48023) b!57845))

(assert (= (and b!57845 res!48024) b!57847))

(assert (= (and b!57847 res!48022) b!57846))

(assert (= (and b!57846 res!48020) b!57850))

(declare-fun m!91147 () Bool)

(assert (=> b!57848 m!91147))

(declare-fun m!91149 () Bool)

(assert (=> d!18454 m!91149))

(assert (=> d!18454 m!90871))

(assert (=> d!18454 m!91113))

(assert (=> d!18454 m!91117))

(declare-fun m!91151 () Bool)

(assert (=> bm!758 m!91151))

(declare-fun m!91153 () Bool)

(assert (=> b!57845 m!91153))

(declare-fun m!91155 () Bool)

(assert (=> b!57851 m!91155))

(declare-fun m!91157 () Bool)

(assert (=> b!57851 m!91157))

(declare-fun m!91159 () Bool)

(assert (=> b!57846 m!91159))

(declare-fun m!91161 () Bool)

(assert (=> b!57846 m!91161))

(declare-fun m!91163 () Bool)

(assert (=> b!57846 m!91163))

(declare-fun m!91165 () Bool)

(assert (=> b!57846 m!91165))

(declare-fun m!91167 () Bool)

(assert (=> b!57846 m!91167))

(declare-fun m!91169 () Bool)

(assert (=> b!57849 m!91169))

(declare-fun m!91171 () Bool)

(assert (=> b!57849 m!91171))

(declare-fun m!91173 () Bool)

(assert (=> b!57849 m!91173))

(declare-fun m!91175 () Bool)

(assert (=> b!57849 m!91175))

(declare-fun m!91177 () Bool)

(assert (=> b!57849 m!91177))

(declare-fun m!91179 () Bool)

(assert (=> b!57849 m!91179))

(declare-fun m!91181 () Bool)

(assert (=> b!57849 m!91181))

(declare-fun m!91183 () Bool)

(assert (=> b!57849 m!91183))

(declare-fun m!91185 () Bool)

(assert (=> b!57849 m!91185))

(assert (=> b!57849 m!91185))

(declare-fun m!91187 () Bool)

(assert (=> b!57849 m!91187))

(declare-fun m!91189 () Bool)

(assert (=> b!57849 m!91189))

(declare-fun m!91191 () Bool)

(assert (=> b!57849 m!91191))

(declare-fun m!91193 () Bool)

(assert (=> b!57849 m!91193))

(declare-fun m!91195 () Bool)

(assert (=> b!57849 m!91195))

(declare-fun m!91197 () Bool)

(assert (=> b!57849 m!91197))

(declare-fun m!91199 () Bool)

(assert (=> b!57849 m!91199))

(declare-fun m!91201 () Bool)

(assert (=> b!57849 m!91201))

(declare-fun m!91203 () Bool)

(assert (=> b!57849 m!91203))

(declare-fun m!91205 () Bool)

(assert (=> b!57849 m!91205))

(declare-fun m!91207 () Bool)

(assert (=> b!57849 m!91207))

(assert (=> b!57849 m!90871))

(declare-fun m!91209 () Bool)

(assert (=> b!57849 m!91209))

(declare-fun m!91211 () Bool)

(assert (=> b!57849 m!91211))

(declare-fun m!91213 () Bool)

(assert (=> b!57849 m!91213))

(declare-fun m!91215 () Bool)

(assert (=> b!57849 m!91215))

(declare-fun m!91217 () Bool)

(assert (=> b!57849 m!91217))

(assert (=> b!57849 m!91197))

(declare-fun m!91219 () Bool)

(assert (=> b!57849 m!91219))

(declare-fun m!91221 () Bool)

(assert (=> b!57849 m!91221))

(declare-fun m!91223 () Bool)

(assert (=> b!57849 m!91223))

(assert (=> b!57849 m!91215))

(declare-fun m!91225 () Bool)

(assert (=> b!57849 m!91225))

(assert (=> b!57849 m!91221))

(declare-fun m!91227 () Bool)

(assert (=> b!57849 m!91227))

(declare-fun m!91229 () Bool)

(assert (=> b!57849 m!91229))

(declare-fun m!91231 () Bool)

(assert (=> b!57850 m!91231))

(assert (=> b!57633 d!18454))

(declare-fun d!18460 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!18460 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!4587 () Bool)

(assert (= bs!4587 d!18460))

(declare-fun m!91233 () Bool)

(assert (=> bs!4587 m!91233))

(assert (=> b!57633 d!18460))

(declare-fun d!18462 () Bool)

(assert (=> d!18462 (isPrefixOf!0 thiss!1379 (_2!2734 lt!91154))))

(declare-fun lt!91778 () Unit!3985)

(declare-fun choose!30 (BitStream!2074 BitStream!2074 BitStream!2074) Unit!3985)

(assert (=> d!18462 (= lt!91778 (choose!30 thiss!1379 (_2!2734 lt!91158) (_2!2734 lt!91154)))))

(assert (=> d!18462 (isPrefixOf!0 thiss!1379 (_2!2734 lt!91158))))

(assert (=> d!18462 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2734 lt!91158) (_2!2734 lt!91154)) lt!91778)))

(declare-fun bs!4588 () Bool)

(assert (= bs!4588 d!18462))

(assert (=> bs!4588 m!90899))

(declare-fun m!91273 () Bool)

(assert (=> bs!4588 m!91273))

(assert (=> bs!4588 m!90875))

(assert (=> b!57633 d!18462))

(declare-fun d!18464 () Bool)

(declare-fun res!48046 () Bool)

(declare-fun e!38356 () Bool)

(assert (=> d!18464 (=> (not res!48046) (not e!38356))))

(assert (=> d!18464 (= res!48046 (= (size!1193 (buf!1571 (_2!2734 lt!91158))) (size!1193 (buf!1571 (_2!2734 lt!91154)))))))

(assert (=> d!18464 (= (isPrefixOf!0 (_2!2734 lt!91158) (_2!2734 lt!91154)) e!38356)))

(declare-fun b!57872 () Bool)

(declare-fun res!48045 () Bool)

(assert (=> b!57872 (=> (not res!48045) (not e!38356))))

(assert (=> b!57872 (= res!48045 (bvsle (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158))) (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91154))) (currentByte!3183 (_2!2734 lt!91154)) (currentBit!3178 (_2!2734 lt!91154)))))))

(declare-fun b!57873 () Bool)

(declare-fun e!38357 () Bool)

(assert (=> b!57873 (= e!38356 e!38357)))

(declare-fun res!48044 () Bool)

(assert (=> b!57873 (=> res!48044 e!38357)))

(assert (=> b!57873 (= res!48044 (= (size!1193 (buf!1571 (_2!2734 lt!91158))) #b00000000000000000000000000000000))))

(declare-fun b!57874 () Bool)

(assert (=> b!57874 (= e!38357 (arrayBitRangesEq!0 (buf!1571 (_2!2734 lt!91158)) (buf!1571 (_2!2734 lt!91154)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158)))))))

(assert (= (and d!18464 res!48046) b!57872))

(assert (= (and b!57872 res!48045) b!57873))

(assert (= (and b!57873 (not res!48044)) b!57874))

(assert (=> b!57872 m!90871))

(assert (=> b!57872 m!90897))

(assert (=> b!57874 m!90871))

(assert (=> b!57874 m!90871))

(declare-fun m!91301 () Bool)

(assert (=> b!57874 m!91301))

(assert (=> b!57633 d!18464))

(declare-fun d!18466 () Bool)

(declare-fun res!48049 () Bool)

(declare-fun e!38358 () Bool)

(assert (=> d!18466 (=> (not res!48049) (not e!38358))))

(assert (=> d!18466 (= res!48049 (= (size!1193 (buf!1571 thiss!1379)) (size!1193 (buf!1571 (_2!2734 lt!91158)))))))

(assert (=> d!18466 (= (isPrefixOf!0 thiss!1379 (_2!2734 lt!91158)) e!38358)))

(declare-fun b!57875 () Bool)

(declare-fun res!48048 () Bool)

(assert (=> b!57875 (=> (not res!48048) (not e!38358))))

(assert (=> b!57875 (= res!48048 (bvsle (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)) (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158)))))))

(declare-fun b!57876 () Bool)

(declare-fun e!38359 () Bool)

(assert (=> b!57876 (= e!38358 e!38359)))

(declare-fun res!48047 () Bool)

(assert (=> b!57876 (=> res!48047 e!38359)))

(assert (=> b!57876 (= res!48047 (= (size!1193 (buf!1571 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57877 () Bool)

(assert (=> b!57877 (= e!38359 (arrayBitRangesEq!0 (buf!1571 thiss!1379) (buf!1571 (_2!2734 lt!91158)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379))))))

(assert (= (and d!18466 res!48049) b!57875))

(assert (= (and b!57875 res!48048) b!57876))

(assert (= (and b!57876 (not res!48047)) b!57877))

(assert (=> b!57875 m!90921))

(assert (=> b!57875 m!90871))

(assert (=> b!57877 m!90921))

(assert (=> b!57877 m!90921))

(declare-fun m!91327 () Bool)

(assert (=> b!57877 m!91327))

(assert (=> b!57639 d!18466))

(declare-fun d!18468 () Bool)

(assert (=> d!18468 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!4589 () Bool)

(assert (= bs!4589 d!18468))

(declare-fun m!91331 () Bool)

(assert (=> bs!4589 m!91331))

(assert (=> b!57639 d!18468))

(declare-fun d!18472 () Bool)

(declare-fun e!38365 () Bool)

(assert (=> d!18472 e!38365))

(declare-fun res!48058 () Bool)

(assert (=> d!18472 (=> (not res!48058) (not e!38365))))

(assert (=> d!18472 (= res!48058 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!91828 () Unit!3985)

(declare-fun choose!27 (BitStream!2074 BitStream!2074 (_ BitVec 64) (_ BitVec 64)) Unit!3985)

(assert (=> d!18472 (= lt!91828 (choose!27 thiss!1379 (_2!2734 lt!91158) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!18472 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!18472 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2734 lt!91158) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!91828)))

(declare-fun b!57888 () Bool)

(assert (=> b!57888 (= e!38365 (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!18472 res!48058) b!57888))

(declare-fun m!91337 () Bool)

(assert (=> d!18472 m!91337))

(assert (=> b!57888 m!90879))

(assert (=> b!57639 d!18472))

(declare-fun b!57981 () Bool)

(declare-fun res!48111 () Bool)

(declare-fun e!38415 () Bool)

(assert (=> b!57981 (=> (not res!48111) (not e!38415))))

(declare-fun lt!91941 () tuple2!5246)

(assert (=> b!57981 (= res!48111 (isPrefixOf!0 thiss!1379 (_2!2734 lt!91941)))))

(declare-fun b!57983 () Bool)

(declare-fun e!38417 () Bool)

(declare-fun e!38416 () Bool)

(assert (=> b!57983 (= e!38417 e!38416)))

(declare-fun res!48110 () Bool)

(assert (=> b!57983 (=> (not res!48110) (not e!38416))))

(declare-fun lt!91943 () tuple2!5246)

(declare-fun lt!91938 () (_ BitVec 8))

(declare-datatypes ((tuple2!5274 0))(
  ( (tuple2!5275 (_1!2748 BitStream!2074) (_2!2748 Bool)) )
))
(declare-fun lt!91944 () tuple2!5274)

(assert (=> b!57983 (= res!48110 (and (= (_2!2748 lt!91944) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1754 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!91938)) #b00000000000000000000000000000000))) (= (_1!2748 lt!91944) (_2!2734 lt!91943))))))

(declare-fun lt!91940 () tuple2!5270)

(declare-fun lt!91937 () BitStream!2074)

(assert (=> b!57983 (= lt!91940 (readBits!0 lt!91937 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2074) tuple2!5274)

(assert (=> b!57983 (= lt!91944 (readBitPure!0 lt!91937))))

(declare-fun readerFrom!0 (BitStream!2074 (_ BitVec 32) (_ BitVec 32)) BitStream!2074)

(assert (=> b!57983 (= lt!91937 (readerFrom!0 (_2!2734 lt!91943) (currentBit!3178 thiss!1379) (currentByte!3183 thiss!1379)))))

(declare-fun b!57984 () Bool)

(declare-fun e!38418 () Bool)

(assert (=> b!57984 (= e!38415 e!38418)))

(declare-fun res!48109 () Bool)

(assert (=> b!57984 (=> (not res!48109) (not e!38418))))

(declare-fun lt!91948 () tuple2!5274)

(declare-fun lt!91947 () Bool)

(assert (=> b!57984 (= res!48109 (and (= (_2!2748 lt!91948) lt!91947) (= (_1!2748 lt!91948) (_2!2734 lt!91941))))))

(assert (=> b!57984 (= lt!91948 (readBitPure!0 (readerFrom!0 (_2!2734 lt!91941) (currentBit!3178 thiss!1379) (currentByte!3183 thiss!1379))))))

(declare-fun b!57985 () Bool)

(assert (=> b!57985 (= e!38418 (= (bitIndex!0 (size!1193 (buf!1571 (_1!2748 lt!91948))) (currentByte!3183 (_1!2748 lt!91948)) (currentBit!3178 (_1!2748 lt!91948))) (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91941))) (currentByte!3183 (_2!2734 lt!91941)) (currentBit!3178 (_2!2734 lt!91941)))))))

(declare-fun b!57986 () Bool)

(declare-fun res!48108 () Bool)

(assert (=> b!57986 (=> (not res!48108) (not e!38417))))

(declare-fun lt!91946 () (_ BitVec 64))

(declare-fun lt!91942 () (_ BitVec 64))

(assert (=> b!57986 (= res!48108 (= (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91943))) (currentByte!3183 (_2!2734 lt!91943)) (currentBit!3178 (_2!2734 lt!91943))) (bvadd lt!91946 lt!91942)))))

(assert (=> b!57986 (or (not (= (bvand lt!91946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91942 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!91946 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!91946 lt!91942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!57986 (= lt!91942 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!57986 (= lt!91946 (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)))))

(declare-fun b!57982 () Bool)

(declare-fun res!48112 () Bool)

(assert (=> b!57982 (=> (not res!48112) (not e!38417))))

(assert (=> b!57982 (= res!48112 (isPrefixOf!0 thiss!1379 (_2!2734 lt!91943)))))

(declare-fun d!18478 () Bool)

(assert (=> d!18478 e!38417))

(declare-fun res!48113 () Bool)

(assert (=> d!18478 (=> (not res!48113) (not e!38417))))

(assert (=> d!18478 (= res!48113 (= (size!1193 (buf!1571 (_2!2734 lt!91943))) (size!1193 (buf!1571 thiss!1379))))))

(declare-fun lt!91945 () array!2632)

(assert (=> d!18478 (= lt!91938 (select (arr!1754 lt!91945) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!18478 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1193 lt!91945)))))

(assert (=> d!18478 (= lt!91945 (array!2633 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!91939 () tuple2!5246)

(assert (=> d!18478 (= lt!91943 (tuple2!5247 (_1!2734 lt!91939) (_2!2734 lt!91939)))))

(assert (=> d!18478 (= lt!91939 lt!91941)))

(assert (=> d!18478 e!38415))

(declare-fun res!48114 () Bool)

(assert (=> d!18478 (=> (not res!48114) (not e!38415))))

(assert (=> d!18478 (= res!48114 (= (size!1193 (buf!1571 thiss!1379)) (size!1193 (buf!1571 (_2!2734 lt!91941)))))))

(declare-fun appendBit!0 (BitStream!2074 Bool) tuple2!5246)

(assert (=> d!18478 (= lt!91941 (appendBit!0 thiss!1379 lt!91947))))

(assert (=> d!18478 (= lt!91947 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1754 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!18478 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!18478 (= (appendBitFromByte!0 thiss!1379 (select (arr!1754 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!91943)))

(declare-fun b!57987 () Bool)

(declare-fun res!48115 () Bool)

(assert (=> b!57987 (=> (not res!48115) (not e!38415))))

(assert (=> b!57987 (= res!48115 (= (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91941))) (currentByte!3183 (_2!2734 lt!91941)) (currentBit!3178 (_2!2734 lt!91941))) (bvadd (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!57988 () Bool)

(assert (=> b!57988 (= e!38416 (= (bitIndex!0 (size!1193 (buf!1571 (_1!2748 lt!91944))) (currentByte!3183 (_1!2748 lt!91944)) (currentBit!3178 (_1!2748 lt!91944))) (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91943))) (currentByte!3183 (_2!2734 lt!91943)) (currentBit!3178 (_2!2734 lt!91943)))))))

(assert (= (and d!18478 res!48114) b!57987))

(assert (= (and b!57987 res!48115) b!57981))

(assert (= (and b!57981 res!48111) b!57984))

(assert (= (and b!57984 res!48109) b!57985))

(assert (= (and d!18478 res!48113) b!57986))

(assert (= (and b!57986 res!48108) b!57982))

(assert (= (and b!57982 res!48112) b!57983))

(assert (= (and b!57983 res!48110) b!57988))

(declare-fun m!91487 () Bool)

(assert (=> b!57984 m!91487))

(assert (=> b!57984 m!91487))

(declare-fun m!91489 () Bool)

(assert (=> b!57984 m!91489))

(declare-fun m!91491 () Bool)

(assert (=> b!57981 m!91491))

(declare-fun m!91493 () Bool)

(assert (=> b!57982 m!91493))

(declare-fun m!91495 () Bool)

(assert (=> d!18478 m!91495))

(declare-fun m!91497 () Bool)

(assert (=> d!18478 m!91497))

(assert (=> d!18478 m!91041))

(declare-fun m!91499 () Bool)

(assert (=> b!57987 m!91499))

(assert (=> b!57987 m!90921))

(declare-fun m!91501 () Bool)

(assert (=> b!57983 m!91501))

(declare-fun m!91503 () Bool)

(assert (=> b!57983 m!91503))

(declare-fun m!91505 () Bool)

(assert (=> b!57983 m!91505))

(declare-fun m!91507 () Bool)

(assert (=> b!57988 m!91507))

(declare-fun m!91509 () Bool)

(assert (=> b!57988 m!91509))

(assert (=> b!57986 m!91509))

(assert (=> b!57986 m!90921))

(declare-fun m!91511 () Bool)

(assert (=> b!57985 m!91511))

(assert (=> b!57985 m!91499))

(assert (=> b!57639 d!18478))

(declare-fun d!18516 () Bool)

(declare-fun e!38421 () Bool)

(assert (=> d!18516 e!38421))

(declare-fun res!48120 () Bool)

(assert (=> d!18516 (=> (not res!48120) (not e!38421))))

(declare-fun lt!91962 () (_ BitVec 64))

(declare-fun lt!91964 () (_ BitVec 64))

(declare-fun lt!91963 () (_ BitVec 64))

(assert (=> d!18516 (= res!48120 (= lt!91962 (bvsub lt!91964 lt!91963)))))

(assert (=> d!18516 (or (= (bvand lt!91964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91963 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91964 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91964 lt!91963) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18516 (= lt!91963 (remainingBits!0 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91154)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91154))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91154)))))))

(declare-fun lt!91966 () (_ BitVec 64))

(declare-fun lt!91965 () (_ BitVec 64))

(assert (=> d!18516 (= lt!91964 (bvmul lt!91966 lt!91965))))

(assert (=> d!18516 (or (= lt!91966 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91965 (bvsdiv (bvmul lt!91966 lt!91965) lt!91966)))))

(assert (=> d!18516 (= lt!91965 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18516 (= lt!91966 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91154)))))))

(assert (=> d!18516 (= lt!91962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91154))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91154)))))))

(assert (=> d!18516 (invariant!0 (currentBit!3178 (_2!2734 lt!91154)) (currentByte!3183 (_2!2734 lt!91154)) (size!1193 (buf!1571 (_2!2734 lt!91154))))))

(assert (=> d!18516 (= (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91154))) (currentByte!3183 (_2!2734 lt!91154)) (currentBit!3178 (_2!2734 lt!91154))) lt!91962)))

(declare-fun b!57993 () Bool)

(declare-fun res!48121 () Bool)

(assert (=> b!57993 (=> (not res!48121) (not e!38421))))

(assert (=> b!57993 (= res!48121 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91962))))

(declare-fun b!57994 () Bool)

(declare-fun lt!91961 () (_ BitVec 64))

(assert (=> b!57994 (= e!38421 (bvsle lt!91962 (bvmul lt!91961 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57994 (or (= lt!91961 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91961 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91961)))))

(assert (=> b!57994 (= lt!91961 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91154)))))))

(assert (= (and d!18516 res!48120) b!57993))

(assert (= (and b!57993 res!48121) b!57994))

(declare-fun m!91513 () Bool)

(assert (=> d!18516 m!91513))

(assert (=> d!18516 m!90895))

(assert (=> b!57634 d!18516))

(declare-fun d!18518 () Bool)

(declare-fun e!38422 () Bool)

(assert (=> d!18518 e!38422))

(declare-fun res!48122 () Bool)

(assert (=> d!18518 (=> (not res!48122) (not e!38422))))

(declare-fun lt!91968 () (_ BitVec 64))

(declare-fun lt!91970 () (_ BitVec 64))

(declare-fun lt!91969 () (_ BitVec 64))

(assert (=> d!18518 (= res!48122 (= lt!91968 (bvsub lt!91970 lt!91969)))))

(assert (=> d!18518 (or (= (bvand lt!91970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91970 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91970 lt!91969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18518 (= lt!91969 (remainingBits!0 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))) ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158)))))))

(declare-fun lt!91972 () (_ BitVec 64))

(declare-fun lt!91971 () (_ BitVec 64))

(assert (=> d!18518 (= lt!91970 (bvmul lt!91972 lt!91971))))

(assert (=> d!18518 (or (= lt!91972 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91971 (bvsdiv (bvmul lt!91972 lt!91971) lt!91972)))))

(assert (=> d!18518 (= lt!91971 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18518 (= lt!91972 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))))))

(assert (=> d!18518 (= lt!91968 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3183 (_2!2734 lt!91158))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3178 (_2!2734 lt!91158)))))))

(assert (=> d!18518 (invariant!0 (currentBit!3178 (_2!2734 lt!91158)) (currentByte!3183 (_2!2734 lt!91158)) (size!1193 (buf!1571 (_2!2734 lt!91158))))))

(assert (=> d!18518 (= (bitIndex!0 (size!1193 (buf!1571 (_2!2734 lt!91158))) (currentByte!3183 (_2!2734 lt!91158)) (currentBit!3178 (_2!2734 lt!91158))) lt!91968)))

(declare-fun b!57995 () Bool)

(declare-fun res!48123 () Bool)

(assert (=> b!57995 (=> (not res!48123) (not e!38422))))

(assert (=> b!57995 (= res!48123 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91968))))

(declare-fun b!57996 () Bool)

(declare-fun lt!91967 () (_ BitVec 64))

(assert (=> b!57996 (= e!38422 (bvsle lt!91968 (bvmul lt!91967 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!57996 (or (= lt!91967 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91967 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91967)))))

(assert (=> b!57996 (= lt!91967 ((_ sign_extend 32) (size!1193 (buf!1571 (_2!2734 lt!91158)))))))

(assert (= (and d!18518 res!48122) b!57995))

(assert (= (and b!57995 res!48123) b!57996))

(assert (=> d!18518 m!91331))

(declare-fun m!91515 () Bool)

(assert (=> d!18518 m!91515))

(assert (=> b!57637 d!18518))

(declare-fun d!18520 () Bool)

(assert (=> d!18520 (= (invariant!0 (currentBit!3178 (_2!2734 lt!91154)) (currentByte!3183 (_2!2734 lt!91154)) (size!1193 (buf!1571 (_2!2734 lt!91154)))) (and (bvsge (currentBit!3178 (_2!2734 lt!91154)) #b00000000000000000000000000000000) (bvslt (currentBit!3178 (_2!2734 lt!91154)) #b00000000000000000000000000001000) (bvsge (currentByte!3183 (_2!2734 lt!91154)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3183 (_2!2734 lt!91154)) (size!1193 (buf!1571 (_2!2734 lt!91154)))) (and (= (currentBit!3178 (_2!2734 lt!91154)) #b00000000000000000000000000000000) (= (currentByte!3183 (_2!2734 lt!91154)) (size!1193 (buf!1571 (_2!2734 lt!91154))))))))))

(assert (=> b!57632 d!18520))

(declare-fun d!18522 () Bool)

(declare-fun res!48126 () Bool)

(declare-fun e!38423 () Bool)

(assert (=> d!18522 (=> (not res!48126) (not e!38423))))

(assert (=> d!18522 (= res!48126 (= (size!1193 (buf!1571 thiss!1379)) (size!1193 (buf!1571 thiss!1379))))))

(assert (=> d!18522 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!38423)))

(declare-fun b!57997 () Bool)

(declare-fun res!48125 () Bool)

(assert (=> b!57997 (=> (not res!48125) (not e!38423))))

(assert (=> b!57997 (= res!48125 (bvsle (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)) (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379))))))

(declare-fun b!57998 () Bool)

(declare-fun e!38424 () Bool)

(assert (=> b!57998 (= e!38423 e!38424)))

(declare-fun res!48124 () Bool)

(assert (=> b!57998 (=> res!48124 e!38424)))

(assert (=> b!57998 (= res!48124 (= (size!1193 (buf!1571 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!57999 () Bool)

(assert (=> b!57999 (= e!38424 (arrayBitRangesEq!0 (buf!1571 thiss!1379) (buf!1571 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379))))))

(assert (= (and d!18522 res!48126) b!57997))

(assert (= (and b!57997 res!48125) b!57998))

(assert (= (and b!57998 (not res!48124)) b!57999))

(assert (=> b!57997 m!90921))

(assert (=> b!57997 m!90921))

(assert (=> b!57999 m!90921))

(assert (=> b!57999 m!90921))

(declare-fun m!91517 () Bool)

(assert (=> b!57999 m!91517))

(assert (=> b!57638 d!18522))

(declare-fun d!18524 () Bool)

(assert (=> d!18524 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!91975 () Unit!3985)

(declare-fun choose!11 (BitStream!2074) Unit!3985)

(assert (=> d!18524 (= lt!91975 (choose!11 thiss!1379))))

(assert (=> d!18524 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!91975)))

(declare-fun bs!4596 () Bool)

(assert (= bs!4596 d!18524))

(assert (=> bs!4596 m!90917))

(declare-fun m!91519 () Bool)

(assert (=> bs!4596 m!91519))

(assert (=> b!57638 d!18524))

(declare-fun d!18526 () Bool)

(declare-fun e!38425 () Bool)

(assert (=> d!18526 e!38425))

(declare-fun res!48127 () Bool)

(assert (=> d!18526 (=> (not res!48127) (not e!38425))))

(declare-fun lt!91977 () (_ BitVec 64))

(declare-fun lt!91979 () (_ BitVec 64))

(declare-fun lt!91978 () (_ BitVec 64))

(assert (=> d!18526 (= res!48127 (= lt!91977 (bvsub lt!91979 lt!91978)))))

(assert (=> d!18526 (or (= (bvand lt!91979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!91978 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!91979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!91979 lt!91978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!18526 (= lt!91978 (remainingBits!0 ((_ sign_extend 32) (size!1193 (buf!1571 thiss!1379))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379))))))

(declare-fun lt!91981 () (_ BitVec 64))

(declare-fun lt!91980 () (_ BitVec 64))

(assert (=> d!18526 (= lt!91979 (bvmul lt!91981 lt!91980))))

(assert (=> d!18526 (or (= lt!91981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!91980 (bvsdiv (bvmul lt!91981 lt!91980) lt!91981)))))

(assert (=> d!18526 (= lt!91980 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!18526 (= lt!91981 ((_ sign_extend 32) (size!1193 (buf!1571 thiss!1379))))))

(assert (=> d!18526 (= lt!91977 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3183 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3178 thiss!1379))))))

(assert (=> d!18526 (invariant!0 (currentBit!3178 thiss!1379) (currentByte!3183 thiss!1379) (size!1193 (buf!1571 thiss!1379)))))

(assert (=> d!18526 (= (bitIndex!0 (size!1193 (buf!1571 thiss!1379)) (currentByte!3183 thiss!1379) (currentBit!3178 thiss!1379)) lt!91977)))

(declare-fun b!58000 () Bool)

(declare-fun res!48128 () Bool)

(assert (=> b!58000 (=> (not res!48128) (not e!38425))))

(assert (=> b!58000 (= res!48128 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!91977))))

(declare-fun b!58001 () Bool)

(declare-fun lt!91976 () (_ BitVec 64))

(assert (=> b!58001 (= e!38425 (bvsle lt!91977 (bvmul lt!91976 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!58001 (or (= lt!91976 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!91976 #b0000000000000000000000000000000000000000000000000000000000001000) lt!91976)))))

(assert (=> b!58001 (= lt!91976 ((_ sign_extend 32) (size!1193 (buf!1571 thiss!1379))))))

(assert (= (and d!18526 res!48127) b!58000))

(assert (= (and b!58000 res!48128) b!58001))

(declare-fun m!91521 () Bool)

(assert (=> d!18526 m!91521))

(declare-fun m!91523 () Bool)

(assert (=> d!18526 m!91523))

(assert (=> b!57638 d!18526))

(declare-fun d!18528 () Bool)

(assert (=> d!18528 (= (array_inv!1096 srcBuffer!2) (bvsge (size!1193 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!11682 d!18528))

(declare-fun d!18530 () Bool)

(assert (=> d!18530 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3178 thiss!1379) (currentByte!3183 thiss!1379) (size!1193 (buf!1571 thiss!1379))))))

(declare-fun bs!4597 () Bool)

(assert (= bs!4597 d!18530))

(assert (=> bs!4597 m!91523))

(assert (=> start!11682 d!18530))

(declare-fun d!18532 () Bool)

(assert (=> d!18532 (= (array_inv!1096 (buf!1571 thiss!1379)) (bvsge (size!1193 (buf!1571 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!57636 d!18532))

(declare-fun d!18534 () Bool)

(assert (=> d!18534 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1193 (buf!1571 thiss!1379))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1193 (buf!1571 thiss!1379))) ((_ sign_extend 32) (currentByte!3183 thiss!1379)) ((_ sign_extend 32) (currentBit!3178 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!4598 () Bool)

(assert (= bs!4598 d!18534))

(assert (=> bs!4598 m!91521))

(assert (=> b!57631 d!18534))

(push 1)

(assert (not b!57737))

(assert (not b!57849))

(assert (not d!18426))

(assert (not b!57792))

(assert (not b!57988))

(assert (not b!57987))

(assert (not b!57877))

(assert (not d!18524))

(assert (not b!57851))

(assert (not b!57788))

(assert (not b!57789))

(assert (not d!18454))

(assert (not b!57846))

(assert (not d!18430))

(assert (not b!57981))

(assert (not b!57850))

(assert (not b!57727))

(assert (not b!57790))

(assert (not d!18516))

(assert (not d!18526))

(assert (not b!57748))

(assert (not d!18472))

(assert (not b!57984))

(assert (not d!18468))

(assert (not b!57746))

(assert (not d!18534))

(assert (not d!18518))

(assert (not b!57982))

(assert (not bm!758))

(assert (not b!57848))

(assert (not b!57845))

(assert (not b!57999))

(assert (not d!18478))

(assert (not b!57875))

(assert (not b!57872))

(assert (not b!57739))

(assert (not b!57985))

(assert (not d!18460))

(assert (not b!57888))

(assert (not b!57986))

(assert (not b!57738))

(assert (not b!57997))

(assert (not d!18530))

(assert (not b!57874))

(assert (not d!18462))

(assert (not b!57983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

