; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5040 () Bool)

(assert start!5040)

(declare-fun b!20053 () Bool)

(declare-fun e!13409 () Bool)

(declare-fun e!13405 () Bool)

(assert (=> b!20053 (= e!13409 (not e!13405))))

(declare-fun res!17456 () Bool)

(assert (=> b!20053 (=> res!17456 e!13405)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20053 (= res!17456 (bvsge i!635 to!314))))

(declare-datatypes ((array!1438 0))(
  ( (array!1439 (arr!1055 (Array (_ BitVec 32) (_ BitVec 8))) (size!611 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1056 0))(
  ( (BitStream!1057 (buf!917 array!1438) (currentByte!2203 (_ BitVec 32)) (currentBit!2198 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1056)

(declare-fun isPrefixOf!0 (BitStream!1056 BitStream!1056) Bool)

(assert (=> b!20053 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1772 0))(
  ( (Unit!1773) )
))
(declare-fun lt!28579 () Unit!1772)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1056) Unit!1772)

(assert (=> b!20053 (= lt!28579 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!28574 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20053 (= lt!28574 (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)))))

(declare-fun b!20054 () Bool)

(declare-fun res!17453 () Bool)

(assert (=> b!20054 (=> (not res!17453) (not e!13409))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20054 (= res!17453 (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 thiss!1379))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20055 () Bool)

(declare-fun e!13406 () Bool)

(declare-fun array_inv!581 (array!1438) Bool)

(assert (=> b!20055 (= e!13406 (array_inv!581 (buf!917 thiss!1379)))))

(declare-fun b!20056 () Bool)

(declare-fun e!13407 () Bool)

(declare-datatypes ((tuple2!2328 0))(
  ( (tuple2!2329 (_1!1249 Unit!1772) (_2!1249 BitStream!1056)) )
))
(declare-fun lt!28575 () tuple2!2328)

(declare-datatypes ((tuple2!2330 0))(
  ( (tuple2!2331 (_1!1250 BitStream!1056) (_2!1250 BitStream!1056)) )
))
(declare-fun lt!28576 () tuple2!2330)

(declare-datatypes ((List!229 0))(
  ( (Nil!226) (Cons!225 (h!344 Bool) (t!979 List!229)) )
))
(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1056 BitStream!1056 (_ BitVec 64)) List!229)

(assert (=> b!20056 (= e!13407 (not (= (bitStreamReadBitsIntoList!0 (_2!1249 lt!28575) (_1!1250 lt!28576) #b0000000000000000000000000000000000000000000000000000000000000001) Nil!226)))))

(assert (=> b!20056 (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28577 () Unit!1772)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1056 array!1438 (_ BitVec 64)) Unit!1772)

(assert (=> b!20056 (= lt!28577 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!917 (_2!1249 lt!28575)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1056 BitStream!1056) tuple2!2330)

(assert (=> b!20056 (= lt!28576 (reader!0 thiss!1379 (_2!1249 lt!28575)))))

(declare-fun res!17455 () Bool)

(assert (=> start!5040 (=> (not res!17455) (not e!13409))))

(declare-fun srcBuffer!2 () array!1438)

(assert (=> start!5040 (= res!17455 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!611 srcBuffer!2))))))))

(assert (=> start!5040 e!13409))

(assert (=> start!5040 true))

(assert (=> start!5040 (array_inv!581 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1056) Bool)

(assert (=> start!5040 (and (inv!12 thiss!1379) e!13406)))

(declare-fun b!20057 () Bool)

(assert (=> b!20057 (= e!13405 e!13407)))

(declare-fun res!17454 () Bool)

(assert (=> b!20057 (=> res!17454 e!13407)))

(assert (=> b!20057 (= res!17454 (not (isPrefixOf!0 thiss!1379 (_2!1249 lt!28575))))))

(assert (=> b!20057 (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 (_2!1249 lt!28575))) ((_ sign_extend 32) (currentBit!2198 (_2!1249 lt!28575))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!28578 () Unit!1772)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1056 BitStream!1056 (_ BitVec 64) (_ BitVec 64)) Unit!1772)

(assert (=> b!20057 (= lt!28578 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1249 lt!28575) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1056 (_ BitVec 8) (_ BitVec 32)) tuple2!2328)

(assert (=> b!20057 (= lt!28575 (appendBitFromByte!0 thiss!1379 (select (arr!1055 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5040 res!17455) b!20054))

(assert (= (and b!20054 res!17453) b!20053))

(assert (= (and b!20053 (not res!17456)) b!20057))

(assert (= (and b!20057 (not res!17454)) b!20056))

(assert (= start!5040 b!20055))

(declare-fun m!27125 () Bool)

(assert (=> b!20056 m!27125))

(declare-fun m!27127 () Bool)

(assert (=> b!20056 m!27127))

(declare-fun m!27129 () Bool)

(assert (=> b!20056 m!27129))

(declare-fun m!27131 () Bool)

(assert (=> b!20056 m!27131))

(declare-fun m!27133 () Bool)

(assert (=> b!20054 m!27133))

(declare-fun m!27135 () Bool)

(assert (=> b!20055 m!27135))

(declare-fun m!27137 () Bool)

(assert (=> start!5040 m!27137))

(declare-fun m!27139 () Bool)

(assert (=> start!5040 m!27139))

(declare-fun m!27141 () Bool)

(assert (=> b!20057 m!27141))

(declare-fun m!27143 () Bool)

(assert (=> b!20057 m!27143))

(declare-fun m!27145 () Bool)

(assert (=> b!20057 m!27145))

(declare-fun m!27147 () Bool)

(assert (=> b!20057 m!27147))

(assert (=> b!20057 m!27141))

(declare-fun m!27149 () Bool)

(assert (=> b!20057 m!27149))

(declare-fun m!27151 () Bool)

(assert (=> b!20053 m!27151))

(declare-fun m!27153 () Bool)

(assert (=> b!20053 m!27153))

(declare-fun m!27155 () Bool)

(assert (=> b!20053 m!27155))

(check-sat (not b!20056) (not b!20055) (not b!20054) (not b!20057) (not b!20053) (not start!5040))
(check-sat)
(get-model)

(declare-fun d!6530 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6530 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 thiss!1379))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!611 (buf!917 thiss!1379))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1919 () Bool)

(assert (= bs!1919 d!6530))

(declare-fun m!27189 () Bool)

(assert (=> bs!1919 m!27189))

(assert (=> b!20054 d!6530))

(declare-fun d!6532 () Bool)

(assert (=> d!6532 (= (array_inv!581 srcBuffer!2) (bvsge (size!611 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!5040 d!6532))

(declare-fun d!6534 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6534 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2198 thiss!1379) (currentByte!2203 thiss!1379) (size!611 (buf!917 thiss!1379))))))

(declare-fun bs!1920 () Bool)

(assert (= bs!1920 d!6534))

(declare-fun m!27191 () Bool)

(assert (=> bs!1920 m!27191))

(assert (=> start!5040 d!6534))

(declare-fun d!6536 () Bool)

(declare-fun res!17475 () Bool)

(declare-fun e!13434 () Bool)

(assert (=> d!6536 (=> (not res!17475) (not e!13434))))

(assert (=> d!6536 (= res!17475 (= (size!611 (buf!917 thiss!1379)) (size!611 (buf!917 thiss!1379))))))

(assert (=> d!6536 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!13434)))

(declare-fun b!20079 () Bool)

(declare-fun res!17476 () Bool)

(assert (=> b!20079 (=> (not res!17476) (not e!13434))))

(assert (=> b!20079 (= res!17476 (bvsle (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)) (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379))))))

(declare-fun b!20080 () Bool)

(declare-fun e!13433 () Bool)

(assert (=> b!20080 (= e!13434 e!13433)))

(declare-fun res!17477 () Bool)

(assert (=> b!20080 (=> res!17477 e!13433)))

(assert (=> b!20080 (= res!17477 (= (size!611 (buf!917 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20081 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1438 array!1438 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20081 (= e!13433 (arrayBitRangesEq!0 (buf!917 thiss!1379) (buf!917 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379))))))

(assert (= (and d!6536 res!17475) b!20079))

(assert (= (and b!20079 res!17476) b!20080))

(assert (= (and b!20080 (not res!17477)) b!20081))

(assert (=> b!20079 m!27155))

(assert (=> b!20079 m!27155))

(assert (=> b!20081 m!27155))

(assert (=> b!20081 m!27155))

(declare-fun m!27193 () Bool)

(assert (=> b!20081 m!27193))

(assert (=> b!20053 d!6536))

(declare-fun d!6538 () Bool)

(assert (=> d!6538 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!28600 () Unit!1772)

(declare-fun choose!11 (BitStream!1056) Unit!1772)

(assert (=> d!6538 (= lt!28600 (choose!11 thiss!1379))))

(assert (=> d!6538 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!28600)))

(declare-fun bs!1922 () Bool)

(assert (= bs!1922 d!6538))

(assert (=> bs!1922 m!27151))

(declare-fun m!27195 () Bool)

(assert (=> bs!1922 m!27195))

(assert (=> b!20053 d!6538))

(declare-fun d!6540 () Bool)

(declare-fun e!13437 () Bool)

(assert (=> d!6540 e!13437))

(declare-fun res!17483 () Bool)

(assert (=> d!6540 (=> (not res!17483) (not e!13437))))

(declare-fun lt!28616 () (_ BitVec 64))

(declare-fun lt!28614 () (_ BitVec 64))

(declare-fun lt!28613 () (_ BitVec 64))

(assert (=> d!6540 (= res!17483 (= lt!28616 (bvsub lt!28613 lt!28614)))))

(assert (=> d!6540 (or (= (bvand lt!28613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28614 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28613 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28613 lt!28614) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6540 (= lt!28614 (remainingBits!0 ((_ sign_extend 32) (size!611 (buf!917 thiss!1379))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379))))))

(declare-fun lt!28615 () (_ BitVec 64))

(declare-fun lt!28617 () (_ BitVec 64))

(assert (=> d!6540 (= lt!28613 (bvmul lt!28615 lt!28617))))

(assert (=> d!6540 (or (= lt!28615 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!28617 (bvsdiv (bvmul lt!28615 lt!28617) lt!28615)))))

(assert (=> d!6540 (= lt!28617 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6540 (= lt!28615 ((_ sign_extend 32) (size!611 (buf!917 thiss!1379))))))

(assert (=> d!6540 (= lt!28616 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2203 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2198 thiss!1379))))))

(assert (=> d!6540 (invariant!0 (currentBit!2198 thiss!1379) (currentByte!2203 thiss!1379) (size!611 (buf!917 thiss!1379)))))

(assert (=> d!6540 (= (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)) lt!28616)))

(declare-fun b!20086 () Bool)

(declare-fun res!17482 () Bool)

(assert (=> b!20086 (=> (not res!17482) (not e!13437))))

(assert (=> b!20086 (= res!17482 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!28616))))

(declare-fun b!20087 () Bool)

(declare-fun lt!28618 () (_ BitVec 64))

(assert (=> b!20087 (= e!13437 (bvsle lt!28616 (bvmul lt!28618 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!20087 (or (= lt!28618 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!28618 #b0000000000000000000000000000000000000000000000000000000000001000) lt!28618)))))

(assert (=> b!20087 (= lt!28618 ((_ sign_extend 32) (size!611 (buf!917 thiss!1379))))))

(assert (= (and d!6540 res!17483) b!20086))

(assert (= (and b!20086 res!17482) b!20087))

(assert (=> d!6540 m!27189))

(assert (=> d!6540 m!27191))

(assert (=> b!20053 d!6540))

(declare-fun b!20099 () Bool)

(declare-fun e!13442 () Bool)

(declare-fun lt!28626 () List!229)

(declare-fun length!47 (List!229) Int)

(assert (=> b!20099 (= e!13442 (> (length!47 lt!28626) 0))))

(declare-fun b!20097 () Bool)

(declare-datatypes ((tuple2!2336 0))(
  ( (tuple2!2337 (_1!1253 Bool) (_2!1253 BitStream!1056)) )
))
(declare-fun lt!28627 () tuple2!2336)

(declare-fun lt!28625 () (_ BitVec 64))

(declare-datatypes ((tuple2!2338 0))(
  ( (tuple2!2339 (_1!1254 List!229) (_2!1254 BitStream!1056)) )
))
(declare-fun e!13443 () tuple2!2338)

(assert (=> b!20097 (= e!13443 (tuple2!2339 (Cons!225 (_1!1253 lt!28627) (bitStreamReadBitsIntoList!0 (_2!1249 lt!28575) (_2!1253 lt!28627) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!28625))) (_2!1253 lt!28627)))))

(declare-fun readBit!0 (BitStream!1056) tuple2!2336)

(assert (=> b!20097 (= lt!28627 (readBit!0 (_1!1250 lt!28576)))))

(assert (=> b!20097 (= lt!28625 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!20098 () Bool)

(declare-fun isEmpty!52 (List!229) Bool)

(assert (=> b!20098 (= e!13442 (isEmpty!52 lt!28626))))

(declare-fun b!20096 () Bool)

(assert (=> b!20096 (= e!13443 (tuple2!2339 Nil!226 (_1!1250 lt!28576)))))

(declare-fun d!6542 () Bool)

(assert (=> d!6542 e!13442))

(declare-fun c!1438 () Bool)

(assert (=> d!6542 (= c!1438 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6542 (= lt!28626 (_1!1254 e!13443))))

(declare-fun c!1437 () Bool)

(assert (=> d!6542 (= c!1437 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!6542 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!6542 (= (bitStreamReadBitsIntoList!0 (_2!1249 lt!28575) (_1!1250 lt!28576) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28626)))

(assert (= (and d!6542 c!1437) b!20096))

(assert (= (and d!6542 (not c!1437)) b!20097))

(assert (= (and d!6542 c!1438) b!20098))

(assert (= (and d!6542 (not c!1438)) b!20099))

(declare-fun m!27199 () Bool)

(assert (=> b!20099 m!27199))

(declare-fun m!27201 () Bool)

(assert (=> b!20097 m!27201))

(declare-fun m!27203 () Bool)

(assert (=> b!20097 m!27203))

(declare-fun m!27205 () Bool)

(assert (=> b!20098 m!27205))

(assert (=> b!20056 d!6542))

(declare-fun d!6552 () Bool)

(assert (=> d!6552 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1924 () Bool)

(assert (= bs!1924 d!6552))

(declare-fun m!27207 () Bool)

(assert (=> bs!1924 m!27207))

(assert (=> b!20056 d!6552))

(declare-fun d!6554 () Bool)

(assert (=> d!6554 (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 thiss!1379)) ((_ sign_extend 32) (currentBit!2198 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!28630 () Unit!1772)

(declare-fun choose!9 (BitStream!1056 array!1438 (_ BitVec 64) BitStream!1056) Unit!1772)

(assert (=> d!6554 (= lt!28630 (choose!9 thiss!1379 (buf!917 (_2!1249 lt!28575)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1057 (buf!917 (_2!1249 lt!28575)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379))))))

(assert (=> d!6554 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!917 (_2!1249 lt!28575)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28630)))

(declare-fun bs!1925 () Bool)

(assert (= bs!1925 d!6554))

(assert (=> bs!1925 m!27127))

(declare-fun m!27209 () Bool)

(assert (=> bs!1925 m!27209))

(assert (=> b!20056 d!6554))

(declare-fun b!20134 () Bool)

(declare-fun e!13460 () Unit!1772)

(declare-fun lt!28701 () Unit!1772)

(assert (=> b!20134 (= e!13460 lt!28701)))

(declare-fun lt!28699 () (_ BitVec 64))

(assert (=> b!20134 (= lt!28699 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!28708 () (_ BitVec 64))

(assert (=> b!20134 (= lt!28708 (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1438 array!1438 (_ BitVec 64) (_ BitVec 64)) Unit!1772)

(assert (=> b!20134 (= lt!28701 (arrayBitRangesEqSymmetric!0 (buf!917 thiss!1379) (buf!917 (_2!1249 lt!28575)) lt!28699 lt!28708))))

(assert (=> b!20134 (arrayBitRangesEq!0 (buf!917 (_2!1249 lt!28575)) (buf!917 thiss!1379) lt!28699 lt!28708)))

(declare-fun b!20135 () Bool)

(declare-fun res!17492 () Bool)

(declare-fun e!13461 () Bool)

(assert (=> b!20135 (=> (not res!17492) (not e!13461))))

(declare-fun lt!28707 () tuple2!2330)

(assert (=> b!20135 (= res!17492 (isPrefixOf!0 (_1!1250 lt!28707) thiss!1379))))

(declare-fun b!20137 () Bool)

(declare-fun Unit!1776 () Unit!1772)

(assert (=> b!20137 (= e!13460 Unit!1776)))

(declare-fun lt!28705 () (_ BitVec 64))

(declare-fun b!20138 () Bool)

(declare-fun lt!28703 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1056 (_ BitVec 64)) BitStream!1056)

(assert (=> b!20138 (= e!13461 (= (_1!1250 lt!28707) (withMovedBitIndex!0 (_2!1250 lt!28707) (bvsub lt!28705 lt!28703))))))

(assert (=> b!20138 (or (= (bvand lt!28705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!28705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!28705 lt!28703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20138 (= lt!28703 (bitIndex!0 (size!611 (buf!917 (_2!1249 lt!28575))) (currentByte!2203 (_2!1249 lt!28575)) (currentBit!2198 (_2!1249 lt!28575))))))

(assert (=> b!20138 (= lt!28705 (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)))))

(declare-fun b!20136 () Bool)

(declare-fun res!17490 () Bool)

(assert (=> b!20136 (=> (not res!17490) (not e!13461))))

(assert (=> b!20136 (= res!17490 (isPrefixOf!0 (_2!1250 lt!28707) (_2!1249 lt!28575)))))

(declare-fun d!6556 () Bool)

(assert (=> d!6556 e!13461))

(declare-fun res!17491 () Bool)

(assert (=> d!6556 (=> (not res!17491) (not e!13461))))

(assert (=> d!6556 (= res!17491 (isPrefixOf!0 (_1!1250 lt!28707) (_2!1250 lt!28707)))))

(declare-fun lt!28696 () BitStream!1056)

(assert (=> d!6556 (= lt!28707 (tuple2!2331 lt!28696 (_2!1249 lt!28575)))))

(declare-fun lt!28709 () Unit!1772)

(declare-fun lt!28700 () Unit!1772)

(assert (=> d!6556 (= lt!28709 lt!28700)))

(assert (=> d!6556 (isPrefixOf!0 lt!28696 (_2!1249 lt!28575))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1056 BitStream!1056 BitStream!1056) Unit!1772)

(assert (=> d!6556 (= lt!28700 (lemmaIsPrefixTransitive!0 lt!28696 (_2!1249 lt!28575) (_2!1249 lt!28575)))))

(declare-fun lt!28714 () Unit!1772)

(declare-fun lt!28695 () Unit!1772)

(assert (=> d!6556 (= lt!28714 lt!28695)))

(assert (=> d!6556 (isPrefixOf!0 lt!28696 (_2!1249 lt!28575))))

(assert (=> d!6556 (= lt!28695 (lemmaIsPrefixTransitive!0 lt!28696 thiss!1379 (_2!1249 lt!28575)))))

(declare-fun lt!28706 () Unit!1772)

(assert (=> d!6556 (= lt!28706 e!13460)))

(declare-fun c!1453 () Bool)

(assert (=> d!6556 (= c!1453 (not (= (size!611 (buf!917 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!28698 () Unit!1772)

(declare-fun lt!28697 () Unit!1772)

(assert (=> d!6556 (= lt!28698 lt!28697)))

(assert (=> d!6556 (isPrefixOf!0 (_2!1249 lt!28575) (_2!1249 lt!28575))))

(assert (=> d!6556 (= lt!28697 (lemmaIsPrefixRefl!0 (_2!1249 lt!28575)))))

(declare-fun lt!28712 () Unit!1772)

(declare-fun lt!28710 () Unit!1772)

(assert (=> d!6556 (= lt!28712 lt!28710)))

(assert (=> d!6556 (= lt!28710 (lemmaIsPrefixRefl!0 (_2!1249 lt!28575)))))

(declare-fun lt!28702 () Unit!1772)

(declare-fun lt!28713 () Unit!1772)

(assert (=> d!6556 (= lt!28702 lt!28713)))

(assert (=> d!6556 (isPrefixOf!0 lt!28696 lt!28696)))

(assert (=> d!6556 (= lt!28713 (lemmaIsPrefixRefl!0 lt!28696))))

(declare-fun lt!28704 () Unit!1772)

(declare-fun lt!28711 () Unit!1772)

(assert (=> d!6556 (= lt!28704 lt!28711)))

(assert (=> d!6556 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6556 (= lt!28711 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6556 (= lt!28696 (BitStream!1057 (buf!917 (_2!1249 lt!28575)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)))))

(assert (=> d!6556 (isPrefixOf!0 thiss!1379 (_2!1249 lt!28575))))

(assert (=> d!6556 (= (reader!0 thiss!1379 (_2!1249 lt!28575)) lt!28707)))

(assert (= (and d!6556 c!1453) b!20134))

(assert (= (and d!6556 (not c!1453)) b!20137))

(assert (= (and d!6556 res!17491) b!20135))

(assert (= (and b!20135 res!17492) b!20136))

(assert (= (and b!20136 res!17490) b!20138))

(declare-fun m!27235 () Bool)

(assert (=> b!20136 m!27235))

(declare-fun m!27237 () Bool)

(assert (=> b!20138 m!27237))

(declare-fun m!27239 () Bool)

(assert (=> b!20138 m!27239))

(assert (=> b!20138 m!27155))

(declare-fun m!27241 () Bool)

(assert (=> b!20135 m!27241))

(assert (=> b!20134 m!27155))

(declare-fun m!27243 () Bool)

(assert (=> b!20134 m!27243))

(declare-fun m!27245 () Bool)

(assert (=> b!20134 m!27245))

(declare-fun m!27247 () Bool)

(assert (=> d!6556 m!27247))

(declare-fun m!27249 () Bool)

(assert (=> d!6556 m!27249))

(declare-fun m!27251 () Bool)

(assert (=> d!6556 m!27251))

(assert (=> d!6556 m!27153))

(declare-fun m!27253 () Bool)

(assert (=> d!6556 m!27253))

(assert (=> d!6556 m!27147))

(declare-fun m!27255 () Bool)

(assert (=> d!6556 m!27255))

(declare-fun m!27257 () Bool)

(assert (=> d!6556 m!27257))

(declare-fun m!27259 () Bool)

(assert (=> d!6556 m!27259))

(assert (=> d!6556 m!27151))

(declare-fun m!27261 () Bool)

(assert (=> d!6556 m!27261))

(assert (=> b!20056 d!6556))

(declare-fun d!6570 () Bool)

(declare-fun res!17493 () Bool)

(declare-fun e!13463 () Bool)

(assert (=> d!6570 (=> (not res!17493) (not e!13463))))

(assert (=> d!6570 (= res!17493 (= (size!611 (buf!917 thiss!1379)) (size!611 (buf!917 (_2!1249 lt!28575)))))))

(assert (=> d!6570 (= (isPrefixOf!0 thiss!1379 (_2!1249 lt!28575)) e!13463)))

(declare-fun b!20139 () Bool)

(declare-fun res!17494 () Bool)

(assert (=> b!20139 (=> (not res!17494) (not e!13463))))

(assert (=> b!20139 (= res!17494 (bvsle (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)) (bitIndex!0 (size!611 (buf!917 (_2!1249 lt!28575))) (currentByte!2203 (_2!1249 lt!28575)) (currentBit!2198 (_2!1249 lt!28575)))))))

(declare-fun b!20140 () Bool)

(declare-fun e!13462 () Bool)

(assert (=> b!20140 (= e!13463 e!13462)))

(declare-fun res!17495 () Bool)

(assert (=> b!20140 (=> res!17495 e!13462)))

(assert (=> b!20140 (= res!17495 (= (size!611 (buf!917 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!20141 () Bool)

(assert (=> b!20141 (= e!13462 (arrayBitRangesEq!0 (buf!917 thiss!1379) (buf!917 (_2!1249 lt!28575)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379))))))

(assert (= (and d!6570 res!17493) b!20139))

(assert (= (and b!20139 res!17494) b!20140))

(assert (= (and b!20140 (not res!17495)) b!20141))

(assert (=> b!20139 m!27155))

(assert (=> b!20139 m!27239))

(assert (=> b!20141 m!27155))

(assert (=> b!20141 m!27155))

(declare-fun m!27263 () Bool)

(assert (=> b!20141 m!27263))

(assert (=> b!20057 d!6570))

(declare-fun d!6572 () Bool)

(assert (=> d!6572 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 (_2!1249 lt!28575))) ((_ sign_extend 32) (currentBit!2198 (_2!1249 lt!28575))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 (_2!1249 lt!28575))) ((_ sign_extend 32) (currentBit!2198 (_2!1249 lt!28575)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1930 () Bool)

(assert (= bs!1930 d!6572))

(declare-fun m!27265 () Bool)

(assert (=> bs!1930 m!27265))

(assert (=> b!20057 d!6572))

(declare-fun d!6574 () Bool)

(declare-fun e!13470 () Bool)

(assert (=> d!6574 e!13470))

(declare-fun res!17504 () Bool)

(assert (=> d!6574 (=> (not res!17504) (not e!13470))))

(assert (=> d!6574 (= res!17504 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!28757 () Unit!1772)

(declare-fun choose!27 (BitStream!1056 BitStream!1056 (_ BitVec 64) (_ BitVec 64)) Unit!1772)

(assert (=> d!6574 (= lt!28757 (choose!27 thiss!1379 (_2!1249 lt!28575) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6574 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6574 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1249 lt!28575) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!28757)))

(declare-fun b!20154 () Bool)

(assert (=> b!20154 (= e!13470 (validate_offset_bits!1 ((_ sign_extend 32) (size!611 (buf!917 (_2!1249 lt!28575)))) ((_ sign_extend 32) (currentByte!2203 (_2!1249 lt!28575))) ((_ sign_extend 32) (currentBit!2198 (_2!1249 lt!28575))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6574 res!17504) b!20154))

(declare-fun m!27267 () Bool)

(assert (=> d!6574 m!27267))

(assert (=> b!20154 m!27143))

(assert (=> b!20057 d!6574))

(declare-fun b!20225 () Bool)

(declare-fun e!13512 () Bool)

(declare-fun e!13513 () Bool)

(assert (=> b!20225 (= e!13512 e!13513)))

(declare-fun res!17571 () Bool)

(assert (=> b!20225 (=> (not res!17571) (not e!13513))))

(declare-fun lt!28897 () Bool)

(declare-datatypes ((tuple2!2340 0))(
  ( (tuple2!2341 (_1!1255 BitStream!1056) (_2!1255 Bool)) )
))
(declare-fun lt!28892 () tuple2!2340)

(declare-fun lt!28894 () tuple2!2328)

(assert (=> b!20225 (= res!17571 (and (= (_2!1255 lt!28892) lt!28897) (= (_1!1255 lt!28892) (_2!1249 lt!28894))))))

(declare-fun readBitPure!0 (BitStream!1056) tuple2!2340)

(declare-fun readerFrom!0 (BitStream!1056 (_ BitVec 32) (_ BitVec 32)) BitStream!1056)

(assert (=> b!20225 (= lt!28892 (readBitPure!0 (readerFrom!0 (_2!1249 lt!28894) (currentBit!2198 thiss!1379) (currentByte!2203 thiss!1379))))))

(declare-fun b!20226 () Bool)

(declare-fun res!17570 () Bool)

(assert (=> b!20226 (=> (not res!17570) (not e!13512))))

(assert (=> b!20226 (= res!17570 (= (bitIndex!0 (size!611 (buf!917 (_2!1249 lt!28894))) (currentByte!2203 (_2!1249 lt!28894)) (currentBit!2198 (_2!1249 lt!28894))) (bvadd (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!20227 () Bool)

(declare-fun res!17569 () Bool)

(assert (=> b!20227 (=> (not res!17569) (not e!13512))))

(assert (=> b!20227 (= res!17569 (isPrefixOf!0 thiss!1379 (_2!1249 lt!28894)))))

(declare-fun b!20228 () Bool)

(declare-fun res!17568 () Bool)

(declare-fun e!13511 () Bool)

(assert (=> b!20228 (=> (not res!17568) (not e!13511))))

(declare-fun lt!28891 () (_ BitVec 64))

(declare-fun lt!28896 () (_ BitVec 64))

(declare-fun lt!28895 () tuple2!2328)

(assert (=> b!20228 (= res!17568 (= (bitIndex!0 (size!611 (buf!917 (_2!1249 lt!28895))) (currentByte!2203 (_2!1249 lt!28895)) (currentBit!2198 (_2!1249 lt!28895))) (bvadd lt!28896 lt!28891)))))

(assert (=> b!20228 (or (not (= (bvand lt!28896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!28891 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!28896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!28896 lt!28891) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!20228 (= lt!28891 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!20228 (= lt!28896 (bitIndex!0 (size!611 (buf!917 thiss!1379)) (currentByte!2203 thiss!1379) (currentBit!2198 thiss!1379)))))

(declare-fun b!20229 () Bool)

(declare-fun e!13510 () Bool)

(assert (=> b!20229 (= e!13511 e!13510)))

(declare-fun res!17572 () Bool)

(assert (=> b!20229 (=> (not res!17572) (not e!13510))))

(declare-fun lt!28889 () (_ BitVec 8))

(declare-fun lt!28893 () tuple2!2340)

(assert (=> b!20229 (= res!17572 (and (= (_2!1255 lt!28893) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1055 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!28889)) #b00000000000000000000000000000000))) (= (_1!1255 lt!28893) (_2!1249 lt!28895))))))

(declare-datatypes ((tuple2!2346 0))(
  ( (tuple2!2347 (_1!1258 array!1438) (_2!1258 BitStream!1056)) )
))
(declare-fun lt!28898 () tuple2!2346)

(declare-fun lt!28899 () BitStream!1056)

(declare-fun readBits!0 (BitStream!1056 (_ BitVec 64)) tuple2!2346)

(assert (=> b!20229 (= lt!28898 (readBits!0 lt!28899 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!20229 (= lt!28893 (readBitPure!0 lt!28899))))

(assert (=> b!20229 (= lt!28899 (readerFrom!0 (_2!1249 lt!28895) (currentBit!2198 thiss!1379) (currentByte!2203 thiss!1379)))))

(declare-fun b!20230 () Bool)

(assert (=> b!20230 (= e!13510 (= (bitIndex!0 (size!611 (buf!917 (_1!1255 lt!28893))) (currentByte!2203 (_1!1255 lt!28893)) (currentBit!2198 (_1!1255 lt!28893))) (bitIndex!0 (size!611 (buf!917 (_2!1249 lt!28895))) (currentByte!2203 (_2!1249 lt!28895)) (currentBit!2198 (_2!1249 lt!28895)))))))

(declare-fun d!6576 () Bool)

(assert (=> d!6576 e!13511))

(declare-fun res!17566 () Bool)

(assert (=> d!6576 (=> (not res!17566) (not e!13511))))

(assert (=> d!6576 (= res!17566 (= (size!611 (buf!917 (_2!1249 lt!28895))) (size!611 (buf!917 thiss!1379))))))

(declare-fun lt!28900 () array!1438)

(assert (=> d!6576 (= lt!28889 (select (arr!1055 lt!28900) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6576 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!611 lt!28900)))))

(assert (=> d!6576 (= lt!28900 (array!1439 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!28890 () tuple2!2328)

(assert (=> d!6576 (= lt!28895 (tuple2!2329 (_1!1249 lt!28890) (_2!1249 lt!28890)))))

(assert (=> d!6576 (= lt!28890 lt!28894)))

(assert (=> d!6576 e!13512))

(declare-fun res!17567 () Bool)

(assert (=> d!6576 (=> (not res!17567) (not e!13512))))

(assert (=> d!6576 (= res!17567 (= (size!611 (buf!917 thiss!1379)) (size!611 (buf!917 (_2!1249 lt!28894)))))))

(declare-fun appendBit!0 (BitStream!1056 Bool) tuple2!2328)

(assert (=> d!6576 (= lt!28894 (appendBit!0 thiss!1379 lt!28897))))

(assert (=> d!6576 (= lt!28897 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1055 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6576 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6576 (= (appendBitFromByte!0 thiss!1379 (select (arr!1055 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!28895)))

(declare-fun b!20231 () Bool)

(assert (=> b!20231 (= e!13513 (= (bitIndex!0 (size!611 (buf!917 (_1!1255 lt!28892))) (currentByte!2203 (_1!1255 lt!28892)) (currentBit!2198 (_1!1255 lt!28892))) (bitIndex!0 (size!611 (buf!917 (_2!1249 lt!28894))) (currentByte!2203 (_2!1249 lt!28894)) (currentBit!2198 (_2!1249 lt!28894)))))))

(declare-fun b!20232 () Bool)

(declare-fun res!17573 () Bool)

(assert (=> b!20232 (=> (not res!17573) (not e!13511))))

(assert (=> b!20232 (= res!17573 (isPrefixOf!0 thiss!1379 (_2!1249 lt!28895)))))

(assert (= (and d!6576 res!17567) b!20226))

(assert (= (and b!20226 res!17570) b!20227))

(assert (= (and b!20227 res!17569) b!20225))

(assert (= (and b!20225 res!17571) b!20231))

(assert (= (and d!6576 res!17566) b!20228))

(assert (= (and b!20228 res!17568) b!20232))

(assert (= (and b!20232 res!17573) b!20229))

(assert (= (and b!20229 res!17572) b!20230))

(declare-fun m!27345 () Bool)

(assert (=> b!20227 m!27345))

(declare-fun m!27347 () Bool)

(assert (=> b!20229 m!27347))

(declare-fun m!27349 () Bool)

(assert (=> b!20229 m!27349))

(declare-fun m!27351 () Bool)

(assert (=> b!20229 m!27351))

(declare-fun m!27353 () Bool)

(assert (=> b!20231 m!27353))

(declare-fun m!27355 () Bool)

(assert (=> b!20231 m!27355))

(declare-fun m!27357 () Bool)

(assert (=> b!20230 m!27357))

(declare-fun m!27359 () Bool)

(assert (=> b!20230 m!27359))

(declare-fun m!27361 () Bool)

(assert (=> b!20225 m!27361))

(assert (=> b!20225 m!27361))

(declare-fun m!27363 () Bool)

(assert (=> b!20225 m!27363))

(assert (=> b!20226 m!27355))

(assert (=> b!20226 m!27155))

(declare-fun m!27365 () Bool)

(assert (=> b!20232 m!27365))

(declare-fun m!27367 () Bool)

(assert (=> d!6576 m!27367))

(declare-fun m!27369 () Bool)

(assert (=> d!6576 m!27369))

(declare-fun m!27371 () Bool)

(assert (=> d!6576 m!27371))

(assert (=> b!20228 m!27359))

(assert (=> b!20228 m!27155))

(assert (=> b!20057 d!6576))

(declare-fun d!6608 () Bool)

(assert (=> d!6608 (= (array_inv!581 (buf!917 thiss!1379)) (bvsge (size!611 (buf!917 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!20055 d!6608))

(check-sat (not b!20097) (not b!20154) (not d!6572) (not b!20134) (not b!20139) (not d!6538) (not b!20228) (not b!20098) (not b!20229) (not b!20079) (not b!20226) (not d!6574) (not b!20230) (not d!6554) (not b!20225) (not d!6552) (not d!6576) (not b!20135) (not b!20081) (not b!20141) (not d!6530) (not b!20136) (not d!6556) (not d!6534) (not b!20231) (not b!20099) (not b!20232) (not d!6540) (not b!20138) (not b!20227))
