; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20024 () Bool)

(assert start!20024)

(declare-fun b!100227 () Bool)

(declare-fun res!82307 () Bool)

(declare-fun e!65598 () Bool)

(assert (=> b!100227 (=> (not res!82307) (not e!65598))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!100227 (= res!82307 (bvslt i!615 nBits!396))))

(declare-fun b!100228 () Bool)

(declare-datatypes ((array!4723 0))(
  ( (array!4724 (arr!2750 (Array (_ BitVec 32) (_ BitVec 8))) (size!2157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3788 0))(
  ( (BitStream!3789 (buf!2514 array!4723) (currentByte!4960 (_ BitVec 32)) (currentBit!4955 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6141 0))(
  ( (Unit!6142) )
))
(declare-datatypes ((tuple2!8098 0))(
  ( (tuple2!8099 (_1!4304 Unit!6141) (_2!4304 BitStream!3788)) )
))
(declare-fun lt!144895 () tuple2!8098)

(declare-fun lt!144898 () tuple2!8098)

(declare-fun isPrefixOf!0 (BitStream!3788 BitStream!3788) Bool)

(assert (=> b!100228 (= e!65598 (not (isPrefixOf!0 (_2!4304 lt!144895) (_2!4304 lt!144898))))))

(declare-datatypes ((tuple2!8100 0))(
  ( (tuple2!8101 (_1!4305 BitStream!3788) (_2!4305 BitStream!3788)) )
))
(declare-fun lt!144887 () tuple2!8100)

(declare-fun thiss!1305 () BitStream!3788)

(declare-fun reader!0 (BitStream!3788 BitStream!3788) tuple2!8100)

(assert (=> b!100228 (= lt!144887 (reader!0 thiss!1305 (_2!4304 lt!144898)))))

(declare-fun e!65595 () Bool)

(assert (=> b!100228 e!65595))

(declare-fun res!82302 () Bool)

(assert (=> b!100228 (=> (not res!82302) (not e!65595))))

(declare-datatypes ((tuple2!8102 0))(
  ( (tuple2!8103 (_1!4306 BitStream!3788) (_2!4306 Bool)) )
))
(declare-fun lt!144894 () tuple2!8102)

(declare-fun lt!144891 () tuple2!8102)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100228 (= res!82302 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!144894))) (currentByte!4960 (_1!4306 lt!144894)) (currentBit!4955 (_1!4306 lt!144894))) (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!144891))) (currentByte!4960 (_1!4306 lt!144891)) (currentBit!4955 (_1!4306 lt!144891)))))))

(declare-fun lt!144896 () Unit!6141)

(declare-fun lt!144893 () BitStream!3788)

(declare-fun readBitPrefixLemma!0 (BitStream!3788 BitStream!3788) Unit!6141)

(assert (=> b!100228 (= lt!144896 (readBitPrefixLemma!0 lt!144893 (_2!4304 lt!144898)))))

(declare-fun readBitPure!0 (BitStream!3788) tuple2!8102)

(assert (=> b!100228 (= lt!144891 (readBitPure!0 (BitStream!3789 (buf!2514 (_2!4304 lt!144898)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305))))))

(assert (=> b!100228 (= lt!144894 (readBitPure!0 lt!144893))))

(assert (=> b!100228 (= lt!144893 (BitStream!3789 (buf!2514 (_2!4304 lt!144895)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)))))

(declare-fun e!65596 () Bool)

(assert (=> b!100228 e!65596))

(declare-fun res!82300 () Bool)

(assert (=> b!100228 (=> (not res!82300) (not e!65596))))

(assert (=> b!100228 (= res!82300 (isPrefixOf!0 thiss!1305 (_2!4304 lt!144898)))))

(declare-fun lt!144889 () Unit!6141)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3788 BitStream!3788 BitStream!3788) Unit!6141)

(assert (=> b!100228 (= lt!144889 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4304 lt!144895) (_2!4304 lt!144898)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3788 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8098)

(assert (=> b!100228 (= lt!144898 (appendNLeastSignificantBitsLoop!0 (_2!4304 lt!144895) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!65592 () Bool)

(assert (=> b!100228 e!65592))

(declare-fun res!82303 () Bool)

(assert (=> b!100228 (=> (not res!82303) (not e!65592))))

(assert (=> b!100228 (= res!82303 (= (size!2157 (buf!2514 thiss!1305)) (size!2157 (buf!2514 (_2!4304 lt!144895)))))))

(declare-fun lt!144890 () Bool)

(declare-fun appendBit!0 (BitStream!3788 Bool) tuple2!8098)

(assert (=> b!100228 (= lt!144895 (appendBit!0 thiss!1305 lt!144890))))

(assert (=> b!100228 (= lt!144890 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!100229 () Bool)

(declare-fun res!82306 () Bool)

(assert (=> b!100229 (=> (not res!82306) (not e!65598))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100229 (= res!82306 (validate_offset_bits!1 ((_ sign_extend 32) (size!2157 (buf!2514 thiss!1305))) ((_ sign_extend 32) (currentByte!4960 thiss!1305)) ((_ sign_extend 32) (currentBit!4955 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!100230 () Bool)

(declare-fun e!65597 () Bool)

(declare-fun array_inv!1959 (array!4723) Bool)

(assert (=> b!100230 (= e!65597 (array_inv!1959 (buf!2514 thiss!1305)))))

(declare-fun b!100231 () Bool)

(assert (=> b!100231 (= e!65595 (= (_2!4306 lt!144894) (_2!4306 lt!144891)))))

(declare-fun b!100232 () Bool)

(declare-fun e!65591 () Bool)

(declare-fun lt!144897 () tuple2!8102)

(declare-fun lt!144892 () (_ BitVec 64))

(assert (=> b!100232 (= e!65591 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!144897))) (currentByte!4960 (_1!4306 lt!144897)) (currentBit!4955 (_1!4306 lt!144897))) lt!144892))))

(declare-fun b!100233 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!100233 (= e!65596 (invariant!0 (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144898)))))))

(declare-fun b!100234 () Bool)

(declare-fun e!65594 () Bool)

(assert (=> b!100234 (= e!65592 e!65594)))

(declare-fun res!82305 () Bool)

(assert (=> b!100234 (=> (not res!82305) (not e!65594))))

(declare-fun lt!144888 () (_ BitVec 64))

(assert (=> b!100234 (= res!82305 (= lt!144892 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!144888)))))

(assert (=> b!100234 (= lt!144892 (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))))))

(assert (=> b!100234 (= lt!144888 (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)))))

(declare-fun b!100235 () Bool)

(declare-fun res!82308 () Bool)

(assert (=> b!100235 (=> (not res!82308) (not e!65594))))

(assert (=> b!100235 (= res!82308 (isPrefixOf!0 thiss!1305 (_2!4304 lt!144895)))))

(declare-fun b!100237 () Bool)

(declare-fun res!82301 () Bool)

(assert (=> b!100237 (=> (not res!82301) (not e!65598))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!100237 (= res!82301 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!100238 () Bool)

(assert (=> b!100238 (= e!65594 e!65591)))

(declare-fun res!82310 () Bool)

(assert (=> b!100238 (=> (not res!82310) (not e!65591))))

(assert (=> b!100238 (= res!82310 (and (= (_2!4306 lt!144897) lt!144890) (= (_1!4306 lt!144897) (_2!4304 lt!144895))))))

(declare-fun readerFrom!0 (BitStream!3788 (_ BitVec 32) (_ BitVec 32)) BitStream!3788)

(assert (=> b!100238 (= lt!144897 (readBitPure!0 (readerFrom!0 (_2!4304 lt!144895) (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305))))))

(declare-fun b!100236 () Bool)

(declare-fun res!82304 () Bool)

(assert (=> b!100236 (=> (not res!82304) (not e!65596))))

(assert (=> b!100236 (= res!82304 (invariant!0 (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144895)))))))

(declare-fun res!82309 () Bool)

(assert (=> start!20024 (=> (not res!82309) (not e!65598))))

