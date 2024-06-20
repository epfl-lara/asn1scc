; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!358 () Bool)

(assert start!358)

(declare-fun b!955 () Bool)

(declare-fun e!556 () Bool)

(declare-fun e!558 () Bool)

(assert (=> b!955 (= e!556 e!558)))

(declare-fun res!3036 () Bool)

(assert (=> b!955 (=> (not res!3036) (not e!558))))

(declare-fun lt!522 () (_ BitVec 64))

(declare-fun lt!521 () (_ BitVec 64))

(assert (=> b!955 (= res!3036 (= lt!522 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!521)))))

(declare-datatypes ((array!99 0))(
  ( (array!100 (arr!424 (Array (_ BitVec 32) (_ BitVec 8))) (size!37 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!58 0))(
  ( (BitStream!59 (buf!349 array!99) (currentByte!1274 (_ BitVec 32)) (currentBit!1269 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!19 0))(
  ( (Unit!20) )
))
(declare-datatypes ((tuple2!52 0))(
  ( (tuple2!53 (_1!26 Unit!19) (_2!26 BitStream!58)) )
))
(declare-fun lt!523 () tuple2!52)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!955 (= lt!522 (bitIndex!0 (size!37 (buf!349 (_2!26 lt!523))) (currentByte!1274 (_2!26 lt!523)) (currentBit!1269 (_2!26 lt!523))))))

(declare-fun thiss!932 () BitStream!58)

(assert (=> b!955 (= lt!521 (bitIndex!0 (size!37 (buf!349 thiss!932)) (currentByte!1274 thiss!932) (currentBit!1269 thiss!932)))))

(declare-fun b!956 () Bool)

(declare-fun res!3032 () Bool)

(declare-fun e!554 () Bool)

(assert (=> b!956 (=> res!3032 e!554)))

(declare-fun isPrefixOf!0 (BitStream!58 BitStream!58) Bool)

(assert (=> b!956 (= res!3032 (not (isPrefixOf!0 thiss!932 (_2!26 lt!523))))))

(declare-fun b!957 () Bool)

(declare-fun res!3034 () Bool)

(assert (=> b!957 (=> (not res!3034) (not e!558))))

(assert (=> b!957 (= res!3034 (isPrefixOf!0 thiss!932 (_2!26 lt!523)))))

(declare-fun b!958 () Bool)

(declare-fun e!557 () Bool)

(declare-fun array_inv!34 (array!99) Bool)

(assert (=> b!958 (= e!557 (array_inv!34 (buf!349 thiss!932)))))

(declare-fun b!959 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!959 (= e!554 (invariant!0 (currentBit!1269 thiss!932) (currentByte!1274 thiss!932) (size!37 (buf!349 (_2!26 lt!523)))))))

(declare-fun b!960 () Bool)

(declare-fun res!3038 () Bool)

(assert (=> b!960 (=> res!3038 e!554)))

(assert (=> b!960 (= res!3038 (not (= (bitIndex!0 (size!37 (buf!349 (_2!26 lt!523))) (currentByte!1274 (_2!26 lt!523)) (currentBit!1269 (_2!26 lt!523))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!37 (buf!349 thiss!932)) (currentByte!1274 thiss!932) (currentBit!1269 thiss!932))))))))

(declare-fun b!961 () Bool)

(declare-fun e!559 () Bool)

(assert (=> b!961 (= e!559 (not e!554))))

(declare-fun res!3035 () Bool)

(assert (=> b!961 (=> res!3035 e!554)))

(assert (=> b!961 (= res!3035 (not (= (size!37 (buf!349 (_2!26 lt!523))) (size!37 (buf!349 thiss!932)))))))

(assert (=> b!961 e!556))

(declare-fun res!3039 () Bool)

(assert (=> b!961 (=> (not res!3039) (not e!556))))

(assert (=> b!961 (= res!3039 (= (size!37 (buf!349 thiss!932)) (size!37 (buf!349 (_2!26 lt!523)))))))

(declare-fun appendBit!0 (BitStream!58 Bool) tuple2!52)

(assert (=> b!961 (= lt!523 (appendBit!0 thiss!932 true))))

