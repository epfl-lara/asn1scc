; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13010 () Bool)

(assert start!13010)

(declare-fun lt!106200 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!43829 () Bool)

(declare-fun lt!106211 () (_ BitVec 64))

(declare-fun b!66792 () Bool)

(assert (=> b!66792 (= e!43829 (or (= lt!106200 (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!106200 (bvand lt!106211 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!106203 () (_ BitVec 64))

(assert (=> b!66792 (= lt!106200 (bvand lt!106203 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!66793 () Bool)

(declare-fun e!43830 () Bool)

(declare-fun e!43823 () Bool)

(assert (=> b!66793 (= e!43830 e!43823)))

(declare-fun res!55349 () Bool)

(assert (=> b!66793 (=> res!55349 e!43823)))

(declare-datatypes ((array!2859 0))(
  ( (array!2860 (arr!1887 (Array (_ BitVec 32) (_ BitVec 8))) (size!1320 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2268 0))(
  ( (BitStream!2269 (buf!1701 array!2859) (currentByte!3379 (_ BitVec 32)) (currentBit!3374 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!5896 0))(
  ( (tuple2!5897 (_1!3059 BitStream!2268) (_2!3059 BitStream!2268)) )
))
(declare-fun lt!106213 () tuple2!5896)

(declare-fun lt!106201 () Bool)

(declare-fun lt!106205 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2859 (_ BitVec 64)) Bool)

(assert (=> b!66793 (= res!55349 (not (= lt!106201 (bitAt!0 (buf!1701 (_1!3059 lt!106213)) lt!106205))))))

(declare-fun lt!106204 () tuple2!5896)

(assert (=> b!66793 (= lt!106201 (bitAt!0 (buf!1701 (_1!3059 lt!106204)) lt!106205))))

(declare-fun b!66794 () Bool)

(declare-fun res!55338 () Bool)

(declare-fun e!43825 () Bool)

(assert (=> b!66794 (=> res!55338 e!43825)))

(declare-datatypes ((Unit!4501 0))(
  ( (Unit!4502) )
))
(declare-datatypes ((tuple2!5898 0))(
  ( (tuple2!5899 (_1!3060 Unit!4501) (_2!3060 BitStream!2268)) )
))
(declare-fun lt!106197 () tuple2!5898)

(declare-fun lt!106208 () tuple2!5898)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!66794 (= res!55338 (not (invariant!0 (currentBit!3374 (_2!3060 lt!106197)) (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106208))))))))

(declare-fun b!66795 () Bool)

(declare-fun res!55339 () Bool)

(assert (=> b!66795 (=> res!55339 e!43823)))

(declare-datatypes ((List!709 0))(
  ( (Nil!706) (Cons!705 (h!824 Bool) (t!1459 List!709)) )
))
(declare-fun lt!106212 () List!709)

(declare-fun head!528 (List!709) Bool)

(assert (=> b!66795 (= res!55339 (not (= (head!528 lt!106212) lt!106201)))))

(declare-fun b!66796 () Bool)

(declare-fun e!43827 () Bool)

(assert (=> b!66796 (= e!43827 e!43830)))

(declare-fun res!55354 () Bool)

(assert (=> b!66796 (=> res!55354 e!43830)))

(declare-fun lt!106217 () List!709)

(declare-fun lt!106218 () List!709)

(assert (=> b!66796 (= res!55354 (not (= lt!106217 lt!106218)))))

(assert (=> b!66796 (= lt!106218 lt!106217)))

(declare-fun tail!313 (List!709) List!709)

(assert (=> b!66796 (= lt!106217 (tail!313 lt!106212))))

(declare-fun lt!106206 () Unit!4501)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2268 BitStream!2268 BitStream!2268 BitStream!2268 (_ BitVec 64) List!709) Unit!4501)

(assert (=> b!66796 (= lt!106206 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3060 lt!106208) (_2!3060 lt!106208) (_1!3059 lt!106204) (_1!3059 lt!106213) (bvsub to!314 i!635) lt!106212))))

(declare-fun b!66797 () Bool)

(assert (=> b!66797 (= e!43823 e!43829)))

(declare-fun res!55343 () Bool)

(assert (=> b!66797 (=> res!55343 e!43829)))

(declare-fun srcBuffer!2 () array!2859)

(declare-fun lt!106214 () Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2268 array!2859 (_ BitVec 64) (_ BitVec 64)) List!709)

(assert (=> b!66797 (= res!55343 (not (= (head!528 (byteArrayBitContentToList!0 (_2!3060 lt!106208) srcBuffer!2 i!635 (bvsub to!314 i!635))) lt!106214)))))

(assert (=> b!66797 (= lt!106214 (bitAt!0 srcBuffer!2 i!635))))

(declare-fun b!66798 () Bool)

(declare-fun e!43835 () Bool)

(declare-fun thiss!1379 () BitStream!2268)

(declare-fun array_inv!1193 (array!2859) Bool)

(assert (=> b!66798 (= e!43835 (array_inv!1193 (buf!1701 thiss!1379)))))

(declare-fun b!66799 () Bool)

(declare-fun res!55341 () Bool)

(declare-fun e!43822 () Bool)

(assert (=> b!66799 (=> res!55341 e!43822)))

(assert (=> b!66799 (= res!55341 (not (invariant!0 (currentBit!3374 (_2!3060 lt!106208)) (currentByte!3379 (_2!3060 lt!106208)) (size!1320 (buf!1701 (_2!3060 lt!106208))))))))

(declare-fun b!66800 () Bool)

(declare-fun res!55351 () Bool)

(assert (=> b!66800 (=> res!55351 e!43827)))

(declare-fun length!337 (List!709) Int)

(assert (=> b!66800 (= res!55351 (<= (length!337 lt!106212) 0))))

(declare-fun b!66801 () Bool)

(declare-fun e!43828 () Bool)

(assert (=> b!66801 (= e!43828 e!43822)))

(declare-fun res!55348 () Bool)

(assert (=> b!66801 (=> res!55348 e!43822)))

(declare-fun lt!106219 () (_ BitVec 64))

(assert (=> b!66801 (= res!55348 (not (= lt!106219 (bvsub (bvadd lt!106205 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!66801 (= lt!106219 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106208))) (currentByte!3379 (_2!3060 lt!106208)) (currentBit!3374 (_2!3060 lt!106208))))))

(declare-fun b!66802 () Bool)

(declare-fun res!55344 () Bool)

(assert (=> b!66802 (=> res!55344 e!43829)))

(assert (=> b!66802 (= res!55344 (not (= (bitAt!0 (buf!1701 (_2!3060 lt!106197)) lt!106205) lt!106214)))))

(declare-fun b!66803 () Bool)

(declare-fun e!43833 () Bool)

(assert (=> b!66803 (= e!43833 e!43828)))

(declare-fun res!55356 () Bool)

(assert (=> b!66803 (=> res!55356 e!43828)))

(declare-fun isPrefixOf!0 (BitStream!2268 BitStream!2268) Bool)

(assert (=> b!66803 (= res!55356 (not (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106208))))))

(assert (=> b!66803 (isPrefixOf!0 thiss!1379 (_2!3060 lt!106208))))

(declare-fun lt!106207 () Unit!4501)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2268 BitStream!2268 BitStream!2268) Unit!4501)

(assert (=> b!66803 (= lt!106207 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3060 lt!106197) (_2!3060 lt!106208)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2268 array!2859 (_ BitVec 64) (_ BitVec 64)) tuple2!5898)

(assert (=> b!66803 (= lt!106208 (appendBitsMSBFirstLoop!0 (_2!3060 lt!106197) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!43824 () Bool)

(assert (=> b!66803 e!43824))

(declare-fun res!55345 () Bool)

(assert (=> b!66803 (=> (not res!55345) (not e!43824))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66803 (= res!55345 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106198 () Unit!4501)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2268 array!2859 (_ BitVec 64)) Unit!4501)

(assert (=> b!66803 (= lt!106198 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1701 (_2!3060 lt!106197)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106199 () tuple2!5896)

(declare-fun reader!0 (BitStream!2268 BitStream!2268) tuple2!5896)

(assert (=> b!66803 (= lt!106199 (reader!0 thiss!1379 (_2!3060 lt!106197)))))

(declare-fun b!66804 () Bool)

(declare-fun res!55342 () Bool)

(assert (=> b!66804 (=> res!55342 e!43822)))

(assert (=> b!66804 (= res!55342 (not (= (size!1320 (buf!1701 thiss!1379)) (size!1320 (buf!1701 (_2!3060 lt!106208))))))))

(declare-fun b!66805 () Bool)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2268 BitStream!2268 (_ BitVec 64)) List!709)

(assert (=> b!66805 (= e!43824 (= (head!528 (byteArrayBitContentToList!0 (_2!3060 lt!106197) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!528 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106197) (_1!3059 lt!106199) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!55355 () Bool)

(declare-fun e!43834 () Bool)

(assert (=> start!13010 (=> (not res!55355) (not e!43834))))

(assert (=> start!13010 (= res!55355 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1320 srcBuffer!2))))))))

(assert (=> start!13010 e!43834))

(assert (=> start!13010 true))

(assert (=> start!13010 (array_inv!1193 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2268) Bool)

(assert (=> start!13010 (and (inv!12 thiss!1379) e!43835)))

(declare-fun b!66806 () Bool)

(declare-fun res!55347 () Bool)

(assert (=> b!66806 (=> res!55347 e!43825)))

(assert (=> b!66806 (= res!55347 (not (invariant!0 (currentBit!3374 (_2!3060 lt!106197)) (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106197))))))))

(declare-fun b!66807 () Bool)

(assert (=> b!66807 (= e!43825 e!43827)))

(declare-fun res!55353 () Bool)

(assert (=> b!66807 (=> res!55353 e!43827)))

(assert (=> b!66807 (= res!55353 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!106210 () (_ BitVec 64))

(assert (=> b!66807 (= lt!106218 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106208) (_1!3059 lt!106213) lt!106210))))

(assert (=> b!66807 (= lt!106212 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106208) (_1!3059 lt!106204) (bvsub to!314 i!635)))))

(assert (=> b!66807 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106210)))

(declare-fun lt!106202 () Unit!4501)

(assert (=> b!66807 (= lt!106202 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3060 lt!106197) (buf!1701 (_2!3060 lt!106208)) lt!106210))))

(assert (=> b!66807 (= lt!106213 (reader!0 (_2!3060 lt!106197) (_2!3060 lt!106208)))))

(assert (=> b!66807 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!106209 () Unit!4501)

(assert (=> b!66807 (= lt!106209 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1701 (_2!3060 lt!106208)) (bvsub to!314 i!635)))))

(assert (=> b!66807 (= lt!106204 (reader!0 thiss!1379 (_2!3060 lt!106208)))))

(declare-fun b!66808 () Bool)

(declare-fun e!43826 () Bool)

(assert (=> b!66808 (= e!43826 e!43833)))

(declare-fun res!55340 () Bool)

(assert (=> b!66808 (=> res!55340 e!43833)))

(assert (=> b!66808 (= res!55340 (not (isPrefixOf!0 thiss!1379 (_2!3060 lt!106197))))))

(assert (=> b!66808 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106210)))

(assert (=> b!66808 (= lt!106210 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106216 () Unit!4501)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2268 BitStream!2268 (_ BitVec 64) (_ BitVec 64)) Unit!4501)

(assert (=> b!66808 (= lt!106216 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3060 lt!106197) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2268 (_ BitVec 8) (_ BitVec 32)) tuple2!5898)