(assert (=> start!20024 (= res!82309 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!20024 e!65598))

(assert (=> start!20024 true))

(declare-fun inv!12 (BitStream!3788) Bool)

(assert (=> start!20024 (and (inv!12 thiss!1305) e!65597)))

(assert (= (and start!20024 res!82309) b!100229))

(assert (= (and b!100229 res!82306) b!100237))

(assert (= (and b!100237 res!82301) b!100227))

(assert (= (and b!100227 res!82307) b!100228))

(assert (= (and b!100228 res!82303) b!100234))

(assert (= (and b!100234 res!82305) b!100235))

(assert (= (and b!100235 res!82308) b!100238))

(assert (= (and b!100238 res!82310) b!100232))

(assert (= (and b!100228 res!82300) b!100236))

(assert (= (and b!100236 res!82304) b!100233))

(assert (= (and b!100228 res!82302) b!100231))

(assert (= start!20024 b!100230))

(declare-fun m!145617 () Bool)

(assert (=> start!20024 m!145617))

(declare-fun m!145619 () Bool)

(assert (=> b!100235 m!145619))

(declare-fun m!145621 () Bool)

(assert (=> b!100232 m!145621))

(declare-fun m!145623 () Bool)

(assert (=> b!100230 m!145623))

(declare-fun m!145625 () Bool)

(assert (=> b!100233 m!145625))

(declare-fun m!145627 () Bool)

(assert (=> b!100229 m!145627))

(declare-fun m!145629 () Bool)

(assert (=> b!100228 m!145629))

(declare-fun m!145631 () Bool)

(assert (=> b!100228 m!145631))

(declare-fun m!145633 () Bool)

(assert (=> b!100228 m!145633))

(declare-fun m!145635 () Bool)

(assert (=> b!100228 m!145635))

(declare-fun m!145637 () Bool)

(assert (=> b!100228 m!145637))

(declare-fun m!145639 () Bool)

(assert (=> b!100228 m!145639))

(declare-fun m!145641 () Bool)

(assert (=> b!100228 m!145641))

(declare-fun m!145643 () Bool)

(assert (=> b!100228 m!145643))

(declare-fun m!145645 () Bool)

(assert (=> b!100228 m!145645))

(declare-fun m!145647 () Bool)

(assert (=> b!100228 m!145647))

(declare-fun m!145649 () Bool)

(assert (=> b!100228 m!145649))

(declare-fun m!145651 () Bool)

(assert (=> b!100238 m!145651))

(assert (=> b!100238 m!145651))

(declare-fun m!145653 () Bool)

(assert (=> b!100238 m!145653))

(declare-fun m!145655 () Bool)

(assert (=> b!100234 m!145655))

(declare-fun m!145657 () Bool)

(assert (=> b!100234 m!145657))

(declare-fun m!145659 () Bool)

(assert (=> b!100236 m!145659))

(declare-fun m!145661 () Bool)

(assert (=> b!100237 m!145661))

(push 1)

(assert (not b!100235))

(assert (not b!100233))

(assert (not b!100230))

(assert (not start!20024))

(assert (not b!100228))

(assert (not b!100238))

(assert (not b!100236))

(assert (not b!100234))

(assert (not b!100232))

(assert (not b!100237))

(assert (not b!100229))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!31408 () Bool)

(assert (=> d!31408 (= (invariant!0 (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144895)))) (and (bvsge (currentBit!4955 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4955 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4960 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144895)))) (and (= (currentBit!4955 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144895))))))))))

(assert (=> b!100236 d!31408))

(declare-fun d!31410 () Bool)

(assert (=> d!31410 (= (inv!12 thiss!1305) (invariant!0 (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305) (size!2157 (buf!2514 thiss!1305))))))

(declare-fun bs!7708 () Bool)

(assert (= bs!7708 d!31410))

(declare-fun m!145683 () Bool)

(assert (=> bs!7708 m!145683))

(assert (=> start!20024 d!31410))

(declare-fun d!31412 () Bool)

(declare-fun res!82339 () Bool)

(declare-fun e!65617 () Bool)

(assert (=> d!31412 (=> (not res!82339) (not e!65617))))

(assert (=> d!31412 (= res!82339 (= (size!2157 (buf!2514 thiss!1305)) (size!2157 (buf!2514 (_2!4304 lt!144895)))))))

(assert (=> d!31412 (= (isPrefixOf!0 thiss!1305 (_2!4304 lt!144895)) e!65617)))

(declare-fun b!100265 () Bool)

(declare-fun res!82338 () Bool)

(assert (=> b!100265 (=> (not res!82338) (not e!65617))))

(assert (=> b!100265 (= res!82338 (bvsle (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)) (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895)))))))

(declare-fun b!100266 () Bool)

(declare-fun e!65616 () Bool)

(assert (=> b!100266 (= e!65617 e!65616)))

(declare-fun res!82340 () Bool)

(assert (=> b!100266 (=> res!82340 e!65616)))

(assert (=> b!100266 (= res!82340 (= (size!2157 (buf!2514 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100267 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4723 array!4723 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!100267 (= e!65616 (arrayBitRangesEq!0 (buf!2514 thiss!1305) (buf!2514 (_2!4304 lt!144895)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305))))))

(assert (= (and d!31412 res!82339) b!100265))

(assert (= (and b!100265 res!82338) b!100266))

(assert (= (and b!100266 (not res!82340)) b!100267))

(assert (=> b!100265 m!145657))

(assert (=> b!100265 m!145655))

(assert (=> b!100267 m!145657))

(assert (=> b!100267 m!145657))

(declare-fun m!145691 () Bool)

(assert (=> b!100267 m!145691))

(assert (=> b!100235 d!31412))

(declare-fun d!31418 () Bool)

(assert (=> d!31418 (= (invariant!0 (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144898)))) (and (bvsge (currentBit!4955 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!4955 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!4960 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144898)))) (and (= (currentBit!4955 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144898))))))))))

(assert (=> b!100233 d!31418))

(declare-fun d!31420 () Bool)

(declare-fun e!65620 () Bool)

(assert (=> d!31420 e!65620))

(declare-fun res!82346 () Bool)

(assert (=> d!31420 (=> (not res!82346) (not e!65620))))

(declare-fun lt!144974 () (_ BitVec 64))

(declare-fun lt!144976 () (_ BitVec 64))

(declare-fun lt!144973 () (_ BitVec 64))

(assert (=> d!31420 (= res!82346 (= lt!144976 (bvsub lt!144973 lt!144974)))))

(assert (=> d!31420 (or (= (bvand lt!144973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144974 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144973 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144973 lt!144974) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!31420 (= lt!144974 (remainingBits!0 ((_ sign_extend 32) (size!2157 (buf!2514 (_2!4304 lt!144895)))) ((_ sign_extend 32) (currentByte!4960 (_2!4304 lt!144895))) ((_ sign_extend 32) (currentBit!4955 (_2!4304 lt!144895)))))))

(declare-fun lt!144975 () (_ BitVec 64))

(declare-fun lt!144972 () (_ BitVec 64))

(assert (=> d!31420 (= lt!144973 (bvmul lt!144975 lt!144972))))

(assert (=> d!31420 (or (= lt!144975 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144972 (bvsdiv (bvmul lt!144975 lt!144972) lt!144975)))))

(assert (=> d!31420 (= lt!144972 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31420 (= lt!144975 ((_ sign_extend 32) (size!2157 (buf!2514 (_2!4304 lt!144895)))))))

(assert (=> d!31420 (= lt!144976 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4960 (_2!4304 lt!144895))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4955 (_2!4304 lt!144895)))))))

(assert (=> d!31420 (invariant!0 (currentBit!4955 (_2!4304 lt!144895)) (currentByte!4960 (_2!4304 lt!144895)) (size!2157 (buf!2514 (_2!4304 lt!144895))))))

(assert (=> d!31420 (= (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))) lt!144976)))

(declare-fun b!100272 () Bool)

(declare-fun res!82345 () Bool)

(assert (=> b!100272 (=> (not res!82345) (not e!65620))))

(assert (=> b!100272 (= res!82345 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144976))))

(declare-fun b!100273 () Bool)

(declare-fun lt!144971 () (_ BitVec 64))