(declare-fun res!3037 () Bool)

(assert (=> start!358 (=> (not res!3037) (not e!559))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!358 (= res!3037 (validate_offset_bit!0 ((_ sign_extend 32) (size!37 (buf!349 thiss!932))) ((_ sign_extend 32) (currentByte!1274 thiss!932)) ((_ sign_extend 32) (currentBit!1269 thiss!932))))))

(assert (=> start!358 e!559))

(declare-fun inv!12 (BitStream!58) Bool)

(assert (=> start!358 (and (inv!12 thiss!932) e!557)))

(declare-fun b!962 () Bool)

(declare-fun e!555 () Bool)

(assert (=> b!962 (= e!558 e!555)))

(declare-fun res!3040 () Bool)

(assert (=> b!962 (=> (not res!3040) (not e!555))))

(declare-datatypes ((tuple2!54 0))(
  ( (tuple2!55 (_1!27 BitStream!58) (_2!27 Bool)) )
))
(declare-fun lt!524 () tuple2!54)

(assert (=> b!962 (= res!3040 (and (_2!27 lt!524) (= (_1!27 lt!524) (_2!26 lt!523))))))

(declare-fun readBitPure!0 (BitStream!58) tuple2!54)

(declare-fun readerFrom!0 (BitStream!58 (_ BitVec 32) (_ BitVec 32)) BitStream!58)

(assert (=> b!962 (= lt!524 (readBitPure!0 (readerFrom!0 (_2!26 lt!523) (currentBit!1269 thiss!932) (currentByte!1274 thiss!932))))))

(declare-fun b!963 () Bool)

(declare-fun res!3033 () Bool)

(assert (=> b!963 (=> res!3033 e!554)))

(assert (=> b!963 (= res!3033 (not (invariant!0 (currentBit!1269 (_2!26 lt!523)) (currentByte!1274 (_2!26 lt!523)) (size!37 (buf!349 (_2!26 lt!523))))))))

(declare-fun b!964 () Bool)

(assert (=> b!964 (= e!555 (= (bitIndex!0 (size!37 (buf!349 (_1!27 lt!524))) (currentByte!1274 (_1!27 lt!524)) (currentBit!1269 (_1!27 lt!524))) lt!522))))

(assert (= (and start!358 res!3037) b!961))

(assert (= (and b!961 res!3039) b!955))

(assert (= (and b!955 res!3036) b!957))

(assert (= (and b!957 res!3034) b!962))

(assert (= (and b!962 res!3040) b!964))

(assert (= (and b!961 (not res!3035)) b!960))

(assert (= (and b!960 (not res!3038)) b!956))

(assert (= (and b!956 (not res!3032)) b!963))

(assert (= (and b!963 (not res!3033)) b!959))

(assert (= start!358 b!958))

(declare-fun m!625 () Bool)

(assert (=> b!958 m!625))

(declare-fun m!627 () Bool)

(assert (=> b!957 m!627))

(declare-fun m!629 () Bool)

(assert (=> b!960 m!629))

(declare-fun m!631 () Bool)

(assert (=> b!960 m!631))

(declare-fun m!633 () Bool)

(assert (=> b!959 m!633))

(assert (=> b!955 m!629))

(assert (=> b!955 m!631))

(declare-fun m!635 () Bool)

(assert (=> b!963 m!635))

(declare-fun m!637 () Bool)

(assert (=> b!964 m!637))

(assert (=> b!956 m!627))

(declare-fun m!639 () Bool)

(assert (=> b!962 m!639))

(assert (=> b!962 m!639))

(declare-fun m!641 () Bool)

(assert (=> b!962 m!641))

(declare-fun m!643 () Bool)

(assert (=> start!358 m!643))

(declare-fun m!645 () Bool)

(assert (=> start!358 m!645))

(declare-fun m!647 () Bool)

(assert (=> b!961 m!647))

(push 1)

(assert (not b!955))

(assert (not start!358))

(assert (not b!964))

(assert (not b!963))

(assert (not b!956))

(assert (not b!958))

(assert (not b!959))

(assert (not b!961))

(assert (not b!957))

(assert (not b!962))

(assert (not b!960))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1050 () Bool)

