; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5384 () Bool)

(assert start!5384)

(declare-fun b!21791 () Bool)

(declare-fun res!18820 () Bool)

(declare-fun e!14787 () Bool)

(assert (=> b!21791 (=> (not res!18820) (not e!14787))))

(declare-datatypes ((array!1533 0))(
  ( (array!1534 (arr!1104 (Array (_ BitVec 32) (_ BitVec 8))) (size!654 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1142 0))(
  ( (BitStream!1143 (buf!969 array!1533) (currentByte!2270 (_ BitVec 32)) (currentBit!2265 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1142)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21791 (= res!18820 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 thiss!1379))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!1533)

(declare-fun b!21792 () Bool)

(declare-datatypes ((Unit!1902 0))(
  ( (Unit!1903) )
))
(declare-datatypes ((tuple2!2558 0))(
  ( (tuple2!2559 (_1!1364 Unit!1902) (_2!1364 BitStream!1142)) )
))
(declare-fun lt!31438 () tuple2!2558)

(declare-datatypes ((tuple2!2560 0))(
  ( (tuple2!2561 (_1!1365 BitStream!1142) (_2!1365 BitStream!1142)) )
))
(declare-fun lt!31435 () tuple2!2560)

(declare-fun e!14793 () Bool)

(declare-datatypes ((List!272 0))(
  ( (Nil!269) (Cons!268 (h!387 Bool) (t!1022 List!272)) )
))
(declare-fun head!109 (List!272) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1142 array!1533 (_ BitVec 64) (_ BitVec 64)) List!272)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1142 BitStream!1142 (_ BitVec 64)) List!272)

(assert (=> b!21792 (= e!14793 (= (head!109 (byteArrayBitContentToList!0 (_2!1364 lt!31438) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!109 (bitStreamReadBitsIntoList!0 (_2!1364 lt!31438) (_1!1365 lt!31435) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!21793 () Bool)

(declare-fun e!14792 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!21793 (= e!14792 (invariant!0 (currentBit!2265 thiss!1379) (currentByte!2270 thiss!1379) (size!654 (buf!969 thiss!1379))))))

(declare-fun lt!31437 () tuple2!2558)

(assert (=> b!21793 (= (size!654 (buf!969 (_2!1364 lt!31437))) (size!654 (buf!969 thiss!1379)))))

(declare-fun b!21794 () Bool)

(declare-fun res!18819 () Bool)

(assert (=> b!21794 (=> res!18819 e!14792)))

(assert (=> b!21794 (= res!18819 (not (invariant!0 (currentBit!2265 (_2!1364 lt!31437)) (currentByte!2270 (_2!1364 lt!31437)) (size!654 (buf!969 (_2!1364 lt!31437))))))))

(declare-fun res!18821 () Bool)

(assert (=> start!5384 (=> (not res!18821) (not e!14787))))

(assert (=> start!5384 (= res!18821 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!654 srcBuffer!2))))))))

(assert (=> start!5384 e!14787))

(assert (=> start!5384 true))

(declare-fun array_inv!624 (array!1533) Bool)

(assert (=> start!5384 (array_inv!624 srcBuffer!2)))

(declare-fun e!14786 () Bool)

(declare-fun inv!12 (BitStream!1142) Bool)

(assert (=> start!5384 (and (inv!12 thiss!1379) e!14786)))

(declare-fun b!21795 () Bool)

(declare-fun e!14788 () Bool)

(assert (=> b!21795 (= e!14788 e!14792)))

(declare-fun res!18825 () Bool)

(assert (=> b!21795 (=> res!18825 e!14792)))

(declare-fun isPrefixOf!0 (BitStream!1142 BitStream!1142) Bool)

(assert (=> b!21795 (= res!18825 (not (isPrefixOf!0 (_2!1364 lt!31438) (_2!1364 lt!31437))))))

(assert (=> b!21795 (isPrefixOf!0 thiss!1379 (_2!1364 lt!31437))))

(declare-fun lt!31434 () Unit!1902)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1142 BitStream!1142 BitStream!1142) Unit!1902)

(assert (=> b!21795 (= lt!31434 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1364 lt!31438) (_2!1364 lt!31437)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1142 array!1533 (_ BitVec 64) (_ BitVec 64)) tuple2!2558)

(assert (=> b!21795 (= lt!31437 (appendBitsMSBFirstLoop!0 (_2!1364 lt!31438) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!21795 e!14793))

(declare-fun res!18824 () Bool)

(assert (=> b!21795 (=> (not res!18824) (not e!14793))))

(assert (=> b!21795 (= res!18824 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31441 () Unit!1902)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1142 array!1533 (_ BitVec 64)) Unit!1902)

(assert (=> b!21795 (= lt!31441 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!969 (_2!1364 lt!31438)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1142 BitStream!1142) tuple2!2560)

(assert (=> b!21795 (= lt!31435 (reader!0 thiss!1379 (_2!1364 lt!31438)))))

(declare-fun b!21796 () Bool)

(assert (=> b!21796 (= e!14786 (array_inv!624 (buf!969 thiss!1379)))))

(declare-fun b!21797 () Bool)

(declare-fun e!14790 () Bool)

(assert (=> b!21797 (= e!14787 (not e!14790))))

(declare-fun res!18823 () Bool)

(assert (=> b!21797 (=> res!18823 e!14790)))

(assert (=> b!21797 (= res!18823 (bvsge i!635 to!314))))

(assert (=> b!21797 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31439 () Unit!1902)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1142) Unit!1902)

(assert (=> b!21797 (= lt!31439 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!31440 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!21797 (= lt!31440 (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)))))

(declare-fun b!21798 () Bool)

(declare-fun res!18826 () Bool)

(assert (=> b!21798 (=> res!18826 e!14792)))

(assert (=> b!21798 (= res!18826 (not (= (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31437))) (currentByte!2270 (_2!1364 lt!31437)) (currentBit!2265 (_2!1364 lt!31437))) (bvsub (bvadd lt!31440 to!314) i!635))))))

(declare-fun b!21799 () Bool)

(assert (=> b!21799 (= e!14790 e!14788)))

(declare-fun res!18822 () Bool)

(assert (=> b!21799 (=> res!18822 e!14788)))

(assert (=> b!21799 (= res!18822 (not (isPrefixOf!0 thiss!1379 (_2!1364 lt!31438))))))

(assert (=> b!21799 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31436 () Unit!1902)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1142 BitStream!1142 (_ BitVec 64) (_ BitVec 64)) Unit!1902)

(assert (=> b!21799 (= lt!31436 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1364 lt!31438) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1142 (_ BitVec 8) (_ BitVec 32)) tuple2!2558)