(assert (=> b!100273 (= e!65620 (bvsle lt!144976 (bvmul lt!144971 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100273 (or (= lt!144971 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144971 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144971)))))

(assert (=> b!100273 (= lt!144971 ((_ sign_extend 32) (size!2157 (buf!2514 (_2!4304 lt!144895)))))))

(assert (= (and d!31420 res!82346) b!100272))

(assert (= (and b!100272 res!82345) b!100273))

(declare-fun m!145693 () Bool)

(assert (=> d!31420 m!145693))

(declare-fun m!145695 () Bool)

(assert (=> d!31420 m!145695))

(assert (=> b!100234 d!31420))

(declare-fun d!31422 () Bool)

(declare-fun e!65621 () Bool)

(assert (=> d!31422 e!65621))

(declare-fun res!82348 () Bool)

(assert (=> d!31422 (=> (not res!82348) (not e!65621))))

(declare-fun lt!144979 () (_ BitVec 64))

(declare-fun lt!144980 () (_ BitVec 64))

(declare-fun lt!144982 () (_ BitVec 64))

(assert (=> d!31422 (= res!82348 (= lt!144982 (bvsub lt!144979 lt!144980)))))

(assert (=> d!31422 (or (= (bvand lt!144979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144979 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144979 lt!144980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31422 (= lt!144980 (remainingBits!0 ((_ sign_extend 32) (size!2157 (buf!2514 thiss!1305))) ((_ sign_extend 32) (currentByte!4960 thiss!1305)) ((_ sign_extend 32) (currentBit!4955 thiss!1305))))))

(declare-fun lt!144981 () (_ BitVec 64))

(declare-fun lt!144978 () (_ BitVec 64))

(assert (=> d!31422 (= lt!144979 (bvmul lt!144981 lt!144978))))

(assert (=> d!31422 (or (= lt!144981 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144978 (bvsdiv (bvmul lt!144981 lt!144978) lt!144981)))))

(assert (=> d!31422 (= lt!144978 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31422 (= lt!144981 ((_ sign_extend 32) (size!2157 (buf!2514 thiss!1305))))))

(assert (=> d!31422 (= lt!144982 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4960 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4955 thiss!1305))))))

(assert (=> d!31422 (invariant!0 (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305) (size!2157 (buf!2514 thiss!1305)))))

(assert (=> d!31422 (= (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)) lt!144982)))

(declare-fun b!100274 () Bool)

(declare-fun res!82347 () Bool)

(assert (=> b!100274 (=> (not res!82347) (not e!65621))))

(assert (=> b!100274 (= res!82347 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144982))))

(declare-fun b!100275 () Bool)

(declare-fun lt!144977 () (_ BitVec 64))

(assert (=> b!100275 (= e!65621 (bvsle lt!144982 (bvmul lt!144977 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100275 (or (= lt!144977 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144977 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144977)))))

(assert (=> b!100275 (= lt!144977 ((_ sign_extend 32) (size!2157 (buf!2514 thiss!1305))))))

(assert (= (and d!31422 res!82348) b!100274))

(assert (= (and b!100274 res!82347) b!100275))

(declare-fun m!145697 () Bool)

(assert (=> d!31422 m!145697))

(assert (=> d!31422 m!145683))

(assert (=> b!100234 d!31422))

(declare-fun d!31424 () Bool)

(declare-fun e!65622 () Bool)

(assert (=> d!31424 e!65622))

(declare-fun res!82350 () Bool)

(assert (=> d!31424 (=> (not res!82350) (not e!65622))))

(declare-fun lt!144985 () (_ BitVec 64))

(declare-fun lt!144986 () (_ BitVec 64))

(declare-fun lt!144988 () (_ BitVec 64))

(assert (=> d!31424 (= res!82350 (= lt!144988 (bvsub lt!144985 lt!144986)))))

(assert (=> d!31424 (or (= (bvand lt!144985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!144985 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!144985 lt!144986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31424 (= lt!144986 (remainingBits!0 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144897)))) ((_ sign_extend 32) (currentByte!4960 (_1!4306 lt!144897))) ((_ sign_extend 32) (currentBit!4955 (_1!4306 lt!144897)))))))

(declare-fun lt!144987 () (_ BitVec 64))

(declare-fun lt!144984 () (_ BitVec 64))

(assert (=> d!31424 (= lt!144985 (bvmul lt!144987 lt!144984))))

(assert (=> d!31424 (or (= lt!144987 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!144984 (bvsdiv (bvmul lt!144987 lt!144984) lt!144987)))))

(assert (=> d!31424 (= lt!144984 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31424 (= lt!144987 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144897)))))))

(assert (=> d!31424 (= lt!144988 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4960 (_1!4306 lt!144897))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4955 (_1!4306 lt!144897)))))))

(assert (=> d!31424 (invariant!0 (currentBit!4955 (_1!4306 lt!144897)) (currentByte!4960 (_1!4306 lt!144897)) (size!2157 (buf!2514 (_1!4306 lt!144897))))))

(assert (=> d!31424 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!144897))) (currentByte!4960 (_1!4306 lt!144897)) (currentBit!4955 (_1!4306 lt!144897))) lt!144988)))

(declare-fun b!100276 () Bool)

(declare-fun res!82349 () Bool)

(assert (=> b!100276 (=> (not res!82349) (not e!65622))))

(assert (=> b!100276 (= res!82349 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!144988))))

(declare-fun b!100277 () Bool)

(declare-fun lt!144983 () (_ BitVec 64))

(assert (=> b!100277 (= e!65622 (bvsle lt!144988 (bvmul lt!144983 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100277 (or (= lt!144983 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!144983 #b0000000000000000000000000000000000000000000000000000000000001000) lt!144983)))))

(assert (=> b!100277 (= lt!144983 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144897)))))))

(assert (= (and d!31424 res!82350) b!100276))

(assert (= (and b!100276 res!82349) b!100277))

(declare-fun m!145699 () Bool)

(assert (=> d!31424 m!145699))

(declare-fun m!145701 () Bool)

(assert (=> d!31424 m!145701))

(assert (=> b!100232 d!31424))

(declare-fun d!31426 () Bool)

(assert (=> d!31426 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2157 (buf!2514 thiss!1305))) ((_ sign_extend 32) (currentByte!4960 thiss!1305)) ((_ sign_extend 32) (currentBit!4955 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2157 (buf!2514 thiss!1305))) ((_ sign_extend 32) (currentByte!4960 thiss!1305)) ((_ sign_extend 32) (currentBit!4955 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!7710 () Bool)

(assert (= bs!7710 d!31426))

(assert (=> bs!7710 m!145697))

(assert (=> b!100229 d!31426))

(declare-fun d!31428 () Bool)

(assert (=> d!31428 (= (array_inv!1959 (buf!2514 thiss!1305)) (bvsge (size!2157 (buf!2514 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!100230 d!31428))

(declare-fun d!31430 () Bool)

(declare-fun res!82352 () Bool)

(declare-fun e!65624 () Bool)

(assert (=> d!31430 (=> (not res!82352) (not e!65624))))

(assert (=> d!31430 (= res!82352 (= (size!2157 (buf!2514 (_2!4304 lt!144895))) (size!2157 (buf!2514 (_2!4304 lt!144898)))))))

(assert (=> d!31430 (= (isPrefixOf!0 (_2!4304 lt!144895) (_2!4304 lt!144898)) e!65624)))

(declare-fun b!100278 () Bool)

(declare-fun res!82351 () Bool)

(assert (=> b!100278 (=> (not res!82351) (not e!65624))))

(assert (=> b!100278 (= res!82351 (bvsle (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))) (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144898))) (currentByte!4960 (_2!4304 lt!144898)) (currentBit!4955 (_2!4304 lt!144898)))))))

(declare-fun b!100279 () Bool)

(declare-fun e!65623 () Bool)

(assert (=> b!100279 (= e!65624 e!65623)))

(declare-fun res!82353 () Bool)

(assert (=> b!100279 (=> res!82353 e!65623)))

(assert (=> b!100279 (= res!82353 (= (size!2157 (buf!2514 (_2!4304 lt!144895))) #b00000000000000000000000000000000))))

(declare-fun b!100280 () Bool)

(assert (=> b!100280 (= e!65623 (arrayBitRangesEq!0 (buf!2514 (_2!4304 lt!144895)) (buf!2514 (_2!4304 lt!144898)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895)))))))

(assert (= (and d!31430 res!82352) b!100278))

(assert (= (and b!100278 res!82351) b!100279))

(assert (= (and b!100279 (not res!82353)) b!100280))

(assert (=> b!100278 m!145655))

(declare-fun m!145703 () Bool)

(assert (=> b!100278 m!145703))

(assert (=> b!100280 m!145655))

(assert (=> b!100280 m!145655))

(declare-fun m!145705 () Bool)

(assert (=> b!100280 m!145705))

(assert (=> b!100228 d!31430))

(declare-fun b!100293 () Bool)

(declare-fun e!65629 () Bool)

(declare-fun lt!144999 () tuple2!8102)

(declare-fun lt!145000 () tuple2!8098)

(assert (=> b!100293 (= e!65629 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!144999))) (currentByte!4960 (_1!4306 lt!144999)) (currentBit!4955 (_1!4306 lt!144999))) (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145000))) (currentByte!4960 (_2!4304 lt!145000)) (currentBit!4955 (_2!4304 lt!145000)))))))

(declare-fun d!31432 () Bool)

(declare-fun e!65630 () Bool)

(assert (=> d!31432 e!65630))

(declare-fun res!82365 () Bool)

(assert (=> d!31432 (=> (not res!82365) (not e!65630))))

(assert (=> d!31432 (= res!82365 (= (size!2157 (buf!2514 thiss!1305)) (size!2157 (buf!2514 (_2!4304 lt!145000)))))))

(declare-fun choose!16 (BitStream!3788 Bool) tuple2!8098)

(assert (=> d!31432 (= lt!145000 (choose!16 thiss!1305 lt!144890))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!31432 (validate_offset_bit!0 ((_ sign_extend 32) (size!2157 (buf!2514 thiss!1305))) ((_ sign_extend 32) (currentByte!4960 thiss!1305)) ((_ sign_extend 32) (currentBit!4955 thiss!1305)))))

(assert (=> d!31432 (= (appendBit!0 thiss!1305 lt!144890) lt!145000)))

(declare-fun b!100290 () Bool)

(declare-fun res!82364 () Bool)

(assert (=> b!100290 (=> (not res!82364) (not e!65630))))

(declare-fun lt!144997 () (_ BitVec 64))

(declare-fun lt!144998 () (_ BitVec 64))

(assert (=> b!100290 (= res!82364 (= (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145000))) (currentByte!4960 (_2!4304 lt!145000)) (currentBit!4955 (_2!4304 lt!145000))) (bvadd lt!144997 lt!144998)))))