(assert (=> b!66808 (= lt!106197 (appendBitFromByte!0 thiss!1379 (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!66809 () Bool)

(assert (=> b!66809 (= e!43834 (not e!43826))))

(declare-fun res!55352 () Bool)

(assert (=> b!66809 (=> res!55352 e!43826)))

(assert (=> b!66809 (= res!55352 (bvsge i!635 to!314))))

(assert (=> b!66809 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!106215 () Unit!4501)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2268) Unit!4501)

(assert (=> b!66809 (= lt!106215 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!66809 (= lt!106205 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(declare-fun b!66810 () Bool)

(declare-fun res!55346 () Bool)

(assert (=> b!66810 (=> (not res!55346) (not e!43834))))

(assert (=> b!66810 (= res!55346 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 thiss!1379))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!66811 () Bool)

(assert (=> b!66811 (= e!43822 e!43825)))

(declare-fun res!55350 () Bool)

(assert (=> b!66811 (=> res!55350 e!43825)))

(assert (=> b!66811 (= res!55350 (not (= (size!1320 (buf!1701 (_2!3060 lt!106197))) (size!1320 (buf!1701 (_2!3060 lt!106208))))))))

(assert (=> b!66811 (= lt!106219 (bvsub lt!106211 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!66811 (= lt!106211 (bvsub lt!106203 i!635))))

(assert (=> b!66811 (= lt!106203 (bvadd (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))) to!314))))

(assert (=> b!66811 (= (size!1320 (buf!1701 (_2!3060 lt!106208))) (size!1320 (buf!1701 thiss!1379)))))

(assert (= (and start!13010 res!55355) b!66810))

(assert (= (and b!66810 res!55346) b!66809))

(assert (= (and b!66809 (not res!55352)) b!66808))

(assert (= (and b!66808 (not res!55340)) b!66803))

(assert (= (and b!66803 res!55345) b!66805))

(assert (= (and b!66803 (not res!55356)) b!66801))

(assert (= (and b!66801 (not res!55348)) b!66799))

(assert (= (and b!66799 (not res!55341)) b!66804))

(assert (= (and b!66804 (not res!55342)) b!66811))

(assert (= (and b!66811 (not res!55350)) b!66806))

(assert (= (and b!66806 (not res!55347)) b!66794))

(assert (= (and b!66794 (not res!55338)) b!66807))

(assert (= (and b!66807 (not res!55353)) b!66800))

(assert (= (and b!66800 (not res!55351)) b!66796))

(assert (= (and b!66796 (not res!55354)) b!66793))

(assert (= (and b!66793 (not res!55349)) b!66795))

(assert (= (and b!66795 (not res!55339)) b!66797))

(assert (= (and b!66797 (not res!55343)) b!66802))

(assert (= (and b!66802 (not res!55344)) b!66792))

(assert (= start!13010 b!66798))

(declare-fun m!106239 () Bool)

(assert (=> b!66795 m!106239))

(declare-fun m!106241 () Bool)

(assert (=> b!66811 m!106241))

(declare-fun m!106243 () Bool)

(assert (=> b!66796 m!106243))

(declare-fun m!106245 () Bool)

(assert (=> b!66796 m!106245))

(declare-fun m!106247 () Bool)

(assert (=> b!66798 m!106247))

(declare-fun m!106249 () Bool)

(assert (=> b!66810 m!106249))

(declare-fun m!106251 () Bool)

(assert (=> b!66807 m!106251))

(declare-fun m!106253 () Bool)

(assert (=> b!66807 m!106253))

(declare-fun m!106255 () Bool)

(assert (=> b!66807 m!106255))

(declare-fun m!106257 () Bool)

(assert (=> b!66807 m!106257))

(declare-fun m!106259 () Bool)

(assert (=> b!66807 m!106259))

(declare-fun m!106261 () Bool)

(assert (=> b!66807 m!106261))

(declare-fun m!106263 () Bool)

(assert (=> b!66807 m!106263))

(declare-fun m!106265 () Bool)

(assert (=> b!66807 m!106265))

(declare-fun m!106267 () Bool)

(assert (=> b!66794 m!106267))

(declare-fun m!106269 () Bool)

(assert (=> b!66803 m!106269))

(declare-fun m!106271 () Bool)

(assert (=> b!66803 m!106271))

(declare-fun m!106273 () Bool)

(assert (=> b!66803 m!106273))

(declare-fun m!106275 () Bool)

(assert (=> b!66803 m!106275))

(declare-fun m!106277 () Bool)

(assert (=> b!66803 m!106277))

(declare-fun m!106279 () Bool)

(assert (=> b!66803 m!106279))

(declare-fun m!106281 () Bool)

(assert (=> b!66803 m!106281))

(declare-fun m!106283 () Bool)

(assert (=> b!66806 m!106283))

(declare-fun m!106285 () Bool)

(assert (=> b!66802 m!106285))

(declare-fun m!106287 () Bool)

(assert (=> b!66805 m!106287))

(assert (=> b!66805 m!106287))

(declare-fun m!106289 () Bool)

(assert (=> b!66805 m!106289))

(declare-fun m!106291 () Bool)

(assert (=> b!66805 m!106291))

(assert (=> b!66805 m!106291))

(declare-fun m!106293 () Bool)

(assert (=> b!66805 m!106293))

(declare-fun m!106295 () Bool)

(assert (=> start!13010 m!106295))

(declare-fun m!106297 () Bool)

(assert (=> start!13010 m!106297))

(declare-fun m!106299 () Bool)

(assert (=> b!66801 m!106299))

(declare-fun m!106301 () Bool)

(assert (=> b!66800 m!106301))

(declare-fun m!106303 () Bool)

(assert (=> b!66797 m!106303))

(assert (=> b!66797 m!106303))

(declare-fun m!106305 () Bool)

(assert (=> b!66797 m!106305))

(declare-fun m!106307 () Bool)

(assert (=> b!66797 m!106307))

(declare-fun m!106309 () Bool)

(assert (=> b!66809 m!106309))

(declare-fun m!106311 () Bool)

(assert (=> b!66809 m!106311))

(declare-fun m!106313 () Bool)

(assert (=> b!66809 m!106313))

(declare-fun m!106315 () Bool)

(assert (=> b!66808 m!106315))

(declare-fun m!106317 () Bool)

(assert (=> b!66808 m!106317))

(declare-fun m!106319 () Bool)

(assert (=> b!66808 m!106319))

(declare-fun m!106321 () Bool)

(assert (=> b!66808 m!106321))

(declare-fun m!106323 () Bool)

(assert (=> b!66808 m!106323))

(assert (=> b!66808 m!106319))

(declare-fun m!106325 () Bool)

(assert (=> b!66793 m!106325))

(declare-fun m!106327 () Bool)

(assert (=> b!66793 m!106327))

(declare-fun m!106329 () Bool)

(assert (=> b!66799 m!106329))

(check-sat (not b!66808) (not b!66800) (not b!66805) (not b!66793) (not b!66803) (not b!66809) (not b!66798) (not b!66795) (not b!66806) (not b!66796) (not b!66802) (not b!66811) (not b!66801) (not b!66810) (not b!66807) (not start!13010) (not b!66794) (not b!66799) (not b!66797))
(check-sat)
(get-model)

(declare-fun d!21026 () Bool)

(assert (=> d!21026 (= (invariant!0 (currentBit!3374 (_2!3060 lt!106197)) (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106208)))) (and (bvsge (currentBit!3374 (_2!3060 lt!106197)) #b00000000000000000000000000000000) (bvslt (currentBit!3374 (_2!3060 lt!106197)) #b00000000000000000000000000001000) (bvsge (currentByte!3379 (_2!3060 lt!106197)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106208)))) (and (= (currentBit!3374 (_2!3060 lt!106197)) #b00000000000000000000000000000000) (= (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106208))))))))))

(assert (=> b!66794 d!21026))

(declare-fun d!21028 () Bool)

(assert (=> d!21028 (= (head!528 (byteArrayBitContentToList!0 (_2!3060 lt!106197) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!824 (byteArrayBitContentToList!0 (_2!3060 lt!106197) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66805 d!21028))

(declare-fun d!21030 () Bool)

(declare-fun c!4863 () Bool)

(assert (=> d!21030 (= c!4863 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43880 () List!709)

(assert (=> d!21030 (= (byteArrayBitContentToList!0 (_2!3060 lt!106197) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!43880)))

(declare-fun b!66876 () Bool)

(assert (=> b!66876 (= e!43880 Nil!706)))

(declare-fun b!66877 () Bool)

(assert (=> b!66877 (= e!43880 (Cons!705 (not (= (bvand ((_ sign_extend 24) (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3060 lt!106197) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21030 c!4863) b!66876))

(assert (= (and d!21030 (not c!4863)) b!66877))

(assert (=> b!66877 m!106319))

(declare-fun m!106423 () Bool)

(assert (=> b!66877 m!106423))

(declare-fun m!106425 () Bool)

(assert (=> b!66877 m!106425))

(assert (=> b!66805 d!21030))

(declare-fun d!21032 () Bool)

(assert (=> d!21032 (= (head!528 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106197) (_1!3059 lt!106199) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!824 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106197) (_1!3059 lt!106199) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!66805 d!21032))

(declare-fun b!66889 () Bool)

(declare-fun e!43885 () Bool)

(declare-fun lt!106297 () List!709)

(assert (=> b!66889 (= e!43885 (> (length!337 lt!106297) 0))))

(declare-datatypes ((tuple2!5904 0))(
  ( (tuple2!5905 (_1!3063 List!709) (_2!3063 BitStream!2268)) )
))
(declare-fun e!43886 () tuple2!5904)

(declare-fun b!66887 () Bool)

(declare-datatypes ((tuple2!5906 0))(
  ( (tuple2!5907 (_1!3064 Bool) (_2!3064 BitStream!2268)) )
))
(declare-fun lt!106296 () tuple2!5906)

(declare-fun lt!106295 () (_ BitVec 64))

(assert (=> b!66887 (= e!43886 (tuple2!5905 (Cons!705 (_1!3064 lt!106296) (bitStreamReadBitsIntoList!0 (_2!3060 lt!106197) (_2!3064 lt!106296) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!106295))) (_2!3064 lt!106296)))))

(declare-fun readBit!0 (BitStream!2268) tuple2!5906)

(assert (=> b!66887 (= lt!106296 (readBit!0 (_1!3059 lt!106199)))))

(assert (=> b!66887 (= lt!106295 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!66886 () Bool)

(assert (=> b!66886 (= e!43886 (tuple2!5905 Nil!706 (_1!3059 lt!106199)))))

(declare-fun d!21034 () Bool)

(assert (=> d!21034 e!43885))

(declare-fun c!4868 () Bool)

(assert (=> d!21034 (= c!4868 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21034 (= lt!106297 (_1!3063 e!43886))))

(declare-fun c!4869 () Bool)

(assert (=> d!21034 (= c!4869 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21034 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21034 (= (bitStreamReadBitsIntoList!0 (_2!3060 lt!106197) (_1!3059 lt!106199) #b0000000000000000000000000000000000000000000000000000000000000001) lt!106297)))

(declare-fun b!66888 () Bool)

(declare-fun isEmpty!210 (List!709) Bool)

(assert (=> b!66888 (= e!43885 (isEmpty!210 lt!106297))))

(assert (= (and d!21034 c!4869) b!66886))

(assert (= (and d!21034 (not c!4869)) b!66887))

(assert (= (and d!21034 c!4868) b!66888))

(assert (= (and d!21034 (not c!4868)) b!66889))

(declare-fun m!106427 () Bool)

(assert (=> b!66889 m!106427))

(declare-fun m!106429 () Bool)

(assert (=> b!66887 m!106429))

(declare-fun m!106431 () Bool)

(assert (=> b!66887 m!106431))

(declare-fun m!106433 () Bool)

(assert (=> b!66888 m!106433))

(assert (=> b!66805 d!21034))

(declare-fun d!21036 () Bool)

(assert (=> d!21036 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106300 () Unit!4501)

(declare-fun choose!9 (BitStream!2268 array!2859 (_ BitVec 64) BitStream!2268) Unit!4501)

(assert (=> d!21036 (= lt!106300 (choose!9 thiss!1379 (buf!1701 (_2!3060 lt!106197)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2269 (buf!1701 (_2!3060 lt!106197)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379))))))

(assert (=> d!21036 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1701 (_2!3060 lt!106197)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!106300)))

(declare-fun bs!5109 () Bool)

(assert (= bs!5109 d!21036))

(assert (=> bs!5109 m!106273))

(declare-fun m!106435 () Bool)

(assert (=> bs!5109 m!106435))

(assert (=> b!66803 d!21036))

(declare-fun d!21038 () Bool)

(assert (=> d!21038 (isPrefixOf!0 thiss!1379 (_2!3060 lt!106208))))

(declare-fun lt!106303 () Unit!4501)

(declare-fun choose!30 (BitStream!2268 BitStream!2268 BitStream!2268) Unit!4501)

(assert (=> d!21038 (= lt!106303 (choose!30 thiss!1379 (_2!3060 lt!106197) (_2!3060 lt!106208)))))

(assert (=> d!21038 (isPrefixOf!0 thiss!1379 (_2!3060 lt!106197))))

(assert (=> d!21038 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3060 lt!106197) (_2!3060 lt!106208)) lt!106303)))

(declare-fun bs!5110 () Bool)

(assert (= bs!5110 d!21038))

(assert (=> bs!5110 m!106271))

(declare-fun m!106437 () Bool)

(assert (=> bs!5110 m!106437))

(assert (=> bs!5110 m!106315))

(assert (=> b!66803 d!21038))

(declare-fun d!21040 () Bool)

(declare-fun res!55422 () Bool)

(declare-fun e!43892 () Bool)

(assert (=> d!21040 (=> (not res!55422) (not e!43892))))

(assert (=> d!21040 (= res!55422 (= (size!1320 (buf!1701 (_2!3060 lt!106197))) (size!1320 (buf!1701 (_2!3060 lt!106208)))))))

(assert (=> d!21040 (= (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106208)) e!43892)))

(declare-fun b!66896 () Bool)

(declare-fun res!55421 () Bool)

(assert (=> b!66896 (=> (not res!55421) (not e!43892))))

(assert (=> b!66896 (= res!55421 (bvsle (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))) (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106208))) (currentByte!3379 (_2!3060 lt!106208)) (currentBit!3374 (_2!3060 lt!106208)))))))

(declare-fun b!66897 () Bool)

(declare-fun e!43891 () Bool)

(assert (=> b!66897 (= e!43892 e!43891)))

(declare-fun res!55420 () Bool)

(assert (=> b!66897 (=> res!55420 e!43891)))

(assert (=> b!66897 (= res!55420 (= (size!1320 (buf!1701 (_2!3060 lt!106197))) #b00000000000000000000000000000000))))

(declare-fun b!66898 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2859 array!2859 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!66898 (= e!43891 (arrayBitRangesEq!0 (buf!1701 (_2!3060 lt!106197)) (buf!1701 (_2!3060 lt!106208)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197)))))))

(assert (= (and d!21040 res!55422) b!66896))

(assert (= (and b!66896 res!55421) b!66897))

(assert (= (and b!66897 (not res!55420)) b!66898))

(assert (=> b!66896 m!106241))

(assert (=> b!66896 m!106299))

(assert (=> b!66898 m!106241))

(assert (=> b!66898 m!106241))

(declare-fun m!106439 () Bool)

(assert (=> b!66898 m!106439))

(assert (=> b!66803 d!21040))

(declare-fun b!66986 () Bool)

(declare-fun e!43939 () tuple2!5898)

(declare-fun Unit!4505 () Unit!4501)

(assert (=> b!66986 (= e!43939 (tuple2!5899 Unit!4505 (_2!3060 lt!106197)))))

(assert (=> b!66986 (= (size!1320 (buf!1701 (_2!3060 lt!106197))) (size!1320 (buf!1701 (_2!3060 lt!106197))))))

(declare-fun lt!106557 () Unit!4501)

(declare-fun Unit!4506 () Unit!4501)

(assert (=> b!66986 (= lt!106557 Unit!4506)))

(declare-fun call!856 () tuple2!5896)

(declare-fun checkByteArrayBitContent!0 (BitStream!2268 array!2859 array!2859 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!5908 0))(
  ( (tuple2!5909 (_1!3065 array!2859) (_2!3065 BitStream!2268)) )
))
(declare-fun readBits!0 (BitStream!2268 (_ BitVec 64)) tuple2!5908)

(assert (=> b!66986 (checkByteArrayBitContent!0 (_2!3060 lt!106197) srcBuffer!2 (_1!3065 (readBits!0 (_1!3059 call!856) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun bm!853 () Bool)

(declare-fun c!4875 () Bool)

(declare-fun lt!106529 () tuple2!5898)

(assert (=> bm!853 (= call!856 (reader!0 (_2!3060 lt!106197) (ite c!4875 (_2!3060 lt!106529) (_2!3060 lt!106197))))))

(declare-fun d!21042 () Bool)

(declare-fun e!43937 () Bool)

(assert (=> d!21042 e!43937))

(declare-fun res!55502 () Bool)

(assert (=> d!21042 (=> (not res!55502) (not e!43937))))

(declare-fun lt!106570 () tuple2!5898)

(declare-fun lt!106537 () (_ BitVec 64))

(assert (=> d!21042 (= res!55502 (= (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106570))) (currentByte!3379 (_2!3060 lt!106570)) (currentBit!3374 (_2!3060 lt!106570))) (bvsub lt!106537 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!21042 (or (= (bvand lt!106537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106537 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106537 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106546 () (_ BitVec 64))

(assert (=> d!21042 (= lt!106537 (bvadd lt!106546 to!314))))

(assert (=> d!21042 (or (not (= (bvand lt!106546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!106546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!106546 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21042 (= lt!106546 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))))))

(assert (=> d!21042 (= lt!106570 e!43939)))

(assert (=> d!21042 (= c!4875 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!106542 () Unit!4501)

(declare-fun lt!106528 () Unit!4501)

(assert (=> d!21042 (= lt!106542 lt!106528)))

(assert (=> d!21042 (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106197))))

(assert (=> d!21042 (= lt!106528 (lemmaIsPrefixRefl!0 (_2!3060 lt!106197)))))

(declare-fun lt!106536 () (_ BitVec 64))

(assert (=> d!21042 (= lt!106536 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))))))

(assert (=> d!21042 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21042 (= (appendBitsMSBFirstLoop!0 (_2!3060 lt!106197) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!106570)))

(declare-fun b!66987 () Bool)

(declare-fun res!55503 () Bool)

(assert (=> b!66987 (=> (not res!55503) (not e!43937))))

(assert (=> b!66987 (= res!55503 (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106570)))))

(declare-fun b!66988 () Bool)

(declare-fun e!43938 () Bool)

(declare-fun lt!106558 () (_ BitVec 64))

(assert (=> b!66988 (= e!43938 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106558))))

(declare-fun b!66989 () Bool)

(declare-fun res!55500 () Bool)

(assert (=> b!66989 (=> (not res!55500) (not e!43937))))

(assert (=> b!66989 (= res!55500 (invariant!0 (currentBit!3374 (_2!3060 lt!106570)) (currentByte!3379 (_2!3060 lt!106570)) (size!1320 (buf!1701 (_2!3060 lt!106570)))))))

(declare-fun b!66990 () Bool)

(declare-fun res!55499 () Bool)

(assert (=> b!66990 (=> (not res!55499) (not e!43937))))

(assert (=> b!66990 (= res!55499 (= (size!1320 (buf!1701 (_2!3060 lt!106570))) (size!1320 (buf!1701 (_2!3060 lt!106197)))))))

(declare-fun b!66991 () Bool)

(declare-fun lt!106560 () tuple2!5896)

(assert (=> b!66991 (= e!43937 (= (bitStreamReadBitsIntoList!0 (_2!3060 lt!106570) (_1!3059 lt!106560) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3060 lt!106570) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!66991 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66991 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!106549 () Unit!4501)

(declare-fun lt!106562 () Unit!4501)

(assert (=> b!66991 (= lt!106549 lt!106562)))

(assert (=> b!66991 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106570)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106558)))

(assert (=> b!66991 (= lt!106562 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3060 lt!106197) (buf!1701 (_2!3060 lt!106570)) lt!106558))))

(assert (=> b!66991 e!43938))

(declare-fun res!55504 () Bool)

(assert (=> b!66991 (=> (not res!55504) (not e!43938))))

(assert (=> b!66991 (= res!55504 (and (= (size!1320 (buf!1701 (_2!3060 lt!106197))) (size!1320 (buf!1701 (_2!3060 lt!106570)))) (bvsge lt!106558 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66991 (= lt!106558 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!66991 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!66991 (= lt!106560 (reader!0 (_2!3060 lt!106197) (_2!3060 lt!106570)))))

(declare-fun b!66992 () Bool)

(declare-fun lt!106547 () tuple2!5898)

(declare-fun Unit!4507 () Unit!4501)

(assert (=> b!66992 (= e!43939 (tuple2!5899 Unit!4507 (_2!3060 lt!106547)))))

(assert (=> b!66992 (= lt!106529 (appendBitFromByte!0 (_2!3060 lt!106197) (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!106548 () (_ BitVec 64))

(assert (=> b!66992 (= lt!106548 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106530 () (_ BitVec 64))

(assert (=> b!66992 (= lt!106530 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106561 () Unit!4501)

(assert (=> b!66992 (= lt!106561 (validateOffsetBitsIneqLemma!0 (_2!3060 lt!106197) (_2!3060 lt!106529) lt!106548 lt!106530))))

(assert (=> b!66992 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106529)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106529))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106529))) (bvsub lt!106548 lt!106530))))

(declare-fun lt!106531 () Unit!4501)

(assert (=> b!66992 (= lt!106531 lt!106561)))

(declare-fun lt!106544 () tuple2!5896)

(assert (=> b!66992 (= lt!106544 call!856)))

(declare-fun lt!106552 () (_ BitVec 64))

(assert (=> b!66992 (= lt!106552 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106534 () Unit!4501)

(assert (=> b!66992 (= lt!106534 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3060 lt!106197) (buf!1701 (_2!3060 lt!106529)) lt!106552))))

(assert (=> b!66992 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106529)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106552)))

(declare-fun lt!106556 () Unit!4501)

(assert (=> b!66992 (= lt!106556 lt!106534)))

(assert (=> b!66992 (= (head!528 (byteArrayBitContentToList!0 (_2!3060 lt!106529) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!528 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106529) (_1!3059 lt!106544) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106527 () Unit!4501)

(declare-fun Unit!4508 () Unit!4501)

(assert (=> b!66992 (= lt!106527 Unit!4508)))

(assert (=> b!66992 (= lt!106547 (appendBitsMSBFirstLoop!0 (_2!3060 lt!106529) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!106566 () Unit!4501)

(assert (=> b!66992 (= lt!106566 (lemmaIsPrefixTransitive!0 (_2!3060 lt!106197) (_2!3060 lt!106529) (_2!3060 lt!106547)))))

(assert (=> b!66992 (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106547))))

(declare-fun lt!106568 () Unit!4501)

(assert (=> b!66992 (= lt!106568 lt!106566)))

(assert (=> b!66992 (= (size!1320 (buf!1701 (_2!3060 lt!106547))) (size!1320 (buf!1701 (_2!3060 lt!106197))))))

(declare-fun lt!106543 () Unit!4501)

(declare-fun Unit!4509 () Unit!4501)

(assert (=> b!66992 (= lt!106543 Unit!4509)))

(assert (=> b!66992 (= (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106547))) (currentByte!3379 (_2!3060 lt!106547)) (currentBit!3374 (_2!3060 lt!106547))) (bvsub (bvadd (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106553 () Unit!4501)

(declare-fun Unit!4510 () Unit!4501)

(assert (=> b!66992 (= lt!106553 Unit!4510)))

(assert (=> b!66992 (= (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106547))) (currentByte!3379 (_2!3060 lt!106547)) (currentBit!3374 (_2!3060 lt!106547))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106529))) (currentByte!3379 (_2!3060 lt!106529)) (currentBit!3374 (_2!3060 lt!106529))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106538 () Unit!4501)

(declare-fun Unit!4511 () Unit!4501)

(assert (=> b!66992 (= lt!106538 Unit!4511)))

(declare-fun lt!106539 () tuple2!5896)

(assert (=> b!66992 (= lt!106539 (reader!0 (_2!3060 lt!106197) (_2!3060 lt!106547)))))

(declare-fun lt!106559 () (_ BitVec 64))

(assert (=> b!66992 (= lt!106559 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106563 () Unit!4501)

(assert (=> b!66992 (= lt!106563 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3060 lt!106197) (buf!1701 (_2!3060 lt!106547)) lt!106559))))

(assert (=> b!66992 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106547)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106559)))

(declare-fun lt!106550 () Unit!4501)

(assert (=> b!66992 (= lt!106550 lt!106563)))

(declare-fun lt!106541 () tuple2!5896)

(assert (=> b!66992 (= lt!106541 (reader!0 (_2!3060 lt!106529) (_2!3060 lt!106547)))))

(declare-fun lt!106569 () (_ BitVec 64))

(assert (=> b!66992 (= lt!106569 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!106555 () Unit!4501)

(assert (=> b!66992 (= lt!106555 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3060 lt!106529) (buf!1701 (_2!3060 lt!106547)) lt!106569))))

(assert (=> b!66992 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106547)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106529))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106529))) lt!106569)))

(declare-fun lt!106567 () Unit!4501)

(assert (=> b!66992 (= lt!106567 lt!106555)))

(declare-fun lt!106554 () List!709)

(assert (=> b!66992 (= lt!106554 (byteArrayBitContentToList!0 (_2!3060 lt!106547) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106564 () List!709)

(assert (=> b!66992 (= lt!106564 (byteArrayBitContentToList!0 (_2!3060 lt!106547) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106565 () List!709)

(assert (=> b!66992 (= lt!106565 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106547) (_1!3059 lt!106539) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!106532 () List!709)

(assert (=> b!66992 (= lt!106532 (bitStreamReadBitsIntoList!0 (_2!3060 lt!106547) (_1!3059 lt!106541) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!106535 () (_ BitVec 64))

(assert (=> b!66992 (= lt!106535 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!106540 () Unit!4501)

(assert (=> b!66992 (= lt!106540 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3060 lt!106547) (_2!3060 lt!106547) (_1!3059 lt!106539) (_1!3059 lt!106541) lt!106535 lt!106565))))

(assert (=> b!66992 (= (bitStreamReadBitsIntoList!0 (_2!3060 lt!106547) (_1!3059 lt!106541) (bvsub lt!106535 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!313 lt!106565))))

(declare-fun lt!106551 () Unit!4501)

(assert (=> b!66992 (= lt!106551 lt!106540)))

(declare-fun lt!106533 () Unit!4501)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2859 array!2859 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4501)

(assert (=> b!66992 (= lt!106533 (arrayBitRangesEqImpliesEq!0 (buf!1701 (_2!3060 lt!106529)) (buf!1701 (_2!3060 lt!106547)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!106536 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106529))) (currentByte!3379 (_2!3060 lt!106529)) (currentBit!3374 (_2!3060 lt!106529)))))))

(assert (=> b!66992 (= (bitAt!0 (buf!1701 (_2!3060 lt!106529)) lt!106536) (bitAt!0 (buf!1701 (_2!3060 lt!106547)) lt!106536))))

(declare-fun lt!106545 () Unit!4501)

(assert (=> b!66992 (= lt!106545 lt!106533)))

(declare-fun b!66993 () Bool)

(declare-fun res!55501 () Bool)

(assert (=> b!66993 (=> (not res!55501) (not e!43937))))

(assert (=> b!66993 (= res!55501 (= (size!1320 (buf!1701 (_2!3060 lt!106197))) (size!1320 (buf!1701 (_2!3060 lt!106570)))))))

(assert (= (and d!21042 c!4875) b!66992))

(assert (= (and d!21042 (not c!4875)) b!66986))

(assert (= (or b!66992 b!66986) bm!853))

(assert (= (and d!21042 res!55502) b!66989))

(assert (= (and b!66989 res!55500) b!66993))

(assert (= (and b!66993 res!55501) b!66987))

(assert (= (and b!66987 res!55503) b!66990))

(assert (= (and b!66990 res!55499) b!66991))

(assert (= (and b!66991 res!55504) b!66988))

(declare-fun m!106523 () Bool)

(assert (=> b!66987 m!106523))

(declare-fun m!106525 () Bool)

(assert (=> b!66991 m!106525))

(declare-fun m!106527 () Bool)

(assert (=> b!66991 m!106527))

(declare-fun m!106529 () Bool)

(assert (=> b!66991 m!106529))

(declare-fun m!106531 () Bool)

(assert (=> b!66991 m!106531))

(declare-fun m!106533 () Bool)

(assert (=> b!66991 m!106533))

(declare-fun m!106535 () Bool)

(assert (=> d!21042 m!106535))

(assert (=> d!21042 m!106241))

(declare-fun m!106537 () Bool)

(assert (=> d!21042 m!106537))

(declare-fun m!106539 () Bool)

(assert (=> d!21042 m!106539))

(declare-fun m!106541 () Bool)

(assert (=> bm!853 m!106541))

(declare-fun m!106543 () Bool)

(assert (=> b!66992 m!106543))

(declare-fun m!106545 () Bool)

(assert (=> b!66992 m!106545))

(declare-fun m!106547 () Bool)

(assert (=> b!66992 m!106547))

(declare-fun m!106549 () Bool)

(assert (=> b!66992 m!106549))

(declare-fun m!106551 () Bool)

(assert (=> b!66992 m!106551))

(declare-fun m!106553 () Bool)

(assert (=> b!66992 m!106553))

(declare-fun m!106555 () Bool)

(assert (=> b!66992 m!106555))

(assert (=> b!66992 m!106549))

(declare-fun m!106557 () Bool)

(assert (=> b!66992 m!106557))

(declare-fun m!106559 () Bool)

(assert (=> b!66992 m!106559))

(declare-fun m!106561 () Bool)

(assert (=> b!66992 m!106561))

(declare-fun m!106563 () Bool)

(assert (=> b!66992 m!106563))

(declare-fun m!106565 () Bool)

(assert (=> b!66992 m!106565))

(declare-fun m!106567 () Bool)

(assert (=> b!66992 m!106567))

(declare-fun m!106569 () Bool)

(assert (=> b!66992 m!106569))

(assert (=> b!66992 m!106553))

(declare-fun m!106571 () Bool)

(assert (=> b!66992 m!106571))

(declare-fun m!106573 () Bool)

(assert (=> b!66992 m!106573))

(declare-fun m!106575 () Bool)

(assert (=> b!66992 m!106575))

(declare-fun m!106577 () Bool)

(assert (=> b!66992 m!106577))

(declare-fun m!106579 () Bool)

(assert (=> b!66992 m!106579))

(declare-fun m!106581 () Bool)

(assert (=> b!66992 m!106581))

(declare-fun m!106583 () Bool)

(assert (=> b!66992 m!106583))

(declare-fun m!106585 () Bool)

(assert (=> b!66992 m!106585))

(declare-fun m!106587 () Bool)

(assert (=> b!66992 m!106587))

(declare-fun m!106589 () Bool)

(assert (=> b!66992 m!106589))

(declare-fun m!106591 () Bool)

(assert (=> b!66992 m!106591))

(declare-fun m!106593 () Bool)

(assert (=> b!66992 m!106593))

(declare-fun m!106595 () Bool)

(assert (=> b!66992 m!106595))

(declare-fun m!106597 () Bool)

(assert (=> b!66992 m!106597))

(assert (=> b!66992 m!106563))

(declare-fun m!106599 () Bool)

(assert (=> b!66992 m!106599))

(declare-fun m!106601 () Bool)

(assert (=> b!66992 m!106601))

(assert (=> b!66992 m!106241))

(declare-fun m!106603 () Bool)

(assert (=> b!66992 m!106603))

(assert (=> b!66992 m!106567))

(declare-fun m!106605 () Bool)

(assert (=> b!66988 m!106605))

(declare-fun m!106607 () Bool)

(assert (=> b!66989 m!106607))

(declare-fun m!106609 () Bool)

(assert (=> b!66986 m!106609))

(declare-fun m!106611 () Bool)

(assert (=> b!66986 m!106611))

(assert (=> b!66803 d!21042))

(declare-fun d!21092 () Bool)

(declare-fun res!55507 () Bool)

(declare-fun e!43941 () Bool)

(assert (=> d!21092 (=> (not res!55507) (not e!43941))))

(assert (=> d!21092 (= res!55507 (= (size!1320 (buf!1701 thiss!1379)) (size!1320 (buf!1701 (_2!3060 lt!106208)))))))

(assert (=> d!21092 (= (isPrefixOf!0 thiss!1379 (_2!3060 lt!106208)) e!43941)))

(declare-fun b!66994 () Bool)

(declare-fun res!55506 () Bool)

(assert (=> b!66994 (=> (not res!55506) (not e!43941))))

(assert (=> b!66994 (= res!55506 (bvsle (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)) (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106208))) (currentByte!3379 (_2!3060 lt!106208)) (currentBit!3374 (_2!3060 lt!106208)))))))

(declare-fun b!66995 () Bool)

(declare-fun e!43940 () Bool)

(assert (=> b!66995 (= e!43941 e!43940)))

(declare-fun res!55505 () Bool)

(assert (=> b!66995 (=> res!55505 e!43940)))

(assert (=> b!66995 (= res!55505 (= (size!1320 (buf!1701 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!66996 () Bool)

(assert (=> b!66996 (= e!43940 (arrayBitRangesEq!0 (buf!1701 thiss!1379) (buf!1701 (_2!3060 lt!106208)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379))))))

(assert (= (and d!21092 res!55507) b!66994))

(assert (= (and b!66994 res!55506) b!66995))

(assert (= (and b!66995 (not res!55505)) b!66996))

(assert (=> b!66994 m!106313))

(assert (=> b!66994 m!106299))

(assert (=> b!66996 m!106313))

(assert (=> b!66996 m!106313))

(declare-fun m!106613 () Bool)

(assert (=> b!66996 m!106613))

(assert (=> b!66803 d!21092))

(declare-fun d!21094 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!21094 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5118 () Bool)

(assert (= bs!5118 d!21094))

(declare-fun m!106615 () Bool)

(assert (=> bs!5118 m!106615))

(assert (=> b!66803 d!21094))

(declare-fun b!67007 () Bool)

(declare-fun e!43946 () Unit!4501)

(declare-fun Unit!4512 () Unit!4501)

(assert (=> b!67007 (= e!43946 Unit!4512)))

(declare-fun b!67008 () Bool)

(declare-fun res!55515 () Bool)

(declare-fun e!43947 () Bool)

(assert (=> b!67008 (=> (not res!55515) (not e!43947))))

(declare-fun lt!106627 () tuple2!5896)

(assert (=> b!67008 (= res!55515 (isPrefixOf!0 (_2!3059 lt!106627) (_2!3060 lt!106197)))))

(declare-fun d!21096 () Bool)

(assert (=> d!21096 e!43947))

(declare-fun res!55516 () Bool)

(assert (=> d!21096 (=> (not res!55516) (not e!43947))))

(assert (=> d!21096 (= res!55516 (isPrefixOf!0 (_1!3059 lt!106627) (_2!3059 lt!106627)))))

(declare-fun lt!106617 () BitStream!2268)

(assert (=> d!21096 (= lt!106627 (tuple2!5897 lt!106617 (_2!3060 lt!106197)))))

(declare-fun lt!106629 () Unit!4501)

(declare-fun lt!106622 () Unit!4501)

(assert (=> d!21096 (= lt!106629 lt!106622)))

(assert (=> d!21096 (isPrefixOf!0 lt!106617 (_2!3060 lt!106197))))

(assert (=> d!21096 (= lt!106622 (lemmaIsPrefixTransitive!0 lt!106617 (_2!3060 lt!106197) (_2!3060 lt!106197)))))

(declare-fun lt!106621 () Unit!4501)

(declare-fun lt!106613 () Unit!4501)

(assert (=> d!21096 (= lt!106621 lt!106613)))

(assert (=> d!21096 (isPrefixOf!0 lt!106617 (_2!3060 lt!106197))))

(assert (=> d!21096 (= lt!106613 (lemmaIsPrefixTransitive!0 lt!106617 thiss!1379 (_2!3060 lt!106197)))))

(declare-fun lt!106630 () Unit!4501)

(assert (=> d!21096 (= lt!106630 e!43946)))

(declare-fun c!4878 () Bool)

(assert (=> d!21096 (= c!4878 (not (= (size!1320 (buf!1701 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!106626 () Unit!4501)

(declare-fun lt!106616 () Unit!4501)

(assert (=> d!21096 (= lt!106626 lt!106616)))

(assert (=> d!21096 (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106197))))

(assert (=> d!21096 (= lt!106616 (lemmaIsPrefixRefl!0 (_2!3060 lt!106197)))))

(declare-fun lt!106614 () Unit!4501)

(declare-fun lt!106625 () Unit!4501)

(assert (=> d!21096 (= lt!106614 lt!106625)))

(assert (=> d!21096 (= lt!106625 (lemmaIsPrefixRefl!0 (_2!3060 lt!106197)))))

(declare-fun lt!106619 () Unit!4501)

(declare-fun lt!106612 () Unit!4501)

(assert (=> d!21096 (= lt!106619 lt!106612)))

(assert (=> d!21096 (isPrefixOf!0 lt!106617 lt!106617)))

(assert (=> d!21096 (= lt!106612 (lemmaIsPrefixRefl!0 lt!106617))))

(declare-fun lt!106628 () Unit!4501)

(declare-fun lt!106611 () Unit!4501)

(assert (=> d!21096 (= lt!106628 lt!106611)))

(assert (=> d!21096 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21096 (= lt!106611 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21096 (= lt!106617 (BitStream!2269 (buf!1701 (_2!3060 lt!106197)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(assert (=> d!21096 (isPrefixOf!0 thiss!1379 (_2!3060 lt!106197))))

(assert (=> d!21096 (= (reader!0 thiss!1379 (_2!3060 lt!106197)) lt!106627)))

(declare-fun lt!106623 () (_ BitVec 64))

(declare-fun b!67009 () Bool)

(declare-fun lt!106620 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2268 (_ BitVec 64)) BitStream!2268)

(assert (=> b!67009 (= e!43947 (= (_1!3059 lt!106627) (withMovedBitIndex!0 (_2!3059 lt!106627) (bvsub lt!106623 lt!106620))))))

(assert (=> b!67009 (or (= (bvand lt!106623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106620 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106623 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106623 lt!106620) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67009 (= lt!106620 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))))))

(assert (=> b!67009 (= lt!106623 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(declare-fun b!67010 () Bool)

(declare-fun res!55514 () Bool)

(assert (=> b!67010 (=> (not res!55514) (not e!43947))))

(assert (=> b!67010 (= res!55514 (isPrefixOf!0 (_1!3059 lt!106627) thiss!1379))))

(declare-fun b!67011 () Bool)

(declare-fun lt!106624 () Unit!4501)

(assert (=> b!67011 (= e!43946 lt!106624)))

(declare-fun lt!106615 () (_ BitVec 64))

(assert (=> b!67011 (= lt!106615 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106618 () (_ BitVec 64))

(assert (=> b!67011 (= lt!106618 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2859 array!2859 (_ BitVec 64) (_ BitVec 64)) Unit!4501)

(assert (=> b!67011 (= lt!106624 (arrayBitRangesEqSymmetric!0 (buf!1701 thiss!1379) (buf!1701 (_2!3060 lt!106197)) lt!106615 lt!106618))))

(assert (=> b!67011 (arrayBitRangesEq!0 (buf!1701 (_2!3060 lt!106197)) (buf!1701 thiss!1379) lt!106615 lt!106618)))

(assert (= (and d!21096 c!4878) b!67011))

(assert (= (and d!21096 (not c!4878)) b!67007))

(assert (= (and d!21096 res!55516) b!67010))

(assert (= (and b!67010 res!55514) b!67008))

(assert (= (and b!67008 res!55515) b!67009))

(declare-fun m!106617 () Bool)

(assert (=> b!67009 m!106617))

(assert (=> b!67009 m!106241))

(assert (=> b!67009 m!106313))

(declare-fun m!106619 () Bool)

(assert (=> b!67010 m!106619))

(assert (=> b!67011 m!106313))

(declare-fun m!106621 () Bool)

(assert (=> b!67011 m!106621))

(declare-fun m!106623 () Bool)

(assert (=> b!67011 m!106623))

(declare-fun m!106625 () Bool)

(assert (=> b!67008 m!106625))

(declare-fun m!106627 () Bool)

(assert (=> d!21096 m!106627))

(declare-fun m!106629 () Bool)

(assert (=> d!21096 m!106629))

(declare-fun m!106631 () Bool)

(assert (=> d!21096 m!106631))

(assert (=> d!21096 m!106537))

(declare-fun m!106633 () Bool)

(assert (=> d!21096 m!106633))

(declare-fun m!106635 () Bool)

(assert (=> d!21096 m!106635))

(declare-fun m!106637 () Bool)

(assert (=> d!21096 m!106637))

(assert (=> d!21096 m!106309))

(assert (=> d!21096 m!106311))

(assert (=> d!21096 m!106315))

(assert (=> d!21096 m!106539))

(assert (=> b!66803 d!21096))

(declare-fun d!21098 () Bool)

(assert (=> d!21098 (= (bitAt!0 (buf!1701 (_1!3059 lt!106213)) lt!106205) (not (= (bvand ((_ sign_extend 24) (select (arr!1887 (buf!1701 (_1!3059 lt!106213))) ((_ extract 31 0) (bvsdiv lt!106205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5119 () Bool)

(assert (= bs!5119 d!21098))

(declare-fun m!106639 () Bool)

(assert (=> bs!5119 m!106639))

(declare-fun m!106641 () Bool)

(assert (=> bs!5119 m!106641))

(assert (=> b!66793 d!21098))

(declare-fun d!21100 () Bool)

(assert (=> d!21100 (= (bitAt!0 (buf!1701 (_1!3059 lt!106204)) lt!106205) (not (= (bvand ((_ sign_extend 24) (select (arr!1887 (buf!1701 (_1!3059 lt!106204))) ((_ extract 31 0) (bvsdiv lt!106205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5120 () Bool)

(assert (= bs!5120 d!21100))

(declare-fun m!106643 () Bool)

(assert (=> bs!5120 m!106643))

(assert (=> bs!5120 m!106641))

(assert (=> b!66793 d!21100))

(declare-fun d!21102 () Bool)

(assert (=> d!21102 (= (bitAt!0 (buf!1701 (_2!3060 lt!106197)) lt!106205) (not (= (bvand ((_ sign_extend 24) (select (arr!1887 (buf!1701 (_2!3060 lt!106197))) ((_ extract 31 0) (bvsdiv lt!106205 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!106205 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5121 () Bool)

(assert (= bs!5121 d!21102))

(declare-fun m!106645 () Bool)

(assert (=> bs!5121 m!106645))

(assert (=> bs!5121 m!106641))

(assert (=> b!66802 d!21102))

(declare-fun d!21104 () Bool)

(declare-fun e!43950 () Bool)

(assert (=> d!21104 e!43950))

(declare-fun res!55521 () Bool)

(assert (=> d!21104 (=> (not res!55521) (not e!43950))))

(declare-fun lt!106644 () (_ BitVec 64))

(declare-fun lt!106648 () (_ BitVec 64))

(declare-fun lt!106647 () (_ BitVec 64))

(assert (=> d!21104 (= res!55521 (= lt!106644 (bvsub lt!106647 lt!106648)))))

(assert (=> d!21104 (or (= (bvand lt!106647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106648 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106647 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106647 lt!106648) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21104 (= lt!106648 (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197)))))))

(declare-fun lt!106646 () (_ BitVec 64))

(declare-fun lt!106643 () (_ BitVec 64))

(assert (=> d!21104 (= lt!106647 (bvmul lt!106646 lt!106643))))

(assert (=> d!21104 (or (= lt!106646 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!106643 (bvsdiv (bvmul lt!106646 lt!106643) lt!106646)))))

(assert (=> d!21104 (= lt!106643 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21104 (= lt!106646 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))))))

(assert (=> d!21104 (= lt!106644 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197)))))))

(assert (=> d!21104 (invariant!0 (currentBit!3374 (_2!3060 lt!106197)) (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106197))))))

(assert (=> d!21104 (= (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))) lt!106644)))

(declare-fun b!67016 () Bool)

(declare-fun res!55522 () Bool)

(assert (=> b!67016 (=> (not res!55522) (not e!43950))))

(assert (=> b!67016 (= res!55522 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!106644))))

(declare-fun b!67017 () Bool)

(declare-fun lt!106645 () (_ BitVec 64))

(assert (=> b!67017 (= e!43950 (bvsle lt!106644 (bvmul lt!106645 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67017 (or (= lt!106645 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106645 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106645)))))

(assert (=> b!67017 (= lt!106645 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))))))

(assert (= (and d!21104 res!55521) b!67016))

(assert (= (and b!67016 res!55522) b!67017))

(declare-fun m!106647 () Bool)

(assert (=> d!21104 m!106647))

(assert (=> d!21104 m!106283))

(assert (=> b!66811 d!21104))

(declare-fun d!21106 () Bool)

(declare-fun e!43951 () Bool)

(assert (=> d!21106 e!43951))

(declare-fun res!55523 () Bool)

(assert (=> d!21106 (=> (not res!55523) (not e!43951))))

(declare-fun lt!106653 () (_ BitVec 64))

(declare-fun lt!106650 () (_ BitVec 64))

(declare-fun lt!106654 () (_ BitVec 64))

(assert (=> d!21106 (= res!55523 (= lt!106650 (bvsub lt!106653 lt!106654)))))

(assert (=> d!21106 (or (= (bvand lt!106653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106653 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106653 lt!106654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21106 (= lt!106654 (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106208))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106208)))))))

(declare-fun lt!106652 () (_ BitVec 64))

(declare-fun lt!106649 () (_ BitVec 64))

(assert (=> d!21106 (= lt!106653 (bvmul lt!106652 lt!106649))))

(assert (=> d!21106 (or (= lt!106652 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!106649 (bvsdiv (bvmul lt!106652 lt!106649) lt!106652)))))

(assert (=> d!21106 (= lt!106649 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21106 (= lt!106652 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))))))

(assert (=> d!21106 (= lt!106650 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106208))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106208)))))))

(assert (=> d!21106 (invariant!0 (currentBit!3374 (_2!3060 lt!106208)) (currentByte!3379 (_2!3060 lt!106208)) (size!1320 (buf!1701 (_2!3060 lt!106208))))))

(assert (=> d!21106 (= (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106208))) (currentByte!3379 (_2!3060 lt!106208)) (currentBit!3374 (_2!3060 lt!106208))) lt!106650)))

(declare-fun b!67018 () Bool)

(declare-fun res!55524 () Bool)

(assert (=> b!67018 (=> (not res!55524) (not e!43951))))

(assert (=> b!67018 (= res!55524 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!106650))))

(declare-fun b!67019 () Bool)

(declare-fun lt!106651 () (_ BitVec 64))

(assert (=> b!67019 (= e!43951 (bvsle lt!106650 (bvmul lt!106651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67019 (or (= lt!106651 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106651 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106651)))))

(assert (=> b!67019 (= lt!106651 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))))))

(assert (= (and d!21106 res!55523) b!67018))

(assert (= (and b!67018 res!55524) b!67019))

(declare-fun m!106649 () Bool)

(assert (=> d!21106 m!106649))

(assert (=> d!21106 m!106329))

(assert (=> b!66801 d!21106))

(declare-fun d!21108 () Bool)

(assert (=> d!21108 (= (invariant!0 (currentBit!3374 (_2!3060 lt!106208)) (currentByte!3379 (_2!3060 lt!106208)) (size!1320 (buf!1701 (_2!3060 lt!106208)))) (and (bvsge (currentBit!3374 (_2!3060 lt!106208)) #b00000000000000000000000000000000) (bvslt (currentBit!3374 (_2!3060 lt!106208)) #b00000000000000000000000000001000) (bvsge (currentByte!3379 (_2!3060 lt!106208)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3379 (_2!3060 lt!106208)) (size!1320 (buf!1701 (_2!3060 lt!106208)))) (and (= (currentBit!3374 (_2!3060 lt!106208)) #b00000000000000000000000000000000) (= (currentByte!3379 (_2!3060 lt!106208)) (size!1320 (buf!1701 (_2!3060 lt!106208))))))))))

(assert (=> b!66799 d!21108))

(declare-fun d!21110 () Bool)

(assert (=> d!21110 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 thiss!1379))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 thiss!1379))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5122 () Bool)

(assert (= bs!5122 d!21110))

(declare-fun m!106651 () Bool)

(assert (=> bs!5122 m!106651))

(assert (=> b!66810 d!21110))

(declare-fun d!21112 () Bool)

(declare-fun size!1322 (List!709) Int)

(assert (=> d!21112 (= (length!337 lt!106212) (size!1322 lt!106212))))

(declare-fun bs!5123 () Bool)

(assert (= bs!5123 d!21112))

(declare-fun m!106653 () Bool)

(assert (=> bs!5123 m!106653))

(assert (=> b!66800 d!21112))

(declare-fun d!21114 () Bool)

(assert (=> d!21114 (= (array_inv!1193 (buf!1701 thiss!1379)) (bvsge (size!1320 (buf!1701 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!66798 d!21114))

(declare-fun d!21116 () Bool)

(declare-fun res!55527 () Bool)

(declare-fun e!43953 () Bool)

(assert (=> d!21116 (=> (not res!55527) (not e!43953))))

(assert (=> d!21116 (= res!55527 (= (size!1320 (buf!1701 thiss!1379)) (size!1320 (buf!1701 thiss!1379))))))

(assert (=> d!21116 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!43953)))

(declare-fun b!67020 () Bool)

(declare-fun res!55526 () Bool)

(assert (=> b!67020 (=> (not res!55526) (not e!43953))))

(assert (=> b!67020 (= res!55526 (bvsle (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)) (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379))))))

(declare-fun b!67021 () Bool)

(declare-fun e!43952 () Bool)

(assert (=> b!67021 (= e!43953 e!43952)))

(declare-fun res!55525 () Bool)

(assert (=> b!67021 (=> res!55525 e!43952)))

(assert (=> b!67021 (= res!55525 (= (size!1320 (buf!1701 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67022 () Bool)

(assert (=> b!67022 (= e!43952 (arrayBitRangesEq!0 (buf!1701 thiss!1379) (buf!1701 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379))))))

(assert (= (and d!21116 res!55527) b!67020))

(assert (= (and b!67020 res!55526) b!67021))

(assert (= (and b!67021 (not res!55525)) b!67022))

(assert (=> b!67020 m!106313))

(assert (=> b!67020 m!106313))

(assert (=> b!67022 m!106313))

(assert (=> b!67022 m!106313))

(declare-fun m!106655 () Bool)

(assert (=> b!67022 m!106655))

(assert (=> b!66809 d!21116))

(declare-fun d!21118 () Bool)

(assert (=> d!21118 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!106657 () Unit!4501)

(declare-fun choose!11 (BitStream!2268) Unit!4501)

(assert (=> d!21118 (= lt!106657 (choose!11 thiss!1379))))

(assert (=> d!21118 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!106657)))

(declare-fun bs!5125 () Bool)

(assert (= bs!5125 d!21118))

(assert (=> bs!5125 m!106309))

(declare-fun m!106657 () Bool)

(assert (=> bs!5125 m!106657))

(assert (=> b!66809 d!21118))

(declare-fun d!21120 () Bool)

(declare-fun e!43954 () Bool)

(assert (=> d!21120 e!43954))

(declare-fun res!55528 () Bool)

(assert (=> d!21120 (=> (not res!55528) (not e!43954))))

(declare-fun lt!106659 () (_ BitVec 64))

(declare-fun lt!106663 () (_ BitVec 64))

(declare-fun lt!106662 () (_ BitVec 64))

(assert (=> d!21120 (= res!55528 (= lt!106659 (bvsub lt!106662 lt!106663)))))

(assert (=> d!21120 (or (= (bvand lt!106662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106663 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106662 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106662 lt!106663) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!21120 (= lt!106663 (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 thiss!1379))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379))))))

(declare-fun lt!106661 () (_ BitVec 64))

(declare-fun lt!106658 () (_ BitVec 64))

(assert (=> d!21120 (= lt!106662 (bvmul lt!106661 lt!106658))))

(assert (=> d!21120 (or (= lt!106661 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!106658 (bvsdiv (bvmul lt!106661 lt!106658) lt!106661)))))

(assert (=> d!21120 (= lt!106658 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!21120 (= lt!106661 ((_ sign_extend 32) (size!1320 (buf!1701 thiss!1379))))))

(assert (=> d!21120 (= lt!106659 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3379 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3374 thiss!1379))))))

(assert (=> d!21120 (invariant!0 (currentBit!3374 thiss!1379) (currentByte!3379 thiss!1379) (size!1320 (buf!1701 thiss!1379)))))

(assert (=> d!21120 (= (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)) lt!106659)))

(declare-fun b!67023 () Bool)

(declare-fun res!55529 () Bool)

(assert (=> b!67023 (=> (not res!55529) (not e!43954))))

(assert (=> b!67023 (= res!55529 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!106659))))

(declare-fun b!67024 () Bool)

(declare-fun lt!106660 () (_ BitVec 64))

(assert (=> b!67024 (= e!43954 (bvsle lt!106659 (bvmul lt!106660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!67024 (or (= lt!106660 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!106660 #b0000000000000000000000000000000000000000000000000000000000001000) lt!106660)))))

(assert (=> b!67024 (= lt!106660 ((_ sign_extend 32) (size!1320 (buf!1701 thiss!1379))))))

(assert (= (and d!21120 res!55528) b!67023))

(assert (= (and b!67023 res!55529) b!67024))

(assert (=> d!21120 m!106651))

(declare-fun m!106659 () Bool)

(assert (=> d!21120 m!106659))

(assert (=> b!66809 d!21120))

(declare-fun d!21122 () Bool)

(assert (=> d!21122 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106210)))

(declare-fun lt!106664 () Unit!4501)

(assert (=> d!21122 (= lt!106664 (choose!9 (_2!3060 lt!106197) (buf!1701 (_2!3060 lt!106208)) lt!106210 (BitStream!2269 (buf!1701 (_2!3060 lt!106208)) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197)))))))

(assert (=> d!21122 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3060 lt!106197) (buf!1701 (_2!3060 lt!106208)) lt!106210) lt!106664)))

(declare-fun bs!5126 () Bool)

(assert (= bs!5126 d!21122))

(assert (=> bs!5126 m!106261))

(declare-fun m!106661 () Bool)

(assert (=> bs!5126 m!106661))

(assert (=> b!66807 d!21122))

(declare-fun b!67028 () Bool)

(declare-fun e!43955 () Bool)

(declare-fun lt!106667 () List!709)

(assert (=> b!67028 (= e!43955 (> (length!337 lt!106667) 0))))

(declare-fun e!43956 () tuple2!5904)

(declare-fun lt!106665 () (_ BitVec 64))

(declare-fun b!67026 () Bool)

(declare-fun lt!106666 () tuple2!5906)

(assert (=> b!67026 (= e!43956 (tuple2!5905 (Cons!705 (_1!3064 lt!106666) (bitStreamReadBitsIntoList!0 (_2!3060 lt!106208) (_2!3064 lt!106666) (bvsub (bvsub to!314 i!635) lt!106665))) (_2!3064 lt!106666)))))

(assert (=> b!67026 (= lt!106666 (readBit!0 (_1!3059 lt!106204)))))

(assert (=> b!67026 (= lt!106665 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67025 () Bool)

(assert (=> b!67025 (= e!43956 (tuple2!5905 Nil!706 (_1!3059 lt!106204)))))

(declare-fun d!21124 () Bool)

(assert (=> d!21124 e!43955))

(declare-fun c!4879 () Bool)

(assert (=> d!21124 (= c!4879 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21124 (= lt!106667 (_1!3063 e!43956))))

(declare-fun c!4880 () Bool)

(assert (=> d!21124 (= c!4880 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21124 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21124 (= (bitStreamReadBitsIntoList!0 (_2!3060 lt!106208) (_1!3059 lt!106204) (bvsub to!314 i!635)) lt!106667)))

(declare-fun b!67027 () Bool)

(assert (=> b!67027 (= e!43955 (isEmpty!210 lt!106667))))

(assert (= (and d!21124 c!4880) b!67025))

(assert (= (and d!21124 (not c!4880)) b!67026))

(assert (= (and d!21124 c!4879) b!67027))

(assert (= (and d!21124 (not c!4879)) b!67028))

(declare-fun m!106663 () Bool)

(assert (=> b!67028 m!106663))

(declare-fun m!106665 () Bool)

(assert (=> b!67026 m!106665))

(declare-fun m!106667 () Bool)

(assert (=> b!67026 m!106667))

(declare-fun m!106669 () Bool)

(assert (=> b!67027 m!106669))

(assert (=> b!66807 d!21124))

(declare-fun d!21126 () Bool)

(assert (=> d!21126 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!106668 () Unit!4501)

(assert (=> d!21126 (= lt!106668 (choose!9 thiss!1379 (buf!1701 (_2!3060 lt!106208)) (bvsub to!314 i!635) (BitStream!2269 (buf!1701 (_2!3060 lt!106208)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379))))))

(assert (=> d!21126 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1701 (_2!3060 lt!106208)) (bvsub to!314 i!635)) lt!106668)))

(declare-fun bs!5127 () Bool)

(assert (= bs!5127 d!21126))

(assert (=> bs!5127 m!106259))

(declare-fun m!106671 () Bool)

(assert (=> bs!5127 m!106671))

(assert (=> b!66807 d!21126))

(declare-fun d!21128 () Bool)

(assert (=> d!21128 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106210) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197)))) lt!106210))))

(declare-fun bs!5128 () Bool)

(assert (= bs!5128 d!21128))

(declare-fun m!106673 () Bool)

(assert (=> bs!5128 m!106673))

(assert (=> b!66807 d!21128))

(declare-fun b!67029 () Bool)

(declare-fun e!43957 () Unit!4501)

(declare-fun Unit!4513 () Unit!4501)

(assert (=> b!67029 (= e!43957 Unit!4513)))

(declare-fun b!67030 () Bool)

(declare-fun res!55531 () Bool)

(declare-fun e!43958 () Bool)

(assert (=> b!67030 (=> (not res!55531) (not e!43958))))

(declare-fun lt!106685 () tuple2!5896)

(assert (=> b!67030 (= res!55531 (isPrefixOf!0 (_2!3059 lt!106685) (_2!3060 lt!106208)))))

(declare-fun d!21130 () Bool)

(assert (=> d!21130 e!43958))

(declare-fun res!55532 () Bool)

(assert (=> d!21130 (=> (not res!55532) (not e!43958))))

(assert (=> d!21130 (= res!55532 (isPrefixOf!0 (_1!3059 lt!106685) (_2!3059 lt!106685)))))

(declare-fun lt!106675 () BitStream!2268)

(assert (=> d!21130 (= lt!106685 (tuple2!5897 lt!106675 (_2!3060 lt!106208)))))

(declare-fun lt!106687 () Unit!4501)

(declare-fun lt!106680 () Unit!4501)

(assert (=> d!21130 (= lt!106687 lt!106680)))

(assert (=> d!21130 (isPrefixOf!0 lt!106675 (_2!3060 lt!106208))))

(assert (=> d!21130 (= lt!106680 (lemmaIsPrefixTransitive!0 lt!106675 (_2!3060 lt!106208) (_2!3060 lt!106208)))))

(declare-fun lt!106679 () Unit!4501)

(declare-fun lt!106671 () Unit!4501)

(assert (=> d!21130 (= lt!106679 lt!106671)))

(assert (=> d!21130 (isPrefixOf!0 lt!106675 (_2!3060 lt!106208))))

(assert (=> d!21130 (= lt!106671 (lemmaIsPrefixTransitive!0 lt!106675 (_2!3060 lt!106197) (_2!3060 lt!106208)))))

(declare-fun lt!106688 () Unit!4501)

(assert (=> d!21130 (= lt!106688 e!43957)))

(declare-fun c!4881 () Bool)

(assert (=> d!21130 (= c!4881 (not (= (size!1320 (buf!1701 (_2!3060 lt!106197))) #b00000000000000000000000000000000)))))

(declare-fun lt!106684 () Unit!4501)

(declare-fun lt!106674 () Unit!4501)

(assert (=> d!21130 (= lt!106684 lt!106674)))

(assert (=> d!21130 (isPrefixOf!0 (_2!3060 lt!106208) (_2!3060 lt!106208))))

(assert (=> d!21130 (= lt!106674 (lemmaIsPrefixRefl!0 (_2!3060 lt!106208)))))

(declare-fun lt!106672 () Unit!4501)

(declare-fun lt!106683 () Unit!4501)

(assert (=> d!21130 (= lt!106672 lt!106683)))

(assert (=> d!21130 (= lt!106683 (lemmaIsPrefixRefl!0 (_2!3060 lt!106208)))))

(declare-fun lt!106677 () Unit!4501)

(declare-fun lt!106670 () Unit!4501)

(assert (=> d!21130 (= lt!106677 lt!106670)))

(assert (=> d!21130 (isPrefixOf!0 lt!106675 lt!106675)))

(assert (=> d!21130 (= lt!106670 (lemmaIsPrefixRefl!0 lt!106675))))

(declare-fun lt!106686 () Unit!4501)

(declare-fun lt!106669 () Unit!4501)

(assert (=> d!21130 (= lt!106686 lt!106669)))

(assert (=> d!21130 (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106197))))

(assert (=> d!21130 (= lt!106669 (lemmaIsPrefixRefl!0 (_2!3060 lt!106197)))))

(assert (=> d!21130 (= lt!106675 (BitStream!2269 (buf!1701 (_2!3060 lt!106208)) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))))))

(assert (=> d!21130 (isPrefixOf!0 (_2!3060 lt!106197) (_2!3060 lt!106208))))

(assert (=> d!21130 (= (reader!0 (_2!3060 lt!106197) (_2!3060 lt!106208)) lt!106685)))

(declare-fun lt!106678 () (_ BitVec 64))

(declare-fun b!67031 () Bool)

(declare-fun lt!106681 () (_ BitVec 64))

(assert (=> b!67031 (= e!43958 (= (_1!3059 lt!106685) (withMovedBitIndex!0 (_2!3059 lt!106685) (bvsub lt!106681 lt!106678))))))

(assert (=> b!67031 (or (= (bvand lt!106681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106678 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106681 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106681 lt!106678) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67031 (= lt!106678 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106208))) (currentByte!3379 (_2!3060 lt!106208)) (currentBit!3374 (_2!3060 lt!106208))))))

(assert (=> b!67031 (= lt!106681 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))))))

(declare-fun b!67032 () Bool)

(declare-fun res!55530 () Bool)

(assert (=> b!67032 (=> (not res!55530) (not e!43958))))

(assert (=> b!67032 (= res!55530 (isPrefixOf!0 (_1!3059 lt!106685) (_2!3060 lt!106197)))))

(declare-fun b!67033 () Bool)

(declare-fun lt!106682 () Unit!4501)

(assert (=> b!67033 (= e!43957 lt!106682)))

(declare-fun lt!106673 () (_ BitVec 64))

(assert (=> b!67033 (= lt!106673 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106676 () (_ BitVec 64))

(assert (=> b!67033 (= lt!106676 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197))))))

(assert (=> b!67033 (= lt!106682 (arrayBitRangesEqSymmetric!0 (buf!1701 (_2!3060 lt!106197)) (buf!1701 (_2!3060 lt!106208)) lt!106673 lt!106676))))

(assert (=> b!67033 (arrayBitRangesEq!0 (buf!1701 (_2!3060 lt!106208)) (buf!1701 (_2!3060 lt!106197)) lt!106673 lt!106676)))

(assert (= (and d!21130 c!4881) b!67033))

(assert (= (and d!21130 (not c!4881)) b!67029))

(assert (= (and d!21130 res!55532) b!67032))

(assert (= (and b!67032 res!55530) b!67030))

(assert (= (and b!67030 res!55531) b!67031))

(declare-fun m!106675 () Bool)

(assert (=> b!67031 m!106675))

(assert (=> b!67031 m!106299))

(assert (=> b!67031 m!106241))

(declare-fun m!106677 () Bool)

(assert (=> b!67032 m!106677))

(assert (=> b!67033 m!106241))

(declare-fun m!106679 () Bool)

(assert (=> b!67033 m!106679))

(declare-fun m!106681 () Bool)

(assert (=> b!67033 m!106681))

(declare-fun m!106683 () Bool)

(assert (=> b!67030 m!106683))

(declare-fun m!106685 () Bool)

(assert (=> d!21130 m!106685))

(declare-fun m!106687 () Bool)

(assert (=> d!21130 m!106687))

(declare-fun m!106689 () Bool)

(assert (=> d!21130 m!106689))

(declare-fun m!106691 () Bool)

(assert (=> d!21130 m!106691))

(declare-fun m!106693 () Bool)

(assert (=> d!21130 m!106693))

(declare-fun m!106695 () Bool)

(assert (=> d!21130 m!106695))

(declare-fun m!106697 () Bool)

(assert (=> d!21130 m!106697))

(assert (=> d!21130 m!106537))

(assert (=> d!21130 m!106539))

(assert (=> d!21130 m!106281))

(declare-fun m!106699 () Bool)

(assert (=> d!21130 m!106699))

(assert (=> b!66807 d!21130))

(declare-fun d!21132 () Bool)

(assert (=> d!21132 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106208)))) ((_ sign_extend 32) (currentByte!3379 thiss!1379)) ((_ sign_extend 32) (currentBit!3374 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5129 () Bool)

(assert (= bs!5129 d!21132))

(declare-fun m!106701 () Bool)

(assert (=> bs!5129 m!106701))

(assert (=> b!66807 d!21132))

(declare-fun b!67034 () Bool)

(declare-fun e!43959 () Unit!4501)

(declare-fun Unit!4514 () Unit!4501)

(assert (=> b!67034 (= e!43959 Unit!4514)))

(declare-fun b!67035 () Bool)

(declare-fun res!55534 () Bool)

(declare-fun e!43960 () Bool)

(assert (=> b!67035 (=> (not res!55534) (not e!43960))))

(declare-fun lt!106705 () tuple2!5896)

(assert (=> b!67035 (= res!55534 (isPrefixOf!0 (_2!3059 lt!106705) (_2!3060 lt!106208)))))

(declare-fun d!21134 () Bool)

(assert (=> d!21134 e!43960))

(declare-fun res!55535 () Bool)

(assert (=> d!21134 (=> (not res!55535) (not e!43960))))

(assert (=> d!21134 (= res!55535 (isPrefixOf!0 (_1!3059 lt!106705) (_2!3059 lt!106705)))))

(declare-fun lt!106695 () BitStream!2268)

(assert (=> d!21134 (= lt!106705 (tuple2!5897 lt!106695 (_2!3060 lt!106208)))))

(declare-fun lt!106707 () Unit!4501)

(declare-fun lt!106700 () Unit!4501)

(assert (=> d!21134 (= lt!106707 lt!106700)))

(assert (=> d!21134 (isPrefixOf!0 lt!106695 (_2!3060 lt!106208))))

(assert (=> d!21134 (= lt!106700 (lemmaIsPrefixTransitive!0 lt!106695 (_2!3060 lt!106208) (_2!3060 lt!106208)))))

(declare-fun lt!106699 () Unit!4501)

(declare-fun lt!106691 () Unit!4501)

(assert (=> d!21134 (= lt!106699 lt!106691)))

(assert (=> d!21134 (isPrefixOf!0 lt!106695 (_2!3060 lt!106208))))

(assert (=> d!21134 (= lt!106691 (lemmaIsPrefixTransitive!0 lt!106695 thiss!1379 (_2!3060 lt!106208)))))

(declare-fun lt!106708 () Unit!4501)

(assert (=> d!21134 (= lt!106708 e!43959)))

(declare-fun c!4882 () Bool)

(assert (=> d!21134 (= c!4882 (not (= (size!1320 (buf!1701 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!106704 () Unit!4501)

(declare-fun lt!106694 () Unit!4501)

(assert (=> d!21134 (= lt!106704 lt!106694)))

(assert (=> d!21134 (isPrefixOf!0 (_2!3060 lt!106208) (_2!3060 lt!106208))))

(assert (=> d!21134 (= lt!106694 (lemmaIsPrefixRefl!0 (_2!3060 lt!106208)))))

(declare-fun lt!106692 () Unit!4501)

(declare-fun lt!106703 () Unit!4501)

(assert (=> d!21134 (= lt!106692 lt!106703)))

(assert (=> d!21134 (= lt!106703 (lemmaIsPrefixRefl!0 (_2!3060 lt!106208)))))

(declare-fun lt!106697 () Unit!4501)

(declare-fun lt!106690 () Unit!4501)

(assert (=> d!21134 (= lt!106697 lt!106690)))

(assert (=> d!21134 (isPrefixOf!0 lt!106695 lt!106695)))

(assert (=> d!21134 (= lt!106690 (lemmaIsPrefixRefl!0 lt!106695))))

(declare-fun lt!106706 () Unit!4501)

(declare-fun lt!106689 () Unit!4501)

(assert (=> d!21134 (= lt!106706 lt!106689)))

(assert (=> d!21134 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!21134 (= lt!106689 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!21134 (= lt!106695 (BitStream!2269 (buf!1701 (_2!3060 lt!106208)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(assert (=> d!21134 (isPrefixOf!0 thiss!1379 (_2!3060 lt!106208))))

(assert (=> d!21134 (= (reader!0 thiss!1379 (_2!3060 lt!106208)) lt!106705)))

(declare-fun lt!106701 () (_ BitVec 64))

(declare-fun b!67036 () Bool)

(declare-fun lt!106698 () (_ BitVec 64))

(assert (=> b!67036 (= e!43960 (= (_1!3059 lt!106705) (withMovedBitIndex!0 (_2!3059 lt!106705) (bvsub lt!106701 lt!106698))))))

(assert (=> b!67036 (or (= (bvand lt!106701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106698 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!106701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!106701 lt!106698) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67036 (= lt!106698 (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106208))) (currentByte!3379 (_2!3060 lt!106208)) (currentBit!3374 (_2!3060 lt!106208))))))

(assert (=> b!67036 (= lt!106701 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(declare-fun b!67037 () Bool)

(declare-fun res!55533 () Bool)

(assert (=> b!67037 (=> (not res!55533) (not e!43960))))

(assert (=> b!67037 (= res!55533 (isPrefixOf!0 (_1!3059 lt!106705) thiss!1379))))

(declare-fun b!67038 () Bool)

(declare-fun lt!106702 () Unit!4501)

(assert (=> b!67038 (= e!43959 lt!106702)))

(declare-fun lt!106693 () (_ BitVec 64))

(assert (=> b!67038 (= lt!106693 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!106696 () (_ BitVec 64))

(assert (=> b!67038 (= lt!106696 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(assert (=> b!67038 (= lt!106702 (arrayBitRangesEqSymmetric!0 (buf!1701 thiss!1379) (buf!1701 (_2!3060 lt!106208)) lt!106693 lt!106696))))

(assert (=> b!67038 (arrayBitRangesEq!0 (buf!1701 (_2!3060 lt!106208)) (buf!1701 thiss!1379) lt!106693 lt!106696)))

(assert (= (and d!21134 c!4882) b!67038))

(assert (= (and d!21134 (not c!4882)) b!67034))

(assert (= (and d!21134 res!55535) b!67037))

(assert (= (and b!67037 res!55533) b!67035))

(assert (= (and b!67035 res!55534) b!67036))

(declare-fun m!106703 () Bool)

(assert (=> b!67036 m!106703))

(assert (=> b!67036 m!106299))

(assert (=> b!67036 m!106313))

(declare-fun m!106705 () Bool)

(assert (=> b!67037 m!106705))

(assert (=> b!67038 m!106313))

(declare-fun m!106707 () Bool)

(assert (=> b!67038 m!106707))

(declare-fun m!106709 () Bool)

(assert (=> b!67038 m!106709))

(declare-fun m!106711 () Bool)

(assert (=> b!67035 m!106711))

(declare-fun m!106713 () Bool)

(assert (=> d!21134 m!106713))

(declare-fun m!106715 () Bool)

(assert (=> d!21134 m!106715))

(declare-fun m!106717 () Bool)

(assert (=> d!21134 m!106717))

(assert (=> d!21134 m!106691))

(declare-fun m!106719 () Bool)

(assert (=> d!21134 m!106719))

(declare-fun m!106721 () Bool)

(assert (=> d!21134 m!106721))

(declare-fun m!106723 () Bool)

(assert (=> d!21134 m!106723))

(assert (=> d!21134 m!106309))

(assert (=> d!21134 m!106311))

(assert (=> d!21134 m!106271))

(assert (=> d!21134 m!106699))

(assert (=> b!66807 d!21134))

(declare-fun b!67042 () Bool)

(declare-fun e!43961 () Bool)

(declare-fun lt!106711 () List!709)

(assert (=> b!67042 (= e!43961 (> (length!337 lt!106711) 0))))

(declare-fun b!67040 () Bool)

(declare-fun lt!106710 () tuple2!5906)

(declare-fun e!43962 () tuple2!5904)

(declare-fun lt!106709 () (_ BitVec 64))

(assert (=> b!67040 (= e!43962 (tuple2!5905 (Cons!705 (_1!3064 lt!106710) (bitStreamReadBitsIntoList!0 (_2!3060 lt!106208) (_2!3064 lt!106710) (bvsub lt!106210 lt!106709))) (_2!3064 lt!106710)))))

(assert (=> b!67040 (= lt!106710 (readBit!0 (_1!3059 lt!106213)))))

(assert (=> b!67040 (= lt!106709 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!67039 () Bool)

(assert (=> b!67039 (= e!43962 (tuple2!5905 Nil!706 (_1!3059 lt!106213)))))

(declare-fun d!21136 () Bool)

(assert (=> d!21136 e!43961))

(declare-fun c!4883 () Bool)

(assert (=> d!21136 (= c!4883 (= lt!106210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21136 (= lt!106711 (_1!3063 e!43962))))

(declare-fun c!4884 () Bool)

(assert (=> d!21136 (= c!4884 (= lt!106210 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!21136 (bvsge lt!106210 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21136 (= (bitStreamReadBitsIntoList!0 (_2!3060 lt!106208) (_1!3059 lt!106213) lt!106210) lt!106711)))

(declare-fun b!67041 () Bool)

(assert (=> b!67041 (= e!43961 (isEmpty!210 lt!106711))))

(assert (= (and d!21136 c!4884) b!67039))

(assert (= (and d!21136 (not c!4884)) b!67040))

(assert (= (and d!21136 c!4883) b!67041))

(assert (= (and d!21136 (not c!4883)) b!67042))

(declare-fun m!106725 () Bool)

(assert (=> b!67042 m!106725))

(declare-fun m!106727 () Bool)

(assert (=> b!67040 m!106727))

(declare-fun m!106729 () Bool)

(assert (=> b!67040 m!106729))

(declare-fun m!106731 () Bool)

(assert (=> b!67041 m!106731))

(assert (=> b!66807 d!21136))

(declare-fun d!21138 () Bool)

(assert (=> d!21138 (= (array_inv!1193 srcBuffer!2) (bvsge (size!1320 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13010 d!21138))

(declare-fun d!21140 () Bool)

(assert (=> d!21140 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3374 thiss!1379) (currentByte!3379 thiss!1379) (size!1320 (buf!1701 thiss!1379))))))

(declare-fun bs!5130 () Bool)

(assert (= bs!5130 d!21140))

(assert (=> bs!5130 m!106659))

(assert (=> start!13010 d!21140))

(declare-fun d!21142 () Bool)

(assert (=> d!21142 (= (head!528 (byteArrayBitContentToList!0 (_2!3060 lt!106208) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!824 (byteArrayBitContentToList!0 (_2!3060 lt!106208) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!66797 d!21142))

(declare-fun d!21144 () Bool)

(declare-fun c!4885 () Bool)

(assert (=> d!21144 (= c!4885 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!43963 () List!709)

(assert (=> d!21144 (= (byteArrayBitContentToList!0 (_2!3060 lt!106208) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!43963)))

(declare-fun b!67043 () Bool)

(assert (=> b!67043 (= e!43963 Nil!706)))

(declare-fun b!67044 () Bool)

(assert (=> b!67044 (= e!43963 (Cons!705 (not (= (bvand ((_ sign_extend 24) (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3060 lt!106208) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!21144 c!4885) b!67043))

(assert (= (and d!21144 (not c!4885)) b!67044))

(assert (=> b!67044 m!106319))

(assert (=> b!67044 m!106423))

(declare-fun m!106733 () Bool)

(assert (=> b!67044 m!106733))

(assert (=> b!66797 d!21144))

(declare-fun d!21146 () Bool)

(assert (=> d!21146 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5131 () Bool)

(assert (= bs!5131 d!21146))

(assert (=> bs!5131 m!106319))

(assert (=> bs!5131 m!106423))

(assert (=> b!66797 d!21146))

(declare-fun d!21148 () Bool)

(declare-fun res!55538 () Bool)

(declare-fun e!43965 () Bool)

(assert (=> d!21148 (=> (not res!55538) (not e!43965))))

(assert (=> d!21148 (= res!55538 (= (size!1320 (buf!1701 thiss!1379)) (size!1320 (buf!1701 (_2!3060 lt!106197)))))))

(assert (=> d!21148 (= (isPrefixOf!0 thiss!1379 (_2!3060 lt!106197)) e!43965)))

(declare-fun b!67045 () Bool)

(declare-fun res!55537 () Bool)

(assert (=> b!67045 (=> (not res!55537) (not e!43965))))

(assert (=> b!67045 (= res!55537 (bvsle (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)) (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106197))) (currentByte!3379 (_2!3060 lt!106197)) (currentBit!3374 (_2!3060 lt!106197)))))))

(declare-fun b!67046 () Bool)

(declare-fun e!43964 () Bool)

(assert (=> b!67046 (= e!43965 e!43964)))

(declare-fun res!55536 () Bool)

(assert (=> b!67046 (=> res!55536 e!43964)))

(assert (=> b!67046 (= res!55536 (= (size!1320 (buf!1701 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!67047 () Bool)

(assert (=> b!67047 (= e!43964 (arrayBitRangesEq!0 (buf!1701 thiss!1379) (buf!1701 (_2!3060 lt!106197)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379))))))

(assert (= (and d!21148 res!55538) b!67045))

(assert (= (and b!67045 res!55537) b!67046))

(assert (= (and b!67046 (not res!55536)) b!67047))

(assert (=> b!67045 m!106313))

(assert (=> b!67045 m!106241))

(assert (=> b!67047 m!106313))

(assert (=> b!67047 m!106313))

(declare-fun m!106735 () Bool)

(assert (=> b!67047 m!106735))

(assert (=> b!66808 d!21148))

(declare-fun d!21150 () Bool)

(assert (=> d!21150 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) lt!106210) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197)))) lt!106210))))

(declare-fun bs!5132 () Bool)

(assert (= bs!5132 d!21150))

(assert (=> bs!5132 m!106647))

(assert (=> b!66808 d!21150))

(declare-fun d!21152 () Bool)

(declare-fun e!43968 () Bool)

(assert (=> d!21152 e!43968))

(declare-fun res!55541 () Bool)

(assert (=> d!21152 (=> (not res!55541) (not e!43968))))

(assert (=> d!21152 (= res!55541 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!106714 () Unit!4501)

(declare-fun choose!27 (BitStream!2268 BitStream!2268 (_ BitVec 64) (_ BitVec 64)) Unit!4501)

(assert (=> d!21152 (= lt!106714 (choose!27 thiss!1379 (_2!3060 lt!106197) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!21152 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!21152 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3060 lt!106197) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!106714)))

(declare-fun b!67050 () Bool)

(assert (=> b!67050 (= e!43968 (validate_offset_bits!1 ((_ sign_extend 32) (size!1320 (buf!1701 (_2!3060 lt!106197)))) ((_ sign_extend 32) (currentByte!3379 (_2!3060 lt!106197))) ((_ sign_extend 32) (currentBit!3374 (_2!3060 lt!106197))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!21152 res!55541) b!67050))

(declare-fun m!106737 () Bool)

(assert (=> d!21152 m!106737))

(declare-fun m!106739 () Bool)

(assert (=> b!67050 m!106739))

(assert (=> b!66808 d!21152))

(declare-fun b!67068 () Bool)

(declare-fun e!43979 () Bool)

(declare-fun e!43977 () Bool)

(assert (=> b!67068 (= e!43979 e!43977)))

(declare-fun res!55563 () Bool)

(assert (=> b!67068 (=> (not res!55563) (not e!43977))))

(declare-datatypes ((tuple2!5910 0))(
  ( (tuple2!5911 (_1!3066 BitStream!2268) (_2!3066 Bool)) )
))
(declare-fun lt!106747 () tuple2!5910)

(declare-fun lt!106741 () tuple2!5898)

(declare-fun lt!106742 () (_ BitVec 8))

(assert (=> b!67068 (= res!55563 (and (= (_2!3066 lt!106747) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!106742)) #b00000000000000000000000000000000))) (= (_1!3066 lt!106747) (_2!3060 lt!106741))))))

(declare-fun lt!106745 () tuple2!5908)

(declare-fun lt!106746 () BitStream!2268)

(assert (=> b!67068 (= lt!106745 (readBits!0 lt!106746 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!2268) tuple2!5910)

(assert (=> b!67068 (= lt!106747 (readBitPure!0 lt!106746))))

(declare-fun readerFrom!0 (BitStream!2268 (_ BitVec 32) (_ BitVec 32)) BitStream!2268)

(assert (=> b!67068 (= lt!106746 (readerFrom!0 (_2!3060 lt!106741) (currentBit!3374 thiss!1379) (currentByte!3379 thiss!1379)))))

(declare-fun b!67069 () Bool)

(declare-fun res!55561 () Bool)

(assert (=> b!67069 (=> (not res!55561) (not e!43979))))

(assert (=> b!67069 (= res!55561 (isPrefixOf!0 thiss!1379 (_2!3060 lt!106741)))))

(declare-fun b!67070 () Bool)

(declare-fun e!43978 () Bool)

(declare-fun lt!106739 () tuple2!5910)

(declare-fun lt!106750 () tuple2!5898)

(assert (=> b!67070 (= e!43978 (= (bitIndex!0 (size!1320 (buf!1701 (_1!3066 lt!106739))) (currentByte!3379 (_1!3066 lt!106739)) (currentBit!3374 (_1!3066 lt!106739))) (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106750))) (currentByte!3379 (_2!3060 lt!106750)) (currentBit!3374 (_2!3060 lt!106750)))))))

(declare-fun b!67071 () Bool)

(declare-fun res!55564 () Bool)

(declare-fun e!43980 () Bool)

(assert (=> b!67071 (=> (not res!55564) (not e!43980))))

(assert (=> b!67071 (= res!55564 (= (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106750))) (currentByte!3379 (_2!3060 lt!106750)) (currentBit!3374 (_2!3060 lt!106750))) (bvadd (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun d!21154 () Bool)

(assert (=> d!21154 e!43979))

(declare-fun res!55562 () Bool)

(assert (=> d!21154 (=> (not res!55562) (not e!43979))))

(assert (=> d!21154 (= res!55562 (= (size!1320 (buf!1701 (_2!3060 lt!106741))) (size!1320 (buf!1701 thiss!1379))))))

(declare-fun lt!106744 () array!2859)

(assert (=> d!21154 (= lt!106742 (select (arr!1887 lt!106744) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!21154 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1320 lt!106744)))))

(assert (=> d!21154 (= lt!106744 (array!2860 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!106748 () tuple2!5898)

(assert (=> d!21154 (= lt!106741 (tuple2!5899 (_1!3060 lt!106748) (_2!3060 lt!106748)))))

(assert (=> d!21154 (= lt!106748 lt!106750)))

(assert (=> d!21154 e!43980))

(declare-fun res!55558 () Bool)

(assert (=> d!21154 (=> (not res!55558) (not e!43980))))

(assert (=> d!21154 (= res!55558 (= (size!1320 (buf!1701 thiss!1379)) (size!1320 (buf!1701 (_2!3060 lt!106750)))))))

(declare-fun lt!106740 () Bool)

(declare-fun appendBit!0 (BitStream!2268 Bool) tuple2!5898)

(assert (=> d!21154 (= lt!106750 (appendBit!0 thiss!1379 lt!106740))))

(assert (=> d!21154 (= lt!106740 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!21154 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!21154 (= (appendBitFromByte!0 thiss!1379 (select (arr!1887 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!106741)))

(declare-fun b!67072 () Bool)

(assert (=> b!67072 (= e!43977 (= (bitIndex!0 (size!1320 (buf!1701 (_1!3066 lt!106747))) (currentByte!3379 (_1!3066 lt!106747)) (currentBit!3374 (_1!3066 lt!106747))) (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106741))) (currentByte!3379 (_2!3060 lt!106741)) (currentBit!3374 (_2!3060 lt!106741)))))))

(declare-fun b!67073 () Bool)

(assert (=> b!67073 (= e!43980 e!43978)))

(declare-fun res!55560 () Bool)

(assert (=> b!67073 (=> (not res!55560) (not e!43978))))

(assert (=> b!67073 (= res!55560 (and (= (_2!3066 lt!106739) lt!106740) (= (_1!3066 lt!106739) (_2!3060 lt!106750))))))

(assert (=> b!67073 (= lt!106739 (readBitPure!0 (readerFrom!0 (_2!3060 lt!106750) (currentBit!3374 thiss!1379) (currentByte!3379 thiss!1379))))))

(declare-fun b!67074 () Bool)

(declare-fun res!55559 () Bool)

(assert (=> b!67074 (=> (not res!55559) (not e!43980))))

(assert (=> b!67074 (= res!55559 (isPrefixOf!0 thiss!1379 (_2!3060 lt!106750)))))

(declare-fun b!67075 () Bool)

(declare-fun res!55565 () Bool)

(assert (=> b!67075 (=> (not res!55565) (not e!43979))))

(declare-fun lt!106743 () (_ BitVec 64))

(declare-fun lt!106749 () (_ BitVec 64))

(assert (=> b!67075 (= res!55565 (= (bitIndex!0 (size!1320 (buf!1701 (_2!3060 lt!106741))) (currentByte!3379 (_2!3060 lt!106741)) (currentBit!3374 (_2!3060 lt!106741))) (bvadd lt!106749 lt!106743)))))

(assert (=> b!67075 (or (not (= (bvand lt!106749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106743 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!106749 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!106749 lt!106743) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!67075 (= lt!106743 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!67075 (= lt!106749 (bitIndex!0 (size!1320 (buf!1701 thiss!1379)) (currentByte!3379 thiss!1379) (currentBit!3374 thiss!1379)))))

(assert (= (and d!21154 res!55558) b!67071))

(assert (= (and b!67071 res!55564) b!67074))

(assert (= (and b!67074 res!55559) b!67073))

(assert (= (and b!67073 res!55560) b!67070))

(assert (= (and d!21154 res!55562) b!67075))

(assert (= (and b!67075 res!55565) b!67069))

(assert (= (and b!67069 res!55561) b!67068))

(assert (= (and b!67068 res!55563) b!67072))

(declare-fun m!106741 () Bool)

(assert (=> b!67073 m!106741))

(assert (=> b!67073 m!106741))

(declare-fun m!106743 () Bool)

(assert (=> b!67073 m!106743))

(declare-fun m!106745 () Bool)

(assert (=> b!67068 m!106745))

(declare-fun m!106747 () Bool)

(assert (=> b!67068 m!106747))

(declare-fun m!106749 () Bool)

(assert (=> b!67068 m!106749))

(declare-fun m!106751 () Bool)

(assert (=> b!67074 m!106751))

(declare-fun m!106753 () Bool)

(assert (=> d!21154 m!106753))

(declare-fun m!106755 () Bool)

(assert (=> d!21154 m!106755))

(assert (=> d!21154 m!106423))

(declare-fun m!106757 () Bool)

(assert (=> b!67070 m!106757))

(declare-fun m!106759 () Bool)

(assert (=> b!67070 m!106759))

(declare-fun m!106761 () Bool)

(assert (=> b!67072 m!106761))

(declare-fun m!106763 () Bool)

(assert (=> b!67072 m!106763))

(assert (=> b!67071 m!106759))

(assert (=> b!67071 m!106313))

(assert (=> b!67075 m!106763))

(assert (=> b!67075 m!106313))

(declare-fun m!106765 () Bool)

(assert (=> b!67069 m!106765))

(assert (=> b!66808 d!21154))

(declare-fun d!21156 () Bool)

(assert (=> d!21156 (= (head!528 lt!106212) (h!824 lt!106212))))

(assert (=> b!66795 d!21156))

(declare-fun d!21158 () Bool)

(assert (=> d!21158 (= (invariant!0 (currentBit!3374 (_2!3060 lt!106197)) (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106197)))) (and (bvsge (currentBit!3374 (_2!3060 lt!106197)) #b00000000000000000000000000000000) (bvslt (currentBit!3374 (_2!3060 lt!106197)) #b00000000000000000000000000001000) (bvsge (currentByte!3379 (_2!3060 lt!106197)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106197)))) (and (= (currentBit!3374 (_2!3060 lt!106197)) #b00000000000000000000000000000000) (= (currentByte!3379 (_2!3060 lt!106197)) (size!1320 (buf!1701 (_2!3060 lt!106197))))))))))

(assert (=> b!66806 d!21158))

(declare-fun d!21160 () Bool)

(assert (=> d!21160 (= (tail!313 lt!106212) (t!1459 lt!106212))))

(assert (=> b!66796 d!21160))

(declare-fun d!21162 () Bool)

(declare-fun e!43983 () Bool)

(assert (=> d!21162 e!43983))

(declare-fun res!55568 () Bool)

(assert (=> d!21162 (=> (not res!55568) (not e!43983))))

(declare-fun lt!106756 () (_ BitVec 64))

(assert (=> d!21162 (= res!55568 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!106756 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!106756) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!21162 (= lt!106756 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!106755 () Unit!4501)

(declare-fun choose!42 (BitStream!2268 BitStream!2268 BitStream!2268 BitStream!2268 (_ BitVec 64) List!709) Unit!4501)

(assert (=> d!21162 (= lt!106755 (choose!42 (_2!3060 lt!106208) (_2!3060 lt!106208) (_1!3059 lt!106204) (_1!3059 lt!106213) (bvsub to!314 i!635) lt!106212))))

(assert (=> d!21162 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!21162 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3060 lt!106208) (_2!3060 lt!106208) (_1!3059 lt!106204) (_1!3059 lt!106213) (bvsub to!314 i!635) lt!106212) lt!106755)))

(declare-fun b!67078 () Bool)

(assert (=> b!67078 (= e!43983 (= (bitStreamReadBitsIntoList!0 (_2!3060 lt!106208) (_1!3059 lt!106213) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!313 lt!106212)))))

(assert (= (and d!21162 res!55568) b!67078))

(declare-fun m!106767 () Bool)

(assert (=> d!21162 m!106767))

(declare-fun m!106769 () Bool)

(assert (=> b!67078 m!106769))

(assert (=> b!67078 m!106243))

(assert (=> b!66796 d!21162))

(check-sat (not b!67041) (not d!21126) (not b!66889) (not d!21140) (not b!67009) (not d!21042) (not b!67011) (not b!67035) (not b!66989) (not d!21036) (not d!21120) (not b!67071) (not d!21118) (not b!66994) (not b!67038) (not d!21112) (not d!21104) (not b!67069) (not b!67028) (not d!21094) (not b!67068) (not d!21122) (not bm!853) (not b!67040) (not b!67073) (not b!67008) (not b!66887) (not b!67026) (not b!66888) (not d!21154) (not b!66988) (not b!67033) (not b!67047) (not b!66996) (not d!21162) (not b!66992) (not b!67042) (not b!66991) (not d!21038) (not b!67074) (not b!67044) (not b!67078) (not d!21106) (not d!21110) (not d!21134) (not b!66877) (not b!66896) (not b!66987) (not b!67027) (not d!21132) (not b!67045) (not d!21128) (not d!21150) (not b!67010) (not b!67020) (not b!67075) (not b!67030) (not b!67050) (not b!66898) (not b!67032) (not d!21096) (not b!67070) (not d!21152) (not b!67022) (not b!67037) (not b!67031) (not b!67036) (not d!21130) (not b!67072) (not b!66986))
