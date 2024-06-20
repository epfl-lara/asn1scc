; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4964 () Bool)

(assert start!4964)

(declare-fun res!17270 () Bool)

(declare-fun e!13246 () Bool)

(assert (=> start!4964 (=> (not res!17270) (not e!13246))))

(declare-datatypes ((array!1431 0))(
  ( (array!1432 (arr!1050 (Array (_ BitVec 32) (_ BitVec 8))) (size!609 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1431)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!4964 (= res!17270 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!609 srcBuffer!2))))))))

(assert (=> start!4964 e!13246))

(assert (=> start!4964 true))

(declare-fun array_inv!579 (array!1431) Bool)

(assert (=> start!4964 (array_inv!579 srcBuffer!2)))

(declare-datatypes ((BitStream!1052 0))(
  ( (BitStream!1053 (buf!912 array!1431) (currentByte!2195 (_ BitVec 32)) (currentBit!2190 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1052)

(declare-fun e!13247 () Bool)

(declare-fun inv!12 (BitStream!1052) Bool)

(assert (=> start!4964 (and (inv!12 thiss!1379) e!13247)))

(declare-fun b!19786 () Bool)

(declare-fun res!17267 () Bool)

(assert (=> b!19786 (=> (not res!17267) (not e!13246))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19786 (= res!17267 (validate_offset_bits!1 ((_ sign_extend 32) (size!609 (buf!912 thiss!1379))) ((_ sign_extend 32) (currentByte!2195 thiss!1379)) ((_ sign_extend 32) (currentBit!2190 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19787 () Bool)

(declare-fun e!13251 () Bool)

(assert (=> b!19787 (= e!13246 (not e!13251))))

(declare-fun res!17268 () Bool)

(assert (=> b!19787 (=> res!17268 e!13251)))

(assert (=> b!19787 (= res!17268 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1052 BitStream!1052) Bool)

(assert (=> b!19787 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1765 0))(
  ( (Unit!1766) )
))
(declare-fun lt!28146 () Unit!1765)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1052) Unit!1765)

(assert (=> b!19787 (= lt!28146 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28142 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19787 (= lt!28142 (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)))))

(declare-fun b!19788 () Bool)

(declare-fun e!13249 () Bool)

(assert (=> b!19788 (= e!13251 e!13249)))

(declare-fun res!17269 () Bool)

(assert (=> b!19788 (=> res!17269 e!13249)))

(declare-datatypes ((tuple2!2296 0))(
  ( (tuple2!2297 (_1!1233 Unit!1765) (_2!1233 BitStream!1052)) )
))
(declare-fun lt!28144 () tuple2!2296)

(assert (=> b!19788 (= res!17269 (not (isPrefixOf!0 thiss!1379 (_2!1233 lt!28144))))))

(assert (=> b!19788 (validate_offset_bits!1 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 (_2!1233 lt!28144))) ((_ sign_extend 32) (currentBit!2190 (_2!1233 lt!28144))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28147 () Unit!1765)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1052 BitStream!1052 (_ BitVec 64) (_ BitVec 64)) Unit!1765)

(assert (=> b!19788 (= lt!28147 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1233 lt!28144) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1052 (_ BitVec 8) (_ BitVec 32)) tuple2!2296)

(assert (=> b!19788 (= lt!28144 (appendBitFromByte!0 thiss!1379 (select (arr!1050 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19789 () Bool)

(declare-datatypes ((List!227 0))(
  ( (Nil!224) (Cons!223 (h!342 Bool) (t!977 List!227)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1052 array!1431 (_ BitVec 64) (_ BitVec 64)) List!227)

(assert (=> b!19789 (= e!13249 (not (= (byteArrayBitContentToList!0 (_2!1233 lt!28144) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) Nil!224)))))

(declare-fun lt!28145 () List!227)

(declare-datatypes ((tuple2!2298 0))(
  ( (tuple2!2299 (_1!1234 BitStream!1052) (_2!1234 BitStream!1052)) )
))
(declare-fun lt!28141 () tuple2!2298)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1052 BitStream!1052 (_ BitVec 64)) List!227)

(assert (=> b!19789 (= lt!28145 (bitStreamReadBitsIntoList!0 (_2!1233 lt!28144) (_1!1234 lt!28141) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19789 (validate_offset_bits!1 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 thiss!1379)) ((_ sign_extend 32) (currentBit!2190 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28143 () Unit!1765)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1052 array!1431 (_ BitVec 64)) Unit!1765)

(assert (=> b!19789 (= lt!28143 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!912 (_2!1233 lt!28144)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1052 BitStream!1052) tuple2!2298)

(assert (=> b!19789 (= lt!28141 (reader!0 thiss!1379 (_2!1233 lt!28144)))))

(declare-fun b!19790 () Bool)

(assert (=> b!19790 (= e!13247 (array_inv!579 (buf!912 thiss!1379)))))

(assert (= (and start!4964 res!17270) b!19786))

(assert (= (and b!19786 res!17267) b!19787))

(assert (= (and b!19787 (not res!17268)) b!19788))

(assert (= (and b!19788 (not res!17269)) b!19789))

(assert (= start!4964 b!19790))

(declare-fun m!26807 () Bool)

(assert (=> b!19790 m!26807))

(declare-fun m!26809 () Bool)

(assert (=> start!4964 m!26809))

(declare-fun m!26811 () Bool)

(assert (=> start!4964 m!26811))

(declare-fun m!26813 () Bool)

(assert (=> b!19788 m!26813))

(declare-fun m!26815 () Bool)

(assert (=> b!19788 m!26815))

(declare-fun m!26817 () Bool)

(assert (=> b!19788 m!26817))

(assert (=> b!19788 m!26815))

(declare-fun m!26819 () Bool)

(assert (=> b!19788 m!26819))

(declare-fun m!26821 () Bool)

(assert (=> b!19788 m!26821))

(declare-fun m!26823 () Bool)

(assert (=> b!19789 m!26823))

(declare-fun m!26825 () Bool)

(assert (=> b!19789 m!26825))

(declare-fun m!26827 () Bool)

(assert (=> b!19789 m!26827))

(declare-fun m!26829 () Bool)

(assert (=> b!19789 m!26829))

(declare-fun m!26831 () Bool)

(assert (=> b!19789 m!26831))

(declare-fun m!26833 () Bool)

(assert (=> b!19787 m!26833))

(declare-fun m!26835 () Bool)

(assert (=> b!19787 m!26835))

(declare-fun m!26837 () Bool)

(assert (=> b!19787 m!26837))

(declare-fun m!26839 () Bool)

(assert (=> b!19786 m!26839))

(push 1)

(assert (not b!19790))

(assert (not start!4964))

(assert (not b!19786))

(assert (not b!19789))

(assert (not b!19787))

(assert (not b!19788))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!19862 () Bool)

(declare-fun e!13284 () Unit!1765)

(declare-fun lt!28328 () Unit!1765)

(assert (=> b!19862 (= e!13284 lt!28328)))

(declare-fun lt!28312 () (_ BitVec 64))

(assert (=> b!19862 (= lt!28312 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28326 () (_ BitVec 64))

(assert (=> b!19862 (= lt!28326 (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1431 array!1431 (_ BitVec 64) (_ BitVec 64)) Unit!1765)

(assert (=> b!19862 (= lt!28328 (arrayBitRangesEqSymmetric!0 (buf!912 thiss!1379) (buf!912 (_2!1233 lt!28144)) lt!28312 lt!28326))))

(declare-fun arrayBitRangesEq!0 (array!1431 array!1431 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19862 (arrayBitRangesEq!0 (buf!912 (_2!1233 lt!28144)) (buf!912 thiss!1379) lt!28312 lt!28326)))

(declare-fun b!19863 () Bool)

(declare-fun Unit!1769 () Unit!1765)

(assert (=> b!19863 (= e!13284 Unit!1769)))

(declare-fun b!19864 () Bool)

(declare-fun res!17293 () Bool)

(declare-fun e!13285 () Bool)

(assert (=> b!19864 (=> (not res!17293) (not e!13285))))

(declare-fun lt!28316 () tuple2!2298)

(assert (=> b!19864 (= res!17293 (isPrefixOf!0 (_1!1234 lt!28316) thiss!1379))))

(declare-fun lt!28319 () (_ BitVec 64))

(declare-fun lt!28320 () (_ BitVec 64))

(declare-fun b!19865 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1052 (_ BitVec 64)) BitStream!1052)

(assert (=> b!19865 (= e!13285 (= (_1!1234 lt!28316) (withMovedBitIndex!0 (_2!1234 lt!28316) (bvsub lt!28319 lt!28320))))))

(assert (=> b!19865 (or (= (bvand lt!28319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28319 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28319 lt!28320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19865 (= lt!28320 (bitIndex!0 (size!609 (buf!912 (_2!1233 lt!28144))) (currentByte!2195 (_2!1233 lt!28144)) (currentBit!2190 (_2!1233 lt!28144))))))

(assert (=> b!19865 (= lt!28319 (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)))))

(declare-fun d!6446 () Bool)

(assert (=> d!6446 e!13285))

(declare-fun res!17294 () Bool)

(assert (=> d!6446 (=> (not res!17294) (not e!13285))))

(assert (=> d!6446 (= res!17294 (isPrefixOf!0 (_1!1234 lt!28316) (_2!1234 lt!28316)))))

(declare-fun lt!28331 () BitStream!1052)

(assert (=> d!6446 (= lt!28316 (tuple2!2299 lt!28331 (_2!1233 lt!28144)))))

(declare-fun lt!28325 () Unit!1765)

(declare-fun lt!28317 () Unit!1765)

(assert (=> d!6446 (= lt!28325 lt!28317)))

(assert (=> d!6446 (isPrefixOf!0 lt!28331 (_2!1233 lt!28144))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1052 BitStream!1052 BitStream!1052) Unit!1765)

(assert (=> d!6446 (= lt!28317 (lemmaIsPrefixTransitive!0 lt!28331 (_2!1233 lt!28144) (_2!1233 lt!28144)))))

(declare-fun lt!28318 () Unit!1765)

(declare-fun lt!28313 () Unit!1765)

(assert (=> d!6446 (= lt!28318 lt!28313)))

(assert (=> d!6446 (isPrefixOf!0 lt!28331 (_2!1233 lt!28144))))

(assert (=> d!6446 (= lt!28313 (lemmaIsPrefixTransitive!0 lt!28331 thiss!1379 (_2!1233 lt!28144)))))

(declare-fun lt!28323 () Unit!1765)

(assert (=> d!6446 (= lt!28323 e!13284)))

(declare-fun c!1422 () Bool)

(assert (=> d!6446 (= c!1422 (not (= (size!609 (buf!912 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!28330 () Unit!1765)

(declare-fun lt!28329 () Unit!1765)

(assert (=> d!6446 (= lt!28330 lt!28329)))

(assert (=> d!6446 (isPrefixOf!0 (_2!1233 lt!28144) (_2!1233 lt!28144))))

(assert (=> d!6446 (= lt!28329 (lemmaIsPrefixRefl!0 (_2!1233 lt!28144)))))

(declare-fun lt!28324 () Unit!1765)

(declare-fun lt!28314 () Unit!1765)

(assert (=> d!6446 (= lt!28324 lt!28314)))

(assert (=> d!6446 (= lt!28314 (lemmaIsPrefixRefl!0 (_2!1233 lt!28144)))))

(declare-fun lt!28315 () Unit!1765)

(declare-fun lt!28327 () Unit!1765)

(assert (=> d!6446 (= lt!28315 lt!28327)))

(assert (=> d!6446 (isPrefixOf!0 lt!28331 lt!28331)))

(assert (=> d!6446 (= lt!28327 (lemmaIsPrefixRefl!0 lt!28331))))

(declare-fun lt!28322 () Unit!1765)

(declare-fun lt!28321 () Unit!1765)

(assert (=> d!6446 (= lt!28322 lt!28321)))

(assert (=> d!6446 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6446 (= lt!28321 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6446 (= lt!28331 (BitStream!1053 (buf!912 (_2!1233 lt!28144)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)))))

(assert (=> d!6446 (isPrefixOf!0 thiss!1379 (_2!1233 lt!28144))))

(assert (=> d!6446 (= (reader!0 thiss!1379 (_2!1233 lt!28144)) lt!28316)))

(declare-fun b!19866 () Bool)

(declare-fun res!17292 () Bool)

(assert (=> b!19866 (=> (not res!17292) (not e!13285))))

(assert (=> b!19866 (= res!17292 (isPrefixOf!0 (_2!1234 lt!28316) (_2!1233 lt!28144)))))

(assert (= (and d!6446 c!1422) b!19862))

(assert (= (and d!6446 (not c!1422)) b!19863))

(assert (= (and d!6446 res!17294) b!19864))

(assert (= (and b!19864 res!17293) b!19866))

(assert (= (and b!19866 res!17292) b!19865))

(assert (=> d!6446 m!26813))

(declare-fun m!26873 () Bool)

(assert (=> d!6446 m!26873))

(declare-fun m!26877 () Bool)

(assert (=> d!6446 m!26877))

(assert (=> d!6446 m!26835))

(declare-fun m!26883 () Bool)

(assert (=> d!6446 m!26883))

(declare-fun m!26885 () Bool)

(assert (=> d!6446 m!26885))

(declare-fun m!26887 () Bool)

(assert (=> d!6446 m!26887))

(declare-fun m!26891 () Bool)

(assert (=> d!6446 m!26891))

(declare-fun m!26893 () Bool)

(assert (=> d!6446 m!26893))

(declare-fun m!26899 () Bool)

(assert (=> d!6446 m!26899))

(assert (=> d!6446 m!26833))

(declare-fun m!26905 () Bool)

(assert (=> b!19866 m!26905))

(declare-fun m!26907 () Bool)

(assert (=> b!19864 m!26907))

(declare-fun m!26909 () Bool)

(assert (=> b!19865 m!26909))

(declare-fun m!26915 () Bool)

(assert (=> b!19865 m!26915))

(assert (=> b!19865 m!26837))

(assert (=> b!19862 m!26837))

(declare-fun m!26923 () Bool)

(assert (=> b!19862 m!26923))

(declare-fun m!26925 () Bool)

(assert (=> b!19862 m!26925))

(assert (=> b!19789 d!6446))

(declare-fun d!6455 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6455 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 thiss!1379)) ((_ sign_extend 32) (currentBit!2190 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 thiss!1379)) ((_ sign_extend 32) (currentBit!2190 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1899 () Bool)

(assert (= bs!1899 d!6455))

(declare-fun m!26929 () Bool)

(assert (=> bs!1899 m!26929))

(assert (=> b!19789 d!6455))

(declare-fun d!6460 () Bool)

(declare-fun e!13308 () Bool)

(assert (=> d!6460 e!13308))

(declare-fun c!1428 () Bool)

(assert (=> d!6460 (= c!1428 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!28362 () List!227)

(declare-datatypes ((tuple2!2314 0))(
  ( (tuple2!2315 (_1!1242 List!227) (_2!1242 BitStream!1052)) )
))
(declare-fun e!13307 () tuple2!2314)

(assert (=> d!6460 (= lt!28362 (_1!1242 e!13307))))

(declare-fun c!1429 () Bool)

(assert (=> d!6460 (= c!1429 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6460 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6460 (= (bitStreamReadBitsIntoList!0 (_2!1233 lt!28144) (_1!1234 lt!28141) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28362)))

(declare-fun lt!28363 () (_ BitVec 64))

(declare-fun b!19902 () Bool)

(declare-datatypes ((tuple2!2318 0))(
  ( (tuple2!2319 (_1!1244 Bool) (_2!1244 BitStream!1052)) )
))
(declare-fun lt!28361 () tuple2!2318)

(assert (=> b!19902 (= e!13307 (tuple2!2315 (Cons!223 (_1!1244 lt!28361) (bitStreamReadBitsIntoList!0 (_2!1233 lt!28144) (_2!1244 lt!28361) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!28363))) (_2!1244 lt!28361)))))

(declare-fun readBit!0 (BitStream!1052) tuple2!2318)

(assert (=> b!19902 (= lt!28361 (readBit!0 (_1!1234 lt!28141)))))

(assert (=> b!19902 (= lt!28363 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!19904 () Bool)

(declare-fun length!46 (List!227) Int)

(assert (=> b!19904 (= e!13308 (> (length!46 lt!28362) 0))))

(declare-fun b!19901 () Bool)

(assert (=> b!19901 (= e!13307 (tuple2!2315 Nil!224 (_1!1234 lt!28141)))))

(declare-fun b!19903 () Bool)

(declare-fun isEmpty!51 (List!227) Bool)

(assert (=> b!19903 (= e!13308 (isEmpty!51 lt!28362))))

(assert (= (and d!6460 c!1429) b!19901))

(assert (= (and d!6460 (not c!1429)) b!19902))

(assert (= (and d!6460 c!1428) b!19903))

(assert (= (and d!6460 (not c!1428)) b!19904))

(declare-fun m!26973 () Bool)

(assert (=> b!19902 m!26973))

(declare-fun m!26975 () Bool)

(assert (=> b!19902 m!26975))

(declare-fun m!26977 () Bool)

(assert (=> b!19904 m!26977))

(declare-fun m!26979 () Bool)

(assert (=> b!19903 m!26979))

(assert (=> b!19789 d!6460))

(declare-fun d!6478 () Bool)

(assert (=> d!6478 (validate_offset_bits!1 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 thiss!1379)) ((_ sign_extend 32) (currentBit!2190 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28369 () Unit!1765)

(declare-fun choose!9 (BitStream!1052 array!1431 (_ BitVec 64) BitStream!1052) Unit!1765)

(assert (=> d!6478 (= lt!28369 (choose!9 thiss!1379 (buf!912 (_2!1233 lt!28144)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1053 (buf!912 (_2!1233 lt!28144)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379))))))

(assert (=> d!6478 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!912 (_2!1233 lt!28144)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28369)))

(declare-fun bs!1904 () Bool)

(assert (= bs!1904 d!6478))

(assert (=> bs!1904 m!26827))

(declare-fun m!26983 () Bool)

(assert (=> bs!1904 m!26983))

(assert (=> b!19789 d!6478))

(declare-fun d!6482 () Bool)

(declare-fun c!1432 () Bool)

(assert (=> d!6482 (= c!1432 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!13314 () List!227)

(assert (=> d!6482 (= (byteArrayBitContentToList!0 (_2!1233 lt!28144) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!13314)))

(declare-fun b!19912 () Bool)

(assert (=> b!19912 (= e!13314 Nil!224)))

(declare-fun b!19913 () Bool)

(assert (=> b!19913 (= e!13314 (Cons!223 (not (= (bvand ((_ sign_extend 24) (select (arr!1050 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1233 lt!28144) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!6482 c!1432) b!19912))

(assert (= (and d!6482 (not c!1432)) b!19913))

(assert (=> b!19913 m!26815))

(declare-fun m!26985 () Bool)

(assert (=> b!19913 m!26985))

(declare-fun m!26987 () Bool)

(assert (=> b!19913 m!26987))

(assert (=> b!19789 d!6482))

(declare-fun d!6484 () Bool)

(assert (=> d!6484 (= (array_inv!579 srcBuffer!2) (bvsge (size!609 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4964 d!6484))

(declare-fun d!6486 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6486 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2190 thiss!1379) (currentByte!2195 thiss!1379) (size!609 (buf!912 thiss!1379))))))

(declare-fun bs!1905 () Bool)

(assert (= bs!1905 d!6486))

(declare-fun m!26989 () Bool)

(assert (=> bs!1905 m!26989))

(assert (=> start!4964 d!6486))

(declare-fun d!6488 () Bool)

(declare-fun res!17329 () Bool)

(declare-fun e!13320 () Bool)

(assert (=> d!6488 (=> (not res!17329) (not e!13320))))

(assert (=> d!6488 (= res!17329 (= (size!609 (buf!912 thiss!1379)) (size!609 (buf!912 (_2!1233 lt!28144)))))))

(assert (=> d!6488 (= (isPrefixOf!0 thiss!1379 (_2!1233 lt!28144)) e!13320)))

(declare-fun b!19920 () Bool)

(declare-fun res!17328 () Bool)

(assert (=> b!19920 (=> (not res!17328) (not e!13320))))

(assert (=> b!19920 (= res!17328 (bvsle (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)) (bitIndex!0 (size!609 (buf!912 (_2!1233 lt!28144))) (currentByte!2195 (_2!1233 lt!28144)) (currentBit!2190 (_2!1233 lt!28144)))))))

(declare-fun b!19921 () Bool)

(declare-fun e!13319 () Bool)

(assert (=> b!19921 (= e!13320 e!13319)))

(declare-fun res!17330 () Bool)

(assert (=> b!19921 (=> res!17330 e!13319)))

(assert (=> b!19921 (= res!17330 (= (size!609 (buf!912 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19922 () Bool)

(assert (=> b!19922 (= e!13319 (arrayBitRangesEq!0 (buf!912 thiss!1379) (buf!912 (_2!1233 lt!28144)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379))))))

(assert (= (and d!6488 res!17329) b!19920))

(assert (= (and b!19920 res!17328) b!19921))

(assert (= (and b!19921 (not res!17330)) b!19922))

(assert (=> b!19920 m!26837))

(assert (=> b!19920 m!26915))

(assert (=> b!19922 m!26837))

(assert (=> b!19922 m!26837))

(declare-fun m!26991 () Bool)

(assert (=> b!19922 m!26991))

(assert (=> b!19788 d!6488))

(declare-fun d!6490 () Bool)

(assert (=> d!6490 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 (_2!1233 lt!28144))) ((_ sign_extend 32) (currentBit!2190 (_2!1233 lt!28144))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 (_2!1233 lt!28144))) ((_ sign_extend 32) (currentBit!2190 (_2!1233 lt!28144)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1906 () Bool)

(assert (= bs!1906 d!6490))

(declare-fun m!26993 () Bool)

(assert (=> bs!1906 m!26993))

(assert (=> b!19788 d!6490))

(declare-fun d!6492 () Bool)

(declare-fun e!13323 () Bool)

(assert (=> d!6492 e!13323))

(declare-fun res!17333 () Bool)

(assert (=> d!6492 (=> (not res!17333) (not e!13323))))

(assert (=> d!6492 (= res!17333 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28372 () Unit!1765)

(declare-fun choose!27 (BitStream!1052 BitStream!1052 (_ BitVec 64) (_ BitVec 64)) Unit!1765)

(assert (=> d!6492 (= lt!28372 (choose!27 thiss!1379 (_2!1233 lt!28144) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6492 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6492 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1233 lt!28144) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28372)))

(declare-fun b!19925 () Bool)

(assert (=> b!19925 (= e!13323 (validate_offset_bits!1 ((_ sign_extend 32) (size!609 (buf!912 (_2!1233 lt!28144)))) ((_ sign_extend 32) (currentByte!2195 (_2!1233 lt!28144))) ((_ sign_extend 32) (currentBit!2190 (_2!1233 lt!28144))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6492 res!17333) b!19925))

(declare-fun m!26995 () Bool)

(assert (=> d!6492 m!26995))

(assert (=> b!19925 m!26821))

(assert (=> b!19788 d!6492))

(declare-fun b!20011 () Bool)

(declare-fun res!17419 () Bool)

(declare-fun e!13368 () Bool)

(assert (=> b!20011 (=> (not res!17419) (not e!13368))))

(declare-fun lt!28514 () tuple2!2296)

(assert (=> b!20011 (= res!17419 (= (bitIndex!0 (size!609 (buf!912 (_2!1233 lt!28514))) (currentByte!2195 (_2!1233 lt!28514)) (currentBit!2190 (_2!1233 lt!28514))) (bvadd (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!20012 () Bool)

(declare-fun res!17422 () Bool)

(assert (=> b!20012 (=> (not res!17422) (not e!13368))))

(assert (=> b!20012 (= res!17422 (isPrefixOf!0 thiss!1379 (_2!1233 lt!28514)))))

(declare-fun b!20013 () Bool)

(declare-fun e!13366 () Bool)

(declare-fun e!13369 () Bool)

(assert (=> b!20013 (= e!13366 e!13369)))

(declare-fun res!17416 () Bool)

(assert (=> b!20013 (=> (not res!17416) (not e!13369))))

(declare-fun lt!28513 () (_ BitVec 8))

(declare-fun lt!28515 () tuple2!2296)

(declare-datatypes ((tuple2!2320 0))(
  ( (tuple2!2321 (_1!1245 BitStream!1052) (_2!1245 Bool)) )
))
(declare-fun lt!28522 () tuple2!2320)

(assert (=> b!20013 (= res!17416 (and (= (_2!1245 lt!28522) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1050 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!28513)) #b00000000000000000000000000000000))) (= (_1!1245 lt!28522) (_2!1233 lt!28515))))))

(declare-datatypes ((tuple2!2322 0))(
  ( (tuple2!2323 (_1!1246 array!1431) (_2!1246 BitStream!1052)) )
))
(declare-fun lt!28512 () tuple2!2322)

(declare-fun lt!28511 () BitStream!1052)

(declare-fun readBits!0 (BitStream!1052 (_ BitVec 64)) tuple2!2322)

(assert (=> b!20013 (= lt!28512 (readBits!0 lt!28511 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1052) tuple2!2320)

(assert (=> b!20013 (= lt!28522 (readBitPure!0 lt!28511))))

(declare-fun readerFrom!0 (BitStream!1052 (_ BitVec 32) (_ BitVec 32)) BitStream!1052)

(assert (=> b!20013 (= lt!28511 (readerFrom!0 (_2!1233 lt!28515) (currentBit!2190 thiss!1379) (currentByte!2195 thiss!1379)))))

(declare-fun b!20014 () Bool)

(assert (=> b!20014 (= e!13369 (= (bitIndex!0 (size!609 (buf!912 (_1!1245 lt!28522))) (currentByte!2195 (_1!1245 lt!28522)) (currentBit!2190 (_1!1245 lt!28522))) (bitIndex!0 (size!609 (buf!912 (_2!1233 lt!28515))) (currentByte!2195 (_2!1233 lt!28515)) (currentBit!2190 (_2!1233 lt!28515)))))))

(declare-fun b!20015 () Bool)

(declare-fun e!13367 () Bool)

(assert (=> b!20015 (= e!13368 e!13367)))

(declare-fun res!17417 () Bool)

(assert (=> b!20015 (=> (not res!17417) (not e!13367))))

(declare-fun lt!28518 () Bool)

(declare-fun lt!28520 () tuple2!2320)

(assert (=> b!20015 (= res!17417 (and (= (_2!1245 lt!28520) lt!28518) (= (_1!1245 lt!28520) (_2!1233 lt!28514))))))

(assert (=> b!20015 (= lt!28520 (readBitPure!0 (readerFrom!0 (_2!1233 lt!28514) (currentBit!2190 thiss!1379) (currentByte!2195 thiss!1379))))))

(declare-fun b!20016 () Bool)

(declare-fun res!17423 () Bool)

(assert (=> b!20016 (=> (not res!17423) (not e!13366))))

(assert (=> b!20016 (= res!17423 (isPrefixOf!0 thiss!1379 (_2!1233 lt!28515)))))

(declare-fun b!20018 () Bool)

(assert (=> b!20018 (= e!13367 (= (bitIndex!0 (size!609 (buf!912 (_1!1245 lt!28520))) (currentByte!2195 (_1!1245 lt!28520)) (currentBit!2190 (_1!1245 lt!28520))) (bitIndex!0 (size!609 (buf!912 (_2!1233 lt!28514))) (currentByte!2195 (_2!1233 lt!28514)) (currentBit!2190 (_2!1233 lt!28514)))))))

(declare-fun b!20017 () Bool)

(declare-fun res!17421 () Bool)

(assert (=> b!20017 (=> (not res!17421) (not e!13366))))

(declare-fun lt!28519 () (_ BitVec 64))

(declare-fun lt!28516 () (_ BitVec 64))

(assert (=> b!20017 (= res!17421 (= (bitIndex!0 (size!609 (buf!912 (_2!1233 lt!28515))) (currentByte!2195 (_2!1233 lt!28515)) (currentBit!2190 (_2!1233 lt!28515))) (bvadd lt!28519 lt!28516)))))

(assert (=> b!20017 (or (not (= (bvand lt!28519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28516 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!28519 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!28519 lt!28516) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20017 (= lt!28516 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!20017 (= lt!28519 (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)))))

(declare-fun d!6494 () Bool)

(assert (=> d!6494 e!13366))

(declare-fun res!17418 () Bool)

(assert (=> d!6494 (=> (not res!17418) (not e!13366))))

(assert (=> d!6494 (= res!17418 (= (size!609 (buf!912 (_2!1233 lt!28515))) (size!609 (buf!912 thiss!1379))))))

(declare-fun lt!28521 () array!1431)

(assert (=> d!6494 (= lt!28513 (select (arr!1050 lt!28521) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6494 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!609 lt!28521)))))

(assert (=> d!6494 (= lt!28521 (array!1432 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!28517 () tuple2!2296)

(assert (=> d!6494 (= lt!28515 (tuple2!2297 (_1!1233 lt!28517) (_2!1233 lt!28517)))))

(assert (=> d!6494 (= lt!28517 lt!28514)))

(assert (=> d!6494 e!13368))

(declare-fun res!17420 () Bool)

(assert (=> d!6494 (=> (not res!17420) (not e!13368))))

(assert (=> d!6494 (= res!17420 (= (size!609 (buf!912 thiss!1379)) (size!609 (buf!912 (_2!1233 lt!28514)))))))

(declare-fun appendBit!0 (BitStream!1052 Bool) tuple2!2296)

(assert (=> d!6494 (= lt!28514 (appendBit!0 thiss!1379 lt!28518))))

(assert (=> d!6494 (= lt!28518 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1050 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6494 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6494 (= (appendBitFromByte!0 thiss!1379 (select (arr!1050 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!28515)))

(assert (= (and d!6494 res!17420) b!20011))

(assert (= (and b!20011 res!17419) b!20012))

(assert (= (and b!20012 res!17422) b!20015))

(assert (= (and b!20015 res!17417) b!20018))

(assert (= (and d!6494 res!17418) b!20017))

(assert (= (and b!20017 res!17421) b!20016))

(assert (= (and b!20016 res!17423) b!20013))

(assert (= (and b!20013 res!17416) b!20014))

(declare-fun m!27061 () Bool)

(assert (=> b!20016 m!27061))

(declare-fun m!27063 () Bool)

(assert (=> b!20015 m!27063))

(assert (=> b!20015 m!27063))

(declare-fun m!27065 () Bool)

(assert (=> b!20015 m!27065))

(declare-fun m!27067 () Bool)

(assert (=> d!6494 m!27067))

(declare-fun m!27069 () Bool)

(assert (=> d!6494 m!27069))

(assert (=> d!6494 m!26985))

(declare-fun m!27071 () Bool)

(assert (=> b!20011 m!27071))

(assert (=> b!20011 m!26837))

(declare-fun m!27073 () Bool)

(assert (=> b!20012 m!27073))

(declare-fun m!27075 () Bool)

(assert (=> b!20017 m!27075))

(assert (=> b!20017 m!26837))

(declare-fun m!27077 () Bool)

(assert (=> b!20013 m!27077))

(declare-fun m!27079 () Bool)

(assert (=> b!20013 m!27079))

(declare-fun m!27081 () Bool)

(assert (=> b!20013 m!27081))

(declare-fun m!27083 () Bool)

(assert (=> b!20014 m!27083))

(assert (=> b!20014 m!27075))

(declare-fun m!27085 () Bool)

(assert (=> b!20018 m!27085))

(assert (=> b!20018 m!27071))

(assert (=> b!19788 d!6494))

(declare-fun d!6518 () Bool)

(declare-fun res!17425 () Bool)

(declare-fun e!13371 () Bool)

(assert (=> d!6518 (=> (not res!17425) (not e!13371))))

(assert (=> d!6518 (= res!17425 (= (size!609 (buf!912 thiss!1379)) (size!609 (buf!912 thiss!1379))))))

(assert (=> d!6518 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!13371)))

(declare-fun b!20019 () Bool)

(declare-fun res!17424 () Bool)

(assert (=> b!20019 (=> (not res!17424) (not e!13371))))

(assert (=> b!20019 (= res!17424 (bvsle (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379)) (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379))))))

(declare-fun b!20020 () Bool)

(declare-fun e!13370 () Bool)

(assert (=> b!20020 (= e!13371 e!13370)))

(declare-fun res!17426 () Bool)

(assert (=> b!20020 (=> res!17426 e!13370)))

(assert (=> b!20020 (= res!17426 (= (size!609 (buf!912 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20021 () Bool)

(assert (=> b!20021 (= e!13370 (arrayBitRangesEq!0 (buf!912 thiss!1379) (buf!912 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!609 (buf!912 thiss!1379)) (currentByte!2195 thiss!1379) (currentBit!2190 thiss!1379))))))

(assert (= (and d!6518 res!17425) b!20019))

(assert (= (and b!20019 res!17424) b!20020))

(assert (= (and b!20020 (not res!17426)) b!20021))

(assert (=> b!20019 m!26837))

(assert (=> b!20019 m!26837))

(assert (=> b!20021 m!26837))

(assert (=> b!20021 m!26837))

(declare-fun m!27087 () Bool)

(assert (=> b!20021 m!27087))

(assert (=> b!19787 d!6518))