(assert (=> b!100290 (or (not (= (bvand lt!144997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!144998 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!144997 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!144997 lt!144998) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100290 (= lt!144998 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!100290 (= lt!144997 (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)))))

(declare-fun b!100291 () Bool)

(declare-fun res!82362 () Bool)

(assert (=> b!100291 (=> (not res!82362) (not e!65630))))

(assert (=> b!100291 (= res!82362 (isPrefixOf!0 thiss!1305 (_2!4304 lt!145000)))))

(declare-fun b!100292 () Bool)

(assert (=> b!100292 (= e!65630 e!65629)))

(declare-fun res!82363 () Bool)

(assert (=> b!100292 (=> (not res!82363) (not e!65629))))

(assert (=> b!100292 (= res!82363 (and (= (_2!4306 lt!144999) lt!144890) (= (_1!4306 lt!144999) (_2!4304 lt!145000))))))

(assert (=> b!100292 (= lt!144999 (readBitPure!0 (readerFrom!0 (_2!4304 lt!145000) (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305))))))

(assert (= (and d!31432 res!82365) b!100290))

(assert (= (and b!100290 res!82364) b!100291))

(assert (= (and b!100291 res!82362) b!100292))

(assert (= (and b!100292 res!82363) b!100293))

(declare-fun m!145707 () Bool)

(assert (=> b!100291 m!145707))

(declare-fun m!145709 () Bool)

(assert (=> b!100292 m!145709))

(assert (=> b!100292 m!145709))

(declare-fun m!145711 () Bool)

(assert (=> b!100292 m!145711))

(declare-fun m!145713 () Bool)

(assert (=> d!31432 m!145713))

(declare-fun m!145715 () Bool)

(assert (=> d!31432 m!145715))

(declare-fun m!145717 () Bool)

(assert (=> b!100293 m!145717))

(declare-fun m!145719 () Bool)

(assert (=> b!100293 m!145719))

(assert (=> b!100290 m!145719))

(assert (=> b!100290 m!145657))

(assert (=> b!100228 d!31432))

(declare-fun d!31434 () Bool)

(declare-fun res!82367 () Bool)

(declare-fun e!65632 () Bool)

(assert (=> d!31434 (=> (not res!82367) (not e!65632))))

(assert (=> d!31434 (= res!82367 (= (size!2157 (buf!2514 thiss!1305)) (size!2157 (buf!2514 (_2!4304 lt!144898)))))))

(assert (=> d!31434 (= (isPrefixOf!0 thiss!1305 (_2!4304 lt!144898)) e!65632)))

(declare-fun b!100294 () Bool)

(declare-fun res!82366 () Bool)

(assert (=> b!100294 (=> (not res!82366) (not e!65632))))

(assert (=> b!100294 (= res!82366 (bvsle (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)) (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144898))) (currentByte!4960 (_2!4304 lt!144898)) (currentBit!4955 (_2!4304 lt!144898)))))))

(declare-fun b!100295 () Bool)

(declare-fun e!65631 () Bool)

(assert (=> b!100295 (= e!65632 e!65631)))

(declare-fun res!82368 () Bool)

(assert (=> b!100295 (=> res!82368 e!65631)))

(assert (=> b!100295 (= res!82368 (= (size!2157 (buf!2514 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!100296 () Bool)

(assert (=> b!100296 (= e!65631 (arrayBitRangesEq!0 (buf!2514 thiss!1305) (buf!2514 (_2!4304 lt!144898)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305))))))

(assert (= (and d!31434 res!82367) b!100294))

(assert (= (and b!100294 res!82366) b!100295))

(assert (= (and b!100295 (not res!82368)) b!100296))

(assert (=> b!100294 m!145657))

(assert (=> b!100294 m!145703))

(assert (=> b!100296 m!145657))

(assert (=> b!100296 m!145657))

(declare-fun m!145721 () Bool)

(assert (=> b!100296 m!145721))

(assert (=> b!100228 d!31434))

(declare-fun d!31436 () Bool)

(declare-fun e!65633 () Bool)

(assert (=> d!31436 e!65633))

(declare-fun res!82370 () Bool)

(assert (=> d!31436 (=> (not res!82370) (not e!65633))))

(declare-fun lt!145006 () (_ BitVec 64))

(declare-fun lt!145003 () (_ BitVec 64))

(declare-fun lt!145004 () (_ BitVec 64))

(assert (=> d!31436 (= res!82370 (= lt!145006 (bvsub lt!145003 lt!145004)))))

(assert (=> d!31436 (or (= (bvand lt!145003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145004 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145003 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145003 lt!145004) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31436 (= lt!145004 (remainingBits!0 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144891)))) ((_ sign_extend 32) (currentByte!4960 (_1!4306 lt!144891))) ((_ sign_extend 32) (currentBit!4955 (_1!4306 lt!144891)))))))

(declare-fun lt!145005 () (_ BitVec 64))

(declare-fun lt!145002 () (_ BitVec 64))

(assert (=> d!31436 (= lt!145003 (bvmul lt!145005 lt!145002))))

(assert (=> d!31436 (or (= lt!145005 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145002 (bvsdiv (bvmul lt!145005 lt!145002) lt!145005)))))

(assert (=> d!31436 (= lt!145002 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31436 (= lt!145005 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144891)))))))

(assert (=> d!31436 (= lt!145006 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4960 (_1!4306 lt!144891))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4955 (_1!4306 lt!144891)))))))

(assert (=> d!31436 (invariant!0 (currentBit!4955 (_1!4306 lt!144891)) (currentByte!4960 (_1!4306 lt!144891)) (size!2157 (buf!2514 (_1!4306 lt!144891))))))

(assert (=> d!31436 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!144891))) (currentByte!4960 (_1!4306 lt!144891)) (currentBit!4955 (_1!4306 lt!144891))) lt!145006)))

(declare-fun b!100297 () Bool)

(declare-fun res!82369 () Bool)

(assert (=> b!100297 (=> (not res!82369) (not e!65633))))

(assert (=> b!100297 (= res!82369 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145006))))

(declare-fun b!100298 () Bool)

(declare-fun lt!145001 () (_ BitVec 64))

(assert (=> b!100298 (= e!65633 (bvsle lt!145006 (bvmul lt!145001 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100298 (or (= lt!145001 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145001 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145001)))))

(assert (=> b!100298 (= lt!145001 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144891)))))))

(assert (= (and d!31436 res!82370) b!100297))

(assert (= (and b!100297 res!82369) b!100298))

(declare-fun m!145723 () Bool)

(assert (=> d!31436 m!145723))

(declare-fun m!145725 () Bool)

(assert (=> d!31436 m!145725))

(assert (=> b!100228 d!31436))

(declare-fun d!31438 () Bool)

(declare-datatypes ((tuple2!8110 0))(
  ( (tuple2!8111 (_1!4310 Bool) (_2!4310 BitStream!3788)) )
))
(declare-fun lt!145009 () tuple2!8110)

(declare-fun readBit!0 (BitStream!3788) tuple2!8110)

(assert (=> d!31438 (= lt!145009 (readBit!0 (BitStream!3789 (buf!2514 (_2!4304 lt!144898)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305))))))

(assert (=> d!31438 (= (readBitPure!0 (BitStream!3789 (buf!2514 (_2!4304 lt!144898)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305))) (tuple2!8103 (_2!4310 lt!145009) (_1!4310 lt!145009)))))

(declare-fun bs!7711 () Bool)

(assert (= bs!7711 d!31438))

(declare-fun m!145727 () Bool)

(assert (=> bs!7711 m!145727))

(assert (=> b!100228 d!31438))

(declare-fun d!31440 () Bool)

(declare-fun lt!145010 () tuple2!8110)

(assert (=> d!31440 (= lt!145010 (readBit!0 lt!144893))))

(assert (=> d!31440 (= (readBitPure!0 lt!144893) (tuple2!8103 (_2!4310 lt!145010) (_1!4310 lt!145010)))))

(declare-fun bs!7712 () Bool)

(assert (= bs!7712 d!31440))

(declare-fun m!145729 () Bool)

(assert (=> bs!7712 m!145729))

(assert (=> b!100228 d!31440))

(declare-fun d!31442 () Bool)

(declare-fun e!65636 () Bool)

(assert (=> d!31442 e!65636))

(declare-fun res!82373 () Bool)

(assert (=> d!31442 (=> (not res!82373) (not e!65636))))

(declare-fun lt!145019 () tuple2!8102)

(declare-fun lt!145020 () tuple2!8102)

(assert (=> d!31442 (= res!82373 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!145019))) (currentByte!4960 (_1!4306 lt!145019)) (currentBit!4955 (_1!4306 lt!145019))) (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!145020))) (currentByte!4960 (_1!4306 lt!145020)) (currentBit!4955 (_1!4306 lt!145020)))))))

(declare-fun lt!145022 () BitStream!3788)

(declare-fun lt!145021 () Unit!6141)

(declare-fun choose!50 (BitStream!3788 BitStream!3788 BitStream!3788 tuple2!8102 tuple2!8102 BitStream!3788 Bool tuple2!8102 tuple2!8102 BitStream!3788 Bool) Unit!6141)

(assert (=> d!31442 (= lt!145021 (choose!50 lt!144893 (_2!4304 lt!144898) lt!145022 lt!145019 (tuple2!8103 (_1!4306 lt!145019) (_2!4306 lt!145019)) (_1!4306 lt!145019) (_2!4306 lt!145019) lt!145020 (tuple2!8103 (_1!4306 lt!145020) (_2!4306 lt!145020)) (_1!4306 lt!145020) (_2!4306 lt!145020)))))