(assert (=> b!21799 (= lt!31438 (appendBitFromByte!0 thiss!1379 (select (arr!1104 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!21800 () Bool)

(declare-fun res!18827 () Bool)

(assert (=> b!21800 (=> res!18827 e!14792)))

(assert (=> b!21800 (= res!18827 (not (= (size!654 (buf!969 thiss!1379)) (size!654 (buf!969 (_2!1364 lt!31437))))))))

(assert (= (and start!5384 res!18821) b!21791))

(assert (= (and b!21791 res!18820) b!21797))

(assert (= (and b!21797 (not res!18823)) b!21799))

(assert (= (and b!21799 (not res!18822)) b!21795))

(assert (= (and b!21795 res!18824) b!21792))

(assert (= (and b!21795 (not res!18825)) b!21798))

(assert (= (and b!21798 (not res!18826)) b!21794))

(assert (= (and b!21794 (not res!18819)) b!21800))

(assert (= (and b!21800 (not res!18827)) b!21793))

(assert (= start!5384 b!21796))

(declare-fun m!30209 () Bool)

(assert (=> b!21799 m!30209))

(declare-fun m!30211 () Bool)

(assert (=> b!21799 m!30211))

(assert (=> b!21799 m!30209))

(declare-fun m!30213 () Bool)

(assert (=> b!21799 m!30213))

(declare-fun m!30215 () Bool)

(assert (=> b!21799 m!30215))

(declare-fun m!30217 () Bool)

(assert (=> b!21799 m!30217))

(declare-fun m!30219 () Bool)

(assert (=> start!5384 m!30219))

(declare-fun m!30221 () Bool)

(assert (=> start!5384 m!30221))

(declare-fun m!30223 () Bool)

(assert (=> b!21791 m!30223))

(declare-fun m!30225 () Bool)

(assert (=> b!21796 m!30225))

(declare-fun m!30227 () Bool)

(assert (=> b!21792 m!30227))

(assert (=> b!21792 m!30227))

(declare-fun m!30229 () Bool)

(assert (=> b!21792 m!30229))

(declare-fun m!30231 () Bool)

(assert (=> b!21792 m!30231))

(assert (=> b!21792 m!30231))

(declare-fun m!30233 () Bool)

(assert (=> b!21792 m!30233))

(declare-fun m!30235 () Bool)

(assert (=> b!21794 m!30235))

(declare-fun m!30237 () Bool)

(assert (=> b!21793 m!30237))

(declare-fun m!30239 () Bool)

(assert (=> b!21795 m!30239))

(declare-fun m!30241 () Bool)

(assert (=> b!21795 m!30241))

(declare-fun m!30243 () Bool)

(assert (=> b!21795 m!30243))

(declare-fun m!30245 () Bool)

(assert (=> b!21795 m!30245))

(declare-fun m!30247 () Bool)

(assert (=> b!21795 m!30247))

(declare-fun m!30249 () Bool)

(assert (=> b!21795 m!30249))

(declare-fun m!30251 () Bool)

(assert (=> b!21795 m!30251))

(declare-fun m!30253 () Bool)

(assert (=> b!21798 m!30253))

(declare-fun m!30255 () Bool)

(assert (=> b!21797 m!30255))

(declare-fun m!30257 () Bool)

(assert (=> b!21797 m!30257))

(declare-fun m!30259 () Bool)

(assert (=> b!21797 m!30259))

(push 1)

(assert (not b!21794))

(assert (not b!21797))

(assert (not b!21792))

(assert (not b!21791))

(assert (not b!21799))

(assert (not b!21798))

(assert (not b!21793))

(assert (not b!21796))

(assert (not b!21795))

(assert (not start!5384))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6942 () Bool)

(declare-fun res!18851 () Bool)

(declare-fun e!14816 () Bool)

(assert (=> d!6942 (=> (not res!18851) (not e!14816))))

(assert (=> d!6942 (= res!18851 (= (size!654 (buf!969 thiss!1379)) (size!654 (buf!969 thiss!1379))))))

(assert (=> d!6942 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!14816)))

(declare-fun b!21840 () Bool)

(declare-fun res!18849 () Bool)

(assert (=> b!21840 (=> (not res!18849) (not e!14816))))

(assert (=> b!21840 (= res!18849 (bvsle (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)) (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379))))))

(declare-fun b!21841 () Bool)

(declare-fun e!14817 () Bool)

(assert (=> b!21841 (= e!14816 e!14817)))

(declare-fun res!18850 () Bool)

(assert (=> b!21841 (=> res!18850 e!14817)))

(assert (=> b!21841 (= res!18850 (= (size!654 (buf!969 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21842 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1533 array!1533 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!21842 (= e!14817 (arrayBitRangesEq!0 (buf!969 thiss!1379) (buf!969 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379))))))

(assert (= (and d!6942 res!18851) b!21840))

(assert (= (and b!21840 res!18849) b!21841))

(assert (= (and b!21841 (not res!18850)) b!21842))

(assert (=> b!21840 m!30259))

(assert (=> b!21840 m!30259))

(assert (=> b!21842 m!30259))

(assert (=> b!21842 m!30259))

(declare-fun m!30283 () Bool)

(assert (=> b!21842 m!30283))

(assert (=> b!21797 d!6942))

(declare-fun d!6948 () Bool)

(assert (=> d!6948 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!31473 () Unit!1902)

(declare-fun choose!11 (BitStream!1142) Unit!1902)

(assert (=> d!6948 (= lt!31473 (choose!11 thiss!1379))))

(assert (=> d!6948 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!31473)))

(declare-fun bs!2033 () Bool)

(assert (= bs!2033 d!6948))

(assert (=> bs!2033 m!30255))

(declare-fun m!30285 () Bool)

(assert (=> bs!2033 m!30285))

(assert (=> b!21797 d!6948))

(declare-fun d!6950 () Bool)

(declare-fun e!14823 () Bool)

(assert (=> d!6950 e!14823))

(declare-fun res!18859 () Bool)

(assert (=> d!6950 (=> (not res!18859) (not e!14823))))

(declare-fun lt!31492 () (_ BitVec 64))

(declare-fun lt!31490 () (_ BitVec 64))

(declare-fun lt!31491 () (_ BitVec 64))

(assert (=> d!6950 (= res!18859 (= lt!31490 (bvsub lt!31492 lt!31491)))))

(assert (=> d!6950 (or (= (bvand lt!31492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31491 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31492 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31492 lt!31491) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6950 (= lt!31491 (remainingBits!0 ((_ sign_extend 32) (size!654 (buf!969 thiss!1379))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379))))))

(declare-fun lt!31487 () (_ BitVec 64))

(declare-fun lt!31488 () (_ BitVec 64))

(assert (=> d!6950 (= lt!31492 (bvmul lt!31487 lt!31488))))

(assert (=> d!6950 (or (= lt!31487 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!31488 (bvsdiv (bvmul lt!31487 lt!31488) lt!31487)))))

(assert (=> d!6950 (= lt!31488 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6950 (= lt!31487 ((_ sign_extend 32) (size!654 (buf!969 thiss!1379))))))

(assert (=> d!6950 (= lt!31490 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2270 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2265 thiss!1379))))))

(assert (=> d!6950 (invariant!0 (currentBit!2265 thiss!1379) (currentByte!2270 thiss!1379) (size!654 (buf!969 thiss!1379)))))

(assert (=> d!6950 (= (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)) lt!31490)))

(declare-fun b!21850 () Bool)

(declare-fun res!18860 () Bool)

(assert (=> b!21850 (=> (not res!18860) (not e!14823))))

(assert (=> b!21850 (= res!18860 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!31490))))

(declare-fun b!21851 () Bool)

(declare-fun lt!31489 () (_ BitVec 64))

(assert (=> b!21851 (= e!14823 (bvsle lt!31490 (bvmul lt!31489 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!21851 (or (= lt!31489 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!31489 #b0000000000000000000000000000000000000000000000000000000000001000) lt!31489)))))

(assert (=> b!21851 (= lt!31489 ((_ sign_extend 32) (size!654 (buf!969 thiss!1379))))))

(assert (= (and d!6950 res!18859) b!21850))

(assert (= (and b!21850 res!18860) b!21851))

(declare-fun m!30289 () Bool)

(assert (=> d!6950 m!30289))

(assert (=> d!6950 m!30237))

(assert (=> b!21797 d!6950))

(declare-fun d!6954 () Bool)

(assert (=> d!6954 (= (array_inv!624 (buf!969 thiss!1379)) (bvsge (size!654 (buf!969 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!21796 d!6954))

(declare-fun d!6956 () Bool)

(assert (=> d!6956 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 thiss!1379))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!654 (buf!969 thiss!1379))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2034 () Bool)

(assert (= bs!2034 d!6956))

(assert (=> bs!2034 m!30289))

(assert (=> b!21791 d!6956))

(declare-fun d!6958 () Bool)

(assert (=> d!6958 (= (array_inv!624 srcBuffer!2) (bvsge (size!654 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5384 d!6958))

(declare-fun d!6960 () Bool)

(assert (=> d!6960 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2265 thiss!1379) (currentByte!2270 thiss!1379) (size!654 (buf!969 thiss!1379))))))

(declare-fun bs!2035 () Bool)

(assert (= bs!2035 d!6960))

(assert (=> bs!2035 m!30237))

(assert (=> start!5384 d!6960))

(declare-fun d!6962 () Bool)

(assert (=> d!6962 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2036 () Bool)

(assert (= bs!2036 d!6962))

(declare-fun m!30291 () Bool)

(assert (=> bs!2036 m!30291))

(assert (=> b!21795 d!6962))

(declare-fun d!6964 () Bool)

(declare-fun res!18863 () Bool)

(declare-fun e!14824 () Bool)

(assert (=> d!6964 (=> (not res!18863) (not e!14824))))

(assert (=> d!6964 (= res!18863 (= (size!654 (buf!969 thiss!1379)) (size!654 (buf!969 (_2!1364 lt!31437)))))))

(assert (=> d!6964 (= (isPrefixOf!0 thiss!1379 (_2!1364 lt!31437)) e!14824)))

(declare-fun b!21852 () Bool)

(declare-fun res!18861 () Bool)

(assert (=> b!21852 (=> (not res!18861) (not e!14824))))

(assert (=> b!21852 (= res!18861 (bvsle (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)) (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31437))) (currentByte!2270 (_2!1364 lt!31437)) (currentBit!2265 (_2!1364 lt!31437)))))))

(declare-fun b!21853 () Bool)

(declare-fun e!14825 () Bool)

(assert (=> b!21853 (= e!14824 e!14825)))

(declare-fun res!18862 () Bool)

(assert (=> b!21853 (=> res!18862 e!14825)))

(assert (=> b!21853 (= res!18862 (= (size!654 (buf!969 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!21854 () Bool)

(assert (=> b!21854 (= e!14825 (arrayBitRangesEq!0 (buf!969 thiss!1379) (buf!969 (_2!1364 lt!31437)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379))))))

(assert (= (and d!6964 res!18863) b!21852))

(assert (= (and b!21852 res!18861) b!21853))

(assert (= (and b!21853 (not res!18862)) b!21854))

(assert (=> b!21852 m!30259))

(assert (=> b!21852 m!30253))

(assert (=> b!21854 m!30259))

(assert (=> b!21854 m!30259))

(declare-fun m!30293 () Bool)

(assert (=> b!21854 m!30293))

(assert (=> b!21795 d!6964))

(declare-fun d!6966 () Bool)

(declare-fun res!18866 () Bool)

(declare-fun e!14826 () Bool)

(assert (=> d!6966 (=> (not res!18866) (not e!14826))))

(assert (=> d!6966 (= res!18866 (= (size!654 (buf!969 (_2!1364 lt!31438))) (size!654 (buf!969 (_2!1364 lt!31437)))))))

(assert (=> d!6966 (= (isPrefixOf!0 (_2!1364 lt!31438) (_2!1364 lt!31437)) e!14826)))

(declare-fun b!21855 () Bool)

(declare-fun res!18864 () Bool)

(assert (=> b!21855 (=> (not res!18864) (not e!14826))))

(assert (=> b!21855 (= res!18864 (bvsle (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31438))) (currentByte!2270 (_2!1364 lt!31438)) (currentBit!2265 (_2!1364 lt!31438))) (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31437))) (currentByte!2270 (_2!1364 lt!31437)) (currentBit!2265 (_2!1364 lt!31437)))))))

(declare-fun b!21856 () Bool)

(declare-fun e!14827 () Bool)

(assert (=> b!21856 (= e!14826 e!14827)))

(declare-fun res!18865 () Bool)

(assert (=> b!21856 (=> res!18865 e!14827)))

(assert (=> b!21856 (= res!18865 (= (size!654 (buf!969 (_2!1364 lt!31438))) #b00000000000000000000000000000000))))

(declare-fun b!21857 () Bool)

(assert (=> b!21857 (= e!14827 (arrayBitRangesEq!0 (buf!969 (_2!1364 lt!31438)) (buf!969 (_2!1364 lt!31437)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31438))) (currentByte!2270 (_2!1364 lt!31438)) (currentBit!2265 (_2!1364 lt!31438)))))))

(assert (= (and d!6966 res!18866) b!21855))

(assert (= (and b!21855 res!18864) b!21856))

(assert (= (and b!21856 (not res!18865)) b!21857))

(declare-fun m!30295 () Bool)

(assert (=> b!21855 m!30295))

(assert (=> b!21855 m!30253))

(assert (=> b!21857 m!30295))

(assert (=> b!21857 m!30295))

(declare-fun m!30297 () Bool)

(assert (=> b!21857 m!30297))

(assert (=> b!21795 d!6966))

(declare-fun d!6968 () Bool)

(assert (=> d!6968 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 thiss!1379)) ((_ sign_extend 32) (currentBit!2265 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31495 () Unit!1902)

(declare-fun choose!9 (BitStream!1142 array!1533 (_ BitVec 64) BitStream!1142) Unit!1902)

(assert (=> d!6968 (= lt!31495 (choose!9 thiss!1379 (buf!969 (_2!1364 lt!31438)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1143 (buf!969 (_2!1364 lt!31438)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379))))))

(assert (=> d!6968 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!969 (_2!1364 lt!31438)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31495)))

(declare-fun bs!2037 () Bool)

(assert (= bs!2037 d!6968))

(assert (=> bs!2037 m!30239))

(declare-fun m!30299 () Bool)

(assert (=> bs!2037 m!30299))

(assert (=> b!21795 d!6968))

(declare-fun d!6970 () Bool)

(assert (=> d!6970 (isPrefixOf!0 thiss!1379 (_2!1364 lt!31437))))

(declare-fun lt!31534 () Unit!1902)

(declare-fun choose!30 (BitStream!1142 BitStream!1142 BitStream!1142) Unit!1902)

(assert (=> d!6970 (= lt!31534 (choose!30 thiss!1379 (_2!1364 lt!31438) (_2!1364 lt!31437)))))

(assert (=> d!6970 (isPrefixOf!0 thiss!1379 (_2!1364 lt!31438))))

(assert (=> d!6970 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1364 lt!31438) (_2!1364 lt!31437)) lt!31534)))

(declare-fun bs!2038 () Bool)

(assert (= bs!2038 d!6970))

(assert (=> bs!2038 m!30243))

(declare-fun m!30301 () Bool)

(assert (=> bs!2038 m!30301))

(assert (=> bs!2038 m!30217))

(assert (=> b!21795 d!6970))

(declare-fun d!6972 () Bool)

(declare-fun e!14845 () Bool)

(assert (=> d!6972 e!14845))

(declare-fun res!18891 () Bool)

(assert (=> d!6972 (=> (not res!18891) (not e!14845))))

(declare-fun lt!31602 () tuple2!2560)

(assert (=> d!6972 (= res!18891 (isPrefixOf!0 (_1!1365 lt!31602) (_2!1365 lt!31602)))))

(declare-fun lt!31607 () BitStream!1142)

(assert (=> d!6972 (= lt!31602 (tuple2!2561 lt!31607 (_2!1364 lt!31438)))))

(declare-fun lt!31613 () Unit!1902)

(declare-fun lt!31608 () Unit!1902)

(assert (=> d!6972 (= lt!31613 lt!31608)))

(assert (=> d!6972 (isPrefixOf!0 lt!31607 (_2!1364 lt!31438))))

(assert (=> d!6972 (= lt!31608 (lemmaIsPrefixTransitive!0 lt!31607 (_2!1364 lt!31438) (_2!1364 lt!31438)))))

(declare-fun lt!31615 () Unit!1902)

(declare-fun lt!31612 () Unit!1902)

(assert (=> d!6972 (= lt!31615 lt!31612)))

(assert (=> d!6972 (isPrefixOf!0 lt!31607 (_2!1364 lt!31438))))

(assert (=> d!6972 (= lt!31612 (lemmaIsPrefixTransitive!0 lt!31607 thiss!1379 (_2!1364 lt!31438)))))

(declare-fun lt!31606 () Unit!1902)

(declare-fun e!14844 () Unit!1902)

(assert (=> d!6972 (= lt!31606 e!14844)))

(declare-fun c!1564 () Bool)

(assert (=> d!6972 (= c!1564 (not (= (size!654 (buf!969 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!31605 () Unit!1902)

(declare-fun lt!31610 () Unit!1902)

(assert (=> d!6972 (= lt!31605 lt!31610)))

(assert (=> d!6972 (isPrefixOf!0 (_2!1364 lt!31438) (_2!1364 lt!31438))))

(assert (=> d!6972 (= lt!31610 (lemmaIsPrefixRefl!0 (_2!1364 lt!31438)))))

(declare-fun lt!31599 () Unit!1902)

(declare-fun lt!31618 () Unit!1902)

(assert (=> d!6972 (= lt!31599 lt!31618)))

(assert (=> d!6972 (= lt!31618 (lemmaIsPrefixRefl!0 (_2!1364 lt!31438)))))

(declare-fun lt!31616 () Unit!1902)

(declare-fun lt!31603 () Unit!1902)

(assert (=> d!6972 (= lt!31616 lt!31603)))

(assert (=> d!6972 (isPrefixOf!0 lt!31607 lt!31607)))

(assert (=> d!6972 (= lt!31603 (lemmaIsPrefixRefl!0 lt!31607))))

(declare-fun lt!31604 () Unit!1902)

(declare-fun lt!31611 () Unit!1902)

(assert (=> d!6972 (= lt!31604 lt!31611)))

(assert (=> d!6972 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6972 (= lt!31611 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6972 (= lt!31607 (BitStream!1143 (buf!969 (_2!1364 lt!31438)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)))))

(assert (=> d!6972 (isPrefixOf!0 thiss!1379 (_2!1364 lt!31438))))

(assert (=> d!6972 (= (reader!0 thiss!1379 (_2!1364 lt!31438)) lt!31602)))

(declare-fun b!21892 () Bool)

(declare-fun res!18893 () Bool)

(assert (=> b!21892 (=> (not res!18893) (not e!14845))))

(assert (=> b!21892 (= res!18893 (isPrefixOf!0 (_1!1365 lt!31602) thiss!1379))))

(declare-fun b!21893 () Bool)

(declare-fun lt!31609 () (_ BitVec 64))

(declare-fun lt!31601 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1142 (_ BitVec 64)) BitStream!1142)

(assert (=> b!21893 (= e!14845 (= (_1!1365 lt!31602) (withMovedBitIndex!0 (_2!1365 lt!31602) (bvsub lt!31609 lt!31601))))))

(assert (=> b!21893 (or (= (bvand lt!31609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!31601 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31609 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31609 lt!31601) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!21893 (= lt!31601 (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31438))) (currentByte!2270 (_2!1364 lt!31438)) (currentBit!2265 (_2!1364 lt!31438))))))

(assert (=> b!21893 (= lt!31609 (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)))))

(declare-fun b!21894 () Bool)

(declare-fun Unit!1912 () Unit!1902)

(assert (=> b!21894 (= e!14844 Unit!1912)))

(declare-fun b!21895 () Bool)

(declare-fun res!18892 () Bool)

(assert (=> b!21895 (=> (not res!18892) (not e!14845))))

(assert (=> b!21895 (= res!18892 (isPrefixOf!0 (_2!1365 lt!31602) (_2!1364 lt!31438)))))

(declare-fun b!21896 () Bool)

(declare-fun lt!31617 () Unit!1902)

(assert (=> b!21896 (= e!14844 lt!31617)))

(declare-fun lt!31614 () (_ BitVec 64))

(assert (=> b!21896 (= lt!31614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!31600 () (_ BitVec 64))

(assert (=> b!21896 (= lt!31600 (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1533 array!1533 (_ BitVec 64) (_ BitVec 64)) Unit!1902)

(assert (=> b!21896 (= lt!31617 (arrayBitRangesEqSymmetric!0 (buf!969 thiss!1379) (buf!969 (_2!1364 lt!31438)) lt!31614 lt!31600))))

(assert (=> b!21896 (arrayBitRangesEq!0 (buf!969 (_2!1364 lt!31438)) (buf!969 thiss!1379) lt!31614 lt!31600)))

(assert (= (and d!6972 c!1564) b!21896))

(assert (= (and d!6972 (not c!1564)) b!21894))

(assert (= (and d!6972 res!18891) b!21892))

(assert (= (and b!21892 res!18893) b!21895))

(assert (= (and b!21895 res!18892) b!21893))

(declare-fun m!30333 () Bool)

(assert (=> b!21892 m!30333))

(assert (=> d!6972 m!30257))

(declare-fun m!30335 () Bool)

(assert (=> d!6972 m!30335))

(declare-fun m!30337 () Bool)

(assert (=> d!6972 m!30337))

(declare-fun m!30339 () Bool)

(assert (=> d!6972 m!30339))

(assert (=> d!6972 m!30255))

(declare-fun m!30341 () Bool)

(assert (=> d!6972 m!30341))

(declare-fun m!30343 () Bool)

(assert (=> d!6972 m!30343))

(assert (=> d!6972 m!30217))

(declare-fun m!30345 () Bool)

(assert (=> d!6972 m!30345))

(declare-fun m!30347 () Bool)

(assert (=> d!6972 m!30347))

(declare-fun m!30349 () Bool)

(assert (=> d!6972 m!30349))

(declare-fun m!30351 () Bool)

(assert (=> b!21893 m!30351))

(assert (=> b!21893 m!30295))

(assert (=> b!21893 m!30259))

(assert (=> b!21896 m!30259))

(declare-fun m!30353 () Bool)

(assert (=> b!21896 m!30353))

(declare-fun m!30355 () Bool)

(assert (=> b!21896 m!30355))

(declare-fun m!30357 () Bool)

(assert (=> b!21895 m!30357))

(assert (=> b!21795 d!6972))

(declare-fun b!21994 () Bool)

(declare-fun res!18964 () Bool)

(declare-fun e!14895 () Bool)

(assert (=> b!21994 (=> (not res!18964) (not e!14895))))

(declare-fun lt!31931 () tuple2!2558)

(assert (=> b!21994 (= res!18964 (= (size!654 (buf!969 (_2!1364 lt!31931))) (size!654 (buf!969 (_2!1364 lt!31438)))))))

(declare-fun b!21995 () Bool)

(declare-fun res!18967 () Bool)

(assert (=> b!21995 (=> (not res!18967) (not e!14895))))

(assert (=> b!21995 (= res!18967 (invariant!0 (currentBit!2265 (_2!1364 lt!31931)) (currentByte!2270 (_2!1364 lt!31931)) (size!654 (buf!969 (_2!1364 lt!31931)))))))

(declare-fun b!21996 () Bool)

(declare-fun e!14893 () tuple2!2558)

(declare-fun Unit!1913 () Unit!1902)

(assert (=> b!21996 (= e!14893 (tuple2!2559 Unit!1913 (_2!1364 lt!31438)))))

(assert (=> b!21996 (= (size!654 (buf!969 (_2!1364 lt!31438))) (size!654 (buf!969 (_2!1364 lt!31438))))))

(declare-fun lt!31926 () Unit!1902)

(declare-fun Unit!1914 () Unit!1902)

(assert (=> b!21996 (= lt!31926 Unit!1914)))

(declare-fun call!317 () tuple2!2560)

(declare-fun checkByteArrayBitContent!0 (BitStream!1142 array!1533 array!1533 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!2568 0))(
  ( (tuple2!2569 (_1!1369 array!1533) (_2!1369 BitStream!1142)) )
))
(declare-fun readBits!0 (BitStream!1142 (_ BitVec 64)) tuple2!2568)

(assert (=> b!21996 (checkByteArrayBitContent!0 (_2!1364 lt!31438) srcBuffer!2 (_1!1369 (readBits!0 (_1!1365 call!317) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!21997 () Bool)

(declare-fun res!18965 () Bool)

(assert (=> b!21997 (=> (not res!18965) (not e!14895))))

(assert (=> b!21997 (= res!18965 (= (size!654 (buf!969 (_2!1364 lt!31438))) (size!654 (buf!969 (_2!1364 lt!31931)))))))

(declare-fun c!1579 () Bool)

(declare-fun lt!31938 () tuple2!2558)

(declare-fun bm!314 () Bool)

(declare-fun lt!31916 () tuple2!2558)

(assert (=> bm!314 (= call!317 (reader!0 (ite c!1579 (_2!1364 lt!31938) (_2!1364 lt!31438)) (ite c!1579 (_2!1364 lt!31916) (_2!1364 lt!31438))))))

(declare-fun d!6978 () Bool)

(assert (=> d!6978 e!14895))

(declare-fun res!18969 () Bool)

(assert (=> d!6978 (=> (not res!18969) (not e!14895))))

(declare-fun lt!31935 () (_ BitVec 64))

(assert (=> d!6978 (= res!18969 (= (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31931))) (currentByte!2270 (_2!1364 lt!31931)) (currentBit!2265 (_2!1364 lt!31931))) (bvsub lt!31935 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!6978 (or (= (bvand lt!31935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!31935 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!31935 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!31954 () (_ BitVec 64))

(assert (=> d!6978 (= lt!31935 (bvadd lt!31954 to!314))))

(assert (=> d!6978 (or (not (= (bvand lt!31954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!31954 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!31954 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6978 (= lt!31954 (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31438))) (currentByte!2270 (_2!1364 lt!31438)) (currentBit!2265 (_2!1364 lt!31438))))))

(assert (=> d!6978 (= lt!31931 e!14893)))

(assert (=> d!6978 (= c!1579 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!31942 () Unit!1902)

(declare-fun lt!31945 () Unit!1902)

(assert (=> d!6978 (= lt!31942 lt!31945)))

(assert (=> d!6978 (isPrefixOf!0 (_2!1364 lt!31438) (_2!1364 lt!31438))))

(assert (=> d!6978 (= lt!31945 (lemmaIsPrefixRefl!0 (_2!1364 lt!31438)))))

(declare-fun lt!31944 () (_ BitVec 64))

(assert (=> d!6978 (= lt!31944 (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31438))) (currentByte!2270 (_2!1364 lt!31438)) (currentBit!2265 (_2!1364 lt!31438))))))

(assert (=> d!6978 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6978 (= (appendBitsMSBFirstLoop!0 (_2!1364 lt!31438) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!31931)))

(declare-fun b!21998 () Bool)

(declare-fun e!14894 () Bool)

(declare-fun lt!31932 () (_ BitVec 64))

(assert (=> b!21998 (= e!14894 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438))) lt!31932))))

(declare-fun b!21999 () Bool)

(declare-fun res!18968 () Bool)

(assert (=> b!21999 (=> (not res!18968) (not e!14895))))

(assert (=> b!21999 (= res!18968 (isPrefixOf!0 (_2!1364 lt!31438) (_2!1364 lt!31931)))))

(declare-fun lt!31917 () tuple2!2560)

(declare-fun b!22000 () Bool)

(assert (=> b!22000 (= e!14895 (= (bitStreamReadBitsIntoList!0 (_2!1364 lt!31931) (_1!1365 lt!31917) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1364 lt!31931) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!22000 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22000 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!31924 () Unit!1902)

(declare-fun lt!31950 () Unit!1902)

(assert (=> b!22000 (= lt!31924 lt!31950)))

(assert (=> b!22000 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31931)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438))) lt!31932)))

(assert (=> b!22000 (= lt!31950 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1364 lt!31438) (buf!969 (_2!1364 lt!31931)) lt!31932))))

(assert (=> b!22000 e!14894))

(declare-fun res!18966 () Bool)

(assert (=> b!22000 (=> (not res!18966) (not e!14894))))

(assert (=> b!22000 (= res!18966 (and (= (size!654 (buf!969 (_2!1364 lt!31438))) (size!654 (buf!969 (_2!1364 lt!31931)))) (bvsge lt!31932 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22000 (= lt!31932 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!22000 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22000 (= lt!31917 (reader!0 (_2!1364 lt!31438) (_2!1364 lt!31931)))))

(declare-fun b!22001 () Bool)

(declare-fun Unit!1915 () Unit!1902)

(assert (=> b!22001 (= e!14893 (tuple2!2559 Unit!1915 (_2!1364 lt!31916)))))

(assert (=> b!22001 (= lt!31938 (appendBitFromByte!0 (_2!1364 lt!31438) (select (arr!1104 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!31940 () (_ BitVec 64))

(assert (=> b!22001 (= lt!31940 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31922 () (_ BitVec 64))

(assert (=> b!22001 (= lt!31922 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31914 () Unit!1902)

(assert (=> b!22001 (= lt!31914 (validateOffsetBitsIneqLemma!0 (_2!1364 lt!31438) (_2!1364 lt!31938) lt!31940 lt!31922))))

(assert (=> b!22001 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31938)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31938))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31938))) (bvsub lt!31940 lt!31922))))

(declare-fun lt!31930 () Unit!1902)

(assert (=> b!22001 (= lt!31930 lt!31914)))

(declare-fun lt!31955 () tuple2!2560)

(assert (=> b!22001 (= lt!31955 (reader!0 (_2!1364 lt!31438) (_2!1364 lt!31938)))))

(declare-fun lt!31920 () (_ BitVec 64))

(assert (=> b!22001 (= lt!31920 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!31947 () Unit!1902)

(assert (=> b!22001 (= lt!31947 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1364 lt!31438) (buf!969 (_2!1364 lt!31938)) lt!31920))))

(assert (=> b!22001 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31938)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438))) lt!31920)))

(declare-fun lt!31921 () Unit!1902)

(assert (=> b!22001 (= lt!31921 lt!31947)))

(assert (=> b!22001 (= (head!109 (byteArrayBitContentToList!0 (_2!1364 lt!31938) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!109 (bitStreamReadBitsIntoList!0 (_2!1364 lt!31938) (_1!1365 lt!31955) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31951 () Unit!1902)

(declare-fun Unit!1916 () Unit!1902)

(assert (=> b!22001 (= lt!31951 Unit!1916)))

(assert (=> b!22001 (= lt!31916 (appendBitsMSBFirstLoop!0 (_2!1364 lt!31938) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!31913 () Unit!1902)

(assert (=> b!22001 (= lt!31913 (lemmaIsPrefixTransitive!0 (_2!1364 lt!31438) (_2!1364 lt!31938) (_2!1364 lt!31916)))))

(assert (=> b!22001 (isPrefixOf!0 (_2!1364 lt!31438) (_2!1364 lt!31916))))

(declare-fun lt!31918 () Unit!1902)

(assert (=> b!22001 (= lt!31918 lt!31913)))

(assert (=> b!22001 (= (size!654 (buf!969 (_2!1364 lt!31916))) (size!654 (buf!969 (_2!1364 lt!31438))))))

(declare-fun lt!31953 () Unit!1902)

(declare-fun Unit!1917 () Unit!1902)

(assert (=> b!22001 (= lt!31953 Unit!1917)))

(assert (=> b!22001 (= (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31916))) (currentByte!2270 (_2!1364 lt!31916)) (currentBit!2265 (_2!1364 lt!31916))) (bvsub (bvadd (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31438))) (currentByte!2270 (_2!1364 lt!31438)) (currentBit!2265 (_2!1364 lt!31438))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31941 () Unit!1902)

(declare-fun Unit!1918 () Unit!1902)

(assert (=> b!22001 (= lt!31941 Unit!1918)))

(assert (=> b!22001 (= (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31916))) (currentByte!2270 (_2!1364 lt!31916)) (currentBit!2265 (_2!1364 lt!31916))) (bvsub (bvsub (bvadd (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31938))) (currentByte!2270 (_2!1364 lt!31938)) (currentBit!2265 (_2!1364 lt!31938))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31927 () Unit!1902)

(declare-fun Unit!1919 () Unit!1902)

(assert (=> b!22001 (= lt!31927 Unit!1919)))

(declare-fun lt!31936 () tuple2!2560)

(assert (=> b!22001 (= lt!31936 (reader!0 (_2!1364 lt!31438) (_2!1364 lt!31916)))))

(declare-fun lt!31925 () (_ BitVec 64))

(assert (=> b!22001 (= lt!31925 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31928 () Unit!1902)

(assert (=> b!22001 (= lt!31928 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1364 lt!31438) (buf!969 (_2!1364 lt!31916)) lt!31925))))

(assert (=> b!22001 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31916)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438))) lt!31925)))

(declare-fun lt!31948 () Unit!1902)

(assert (=> b!22001 (= lt!31948 lt!31928)))

(declare-fun lt!31915 () tuple2!2560)

(assert (=> b!22001 (= lt!31915 call!317)))

(declare-fun lt!31949 () (_ BitVec 64))

(assert (=> b!22001 (= lt!31949 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!31939 () Unit!1902)

(assert (=> b!22001 (= lt!31939 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1364 lt!31938) (buf!969 (_2!1364 lt!31916)) lt!31949))))

(assert (=> b!22001 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31916)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31938))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31938))) lt!31949)))

(declare-fun lt!31933 () Unit!1902)

(assert (=> b!22001 (= lt!31933 lt!31939)))

(declare-fun lt!31929 () List!272)

(assert (=> b!22001 (= lt!31929 (byteArrayBitContentToList!0 (_2!1364 lt!31916) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31946 () List!272)

(assert (=> b!22001 (= lt!31946 (byteArrayBitContentToList!0 (_2!1364 lt!31916) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31919 () List!272)

(assert (=> b!22001 (= lt!31919 (bitStreamReadBitsIntoList!0 (_2!1364 lt!31916) (_1!1365 lt!31936) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!31923 () List!272)

(assert (=> b!22001 (= lt!31923 (bitStreamReadBitsIntoList!0 (_2!1364 lt!31916) (_1!1365 lt!31915) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!31943 () (_ BitVec 64))

(assert (=> b!22001 (= lt!31943 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!31934 () Unit!1902)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1142 BitStream!1142 BitStream!1142 BitStream!1142 (_ BitVec 64) List!272) Unit!1902)

(assert (=> b!22001 (= lt!31934 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1364 lt!31916) (_2!1364 lt!31916) (_1!1365 lt!31936) (_1!1365 lt!31915) lt!31943 lt!31919))))

(declare-fun tail!82 (List!272) List!272)

(assert (=> b!22001 (= (bitStreamReadBitsIntoList!0 (_2!1364 lt!31916) (_1!1365 lt!31915) (bvsub lt!31943 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!82 lt!31919))))

(declare-fun lt!31937 () Unit!1902)

(assert (=> b!22001 (= lt!31937 lt!31934)))

(declare-fun lt!31912 () Unit!1902)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1533 array!1533 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!1902)

(assert (=> b!22001 (= lt!31912 (arrayBitRangesEqImpliesEq!0 (buf!969 (_2!1364 lt!31938)) (buf!969 (_2!1364 lt!31916)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!31944 (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31938))) (currentByte!2270 (_2!1364 lt!31938)) (currentBit!2265 (_2!1364 lt!31938)))))))

(declare-fun bitAt!0 (array!1533 (_ BitVec 64)) Bool)

(assert (=> b!22001 (= (bitAt!0 (buf!969 (_2!1364 lt!31938)) lt!31944) (bitAt!0 (buf!969 (_2!1364 lt!31916)) lt!31944))))

(declare-fun lt!31952 () Unit!1902)

(assert (=> b!22001 (= lt!31952 lt!31912)))

(assert (= (and d!6978 c!1579) b!22001))

(assert (= (and d!6978 (not c!1579)) b!21996))

(assert (= (or b!22001 b!21996) bm!314))

(assert (= (and d!6978 res!18969) b!21995))

(assert (= (and b!21995 res!18967) b!21997))

(assert (= (and b!21997 res!18965) b!21999))

(assert (= (and b!21999 res!18968) b!21994))

(assert (= (and b!21994 res!18964) b!22000))

(assert (= (and b!22000 res!18966) b!21998))

(declare-fun m!30509 () Bool)

(assert (=> bm!314 m!30509))

(declare-fun m!30511 () Bool)

(assert (=> b!21998 m!30511))

(declare-fun m!30513 () Bool)

(assert (=> b!21999 m!30513))

(declare-fun m!30515 () Bool)

(assert (=> b!22001 m!30515))

(declare-fun m!30517 () Bool)

(assert (=> b!22001 m!30517))

(declare-fun m!30519 () Bool)

(assert (=> b!22001 m!30519))

(declare-fun m!30521 () Bool)

(assert (=> b!22001 m!30521))

(declare-fun m!30523 () Bool)

(assert (=> b!22001 m!30523))

(declare-fun m!30525 () Bool)

(assert (=> b!22001 m!30525))

(declare-fun m!30527 () Bool)

(assert (=> b!22001 m!30527))

(declare-fun m!30529 () Bool)

(assert (=> b!22001 m!30529))

(declare-fun m!30531 () Bool)

(assert (=> b!22001 m!30531))

(declare-fun m!30533 () Bool)

(assert (=> b!22001 m!30533))

(declare-fun m!30535 () Bool)

(assert (=> b!22001 m!30535))

(declare-fun m!30537 () Bool)

(assert (=> b!22001 m!30537))

(assert (=> b!22001 m!30525))

(declare-fun m!30539 () Bool)

(assert (=> b!22001 m!30539))

(declare-fun m!30541 () Bool)

(assert (=> b!22001 m!30541))

(declare-fun m!30543 () Bool)

(assert (=> b!22001 m!30543))

(declare-fun m!30545 () Bool)

(assert (=> b!22001 m!30545))

(assert (=> b!22001 m!30535))

(declare-fun m!30547 () Bool)

(assert (=> b!22001 m!30547))

(declare-fun m!30549 () Bool)

(assert (=> b!22001 m!30549))

(declare-fun m!30551 () Bool)

(assert (=> b!22001 m!30551))

(declare-fun m!30553 () Bool)

(assert (=> b!22001 m!30553))

(assert (=> b!22001 m!30295))

(assert (=> b!22001 m!30519))

(declare-fun m!30555 () Bool)

(assert (=> b!22001 m!30555))

(declare-fun m!30557 () Bool)

(assert (=> b!22001 m!30557))

(declare-fun m!30559 () Bool)

(assert (=> b!22001 m!30559))

(assert (=> b!22001 m!30559))

(declare-fun m!30561 () Bool)

(assert (=> b!22001 m!30561))

(declare-fun m!30563 () Bool)

(assert (=> b!22001 m!30563))

(declare-fun m!30565 () Bool)

(assert (=> b!22001 m!30565))

(declare-fun m!30567 () Bool)

(assert (=> b!22001 m!30567))

(declare-fun m!30569 () Bool)

(assert (=> b!22001 m!30569))

(declare-fun m!30571 () Bool)

(assert (=> b!22001 m!30571))

(declare-fun m!30573 () Bool)

(assert (=> b!22001 m!30573))

(declare-fun m!30575 () Bool)

(assert (=> b!22001 m!30575))

(declare-fun m!30577 () Bool)

(assert (=> b!21995 m!30577))

(declare-fun m!30579 () Bool)

(assert (=> d!6978 m!30579))

(assert (=> d!6978 m!30295))

(assert (=> d!6978 m!30345))

(assert (=> d!6978 m!30337))

(declare-fun m!30581 () Bool)

(assert (=> b!21996 m!30581))

(declare-fun m!30583 () Bool)

(assert (=> b!21996 m!30583))

(declare-fun m!30585 () Bool)

(assert (=> b!22000 m!30585))

(declare-fun m!30587 () Bool)

(assert (=> b!22000 m!30587))

(declare-fun m!30589 () Bool)

(assert (=> b!22000 m!30589))

(declare-fun m!30591 () Bool)

(assert (=> b!22000 m!30591))

(declare-fun m!30593 () Bool)

(assert (=> b!22000 m!30593))

(assert (=> b!21795 d!6978))

(declare-fun d!7020 () Bool)

(assert (=> d!7020 (= (invariant!0 (currentBit!2265 (_2!1364 lt!31437)) (currentByte!2270 (_2!1364 lt!31437)) (size!654 (buf!969 (_2!1364 lt!31437)))) (and (bvsge (currentBit!2265 (_2!1364 lt!31437)) #b00000000000000000000000000000000) (bvslt (currentBit!2265 (_2!1364 lt!31437)) #b00000000000000000000000000001000) (bvsge (currentByte!2270 (_2!1364 lt!31437)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2270 (_2!1364 lt!31437)) (size!654 (buf!969 (_2!1364 lt!31437)))) (and (= (currentBit!2265 (_2!1364 lt!31437)) #b00000000000000000000000000000000) (= (currentByte!2270 (_2!1364 lt!31437)) (size!654 (buf!969 (_2!1364 lt!31437))))))))))

(assert (=> b!21794 d!7020))

(declare-fun d!7022 () Bool)

(declare-fun res!18981 () Bool)

(declare-fun e!14901 () Bool)

(assert (=> d!7022 (=> (not res!18981) (not e!14901))))

(assert (=> d!7022 (= res!18981 (= (size!654 (buf!969 thiss!1379)) (size!654 (buf!969 (_2!1364 lt!31438)))))))

(assert (=> d!7022 (= (isPrefixOf!0 thiss!1379 (_2!1364 lt!31438)) e!14901)))

(declare-fun b!22013 () Bool)

(declare-fun res!18979 () Bool)

(assert (=> b!22013 (=> (not res!18979) (not e!14901))))

(assert (=> b!22013 (= res!18979 (bvsle (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)) (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31438))) (currentByte!2270 (_2!1364 lt!31438)) (currentBit!2265 (_2!1364 lt!31438)))))))

(declare-fun b!22014 () Bool)

(declare-fun e!14902 () Bool)

(assert (=> b!22014 (= e!14901 e!14902)))

(declare-fun res!18980 () Bool)

(assert (=> b!22014 (=> res!18980 e!14902)))

(assert (=> b!22014 (= res!18980 (= (size!654 (buf!969 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!22015 () Bool)

(assert (=> b!22015 (= e!14902 (arrayBitRangesEq!0 (buf!969 thiss!1379) (buf!969 (_2!1364 lt!31438)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379))))))

(assert (= (and d!7022 res!18981) b!22013))

(assert (= (and b!22013 res!18979) b!22014))

(assert (= (and b!22014 (not res!18980)) b!22015))

(assert (=> b!22013 m!30259))

(assert (=> b!22013 m!30295))

(assert (=> b!22015 m!30259))

(assert (=> b!22015 m!30259))

(declare-fun m!30595 () Bool)

(assert (=> b!22015 m!30595))

(assert (=> b!21799 d!7022))

(declare-fun d!7024 () Bool)

(assert (=> d!7024 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!2048 () Bool)

(assert (= bs!2048 d!7024))

(declare-fun m!30599 () Bool)

(assert (=> bs!2048 m!30599))

(assert (=> b!21799 d!7024))

(declare-fun d!7028 () Bool)

(declare-fun e!14906 () Bool)

(assert (=> d!7028 e!14906))

(declare-fun res!18985 () Bool)

(assert (=> d!7028 (=> (not res!18985) (not e!14906))))

(assert (=> d!7028 (= res!18985 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!31969 () Unit!1902)

(declare-fun choose!27 (BitStream!1142 BitStream!1142 (_ BitVec 64) (_ BitVec 64)) Unit!1902)

(assert (=> d!7028 (= lt!31969 (choose!27 thiss!1379 (_2!1364 lt!31438) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!7028 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!7028 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1364 lt!31438) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!31969)))

(declare-fun b!22019 () Bool)

(assert (=> b!22019 (= e!14906 (validate_offset_bits!1 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31438)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31438))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31438))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!7028 res!18985) b!22019))

(declare-fun m!30601 () Bool)

(assert (=> d!7028 m!30601))

(assert (=> b!22019 m!30215))

(assert (=> b!21799 d!7028))

(declare-fun b!22064 () Bool)

(declare-fun e!14930 () Bool)

(declare-fun e!14931 () Bool)

(assert (=> b!22064 (= e!14930 e!14931)))

(declare-fun res!19035 () Bool)

(assert (=> b!22064 (=> (not res!19035) (not e!14931))))

(declare-fun lt!32046 () (_ BitVec 8))

(declare-fun lt!32042 () tuple2!2558)

(declare-datatypes ((tuple2!2576 0))(
  ( (tuple2!2577 (_1!1373 BitStream!1142) (_2!1373 Bool)) )
))
(declare-fun lt!32036 () tuple2!2576)

(assert (=> b!22064 (= res!19035 (and (= (_2!1373 lt!32036) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1104 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!32046)) #b00000000000000000000000000000000))) (= (_1!1373 lt!32036) (_2!1364 lt!32042))))))

(declare-fun lt!32041 () tuple2!2568)

(declare-fun lt!32039 () BitStream!1142)

(assert (=> b!22064 (= lt!32041 (readBits!0 lt!32039 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1142) tuple2!2576)

(assert (=> b!22064 (= lt!32036 (readBitPure!0 lt!32039))))

(declare-fun readerFrom!0 (BitStream!1142 (_ BitVec 32) (_ BitVec 32)) BitStream!1142)

(assert (=> b!22064 (= lt!32039 (readerFrom!0 (_2!1364 lt!32042) (currentBit!2265 thiss!1379) (currentByte!2270 thiss!1379)))))

(declare-fun d!7030 () Bool)

(assert (=> d!7030 e!14930))

(declare-fun res!19031 () Bool)

(assert (=> d!7030 (=> (not res!19031) (not e!14930))))

(assert (=> d!7030 (= res!19031 (= (size!654 (buf!969 (_2!1364 lt!32042))) (size!654 (buf!969 thiss!1379))))))

(declare-fun lt!32037 () array!1533)

(assert (=> d!7030 (= lt!32046 (select (arr!1104 lt!32037) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!7030 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!654 lt!32037)))))

(assert (=> d!7030 (= lt!32037 (array!1534 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!32043 () tuple2!2558)

(assert (=> d!7030 (= lt!32042 (tuple2!2559 (_1!1364 lt!32043) (_2!1364 lt!32043)))))

(declare-fun lt!32040 () tuple2!2558)

(assert (=> d!7030 (= lt!32043 lt!32040)))

(declare-fun e!14928 () Bool)

(assert (=> d!7030 e!14928))

(declare-fun res!19029 () Bool)

(assert (=> d!7030 (=> (not res!19029) (not e!14928))))

(assert (=> d!7030 (= res!19029 (= (size!654 (buf!969 thiss!1379)) (size!654 (buf!969 (_2!1364 lt!32040)))))))

(declare-fun lt!32044 () Bool)

(declare-fun appendBit!0 (BitStream!1142 Bool) tuple2!2558)

(assert (=> d!7030 (= lt!32040 (appendBit!0 thiss!1379 lt!32044))))

(assert (=> d!7030 (= lt!32044 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1104 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!7030 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!7030 (= (appendBitFromByte!0 thiss!1379 (select (arr!1104 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!32042)))

(declare-fun b!22065 () Bool)

(assert (=> b!22065 (= e!14931 (= (bitIndex!0 (size!654 (buf!969 (_1!1373 lt!32036))) (currentByte!2270 (_1!1373 lt!32036)) (currentBit!2265 (_1!1373 lt!32036))) (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!32042))) (currentByte!2270 (_2!1364 lt!32042)) (currentBit!2265 (_2!1364 lt!32042)))))))

(declare-fun b!22066 () Bool)

(declare-fun e!14929 () Bool)

(assert (=> b!22066 (= e!14928 e!14929)))

(declare-fun res!19034 () Bool)

(assert (=> b!22066 (=> (not res!19034) (not e!14929))))

(declare-fun lt!32045 () tuple2!2576)

(assert (=> b!22066 (= res!19034 (and (= (_2!1373 lt!32045) lt!32044) (= (_1!1373 lt!32045) (_2!1364 lt!32040))))))

(assert (=> b!22066 (= lt!32045 (readBitPure!0 (readerFrom!0 (_2!1364 lt!32040) (currentBit!2265 thiss!1379) (currentByte!2270 thiss!1379))))))

(declare-fun b!22067 () Bool)

(assert (=> b!22067 (= e!14929 (= (bitIndex!0 (size!654 (buf!969 (_1!1373 lt!32045))) (currentByte!2270 (_1!1373 lt!32045)) (currentBit!2265 (_1!1373 lt!32045))) (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!32040))) (currentByte!2270 (_2!1364 lt!32040)) (currentBit!2265 (_2!1364 lt!32040)))))))

(declare-fun b!22068 () Bool)

(declare-fun res!19032 () Bool)

(assert (=> b!22068 (=> (not res!19032) (not e!14928))))

(assert (=> b!22068 (= res!19032 (isPrefixOf!0 thiss!1379 (_2!1364 lt!32040)))))

(declare-fun b!22069 () Bool)

(declare-fun res!19033 () Bool)

(assert (=> b!22069 (=> (not res!19033) (not e!14928))))

(assert (=> b!22069 (= res!19033 (= (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!32040))) (currentByte!2270 (_2!1364 lt!32040)) (currentBit!2265 (_2!1364 lt!32040))) (bvadd (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!22070 () Bool)

(declare-fun res!19030 () Bool)

(assert (=> b!22070 (=> (not res!19030) (not e!14930))))

(assert (=> b!22070 (= res!19030 (isPrefixOf!0 thiss!1379 (_2!1364 lt!32042)))))

(declare-fun b!22071 () Bool)

(declare-fun res!19028 () Bool)

(assert (=> b!22071 (=> (not res!19028) (not e!14930))))

(declare-fun lt!32047 () (_ BitVec 64))

(declare-fun lt!32038 () (_ BitVec 64))

(assert (=> b!22071 (= res!19028 (= (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!32042))) (currentByte!2270 (_2!1364 lt!32042)) (currentBit!2265 (_2!1364 lt!32042))) (bvadd lt!32047 lt!32038)))))

(assert (=> b!22071 (or (not (= (bvand lt!32047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32038 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!32047 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!32047 lt!32038) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!22071 (= lt!32038 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!22071 (= lt!32047 (bitIndex!0 (size!654 (buf!969 thiss!1379)) (currentByte!2270 thiss!1379) (currentBit!2265 thiss!1379)))))

(assert (= (and d!7030 res!19029) b!22069))

(assert (= (and b!22069 res!19033) b!22068))

(assert (= (and b!22068 res!19032) b!22066))

(assert (= (and b!22066 res!19034) b!22067))

(assert (= (and d!7030 res!19031) b!22071))

(assert (= (and b!22071 res!19028) b!22070))

(assert (= (and b!22070 res!19030) b!22064))

(assert (= (and b!22064 res!19035) b!22065))

(declare-fun m!30631 () Bool)

(assert (=> b!22067 m!30631))

(declare-fun m!30633 () Bool)

(assert (=> b!22067 m!30633))

(declare-fun m!30635 () Bool)

(assert (=> d!7030 m!30635))

(declare-fun m!30637 () Bool)

(assert (=> d!7030 m!30637))

(declare-fun m!30639 () Bool)

(assert (=> d!7030 m!30639))

(declare-fun m!30641 () Bool)

(assert (=> b!22064 m!30641))

(declare-fun m!30643 () Bool)

(assert (=> b!22064 m!30643))

(declare-fun m!30645 () Bool)

(assert (=> b!22064 m!30645))

(declare-fun m!30647 () Bool)

(assert (=> b!22066 m!30647))

(assert (=> b!22066 m!30647))

(declare-fun m!30649 () Bool)

(assert (=> b!22066 m!30649))

(declare-fun m!30651 () Bool)

(assert (=> b!22071 m!30651))

(assert (=> b!22071 m!30259))

(declare-fun m!30653 () Bool)

(assert (=> b!22070 m!30653))

(declare-fun m!30655 () Bool)

(assert (=> b!22068 m!30655))

(assert (=> b!22069 m!30633))

(assert (=> b!22069 m!30259))

(declare-fun m!30657 () Bool)

(assert (=> b!22065 m!30657))

(assert (=> b!22065 m!30651))

(assert (=> b!21799 d!7030))

(declare-fun d!7046 () Bool)

(declare-fun e!14932 () Bool)

(assert (=> d!7046 e!14932))

(declare-fun res!19036 () Bool)

(assert (=> d!7046 (=> (not res!19036) (not e!14932))))

(declare-fun lt!32052 () (_ BitVec 64))

(declare-fun lt!32051 () (_ BitVec 64))

(declare-fun lt!32053 () (_ BitVec 64))

(assert (=> d!7046 (= res!19036 (= lt!32051 (bvsub lt!32053 lt!32052)))))

(assert (=> d!7046 (or (= (bvand lt!32053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!32052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!32053 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!32053 lt!32052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7046 (= lt!32052 (remainingBits!0 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31437)))) ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31437))) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31437)))))))

(declare-fun lt!32048 () (_ BitVec 64))

(declare-fun lt!32049 () (_ BitVec 64))

(assert (=> d!7046 (= lt!32053 (bvmul lt!32048 lt!32049))))

(assert (=> d!7046 (or (= lt!32048 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!32049 (bvsdiv (bvmul lt!32048 lt!32049) lt!32048)))))

(assert (=> d!7046 (= lt!32049 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!7046 (= lt!32048 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31437)))))))

(assert (=> d!7046 (= lt!32051 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2270 (_2!1364 lt!31437))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2265 (_2!1364 lt!31437)))))))

(assert (=> d!7046 (invariant!0 (currentBit!2265 (_2!1364 lt!31437)) (currentByte!2270 (_2!1364 lt!31437)) (size!654 (buf!969 (_2!1364 lt!31437))))))

(assert (=> d!7046 (= (bitIndex!0 (size!654 (buf!969 (_2!1364 lt!31437))) (currentByte!2270 (_2!1364 lt!31437)) (currentBit!2265 (_2!1364 lt!31437))) lt!32051)))

(declare-fun b!22072 () Bool)

(declare-fun res!19037 () Bool)

(assert (=> b!22072 (=> (not res!19037) (not e!14932))))

(assert (=> b!22072 (= res!19037 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!32051))))

(declare-fun b!22073 () Bool)

(declare-fun lt!32050 () (_ BitVec 64))

(assert (=> b!22073 (= e!14932 (bvsle lt!32051 (bvmul lt!32050 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!22073 (or (= lt!32050 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!32050 #b0000000000000000000000000000000000000000000000000000000000001000) lt!32050)))))

(assert (=> b!22073 (= lt!32050 ((_ sign_extend 32) (size!654 (buf!969 (_2!1364 lt!31437)))))))

(assert (= (and d!7046 res!19036) b!22072))

(assert (= (and b!22072 res!19037) b!22073))

(declare-fun m!30659 () Bool)