(declare-fun res!3101 () Bool)

(declare-fun e!608 () Bool)

(assert (=> d!1050 (=> (not res!3101) (not e!608))))

(assert (=> d!1050 (= res!3101 (= (size!37 (buf!349 thiss!932)) (size!37 (buf!349 (_2!26 lt!523)))))))

(assert (=> d!1050 (= (isPrefixOf!0 thiss!932 (_2!26 lt!523)) e!608)))

(declare-fun b!1031 () Bool)

(declare-fun res!3102 () Bool)

(assert (=> b!1031 (=> (not res!3102) (not e!608))))

(assert (=> b!1031 (= res!3102 (bvsle (bitIndex!0 (size!37 (buf!349 thiss!932)) (currentByte!1274 thiss!932) (currentBit!1269 thiss!932)) (bitIndex!0 (size!37 (buf!349 (_2!26 lt!523))) (currentByte!1274 (_2!26 lt!523)) (currentBit!1269 (_2!26 lt!523)))))))

(declare-fun b!1032 () Bool)

(declare-fun e!607 () Bool)

(assert (=> b!1032 (= e!608 e!607)))

(declare-fun res!3103 () Bool)

(assert (=> b!1032 (=> res!3103 e!607)))

(assert (=> b!1032 (= res!3103 (= (size!37 (buf!349 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1033 () Bool)

(declare-fun arrayBitRangesEq!0 (array!99 array!99 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1033 (= e!607 (arrayBitRangesEq!0 (buf!349 thiss!932) (buf!349 (_2!26 lt!523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!37 (buf!349 thiss!932)) (currentByte!1274 thiss!932) (currentBit!1269 thiss!932))))))

(assert (= (and d!1050 res!3101) b!1031))

(assert (= (and b!1031 res!3102) b!1032))

(assert (= (and b!1032 (not res!3103)) b!1033))

(assert (=> b!1031 m!631))

(assert (=> b!1031 m!629))

(assert (=> b!1033 m!631))

(assert (=> b!1033 m!631))

(declare-fun m!701 () Bool)

(assert (=> b!1033 m!701))

(assert (=> b!957 d!1050))

(declare-fun d!1056 () Bool)

(assert (=> d!1056 (= (array_inv!34 (buf!349 thiss!932)) (bvsge (size!37 (buf!349 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!958 d!1056))

(declare-fun d!1060 () Bool)

(assert (=> d!1060 (= (invariant!0 (currentBit!1269 thiss!932) (currentByte!1274 thiss!932) (size!37 (buf!349 (_2!26 lt!523)))) (and (bvsge (currentBit!1269 thiss!932) #b00000000000000000000000000000000) (bvslt (currentBit!1269 thiss!932) #b00000000000000000000000000001000) (bvsge (currentByte!1274 thiss!932) #b00000000000000000000000000000000) (or (bvslt (currentByte!1274 thiss!932) (size!37 (buf!349 (_2!26 lt!523)))) (and (= (currentBit!1269 thiss!932) #b00000000000000000000000000000000) (= (currentByte!1274 thiss!932) (size!37 (buf!349 (_2!26 lt!523))))))))))

(assert (=> b!959 d!1060))

(declare-fun d!1064 () Bool)

(declare-fun e!621 () Bool)

(assert (=> d!1064 e!621))

(declare-fun res!3126 () Bool)

(assert (=> d!1064 (=> (not res!3126) (not e!621))))

(declare-fun lt!608 () (_ BitVec 64))

(declare-fun lt!607 () (_ BitVec 64))

(declare-fun lt!609 () (_ BitVec 64))

(assert (=> d!1064 (= res!3126 (= lt!608 (bvsub lt!607 lt!609)))))

(assert (=> d!1064 (or (= (bvand lt!607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!609 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!607 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!607 lt!609) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1064 (= lt!609 (remainingBits!0 ((_ sign_extend 32) (size!37 (buf!349 (_2!26 lt!523)))) ((_ sign_extend 32) (currentByte!1274 (_2!26 lt!523))) ((_ sign_extend 32) (currentBit!1269 (_2!26 lt!523)))))))

(declare-fun lt!606 () (_ BitVec 64))

(declare-fun lt!610 () (_ BitVec 64))

(assert (=> d!1064 (= lt!607 (bvmul lt!606 lt!610))))

(assert (=> d!1064 (or (= lt!606 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!610 (bvsdiv (bvmul lt!606 lt!610) lt!606)))))

(assert (=> d!1064 (= lt!610 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1064 (= lt!606 ((_ sign_extend 32) (size!37 (buf!349 (_2!26 lt!523)))))))

(assert (=> d!1064 (= lt!608 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1274 (_2!26 lt!523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1269 (_2!26 lt!523)))))))

(assert (=> d!1064 (invariant!0 (currentBit!1269 (_2!26 lt!523)) (currentByte!1274 (_2!26 lt!523)) (size!37 (buf!349 (_2!26 lt!523))))))

(assert (=> d!1064 (= (bitIndex!0 (size!37 (buf!349 (_2!26 lt!523))) (currentByte!1274 (_2!26 lt!523)) (currentBit!1269 (_2!26 lt!523))) lt!608)))

(declare-fun b!1055 () Bool)

(declare-fun res!3127 () Bool)

(assert (=> b!1055 (=> (not res!3127) (not e!621))))

(assert (=> b!1055 (= res!3127 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!608))))

(declare-fun b!1056 () Bool)

(declare-fun lt!611 () (_ BitVec 64))

(assert (=> b!1056 (= e!621 (bvsle lt!608 (bvmul lt!611 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1056 (or (= lt!611 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!611 #b0000000000000000000000000000000000000000000000000000000000001000) lt!611)))))

(assert (=> b!1056 (= lt!611 ((_ sign_extend 32) (size!37 (buf!349 (_2!26 lt!523)))))))

(assert (= (and d!1064 res!3126) b!1055))

(assert (= (and b!1055 res!3127) b!1056))

(declare-fun m!715 () Bool)

(assert (=> d!1064 m!715))

(assert (=> d!1064 m!635))

(assert (=> b!955 d!1064))

(declare-fun d!1076 () Bool)

(declare-fun e!622 () Bool)

(assert (=> d!1076 e!622))

(declare-fun res!3128 () Bool)

(assert (=> d!1076 (=> (not res!3128) (not e!622))))

(declare-fun lt!615 () (_ BitVec 64))

(declare-fun lt!614 () (_ BitVec 64))

(declare-fun lt!613 () (_ BitVec 64))

(assert (=> d!1076 (= res!3128 (= lt!614 (bvsub lt!613 lt!615)))))

(assert (=> d!1076 (or (= (bvand lt!613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!613 lt!615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1076 (= lt!615 (remainingBits!0 ((_ sign_extend 32) (size!37 (buf!349 thiss!932))) ((_ sign_extend 32) (currentByte!1274 thiss!932)) ((_ sign_extend 32) (currentBit!1269 thiss!932))))))

(declare-fun lt!612 () (_ BitVec 64))

(declare-fun lt!616 () (_ BitVec 64))

(assert (=> d!1076 (= lt!613 (bvmul lt!612 lt!616))))

(assert (=> d!1076 (or (= lt!612 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!616 (bvsdiv (bvmul lt!612 lt!616) lt!612)))))

(assert (=> d!1076 (= lt!616 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1076 (= lt!612 ((_ sign_extend 32) (size!37 (buf!349 thiss!932))))))

(assert (=> d!1076 (= lt!614 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1274 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1269 thiss!932))))))

(assert (=> d!1076 (invariant!0 (currentBit!1269 thiss!932) (currentByte!1274 thiss!932) (size!37 (buf!349 thiss!932)))))

(assert (=> d!1076 (= (bitIndex!0 (size!37 (buf!349 thiss!932)) (currentByte!1274 thiss!932) (currentBit!1269 thiss!932)) lt!614)))

(declare-fun b!1057 () Bool)

(declare-fun res!3129 () Bool)

(assert (=> b!1057 (=> (not res!3129) (not e!622))))

(assert (=> b!1057 (= res!3129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!614))))

(declare-fun b!1058 () Bool)

(declare-fun lt!617 () (_ BitVec 64))

(assert (=> b!1058 (= e!622 (bvsle lt!614 (bvmul lt!617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1058 (or (= lt!617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!617)))))

(assert (=> b!1058 (= lt!617 ((_ sign_extend 32) (size!37 (buf!349 thiss!932))))))

(assert (= (and d!1076 res!3128) b!1057))

(assert (= (and b!1057 res!3129) b!1058))

(declare-fun m!717 () Bool)

(assert (=> d!1076 m!717))

(declare-fun m!719 () Bool)

(assert (=> d!1076 m!719))

(assert (=> b!955 d!1076))

(assert (=> b!956 d!1050))

(declare-fun d!1078 () Bool)

(declare-datatypes ((tuple2!66 0))(
  ( (tuple2!67 (_1!33 Bool) (_2!33 BitStream!58)) )
))
(declare-fun lt!623 () tuple2!66)

(declare-fun readBit!0 (BitStream!58) tuple2!66)

(assert (=> d!1078 (= lt!623 (readBit!0 (readerFrom!0 (_2!26 lt!523) (currentBit!1269 thiss!932) (currentByte!1274 thiss!932))))))

(assert (=> d!1078 (= (readBitPure!0 (readerFrom!0 (_2!26 lt!523) (currentBit!1269 thiss!932) (currentByte!1274 thiss!932))) (tuple2!55 (_2!33 lt!623) (_1!33 lt!623)))))

(declare-fun bs!418 () Bool)

(assert (= bs!418 d!1078))

(assert (=> bs!418 m!639))

(declare-fun m!723 () Bool)

(assert (=> bs!418 m!723))

(assert (=> b!962 d!1078))

(declare-fun d!1082 () Bool)

(declare-fun e!628 () Bool)

(assert (=> d!1082 e!628))

(declare-fun res!3137 () Bool)

(assert (=> d!1082 (=> (not res!3137) (not e!628))))

(assert (=> d!1082 (= res!3137 (invariant!0 (currentBit!1269 (_2!26 lt!523)) (currentByte!1274 (_2!26 lt!523)) (size!37 (buf!349 (_2!26 lt!523)))))))

(assert (=> d!1082 (= (readerFrom!0 (_2!26 lt!523) (currentBit!1269 thiss!932) (currentByte!1274 thiss!932)) (BitStream!59 (buf!349 (_2!26 lt!523)) (currentByte!1274 thiss!932) (currentBit!1269 thiss!932)))))

(declare-fun b!1064 () Bool)

(assert (=> b!1064 (= e!628 (invariant!0 (currentBit!1269 thiss!932) (currentByte!1274 thiss!932) (size!37 (buf!349 (_2!26 lt!523)))))))

(assert (= (and d!1082 res!3137) b!1064))

(assert (=> d!1082 m!635))

(assert (=> b!1064 m!633))

(assert (=> b!962 d!1082))

(declare-fun d!1088 () Bool)

(assert (=> d!1088 (= (invariant!0 (currentBit!1269 (_2!26 lt!523)) (currentByte!1274 (_2!26 lt!523)) (size!37 (buf!349 (_2!26 lt!523)))) (and (bvsge (currentBit!1269 (_2!26 lt!523)) #b00000000000000000000000000000000) (bvslt (currentBit!1269 (_2!26 lt!523)) #b00000000000000000000000000001000) (bvsge (currentByte!1274 (_2!26 lt!523)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1274 (_2!26 lt!523)) (size!37 (buf!349 (_2!26 lt!523)))) (and (= (currentBit!1269 (_2!26 lt!523)) #b00000000000000000000000000000000) (= (currentByte!1274 (_2!26 lt!523)) (size!37 (buf!349 (_2!26 lt!523))))))))))

(assert (=> b!963 d!1088))

(declare-fun d!1090 () Bool)

(declare-fun e!629 () Bool)

(assert (=> d!1090 e!629))

(declare-fun res!3138 () Bool)

(assert (=> d!1090 (=> (not res!3138) (not e!629))))

(declare-fun lt!626 () (_ BitVec 64))

(declare-fun lt!627 () (_ BitVec 64))

(declare-fun lt!625 () (_ BitVec 64))

(assert (=> d!1090 (= res!3138 (= lt!626 (bvsub lt!625 lt!627)))))

(assert (=> d!1090 (or (= (bvand lt!625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!625 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!625 lt!627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1090 (= lt!627 (remainingBits!0 ((_ sign_extend 32) (size!37 (buf!349 (_1!27 lt!524)))) ((_ sign_extend 32) (currentByte!1274 (_1!27 lt!524))) ((_ sign_extend 32) (currentBit!1269 (_1!27 lt!524)))))))

(declare-fun lt!624 () (_ BitVec 64))

(declare-fun lt!628 () (_ BitVec 64))

(assert (=> d!1090 (= lt!625 (bvmul lt!624 lt!628))))

(assert (=> d!1090 (or (= lt!624 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!628 (bvsdiv (bvmul lt!624 lt!628) lt!624)))))

(assert (=> d!1090 (= lt!628 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1090 (= lt!624 ((_ sign_extend 32) (size!37 (buf!349 (_1!27 lt!524)))))))

(assert (=> d!1090 (= lt!626 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1274 (_1!27 lt!524))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1269 (_1!27 lt!524)))))))

(assert (=> d!1090 (invariant!0 (currentBit!1269 (_1!27 lt!524)) (currentByte!1274 (_1!27 lt!524)) (size!37 (buf!349 (_1!27 lt!524))))))

(assert (=> d!1090 (= (bitIndex!0 (size!37 (buf!349 (_1!27 lt!524))) (currentByte!1274 (_1!27 lt!524)) (currentBit!1269 (_1!27 lt!524))) lt!626)))

(declare-fun b!1065 () Bool)

(declare-fun res!3139 () Bool)

(assert (=> b!1065 (=> (not res!3139) (not e!629))))

(assert (=> b!1065 (= res!3139 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!626))))

(declare-fun b!1066 () Bool)

(declare-fun lt!629 () (_ BitVec 64))

(assert (=> b!1066 (= e!629 (bvsle lt!626 (bvmul lt!629 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1066 (or (= lt!629 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!629 #b0000000000000000000000000000000000000000000000000000000000001000) lt!629)))))

(assert (=> b!1066 (= lt!629 ((_ sign_extend 32) (size!37 (buf!349 (_1!27 lt!524)))))))

(assert (= (and d!1090 res!3138) b!1065))

(assert (= (and b!1065 res!3139) b!1066))

(declare-fun m!725 () Bool)

(assert (=> d!1090 m!725))

(declare-fun m!727 () Bool)

(assert (=> d!1090 m!727))

(assert (=> b!964 d!1090))

(declare-fun d!1092 () Bool)

(assert (=> d!1092 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!37 (buf!349 thiss!932))) ((_ sign_extend 32) (currentByte!1274 thiss!932)) ((_ sign_extend 32) (currentBit!1269 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!37 (buf!349 thiss!932))) ((_ sign_extend 32) (currentByte!1274 thiss!932)) ((_ sign_extend 32) (currentBit!1269 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!419 () Bool)

(assert (= bs!419 d!1092))

(assert (=> bs!419 m!717))

(assert (=> start!358 d!1092))

(declare-fun d!1094 () Bool)

(assert (=> d!1094 (= (inv!12 thiss!932) (invariant!0 (currentBit!1269 thiss!932) (currentByte!1274 thiss!932) (size!37 (buf!349 thiss!932))))))

(declare-fun bs!420 () Bool)

(assert (= bs!420 d!1094))

(assert (=> bs!420 m!719))

(assert (=> start!358 d!1094))

(assert (=> b!960 d!1064))

(assert (=> b!960 d!1076))

(declare-fun b!1117 () Bool)

(declare-fun e!656 () Bool)

(declare-fun lt!670 () tuple2!54)

(declare-fun lt!668 () tuple2!52)

(assert (=> b!1117 (= e!656 (= (bitIndex!0 (size!37 (buf!349 (_1!27 lt!670))) (currentByte!1274 (_1!27 lt!670)) (currentBit!1269 (_1!27 lt!670))) (bitIndex!0 (size!37 (buf!349 (_2!26 lt!668))) (currentByte!1274 (_2!26 lt!668)) (currentBit!1269 (_2!26 lt!668)))))))

(declare-fun b!1114 () Bool)

(declare-fun res!3189 () Bool)

(declare-fun e!657 () Bool)

(assert (=> b!1114 (=> (not res!3189) (not e!657))))

(declare-fun lt!671 () (_ BitVec 64))

(declare-fun lt!669 () (_ BitVec 64))

(assert (=> b!1114 (= res!3189 (= (bitIndex!0 (size!37 (buf!349 (_2!26 lt!668))) (currentByte!1274 (_2!26 lt!668)) (currentBit!1269 (_2!26 lt!668))) (bvadd lt!671 lt!669)))))

(assert (=> b!1114 (or (not (= (bvand lt!671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!669 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!671 lt!669) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1114 (= lt!669 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1114 (= lt!671 (bitIndex!0 (size!37 (buf!349 thiss!932)) (currentByte!1274 thiss!932) (currentBit!1269 thiss!932)))))

(declare-fun b!1115 () Bool)

(declare-fun res!3188 () Bool)

(assert (=> b!1115 (=> (not res!3188) (not e!657))))

(assert (=> b!1115 (= res!3188 (isPrefixOf!0 thiss!932 (_2!26 lt!668)))))

(declare-fun b!1116 () Bool)

(assert (=> b!1116 (= e!657 e!656)))

(declare-fun res!3187 () Bool)

(assert (=> b!1116 (=> (not res!3187) (not e!656))))

(assert (=> b!1116 (= res!3187 (and (= (_2!27 lt!670) true) (= (_1!27 lt!670) (_2!26 lt!668))))))

(assert (=> b!1116 (= lt!670 (readBitPure!0 (readerFrom!0 (_2!26 lt!668) (currentBit!1269 thiss!932) (currentByte!1274 thiss!932))))))

(declare-fun d!1096 () Bool)

(assert (=> d!1096 e!657))

(declare-fun res!3186 () Bool)

(assert (=> d!1096 (=> (not res!3186) (not e!657))))

(assert (=> d!1096 (= res!3186 (= (size!37 (buf!349 thiss!932)) (size!37 (buf!349 (_2!26 lt!668)))))))

(declare-fun choose!16 (BitStream!58 Bool) tuple2!52)

(assert (=> d!1096 (= lt!668 (choose!16 thiss!932 true))))

(assert (=> d!1096 (validate_offset_bit!0 ((_ sign_extend 32) (size!37 (buf!349 thiss!932))) ((_ sign_extend 32) (currentByte!1274 thiss!932)) ((_ sign_extend 32) (currentBit!1269 thiss!932)))))

(assert (=> d!1096 (= (appendBit!0 thiss!932 true) lt!668)))

(assert (= (and d!1096 res!3186) b!1114))

(assert (= (and b!1114 res!3189) b!1115))

(assert (= (and b!1115 res!3188) b!1116))

(assert (= (and b!1116 res!3187) b!1117))

(declare-fun m!747 () Bool)

(assert (=> d!1096 m!747))

(assert (=> d!1096 m!643))

(declare-fun m!749 () Bool)

(assert (=> b!1115 m!749))

(declare-fun m!751 () Bool)

(assert (=> b!1116 m!751))

(assert (=> b!1116 m!751))

(declare-fun m!753 () Bool)

(assert (=> b!1116 m!753))

(declare-fun m!755 () Bool)

(assert (=> b!1114 m!755))

(assert (=> b!1114 m!631))

(declare-fun m!757 () Bool)

(assert (=> b!1117 m!757))

(assert (=> b!1117 m!755))

(assert (=> b!961 d!1096))

(push 1)

(assert (not b!1033))

(assert (not b!1114))

(assert (not b!1031))

(assert (not d!1094))

(assert (not d!1078))

(assert (not d!1090))

(assert (not b!1115))

(assert (not b!1117))

(assert (not b!1116))

(assert (not d!1096))

(assert (not d!1092))

(assert (not d!1076))

(assert (not b!1064))

(assert (not d!1064))

(assert (not d!1082))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