(assert (=> d!31442 (= lt!145020 (readBitPure!0 lt!145022))))

(assert (=> d!31442 (= lt!145019 (readBitPure!0 lt!144893))))

(assert (=> d!31442 (= lt!145022 (BitStream!3789 (buf!2514 (_2!4304 lt!144898)) (currentByte!4960 lt!144893) (currentBit!4955 lt!144893)))))

(assert (=> d!31442 (invariant!0 (currentBit!4955 lt!144893) (currentByte!4960 lt!144893) (size!2157 (buf!2514 (_2!4304 lt!144898))))))

(assert (=> d!31442 (= (readBitPrefixLemma!0 lt!144893 (_2!4304 lt!144898)) lt!145021)))

(declare-fun b!100301 () Bool)

(assert (=> b!100301 (= e!65636 (= (_2!4306 lt!145019) (_2!4306 lt!145020)))))

(assert (= (and d!31442 res!82373) b!100301))

(assert (=> d!31442 m!145637))

(declare-fun m!145731 () Bool)

(assert (=> d!31442 m!145731))

(declare-fun m!145733 () Bool)

(assert (=> d!31442 m!145733))

(declare-fun m!145735 () Bool)

(assert (=> d!31442 m!145735))

(declare-fun m!145737 () Bool)

(assert (=> d!31442 m!145737))

(declare-fun m!145739 () Bool)

(assert (=> d!31442 m!145739))

(assert (=> b!100228 d!31442))

(declare-fun b!100312 () Bool)

(declare-fun res!82381 () Bool)

(declare-fun e!65641 () Bool)

(assert (=> b!100312 (=> (not res!82381) (not e!65641))))

(declare-fun lt!145067 () tuple2!8100)

(assert (=> b!100312 (= res!82381 (isPrefixOf!0 (_2!4305 lt!145067) (_2!4304 lt!144898)))))

(declare-fun d!31444 () Bool)

(assert (=> d!31444 e!65641))

(declare-fun res!82380 () Bool)

(assert (=> d!31444 (=> (not res!82380) (not e!65641))))

(assert (=> d!31444 (= res!82380 (isPrefixOf!0 (_1!4305 lt!145067) (_2!4305 lt!145067)))))

(declare-fun lt!145079 () BitStream!3788)

(assert (=> d!31444 (= lt!145067 (tuple2!8101 lt!145079 (_2!4304 lt!144898)))))

(declare-fun lt!145068 () Unit!6141)

(declare-fun lt!145080 () Unit!6141)

(assert (=> d!31444 (= lt!145068 lt!145080)))

(assert (=> d!31444 (isPrefixOf!0 lt!145079 (_2!4304 lt!144898))))

(assert (=> d!31444 (= lt!145080 (lemmaIsPrefixTransitive!0 lt!145079 (_2!4304 lt!144898) (_2!4304 lt!144898)))))

(declare-fun lt!145077 () Unit!6141)

(declare-fun lt!145064 () Unit!6141)

(assert (=> d!31444 (= lt!145077 lt!145064)))

(assert (=> d!31444 (isPrefixOf!0 lt!145079 (_2!4304 lt!144898))))

(assert (=> d!31444 (= lt!145064 (lemmaIsPrefixTransitive!0 lt!145079 thiss!1305 (_2!4304 lt!144898)))))

(declare-fun lt!145073 () Unit!6141)

(declare-fun e!65642 () Unit!6141)

(assert (=> d!31444 (= lt!145073 e!65642)))

(declare-fun c!6272 () Bool)

(assert (=> d!31444 (= c!6272 (not (= (size!2157 (buf!2514 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!145063 () Unit!6141)

(declare-fun lt!145072 () Unit!6141)

(assert (=> d!31444 (= lt!145063 lt!145072)))

(assert (=> d!31444 (isPrefixOf!0 (_2!4304 lt!144898) (_2!4304 lt!144898))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3788) Unit!6141)

(assert (=> d!31444 (= lt!145072 (lemmaIsPrefixRefl!0 (_2!4304 lt!144898)))))

(declare-fun lt!145070 () Unit!6141)

(declare-fun lt!145076 () Unit!6141)

(assert (=> d!31444 (= lt!145070 lt!145076)))

(assert (=> d!31444 (= lt!145076 (lemmaIsPrefixRefl!0 (_2!4304 lt!144898)))))

(declare-fun lt!145066 () Unit!6141)

(declare-fun lt!145069 () Unit!6141)

(assert (=> d!31444 (= lt!145066 lt!145069)))

(assert (=> d!31444 (isPrefixOf!0 lt!145079 lt!145079)))

(assert (=> d!31444 (= lt!145069 (lemmaIsPrefixRefl!0 lt!145079))))

(declare-fun lt!145065 () Unit!6141)

(declare-fun lt!145078 () Unit!6141)

(assert (=> d!31444 (= lt!145065 lt!145078)))

(assert (=> d!31444 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!31444 (= lt!145078 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!31444 (= lt!145079 (BitStream!3789 (buf!2514 (_2!4304 lt!144898)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)))))

(assert (=> d!31444 (isPrefixOf!0 thiss!1305 (_2!4304 lt!144898))))

(assert (=> d!31444 (= (reader!0 thiss!1305 (_2!4304 lt!144898)) lt!145067)))

(declare-fun b!100313 () Bool)

(declare-fun res!82382 () Bool)

(assert (=> b!100313 (=> (not res!82382) (not e!65641))))

(assert (=> b!100313 (= res!82382 (isPrefixOf!0 (_1!4305 lt!145067) thiss!1305))))

(declare-fun b!100314 () Bool)

(declare-fun lt!145075 () (_ BitVec 64))

(declare-fun lt!145074 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3788 (_ BitVec 64)) BitStream!3788)

(assert (=> b!100314 (= e!65641 (= (_1!4305 lt!145067) (withMovedBitIndex!0 (_2!4305 lt!145067) (bvsub lt!145075 lt!145074))))))

(assert (=> b!100314 (or (= (bvand lt!145075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145074 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145075 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145075 lt!145074) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100314 (= lt!145074 (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144898))) (currentByte!4960 (_2!4304 lt!144898)) (currentBit!4955 (_2!4304 lt!144898))))))

(assert (=> b!100314 (= lt!145075 (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)))))

(declare-fun b!100315 () Bool)

(declare-fun Unit!6156 () Unit!6141)

(assert (=> b!100315 (= e!65642 Unit!6156)))

(declare-fun b!100316 () Bool)

(declare-fun lt!145081 () Unit!6141)

(assert (=> b!100316 (= e!65642 lt!145081)))

(declare-fun lt!145082 () (_ BitVec 64))

(assert (=> b!100316 (= lt!145082 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!145071 () (_ BitVec 64))

(assert (=> b!100316 (= lt!145071 (bitIndex!0 (size!2157 (buf!2514 thiss!1305)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4723 array!4723 (_ BitVec 64) (_ BitVec 64)) Unit!6141)

(assert (=> b!100316 (= lt!145081 (arrayBitRangesEqSymmetric!0 (buf!2514 thiss!1305) (buf!2514 (_2!4304 lt!144898)) lt!145082 lt!145071))))

(assert (=> b!100316 (arrayBitRangesEq!0 (buf!2514 (_2!4304 lt!144898)) (buf!2514 thiss!1305) lt!145082 lt!145071)))

(assert (= (and d!31444 c!6272) b!100316))

(assert (= (and d!31444 (not c!6272)) b!100315))

(assert (= (and d!31444 res!82380) b!100313))

(assert (= (and b!100313 res!82382) b!100312))

(assert (= (and b!100312 res!82381) b!100314))

(declare-fun m!145741 () Bool)

(assert (=> b!100314 m!145741))

(assert (=> b!100314 m!145703))

(assert (=> b!100314 m!145657))

(declare-fun m!145743 () Bool)

(assert (=> b!100312 m!145743))

(declare-fun m!145745 () Bool)

(assert (=> b!100313 m!145745))

(declare-fun m!145747 () Bool)

(assert (=> d!31444 m!145747))

(declare-fun m!145749 () Bool)

(assert (=> d!31444 m!145749))

(declare-fun m!145751 () Bool)

(assert (=> d!31444 m!145751))

(declare-fun m!145753 () Bool)

(assert (=> d!31444 m!145753))

(declare-fun m!145755 () Bool)

(assert (=> d!31444 m!145755))

(declare-fun m!145757 () Bool)

(assert (=> d!31444 m!145757))

(declare-fun m!145759 () Bool)

(assert (=> d!31444 m!145759))

(declare-fun m!145761 () Bool)

(assert (=> d!31444 m!145761))

(assert (=> d!31444 m!145639))

(declare-fun m!145763 () Bool)

(assert (=> d!31444 m!145763))

(declare-fun m!145765 () Bool)

(assert (=> d!31444 m!145765))

(assert (=> b!100316 m!145657))

(declare-fun m!145767 () Bool)

(assert (=> b!100316 m!145767))

(declare-fun m!145769 () Bool)

(assert (=> b!100316 m!145769))

(assert (=> b!100228 d!31444))

(declare-fun b!100484 () Bool)

(declare-fun e!65736 () (_ BitVec 64))

(assert (=> b!100484 (= e!65736 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!100485 () Bool)

(declare-fun res!82517 () Bool)

(declare-fun lt!145567 () tuple2!8098)

(assert (=> b!100485 (= res!82517 (isPrefixOf!0 (_2!4304 lt!144895) (_2!4304 lt!145567)))))

(declare-fun e!65738 () Bool)

(assert (=> b!100485 (=> (not res!82517) (not e!65738))))

(declare-fun e!65737 () Bool)

(declare-fun b!100486 () Bool)

(declare-fun lt!145575 () tuple2!8100)

(declare-datatypes ((tuple2!8114 0))(
  ( (tuple2!8115 (_1!4312 BitStream!3788) (_2!4312 (_ BitVec 64))) )
))
(declare-fun lt!145597 () tuple2!8114)

(assert (=> b!100486 (= e!65737 (and (= (_2!4312 lt!145597) v!199) (= (_1!4312 lt!145597) (_2!4305 lt!145575))))))

(declare-fun lt!145592 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8114)

(assert (=> b!100486 (= lt!145597 (readNLeastSignificantBitsLoopPure!0 (_1!4305 lt!145575) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145592))))

(declare-fun lt!145595 () Unit!6141)

(declare-fun lt!145589 () Unit!6141)

(assert (=> b!100486 (= lt!145595 lt!145589)))

(declare-fun lt!145569 () tuple2!8098)

(declare-fun lt!145584 () (_ BitVec 64))

(assert (=> b!100486 (validate_offset_bits!1 ((_ sign_extend 32) (size!2157 (buf!2514 (_2!4304 lt!145569)))) ((_ sign_extend 32) (currentByte!4960 (_2!4304 lt!144895))) ((_ sign_extend 32) (currentBit!4955 (_2!4304 lt!144895))) lt!145584)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3788 array!4723 (_ BitVec 64)) Unit!6141)

(assert (=> b!100486 (= lt!145589 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4304 lt!144895) (buf!2514 (_2!4304 lt!145569)) lt!145584))))

(declare-fun e!65734 () Bool)

(assert (=> b!100486 e!65734))

(declare-fun res!82516 () Bool)

(assert (=> b!100486 (=> (not res!82516) (not e!65734))))

(assert (=> b!100486 (= res!82516 (and (= (size!2157 (buf!2514 (_2!4304 lt!144895))) (size!2157 (buf!2514 (_2!4304 lt!145569)))) (bvsge lt!145584 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100486 (= lt!145584 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100486 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100486 (= lt!145592 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!100486 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100486 (= lt!145575 (reader!0 (_2!4304 lt!144895) (_2!4304 lt!145569)))))

(declare-fun b!100487 () Bool)

(assert (=> b!100487 (= e!65734 (validate_offset_bits!1 ((_ sign_extend 32) (size!2157 (buf!2514 (_2!4304 lt!144895)))) ((_ sign_extend 32) (currentByte!4960 (_2!4304 lt!144895))) ((_ sign_extend 32) (currentBit!4955 (_2!4304 lt!144895))) lt!145584))))

(declare-fun b!100488 () Bool)

(declare-fun res!82512 () Bool)

(assert (=> b!100488 (=> (not res!82512) (not e!65737))))

(declare-fun lt!145580 () (_ BitVec 64))

(declare-fun lt!145573 () (_ BitVec 64))

(assert (=> b!100488 (= res!82512 (= (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145569))) (currentByte!4960 (_2!4304 lt!145569)) (currentBit!4955 (_2!4304 lt!145569))) (bvadd lt!145573 lt!145580)))))

(assert (=> b!100488 (or (not (= (bvand lt!145573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145580 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!145573 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!145573 lt!145580) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100488 (= lt!145580 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!100488 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!100488 (= lt!145573 (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))))))

(declare-fun b!100489 () Bool)

(declare-fun res!82519 () Bool)

(assert (=> b!100489 (=> (not res!82519) (not e!65737))))

(assert (=> b!100489 (= res!82519 (isPrefixOf!0 (_2!4304 lt!144895) (_2!4304 lt!145569)))))

(declare-fun b!100490 () Bool)

(declare-fun e!65739 () tuple2!8098)

(declare-fun lt!145598 () tuple2!8098)

(declare-fun Unit!6158 () Unit!6141)

(assert (=> b!100490 (= e!65739 (tuple2!8099 Unit!6158 (_2!4304 lt!145598)))))

(declare-fun lt!145601 () Bool)

(assert (=> b!100490 (= lt!145601 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!100490 (= lt!145567 (appendBit!0 (_2!4304 lt!144895) lt!145601))))

(declare-fun res!82515 () Bool)

(assert (=> b!100490 (= res!82515 (= (size!2157 (buf!2514 (_2!4304 lt!144895))) (size!2157 (buf!2514 (_2!4304 lt!145567)))))))

(assert (=> b!100490 (=> (not res!82515) (not e!65738))))

(assert (=> b!100490 e!65738))

(declare-fun lt!145582 () tuple2!8098)

(assert (=> b!100490 (= lt!145582 lt!145567)))

(assert (=> b!100490 (= lt!145598 (appendNLeastSignificantBitsLoop!0 (_2!4304 lt!145582) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!145557 () Unit!6141)

(assert (=> b!100490 (= lt!145557 (lemmaIsPrefixTransitive!0 (_2!4304 lt!144895) (_2!4304 lt!145582) (_2!4304 lt!145598)))))

(declare-fun call!1255 () Bool)

(assert (=> b!100490 call!1255))

(declare-fun lt!145593 () Unit!6141)

(assert (=> b!100490 (= lt!145593 lt!145557)))

(assert (=> b!100490 (invariant!0 (currentBit!4955 (_2!4304 lt!144895)) (currentByte!4960 (_2!4304 lt!144895)) (size!2157 (buf!2514 (_2!4304 lt!145582))))))

(declare-fun lt!145578 () BitStream!3788)

(assert (=> b!100490 (= lt!145578 (BitStream!3789 (buf!2514 (_2!4304 lt!145582)) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))))))

(assert (=> b!100490 (invariant!0 (currentBit!4955 lt!145578) (currentByte!4960 lt!145578) (size!2157 (buf!2514 (_2!4304 lt!145598))))))

(declare-fun lt!145572 () BitStream!3788)

(assert (=> b!100490 (= lt!145572 (BitStream!3789 (buf!2514 (_2!4304 lt!145598)) (currentByte!4960 lt!145578) (currentBit!4955 lt!145578)))))

(declare-fun lt!145563 () tuple2!8102)

(assert (=> b!100490 (= lt!145563 (readBitPure!0 lt!145578))))

(declare-fun lt!145587 () tuple2!8102)

(assert (=> b!100490 (= lt!145587 (readBitPure!0 lt!145572))))

(declare-fun lt!145588 () Unit!6141)

(assert (=> b!100490 (= lt!145588 (readBitPrefixLemma!0 lt!145578 (_2!4304 lt!145598)))))

(declare-fun res!82511 () Bool)

(assert (=> b!100490 (= res!82511 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!145563))) (currentByte!4960 (_1!4306 lt!145563)) (currentBit!4955 (_1!4306 lt!145563))) (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!145587))) (currentByte!4960 (_1!4306 lt!145587)) (currentBit!4955 (_1!4306 lt!145587)))))))

(declare-fun e!65735 () Bool)

(assert (=> b!100490 (=> (not res!82511) (not e!65735))))

(assert (=> b!100490 e!65735))

(declare-fun lt!145571 () Unit!6141)

(assert (=> b!100490 (= lt!145571 lt!145588)))

(declare-fun lt!145581 () tuple2!8100)

(assert (=> b!100490 (= lt!145581 (reader!0 (_2!4304 lt!144895) (_2!4304 lt!145598)))))

(declare-fun lt!145594 () tuple2!8100)

(assert (=> b!100490 (= lt!145594 (reader!0 (_2!4304 lt!145582) (_2!4304 lt!145598)))))

(declare-fun lt!145561 () tuple2!8102)

(assert (=> b!100490 (= lt!145561 (readBitPure!0 (_1!4305 lt!145581)))))

(assert (=> b!100490 (= (_2!4306 lt!145561) lt!145601)))

(declare-fun lt!145585 () Unit!6141)

(declare-fun Unit!6159 () Unit!6141)

(assert (=> b!100490 (= lt!145585 Unit!6159)))

(declare-fun lt!145558 () (_ BitVec 64))

(assert (=> b!100490 (= lt!145558 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!145577 () (_ BitVec 64))

(assert (=> b!100490 (= lt!145577 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!145599 () Unit!6141)

(assert (=> b!100490 (= lt!145599 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4304 lt!144895) (buf!2514 (_2!4304 lt!145598)) lt!145577))))

(assert (=> b!100490 (validate_offset_bits!1 ((_ sign_extend 32) (size!2157 (buf!2514 (_2!4304 lt!145598)))) ((_ sign_extend 32) (currentByte!4960 (_2!4304 lt!144895))) ((_ sign_extend 32) (currentBit!4955 (_2!4304 lt!144895))) lt!145577)))

(declare-fun lt!145565 () Unit!6141)

(assert (=> b!100490 (= lt!145565 lt!145599)))

(declare-fun lt!145596 () tuple2!8114)

(assert (=> b!100490 (= lt!145596 (readNLeastSignificantBitsLoopPure!0 (_1!4305 lt!145581) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145558))))

(declare-fun lt!145579 () (_ BitVec 64))

(assert (=> b!100490 (= lt!145579 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!145586 () Unit!6141)

(assert (=> b!100490 (= lt!145586 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4304 lt!145582) (buf!2514 (_2!4304 lt!145598)) lt!145579))))

(assert (=> b!100490 (validate_offset_bits!1 ((_ sign_extend 32) (size!2157 (buf!2514 (_2!4304 lt!145598)))) ((_ sign_extend 32) (currentByte!4960 (_2!4304 lt!145582))) ((_ sign_extend 32) (currentBit!4955 (_2!4304 lt!145582))) lt!145579)))

(declare-fun lt!145564 () Unit!6141)

(assert (=> b!100490 (= lt!145564 lt!145586)))

(declare-fun lt!145574 () tuple2!8114)

(assert (=> b!100490 (= lt!145574 (readNLeastSignificantBitsLoopPure!0 (_1!4305 lt!145594) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!145558 (ite (_2!4306 lt!145561) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!145600 () tuple2!8114)

(assert (=> b!100490 (= lt!145600 (readNLeastSignificantBitsLoopPure!0 (_1!4305 lt!145581) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145558))))

(declare-fun c!6293 () Bool)

(assert (=> b!100490 (= c!6293 (_2!4306 (readBitPure!0 (_1!4305 lt!145581))))))

(declare-fun lt!145566 () tuple2!8114)

(assert (=> b!100490 (= lt!145566 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4305 lt!145581) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!145558 e!65736)))))

(declare-fun lt!145559 () Unit!6141)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6141)

(assert (=> b!100490 (= lt!145559 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4305 lt!145581) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!145558))))

(assert (=> b!100490 (and (= (_2!4312 lt!145600) (_2!4312 lt!145566)) (= (_1!4312 lt!145600) (_1!4312 lt!145566)))))

(declare-fun lt!145590 () Unit!6141)

(assert (=> b!100490 (= lt!145590 lt!145559)))

(assert (=> b!100490 (= (_1!4305 lt!145581) (withMovedBitIndex!0 (_2!4305 lt!145581) (bvsub (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))) (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145598))) (currentByte!4960 (_2!4304 lt!145598)) (currentBit!4955 (_2!4304 lt!145598))))))))

(declare-fun lt!145560 () Unit!6141)

(declare-fun Unit!6160 () Unit!6141)

(assert (=> b!100490 (= lt!145560 Unit!6160)))

(assert (=> b!100490 (= (_1!4305 lt!145594) (withMovedBitIndex!0 (_2!4305 lt!145594) (bvsub (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145582))) (currentByte!4960 (_2!4304 lt!145582)) (currentBit!4955 (_2!4304 lt!145582))) (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145598))) (currentByte!4960 (_2!4304 lt!145598)) (currentBit!4955 (_2!4304 lt!145598))))))))

(declare-fun lt!145591 () Unit!6141)

(declare-fun Unit!6161 () Unit!6141)

(assert (=> b!100490 (= lt!145591 Unit!6161)))

(assert (=> b!100490 (= (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))) (bvsub (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145582))) (currentByte!4960 (_2!4304 lt!145582)) (currentBit!4955 (_2!4304 lt!145582))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!145562 () Unit!6141)

(declare-fun Unit!6162 () Unit!6141)

(assert (=> b!100490 (= lt!145562 Unit!6162)))

(assert (=> b!100490 (= (_2!4312 lt!145596) (_2!4312 lt!145574))))

(declare-fun lt!145568 () Unit!6141)

(declare-fun Unit!6163 () Unit!6141)

(assert (=> b!100490 (= lt!145568 Unit!6163)))

(assert (=> b!100490 (= (_1!4312 lt!145596) (_2!4305 lt!145581))))

(declare-fun d!31446 () Bool)

(assert (=> d!31446 e!65737))

(declare-fun res!82518 () Bool)

(assert (=> d!31446 (=> (not res!82518) (not e!65737))))

(assert (=> d!31446 (= res!82518 (= (size!2157 (buf!2514 (_2!4304 lt!144895))) (size!2157 (buf!2514 (_2!4304 lt!145569)))))))

(assert (=> d!31446 (= lt!145569 e!65739)))

(declare-fun c!6292 () Bool)

(assert (=> d!31446 (= c!6292 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!31446 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!31446 (= (appendNLeastSignificantBitsLoop!0 (_2!4304 lt!144895) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!145569)))

(declare-fun b!100491 () Bool)

(declare-fun res!82513 () Bool)

(assert (=> b!100491 (= res!82513 (= (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145567))) (currentByte!4960 (_2!4304 lt!145567)) (currentBit!4955 (_2!4304 lt!145567))) (bvadd (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!144895))) (currentByte!4960 (_2!4304 lt!144895)) (currentBit!4955 (_2!4304 lt!144895))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!100491 (=> (not res!82513) (not e!65738))))

(declare-fun b!100492 () Bool)

(declare-fun lt!145570 () Unit!6141)

(assert (=> b!100492 (= e!65739 (tuple2!8099 lt!145570 (_2!4304 lt!144895)))))

(declare-fun lt!145576 () BitStream!3788)

(assert (=> b!100492 (= lt!145576 (_2!4304 lt!144895))))

(assert (=> b!100492 (= lt!145570 (lemmaIsPrefixRefl!0 lt!145576))))

(assert (=> b!100492 call!1255))

(declare-fun bm!1252 () Bool)

(assert (=> bm!1252 (= call!1255 (isPrefixOf!0 (ite c!6292 (_2!4304 lt!144895) lt!145576) (ite c!6292 (_2!4304 lt!145598) lt!145576)))))

(declare-fun b!100493 () Bool)

(assert (=> b!100493 (= e!65735 (= (_2!4306 lt!145563) (_2!4306 lt!145587)))))

(declare-fun b!100494 () Bool)

(declare-fun lt!145583 () tuple2!8102)

(assert (=> b!100494 (= lt!145583 (readBitPure!0 (readerFrom!0 (_2!4304 lt!145567) (currentBit!4955 (_2!4304 lt!144895)) (currentByte!4960 (_2!4304 lt!144895)))))))

(declare-fun res!82514 () Bool)

(assert (=> b!100494 (= res!82514 (and (= (_2!4306 lt!145583) lt!145601) (= (_1!4306 lt!145583) (_2!4304 lt!145567))))))

(declare-fun e!65740 () Bool)

(assert (=> b!100494 (=> (not res!82514) (not e!65740))))

(assert (=> b!100494 (= e!65738 e!65740)))

(declare-fun b!100495 () Bool)

(assert (=> b!100495 (= e!65736 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!100496 () Bool)

(assert (=> b!100496 (= e!65740 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!145583))) (currentByte!4960 (_1!4306 lt!145583)) (currentBit!4955 (_1!4306 lt!145583))) (bitIndex!0 (size!2157 (buf!2514 (_2!4304 lt!145567))) (currentByte!4960 (_2!4304 lt!145567)) (currentBit!4955 (_2!4304 lt!145567)))))))

(assert (= (and d!31446 c!6292) b!100490))

(assert (= (and d!31446 (not c!6292)) b!100492))

(assert (= (and b!100490 res!82515) b!100491))

(assert (= (and b!100491 res!82513) b!100485))

(assert (= (and b!100485 res!82517) b!100494))

(assert (= (and b!100494 res!82514) b!100496))

(assert (= (and b!100490 res!82511) b!100493))

(assert (= (and b!100490 c!6293) b!100484))

(assert (= (and b!100490 (not c!6293)) b!100495))

(assert (= (or b!100490 b!100492) bm!1252))

(assert (= (and d!31446 res!82518) b!100488))

(assert (= (and b!100488 res!82512) b!100489))

(assert (= (and b!100489 res!82519) b!100486))

(assert (= (and b!100486 res!82516) b!100487))

(declare-fun m!146021 () Bool)

(assert (=> b!100486 m!146021))

(declare-fun m!146023 () Bool)

(assert (=> b!100486 m!146023))

(declare-fun m!146025 () Bool)

(assert (=> b!100486 m!146025))

(declare-fun m!146027 () Bool)

(assert (=> b!100486 m!146027))

(declare-fun m!146029 () Bool)

(assert (=> b!100486 m!146029))

(declare-fun m!146031 () Bool)

(assert (=> b!100490 m!146031))

(declare-fun m!146033 () Bool)

(assert (=> b!100490 m!146033))

(declare-fun m!146035 () Bool)

(assert (=> b!100490 m!146035))

(assert (=> b!100490 m!145655))

(declare-fun m!146037 () Bool)

(assert (=> b!100490 m!146037))

(assert (=> b!100490 m!146025))

(declare-fun m!146039 () Bool)

(assert (=> b!100490 m!146039))

(declare-fun m!146041 () Bool)

(assert (=> b!100490 m!146041))

(declare-fun m!146043 () Bool)

(assert (=> b!100490 m!146043))

(declare-fun m!146045 () Bool)

(assert (=> b!100490 m!146045))

(declare-fun m!146047 () Bool)

(assert (=> b!100490 m!146047))

(declare-fun m!146049 () Bool)

(assert (=> b!100490 m!146049))

(declare-fun m!146051 () Bool)

(assert (=> b!100490 m!146051))

(declare-fun m!146053 () Bool)

(assert (=> b!100490 m!146053))

(declare-fun m!146055 () Bool)

(assert (=> b!100490 m!146055))

(declare-fun m!146057 () Bool)

(assert (=> b!100490 m!146057))

(assert (=> b!100490 m!146037))

(declare-fun m!146059 () Bool)

(assert (=> b!100490 m!146059))

(declare-fun m!146061 () Bool)

(assert (=> b!100490 m!146061))

(declare-fun m!146063 () Bool)

(assert (=> b!100490 m!146063))

(declare-fun m!146065 () Bool)

(assert (=> b!100490 m!146065))

(declare-fun m!146067 () Bool)

(assert (=> b!100490 m!146067))

(declare-fun m!146069 () Bool)

(assert (=> b!100490 m!146069))

(declare-fun m!146071 () Bool)

(assert (=> b!100490 m!146071))

(declare-fun m!146073 () Bool)

(assert (=> b!100490 m!146073))

(declare-fun m!146075 () Bool)

(assert (=> b!100490 m!146075))

(declare-fun m!146077 () Bool)

(assert (=> b!100490 m!146077))

(declare-fun m!146079 () Bool)

(assert (=> b!100490 m!146079))

(declare-fun m!146081 () Bool)

(assert (=> b!100490 m!146081))

(declare-fun m!146083 () Bool)

(assert (=> b!100487 m!146083))

(declare-fun m!146085 () Bool)

(assert (=> b!100488 m!146085))

(assert (=> b!100488 m!145655))

(declare-fun m!146089 () Bool)

(assert (=> b!100492 m!146089))

(declare-fun m!146091 () Bool)

(assert (=> b!100489 m!146091))

(declare-fun m!146095 () Bool)

(assert (=> bm!1252 m!146095))

(declare-fun m!146099 () Bool)

(assert (=> b!100494 m!146099))

(assert (=> b!100494 m!146099))

(declare-fun m!146105 () Bool)

(assert (=> b!100494 m!146105))

(declare-fun m!146109 () Bool)

(assert (=> b!100491 m!146109))

(assert (=> b!100491 m!145655))

(declare-fun m!146113 () Bool)

(assert (=> b!100496 m!146113))

(assert (=> b!100496 m!146109))

(declare-fun m!146115 () Bool)

(assert (=> b!100485 m!146115))

(assert (=> b!100228 d!31446))

(declare-fun d!31480 () Bool)

(assert (=> d!31480 (isPrefixOf!0 thiss!1305 (_2!4304 lt!144898))))

(declare-fun lt!145630 () Unit!6141)

(declare-fun choose!30 (BitStream!3788 BitStream!3788 BitStream!3788) Unit!6141)

(assert (=> d!31480 (= lt!145630 (choose!30 thiss!1305 (_2!4304 lt!144895) (_2!4304 lt!144898)))))

(assert (=> d!31480 (isPrefixOf!0 thiss!1305 (_2!4304 lt!144895))))

(assert (=> d!31480 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4304 lt!144895) (_2!4304 lt!144898)) lt!145630)))

(declare-fun bs!7717 () Bool)

(assert (= bs!7717 d!31480))

(assert (=> bs!7717 m!145639))

(declare-fun m!146131 () Bool)

(assert (=> bs!7717 m!146131))

(assert (=> bs!7717 m!145619))

(assert (=> b!100228 d!31480))

(declare-fun d!31494 () Bool)

(declare-fun e!65751 () Bool)

(assert (=> d!31494 e!65751))

(declare-fun res!82541 () Bool)

(assert (=> d!31494 (=> (not res!82541) (not e!65751))))

(declare-fun lt!145634 () (_ BitVec 64))

(declare-fun lt!145633 () (_ BitVec 64))

(declare-fun lt!145636 () (_ BitVec 64))

(assert (=> d!31494 (= res!82541 (= lt!145636 (bvsub lt!145633 lt!145634)))))

(assert (=> d!31494 (or (= (bvand lt!145633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!145634 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!145633 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!145633 lt!145634) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!31494 (= lt!145634 (remainingBits!0 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144894)))) ((_ sign_extend 32) (currentByte!4960 (_1!4306 lt!144894))) ((_ sign_extend 32) (currentBit!4955 (_1!4306 lt!144894)))))))

(declare-fun lt!145635 () (_ BitVec 64))

(declare-fun lt!145632 () (_ BitVec 64))

(assert (=> d!31494 (= lt!145633 (bvmul lt!145635 lt!145632))))

(assert (=> d!31494 (or (= lt!145635 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!145632 (bvsdiv (bvmul lt!145635 lt!145632) lt!145635)))))

(assert (=> d!31494 (= lt!145632 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!31494 (= lt!145635 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144894)))))))

(assert (=> d!31494 (= lt!145636 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4960 (_1!4306 lt!144894))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4955 (_1!4306 lt!144894)))))))

(assert (=> d!31494 (invariant!0 (currentBit!4955 (_1!4306 lt!144894)) (currentByte!4960 (_1!4306 lt!144894)) (size!2157 (buf!2514 (_1!4306 lt!144894))))))

(assert (=> d!31494 (= (bitIndex!0 (size!2157 (buf!2514 (_1!4306 lt!144894))) (currentByte!4960 (_1!4306 lt!144894)) (currentBit!4955 (_1!4306 lt!144894))) lt!145636)))

(declare-fun b!100517 () Bool)

(declare-fun res!82540 () Bool)

(assert (=> b!100517 (=> (not res!82540) (not e!65751))))

(assert (=> b!100517 (= res!82540 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!145636))))

(declare-fun b!100518 () Bool)

(declare-fun lt!145631 () (_ BitVec 64))

(assert (=> b!100518 (= e!65751 (bvsle lt!145636 (bvmul lt!145631 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!100518 (or (= lt!145631 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!145631 #b0000000000000000000000000000000000000000000000000000000000001000) lt!145631)))))

(assert (=> b!100518 (= lt!145631 ((_ sign_extend 32) (size!2157 (buf!2514 (_1!4306 lt!144894)))))))

(assert (= (and d!31494 res!82541) b!100517))

(assert (= (and b!100517 res!82540) b!100518))

(declare-fun m!146133 () Bool)

(assert (=> d!31494 m!146133))

(declare-fun m!146135 () Bool)

(assert (=> d!31494 m!146135))

(assert (=> b!100228 d!31494))

(declare-fun d!31496 () Bool)

(assert (=> d!31496 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!100237 d!31496))

(declare-fun d!31498 () Bool)

(declare-fun lt!145637 () tuple2!8110)

(assert (=> d!31498 (= lt!145637 (readBit!0 (readerFrom!0 (_2!4304 lt!144895) (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305))))))

(assert (=> d!31498 (= (readBitPure!0 (readerFrom!0 (_2!4304 lt!144895) (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305))) (tuple2!8103 (_2!4310 lt!145637) (_1!4310 lt!145637)))))

(declare-fun bs!7718 () Bool)

(assert (= bs!7718 d!31498))

(assert (=> bs!7718 m!145651))

(declare-fun m!146137 () Bool)

(assert (=> bs!7718 m!146137))

(assert (=> b!100238 d!31498))

(declare-fun d!31500 () Bool)

(declare-fun e!65757 () Bool)

(assert (=> d!31500 e!65757))

(declare-fun res!82548 () Bool)

(assert (=> d!31500 (=> (not res!82548) (not e!65757))))

(assert (=> d!31500 (= res!82548 (invariant!0 (currentBit!4955 (_2!4304 lt!144895)) (currentByte!4960 (_2!4304 lt!144895)) (size!2157 (buf!2514 (_2!4304 lt!144895)))))))

(assert (=> d!31500 (= (readerFrom!0 (_2!4304 lt!144895) (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305)) (BitStream!3789 (buf!2514 (_2!4304 lt!144895)) (currentByte!4960 thiss!1305) (currentBit!4955 thiss!1305)))))

(declare-fun b!100524 () Bool)

(assert (=> b!100524 (= e!65757 (invariant!0 (currentBit!4955 thiss!1305) (currentByte!4960 thiss!1305) (size!2157 (buf!2514 (_2!4304 lt!144895)))))))

(assert (= (and d!31500 res!82548) b!100524))

(assert (=> d!31500 m!145695))

(assert (=> b!100524 m!145659))

(assert (=> b!100238 d!31500))

(push 1)

