; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4870 () Bool)

(assert start!4870)

(declare-fun b!19339 () Bool)

(declare-fun e!12835 () Bool)

(declare-fun e!12838 () Bool)

(assert (=> b!19339 (= e!12835 e!12838)))

(declare-fun res!16895 () Bool)

(assert (=> b!19339 (=> res!16895 e!12838)))

(declare-datatypes ((array!1394 0))(
  ( (array!1395 (arr!1033 (Array (_ BitVec 32) (_ BitVec 8))) (size!592 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1018 0))(
  ( (BitStream!1019 (buf!892 array!1394) (currentByte!2172 (_ BitVec 32)) (currentBit!2167 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1018)

(declare-datatypes ((Unit!1728 0))(
  ( (Unit!1729) )
))
(declare-datatypes ((tuple2!2216 0))(
  ( (tuple2!2217 (_1!1193 Unit!1728) (_2!1193 BitStream!1018)) )
))
(declare-fun lt!27418 () tuple2!2216)

(declare-fun isPrefixOf!0 (BitStream!1018 BitStream!1018) Bool)

(assert (=> b!19339 (= res!16895 (not (isPrefixOf!0 thiss!1379 (_2!1193 lt!27418))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19339 (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 (_2!1193 lt!27418))) ((_ sign_extend 32) (currentBit!2167 (_2!1193 lt!27418))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27415 () Unit!1728)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1018 BitStream!1018 (_ BitVec 64) (_ BitVec 64)) Unit!1728)

(assert (=> b!19339 (= lt!27415 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1193 lt!27418) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1394)

(declare-fun appendBitFromByte!0 (BitStream!1018 (_ BitVec 8) (_ BitVec 32)) tuple2!2216)

(assert (=> b!19339 (= lt!27418 (appendBitFromByte!0 thiss!1379 (select (arr!1033 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!19340 () Bool)

(declare-fun e!12836 () Bool)

(assert (=> b!19340 (= e!12836 (not e!12835))))

(declare-fun res!16894 () Bool)

(assert (=> b!19340 (=> res!16894 e!12835)))

(assert (=> b!19340 (= res!16894 (bvsge i!635 to!314))))

(assert (=> b!19340 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27413 () Unit!1728)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1018) Unit!1728)

(assert (=> b!19340 (= lt!27413 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27417 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19340 (= lt!27417 (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)))))

(declare-fun res!16893 () Bool)

(assert (=> start!4870 (=> (not res!16893) (not e!12836))))

(assert (=> start!4870 (= res!16893 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!592 srcBuffer!2))))))))

(assert (=> start!4870 e!12836))

(assert (=> start!4870 true))

(declare-fun array_inv!562 (array!1394) Bool)

(assert (=> start!4870 (array_inv!562 srcBuffer!2)))

(declare-fun e!12837 () Bool)

(declare-fun inv!12 (BitStream!1018) Bool)

(assert (=> start!4870 (and (inv!12 thiss!1379) e!12837)))

(declare-fun b!19341 () Bool)

(declare-fun res!16892 () Bool)

(assert (=> b!19341 (=> (not res!16892) (not e!12836))))

(assert (=> b!19341 (= res!16892 (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 thiss!1379))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19342 () Bool)

(assert (=> b!19342 (= e!12837 (array_inv!562 (buf!892 thiss!1379)))))

(declare-fun b!19343 () Bool)

(declare-datatypes ((tuple2!2218 0))(
  ( (tuple2!2219 (_1!1194 BitStream!1018) (_2!1194 BitStream!1018)) )
))
(declare-fun lt!27416 () tuple2!2218)

(assert (=> b!19343 (= e!12838 (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_1!1194 lt!27416)))) ((_ sign_extend 32) (currentByte!2172 (_1!1194 lt!27416))) ((_ sign_extend 32) (currentBit!2167 (_1!1194 lt!27416))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19343 (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27414 () Unit!1728)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1018 array!1394 (_ BitVec 64)) Unit!1728)

(assert (=> b!19343 (= lt!27414 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!892 (_2!1193 lt!27418)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1018 BitStream!1018) tuple2!2218)

(assert (=> b!19343 (= lt!27416 (reader!0 thiss!1379 (_2!1193 lt!27418)))))

(assert (= (and start!4870 res!16893) b!19341))

(assert (= (and b!19341 res!16892) b!19340))

(assert (= (and b!19340 (not res!16894)) b!19339))

(assert (= (and b!19339 (not res!16895)) b!19343))

(assert (= start!4870 b!19342))

(declare-fun m!26031 () Bool)

(assert (=> b!19340 m!26031))

(declare-fun m!26033 () Bool)

(assert (=> b!19340 m!26033))

(declare-fun m!26035 () Bool)

(assert (=> b!19340 m!26035))

(declare-fun m!26037 () Bool)

(assert (=> b!19343 m!26037))

(declare-fun m!26039 () Bool)

(assert (=> b!19343 m!26039))

(declare-fun m!26041 () Bool)

(assert (=> b!19343 m!26041))

(declare-fun m!26043 () Bool)

(assert (=> b!19343 m!26043))

(declare-fun m!26045 () Bool)

(assert (=> b!19339 m!26045))

(declare-fun m!26047 () Bool)

(assert (=> b!19339 m!26047))

(declare-fun m!26049 () Bool)

(assert (=> b!19339 m!26049))

(assert (=> b!19339 m!26045))

(declare-fun m!26051 () Bool)

(assert (=> b!19339 m!26051))

(declare-fun m!26053 () Bool)

(assert (=> b!19339 m!26053))

(declare-fun m!26055 () Bool)

(assert (=> b!19341 m!26055))

(declare-fun m!26057 () Bool)

(assert (=> start!4870 m!26057))

(declare-fun m!26059 () Bool)

(assert (=> start!4870 m!26059))

(declare-fun m!26061 () Bool)

(assert (=> b!19342 m!26061))

(push 1)

(assert (not b!19339))

(assert (not b!19341))

(assert (not b!19343))

(assert (not b!19340))

(assert (not b!19342))

(assert (not start!4870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6340 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!6340 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 thiss!1379))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!592 (buf!892 thiss!1379))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!1857 () Bool)

(assert (= bs!1857 d!6340))

(declare-fun m!26135 () Bool)

(assert (=> bs!1857 m!26135))

(assert (=> b!19341 d!6340))

(declare-fun d!6342 () Bool)

(assert (=> d!6342 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_1!1194 lt!27416)))) ((_ sign_extend 32) (currentByte!2172 (_1!1194 lt!27416))) ((_ sign_extend 32) (currentBit!2167 (_1!1194 lt!27416))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!592 (buf!892 (_1!1194 lt!27416)))) ((_ sign_extend 32) (currentByte!2172 (_1!1194 lt!27416))) ((_ sign_extend 32) (currentBit!2167 (_1!1194 lt!27416)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1858 () Bool)

(assert (= bs!1858 d!6342))

(declare-fun m!26137 () Bool)

(assert (=> bs!1858 m!26137))

(assert (=> b!19343 d!6342))

(declare-fun d!6344 () Bool)

(assert (=> d!6344 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!1859 () Bool)

(assert (= bs!1859 d!6344))

(declare-fun m!26139 () Bool)

(assert (=> bs!1859 m!26139))

(assert (=> b!19343 d!6344))

(declare-fun d!6346 () Bool)

(assert (=> d!6346 (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27460 () Unit!1728)

(declare-fun choose!9 (BitStream!1018 array!1394 (_ BitVec 64) BitStream!1018) Unit!1728)

(assert (=> d!6346 (= lt!27460 (choose!9 thiss!1379 (buf!892 (_2!1193 lt!27418)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1019 (buf!892 (_2!1193 lt!27418)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379))))))

(assert (=> d!6346 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!892 (_2!1193 lt!27418)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!27460)))

(declare-fun bs!1860 () Bool)

(assert (= bs!1860 d!6346))

(assert (=> bs!1860 m!26039))

(declare-fun m!26141 () Bool)

(assert (=> bs!1860 m!26141))

(assert (=> b!19343 d!6346))

(declare-fun b!19417 () Bool)

(declare-fun res!16961 () Bool)

(declare-fun e!12904 () Bool)

(assert (=> b!19417 (=> (not res!16961) (not e!12904))))

(declare-fun lt!27529 () tuple2!2218)

(assert (=> b!19417 (= res!16961 (isPrefixOf!0 (_1!1194 lt!27529) thiss!1379))))

(declare-fun b!19418 () Bool)

(declare-fun res!16960 () Bool)

(assert (=> b!19418 (=> (not res!16960) (not e!12904))))

(assert (=> b!19418 (= res!16960 (isPrefixOf!0 (_2!1194 lt!27529) (_2!1193 lt!27418)))))

(declare-fun b!19419 () Bool)

(declare-fun e!12905 () Unit!1728)

(declare-fun lt!27527 () Unit!1728)

(assert (=> b!19419 (= e!12905 lt!27527)))

(declare-fun lt!27535 () (_ BitVec 64))

(assert (=> b!19419 (= lt!27535 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!27536 () (_ BitVec 64))

(assert (=> b!19419 (= lt!27536 (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1394 array!1394 (_ BitVec 64) (_ BitVec 64)) Unit!1728)

(assert (=> b!19419 (= lt!27527 (arrayBitRangesEqSymmetric!0 (buf!892 thiss!1379) (buf!892 (_2!1193 lt!27418)) lt!27535 lt!27536))))

(declare-fun arrayBitRangesEq!0 (array!1394 array!1394 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19419 (arrayBitRangesEq!0 (buf!892 (_2!1193 lt!27418)) (buf!892 thiss!1379) lt!27535 lt!27536)))

(declare-fun lt!27531 () (_ BitVec 64))

(declare-fun b!19420 () Bool)

(declare-fun lt!27533 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!1018 (_ BitVec 64)) BitStream!1018)

(assert (=> b!19420 (= e!12904 (= (_1!1194 lt!27529) (withMovedBitIndex!0 (_2!1194 lt!27529) (bvsub lt!27531 lt!27533))))))

(assert (=> b!19420 (or (= (bvand lt!27531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27533 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27531 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27531 lt!27533) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19420 (= lt!27533 (bitIndex!0 (size!592 (buf!892 (_2!1193 lt!27418))) (currentByte!2172 (_2!1193 lt!27418)) (currentBit!2167 (_2!1193 lt!27418))))))

(assert (=> b!19420 (= lt!27531 (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)))))

(declare-fun b!19421 () Bool)

(declare-fun Unit!1734 () Unit!1728)

(assert (=> b!19421 (= e!12905 Unit!1734)))

(declare-fun d!6348 () Bool)

(assert (=> d!6348 e!12904))

(declare-fun res!16959 () Bool)

(assert (=> d!6348 (=> (not res!16959) (not e!12904))))

(assert (=> d!6348 (= res!16959 (isPrefixOf!0 (_1!1194 lt!27529) (_2!1194 lt!27529)))))

(declare-fun lt!27544 () BitStream!1018)

(assert (=> d!6348 (= lt!27529 (tuple2!2219 lt!27544 (_2!1193 lt!27418)))))

(declare-fun lt!27534 () Unit!1728)

(declare-fun lt!27525 () Unit!1728)

(assert (=> d!6348 (= lt!27534 lt!27525)))

(assert (=> d!6348 (isPrefixOf!0 lt!27544 (_2!1193 lt!27418))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1018 BitStream!1018 BitStream!1018) Unit!1728)

(assert (=> d!6348 (= lt!27525 (lemmaIsPrefixTransitive!0 lt!27544 (_2!1193 lt!27418) (_2!1193 lt!27418)))))

(declare-fun lt!27539 () Unit!1728)

(declare-fun lt!27537 () Unit!1728)

(assert (=> d!6348 (= lt!27539 lt!27537)))

(assert (=> d!6348 (isPrefixOf!0 lt!27544 (_2!1193 lt!27418))))

(assert (=> d!6348 (= lt!27537 (lemmaIsPrefixTransitive!0 lt!27544 thiss!1379 (_2!1193 lt!27418)))))

(declare-fun lt!27540 () Unit!1728)

(assert (=> d!6348 (= lt!27540 e!12905)))

(declare-fun c!1390 () Bool)

(assert (=> d!6348 (= c!1390 (not (= (size!592 (buf!892 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!27538 () Unit!1728)

(declare-fun lt!27526 () Unit!1728)

(assert (=> d!6348 (= lt!27538 lt!27526)))

(assert (=> d!6348 (isPrefixOf!0 (_2!1193 lt!27418) (_2!1193 lt!27418))))

(assert (=> d!6348 (= lt!27526 (lemmaIsPrefixRefl!0 (_2!1193 lt!27418)))))

(declare-fun lt!27543 () Unit!1728)

(declare-fun lt!27541 () Unit!1728)

(assert (=> d!6348 (= lt!27543 lt!27541)))

(assert (=> d!6348 (= lt!27541 (lemmaIsPrefixRefl!0 (_2!1193 lt!27418)))))

(declare-fun lt!27542 () Unit!1728)

(declare-fun lt!27532 () Unit!1728)

(assert (=> d!6348 (= lt!27542 lt!27532)))

(assert (=> d!6348 (isPrefixOf!0 lt!27544 lt!27544)))

(assert (=> d!6348 (= lt!27532 (lemmaIsPrefixRefl!0 lt!27544))))

(declare-fun lt!27528 () Unit!1728)

(declare-fun lt!27530 () Unit!1728)

(assert (=> d!6348 (= lt!27528 lt!27530)))

(assert (=> d!6348 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!6348 (= lt!27530 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!6348 (= lt!27544 (BitStream!1019 (buf!892 (_2!1193 lt!27418)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)))))

(assert (=> d!6348 (isPrefixOf!0 thiss!1379 (_2!1193 lt!27418))))

(assert (=> d!6348 (= (reader!0 thiss!1379 (_2!1193 lt!27418)) lt!27529)))

(assert (= (and d!6348 c!1390) b!19419))

(assert (= (and d!6348 (not c!1390)) b!19421))

(assert (= (and d!6348 res!16959) b!19417))

(assert (= (and b!19417 res!16961) b!19418))

(assert (= (and b!19418 res!16960) b!19420))

(declare-fun m!26159 () Bool)

(assert (=> b!19417 m!26159))

(assert (=> b!19419 m!26035))

(declare-fun m!26161 () Bool)

(assert (=> b!19419 m!26161))

(declare-fun m!26163 () Bool)

(assert (=> b!19419 m!26163))

(declare-fun m!26165 () Bool)

(assert (=> d!6348 m!26165))

(assert (=> d!6348 m!26031))

(declare-fun m!26167 () Bool)

(assert (=> d!6348 m!26167))

(declare-fun m!26169 () Bool)

(assert (=> d!6348 m!26169))

(declare-fun m!26171 () Bool)

(assert (=> d!6348 m!26171))

(declare-fun m!26173 () Bool)

(assert (=> d!6348 m!26173))

(declare-fun m!26175 () Bool)

(assert (=> d!6348 m!26175))

(assert (=> d!6348 m!26047))

(declare-fun m!26177 () Bool)

(assert (=> d!6348 m!26177))

(assert (=> d!6348 m!26033))

(declare-fun m!26179 () Bool)

(assert (=> d!6348 m!26179))

(declare-fun m!26181 () Bool)

(assert (=> b!19420 m!26181))

(declare-fun m!26183 () Bool)

(assert (=> b!19420 m!26183))

(assert (=> b!19420 m!26035))

(declare-fun m!26185 () Bool)

(assert (=> b!19418 m!26185))

(assert (=> b!19343 d!6348))

(declare-fun d!6372 () Bool)

(assert (=> d!6372 (= (array_inv!562 (buf!892 thiss!1379)) (bvsge (size!592 (buf!892 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!19342 d!6372))

(declare-fun d!6374 () Bool)

(assert (=> d!6374 (= (array_inv!562 srcBuffer!2) (bvsge (size!592 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!4870 d!6374))

(declare-fun d!6376 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!6376 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2167 thiss!1379) (currentByte!2172 thiss!1379) (size!592 (buf!892 thiss!1379))))))

(declare-fun bs!1866 () Bool)

(assert (= bs!1866 d!6376))

(declare-fun m!26187 () Bool)

(assert (=> bs!1866 m!26187))

(assert (=> start!4870 d!6376))

(declare-fun d!6378 () Bool)

(declare-fun res!16969 () Bool)

(declare-fun e!12910 () Bool)

(assert (=> d!6378 (=> (not res!16969) (not e!12910))))

(assert (=> d!6378 (= res!16969 (= (size!592 (buf!892 thiss!1379)) (size!592 (buf!892 (_2!1193 lt!27418)))))))

(assert (=> d!6378 (= (isPrefixOf!0 thiss!1379 (_2!1193 lt!27418)) e!12910)))

(declare-fun b!19428 () Bool)

(declare-fun res!16968 () Bool)

(assert (=> b!19428 (=> (not res!16968) (not e!12910))))

(assert (=> b!19428 (= res!16968 (bvsle (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)) (bitIndex!0 (size!592 (buf!892 (_2!1193 lt!27418))) (currentByte!2172 (_2!1193 lt!27418)) (currentBit!2167 (_2!1193 lt!27418)))))))

(declare-fun b!19429 () Bool)

(declare-fun e!12911 () Bool)

(assert (=> b!19429 (= e!12910 e!12911)))

(declare-fun res!16970 () Bool)

(assert (=> b!19429 (=> res!16970 e!12911)))

(assert (=> b!19429 (= res!16970 (= (size!592 (buf!892 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19430 () Bool)

(assert (=> b!19430 (= e!12911 (arrayBitRangesEq!0 (buf!892 thiss!1379) (buf!892 (_2!1193 lt!27418)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379))))))

(assert (= (and d!6378 res!16969) b!19428))

(assert (= (and b!19428 res!16968) b!19429))

(assert (= (and b!19429 (not res!16970)) b!19430))

(assert (=> b!19428 m!26035))

(assert (=> b!19428 m!26183))

(assert (=> b!19430 m!26035))

(assert (=> b!19430 m!26035))

(declare-fun m!26189 () Bool)

(assert (=> b!19430 m!26189))

(assert (=> b!19339 d!6378))

(declare-fun d!6380 () Bool)

(assert (=> d!6380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 (_2!1193 lt!27418))) ((_ sign_extend 32) (currentBit!2167 (_2!1193 lt!27418))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 (_2!1193 lt!27418))) ((_ sign_extend 32) (currentBit!2167 (_2!1193 lt!27418)))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!1867 () Bool)

(assert (= bs!1867 d!6380))

(declare-fun m!26191 () Bool)

(assert (=> bs!1867 m!26191))

(assert (=> b!19339 d!6380))

(declare-fun d!6382 () Bool)

(declare-fun e!12914 () Bool)

(assert (=> d!6382 e!12914))

(declare-fun res!16973 () Bool)

(assert (=> d!6382 (=> (not res!16973) (not e!12914))))

(assert (=> d!6382 (= res!16973 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!27547 () Unit!1728)

(declare-fun choose!27 (BitStream!1018 BitStream!1018 (_ BitVec 64) (_ BitVec 64)) Unit!1728)

(assert (=> d!6382 (= lt!27547 (choose!27 thiss!1379 (_2!1193 lt!27418) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!6382 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!6382 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1193 lt!27418) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!27547)))

(declare-fun b!19433 () Bool)

(assert (=> b!19433 (= e!12914 (validate_offset_bits!1 ((_ sign_extend 32) (size!592 (buf!892 (_2!1193 lt!27418)))) ((_ sign_extend 32) (currentByte!2172 (_2!1193 lt!27418))) ((_ sign_extend 32) (currentBit!2167 (_2!1193 lt!27418))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!6382 res!16973) b!19433))

(declare-fun m!26193 () Bool)

(assert (=> d!6382 m!26193))

(assert (=> b!19433 m!26049))

(assert (=> b!19339 d!6382))

(declare-fun b!19540 () Bool)

(declare-fun res!17072 () Bool)

(declare-fun e!12964 () Bool)

(assert (=> b!19540 (=> (not res!17072) (not e!12964))))

(declare-fun lt!27793 () tuple2!2216)

(assert (=> b!19540 (= res!17072 (isPrefixOf!0 thiss!1379 (_2!1193 lt!27793)))))

(declare-fun b!19541 () Bool)

(declare-fun e!12967 () Bool)

(assert (=> b!19541 (= e!12964 e!12967)))

(declare-fun res!17070 () Bool)

(assert (=> b!19541 (=> (not res!17070) (not e!12967))))

(declare-datatypes ((tuple2!2236 0))(
  ( (tuple2!2237 (_1!1203 BitStream!1018) (_2!1203 Bool)) )
))
(declare-fun lt!27798 () tuple2!2236)

(declare-fun lt!27797 () Bool)

(assert (=> b!19541 (= res!17070 (and (= (_2!1203 lt!27798) lt!27797) (= (_1!1203 lt!27798) (_2!1193 lt!27793))))))

(declare-fun readBitPure!0 (BitStream!1018) tuple2!2236)

(declare-fun readerFrom!0 (BitStream!1018 (_ BitVec 32) (_ BitVec 32)) BitStream!1018)

(assert (=> b!19541 (= lt!27798 (readBitPure!0 (readerFrom!0 (_2!1193 lt!27793) (currentBit!2167 thiss!1379) (currentByte!2172 thiss!1379))))))

(declare-fun b!19542 () Bool)

(declare-fun res!17066 () Bool)

(declare-fun e!12966 () Bool)

(assert (=> b!19542 (=> (not res!17066) (not e!12966))))

(declare-fun lt!27800 () tuple2!2216)

(assert (=> b!19542 (= res!17066 (isPrefixOf!0 thiss!1379 (_2!1193 lt!27800)))))

(declare-fun b!19543 () Bool)

(declare-fun e!12965 () Bool)

(declare-fun lt!27799 () tuple2!2236)

(assert (=> b!19543 (= e!12965 (= (bitIndex!0 (size!592 (buf!892 (_1!1203 lt!27799))) (currentByte!2172 (_1!1203 lt!27799)) (currentBit!2167 (_1!1203 lt!27799))) (bitIndex!0 (size!592 (buf!892 (_2!1193 lt!27800))) (currentByte!2172 (_2!1193 lt!27800)) (currentBit!2167 (_2!1193 lt!27800)))))))

(declare-fun b!19544 () Bool)

(assert (=> b!19544 (= e!12967 (= (bitIndex!0 (size!592 (buf!892 (_1!1203 lt!27798))) (currentByte!2172 (_1!1203 lt!27798)) (currentBit!2167 (_1!1203 lt!27798))) (bitIndex!0 (size!592 (buf!892 (_2!1193 lt!27793))) (currentByte!2172 (_2!1193 lt!27793)) (currentBit!2167 (_2!1193 lt!27793)))))))

(declare-fun d!6384 () Bool)

(assert (=> d!6384 e!12966))

(declare-fun res!17069 () Bool)

(assert (=> d!6384 (=> (not res!17069) (not e!12966))))

(assert (=> d!6384 (= res!17069 (= (size!592 (buf!892 (_2!1193 lt!27800))) (size!592 (buf!892 thiss!1379))))))

(declare-fun lt!27795 () (_ BitVec 8))

(declare-fun lt!27796 () array!1394)

(assert (=> d!6384 (= lt!27795 (select (arr!1033 lt!27796) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!6384 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!592 lt!27796)))))

(assert (=> d!6384 (= lt!27796 (array!1395 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!27791 () tuple2!2216)

(assert (=> d!6384 (= lt!27800 (tuple2!2217 (_1!1193 lt!27791) (_2!1193 lt!27791)))))

(assert (=> d!6384 (= lt!27791 lt!27793)))

(assert (=> d!6384 e!12964))

(declare-fun res!17065 () Bool)

(assert (=> d!6384 (=> (not res!17065) (not e!12964))))

(assert (=> d!6384 (= res!17065 (= (size!592 (buf!892 thiss!1379)) (size!592 (buf!892 (_2!1193 lt!27793)))))))

(declare-fun appendBit!0 (BitStream!1018 Bool) tuple2!2216)

(assert (=> d!6384 (= lt!27793 (appendBit!0 thiss!1379 lt!27797))))

(assert (=> d!6384 (= lt!27797 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1033 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!6384 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!6384 (= (appendBitFromByte!0 thiss!1379 (select (arr!1033 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!27800)))

(declare-fun b!19545 () Bool)

(declare-fun res!17067 () Bool)

(assert (=> b!19545 (=> (not res!17067) (not e!12964))))

(assert (=> b!19545 (= res!17067 (= (bitIndex!0 (size!592 (buf!892 (_2!1193 lt!27793))) (currentByte!2172 (_2!1193 lt!27793)) (currentBit!2167 (_2!1193 lt!27793))) (bvadd (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!19546 () Bool)

(declare-fun res!17068 () Bool)

(assert (=> b!19546 (=> (not res!17068) (not e!12966))))

(declare-fun lt!27794 () (_ BitVec 64))

(declare-fun lt!27801 () (_ BitVec 64))

(assert (=> b!19546 (= res!17068 (= (bitIndex!0 (size!592 (buf!892 (_2!1193 lt!27800))) (currentByte!2172 (_2!1193 lt!27800)) (currentBit!2167 (_2!1193 lt!27800))) (bvadd lt!27801 lt!27794)))))

(assert (=> b!19546 (or (not (= (bvand lt!27801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27794 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!27801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!27801 lt!27794) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!19546 (= lt!27794 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!19546 (= lt!27801 (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)))))

(declare-fun b!19547 () Bool)

(assert (=> b!19547 (= e!12966 e!12965)))

(declare-fun res!17071 () Bool)

(assert (=> b!19547 (=> (not res!17071) (not e!12965))))

(assert (=> b!19547 (= res!17071 (and (= (_2!1203 lt!27799) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1033 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!27795)) #b00000000000000000000000000000000))) (= (_1!1203 lt!27799) (_2!1193 lt!27800))))))

(declare-datatypes ((tuple2!2238 0))(
  ( (tuple2!2239 (_1!1204 array!1394) (_2!1204 BitStream!1018)) )
))
(declare-fun lt!27792 () tuple2!2238)

(declare-fun lt!27802 () BitStream!1018)

(declare-fun readBits!0 (BitStream!1018 (_ BitVec 64)) tuple2!2238)

(assert (=> b!19547 (= lt!27792 (readBits!0 lt!27802 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19547 (= lt!27799 (readBitPure!0 lt!27802))))

(assert (=> b!19547 (= lt!27802 (readerFrom!0 (_2!1193 lt!27800) (currentBit!2167 thiss!1379) (currentByte!2172 thiss!1379)))))

(assert (= (and d!6384 res!17065) b!19545))

(assert (= (and b!19545 res!17067) b!19540))

(assert (= (and b!19540 res!17072) b!19541))

(assert (= (and b!19541 res!17070) b!19544))

(assert (= (and d!6384 res!17069) b!19546))

(assert (= (and b!19546 res!17068) b!19542))

(assert (= (and b!19542 res!17066) b!19547))

(assert (= (and b!19547 res!17071) b!19543))

(declare-fun m!26323 () Bool)

(assert (=> b!19540 m!26323))

(declare-fun m!26325 () Bool)

(assert (=> b!19542 m!26325))

(declare-fun m!26327 () Bool)

(assert (=> b!19543 m!26327))

(declare-fun m!26329 () Bool)

(assert (=> b!19543 m!26329))

(declare-fun m!26331 () Bool)

(assert (=> b!19545 m!26331))

(assert (=> b!19545 m!26035))

(declare-fun m!26333 () Bool)

(assert (=> b!19547 m!26333))

(declare-fun m!26335 () Bool)

(assert (=> b!19547 m!26335))

(declare-fun m!26337 () Bool)

(assert (=> b!19547 m!26337))

(assert (=> b!19546 m!26329))

(assert (=> b!19546 m!26035))

(declare-fun m!26339 () Bool)

(assert (=> b!19544 m!26339))

(assert (=> b!19544 m!26331))

(declare-fun m!26341 () Bool)

(assert (=> b!19541 m!26341))

(assert (=> b!19541 m!26341))

(declare-fun m!26343 () Bool)

(assert (=> b!19541 m!26343))

(declare-fun m!26345 () Bool)

(assert (=> d!6384 m!26345))

(declare-fun m!26347 () Bool)

(assert (=> d!6384 m!26347))

(declare-fun m!26349 () Bool)

(assert (=> d!6384 m!26349))

(assert (=> b!19339 d!6384))

(declare-fun d!6416 () Bool)

(declare-fun res!17074 () Bool)

(declare-fun e!12968 () Bool)

(assert (=> d!6416 (=> (not res!17074) (not e!12968))))

(assert (=> d!6416 (= res!17074 (= (size!592 (buf!892 thiss!1379)) (size!592 (buf!892 thiss!1379))))))

(assert (=> d!6416 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!12968)))

(declare-fun b!19548 () Bool)

(declare-fun res!17073 () Bool)

(assert (=> b!19548 (=> (not res!17073) (not e!12968))))

(assert (=> b!19548 (= res!17073 (bvsle (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)) (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379))))))

(declare-fun b!19549 () Bool)

(declare-fun e!12969 () Bool)

(assert (=> b!19549 (= e!12968 e!12969)))

(declare-fun res!17075 () Bool)

(assert (=> b!19549 (=> res!17075 e!12969)))

(assert (=> b!19549 (= res!17075 (= (size!592 (buf!892 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!19550 () Bool)

(assert (=> b!19550 (= e!12969 (arrayBitRangesEq!0 (buf!892 thiss!1379) (buf!892 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379))))))

(assert (= (and d!6416 res!17074) b!19548))

(assert (= (and b!19548 res!17073) b!19549))

(assert (= (and b!19549 (not res!17075)) b!19550))

(assert (=> b!19548 m!26035))

(assert (=> b!19548 m!26035))

(assert (=> b!19550 m!26035))

(assert (=> b!19550 m!26035))

(declare-fun m!26351 () Bool)

(assert (=> b!19550 m!26351))

(assert (=> b!19340 d!6416))

(declare-fun d!6418 () Bool)

(assert (=> d!6418 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27805 () Unit!1728)

(declare-fun choose!11 (BitStream!1018) Unit!1728)

(assert (=> d!6418 (= lt!27805 (choose!11 thiss!1379))))

(assert (=> d!6418 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!27805)))

(declare-fun bs!1879 () Bool)

(assert (= bs!1879 d!6418))

(assert (=> bs!1879 m!26031))

(declare-fun m!26353 () Bool)

(assert (=> bs!1879 m!26353))

(assert (=> b!19340 d!6418))

(declare-fun d!6420 () Bool)

(declare-fun e!12972 () Bool)

(assert (=> d!6420 e!12972))

(declare-fun res!17081 () Bool)

(assert (=> d!6420 (=> (not res!17081) (not e!12972))))

(declare-fun lt!27822 () (_ BitVec 64))

(declare-fun lt!27820 () (_ BitVec 64))

(declare-fun lt!27818 () (_ BitVec 64))

(assert (=> d!6420 (= res!17081 (= lt!27820 (bvsub lt!27818 lt!27822)))))

(assert (=> d!6420 (or (= (bvand lt!27818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!27822 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!27818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!27818 lt!27822) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!6420 (= lt!27822 (remainingBits!0 ((_ sign_extend 32) (size!592 (buf!892 thiss!1379))) ((_ sign_extend 32) (currentByte!2172 thiss!1379)) ((_ sign_extend 32) (currentBit!2167 thiss!1379))))))

(declare-fun lt!27823 () (_ BitVec 64))

(declare-fun lt!27819 () (_ BitVec 64))

(assert (=> d!6420 (= lt!27818 (bvmul lt!27823 lt!27819))))

(assert (=> d!6420 (or (= lt!27823 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!27819 (bvsdiv (bvmul lt!27823 lt!27819) lt!27823)))))

(assert (=> d!6420 (= lt!27819 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!6420 (= lt!27823 ((_ sign_extend 32) (size!592 (buf!892 thiss!1379))))))

(assert (=> d!6420 (= lt!27820 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2172 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2167 thiss!1379))))))

(assert (=> d!6420 (invariant!0 (currentBit!2167 thiss!1379) (currentByte!2172 thiss!1379) (size!592 (buf!892 thiss!1379)))))

(assert (=> d!6420 (= (bitIndex!0 (size!592 (buf!892 thiss!1379)) (currentByte!2172 thiss!1379) (currentBit!2167 thiss!1379)) lt!27820)))

(declare-fun b!19555 () Bool)

(declare-fun res!17080 () Bool)

(assert (=> b!19555 (=> (not res!17080) (not e!12972))))

(assert (=> b!19555 (= res!17080 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!27820))))

(declare-fun b!19556 () Bool)

(declare-fun lt!27821 () (_ BitVec 64))

(assert (=> b!19556 (= e!12972 (bvsle lt!27820 (bvmul lt!27821 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!19556 (or (= lt!27821 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!27821 #b0000000000000000000000000000000000000000000000000000000000001000) lt!27821)))))

(assert (=> b!19556 (= lt!27821 ((_ sign_extend 32) (size!592 (buf!892 thiss!1379))))))

(assert (= (and d!6420 res!17081) b!19555))

(assert (= (and b!19555 res!17080) b!19556))

(assert (=> d!6420 m!26135))

(assert (=> d!6420 m!26187))

(assert (=> b!19340 d!6420))

(push 1)

(assert (not d!6376))

(assert (not d!6346))

(assert (not b!19541))

(assert (not b!19417))

(assert (not b!19547))

(assert (not d!6380))

(assert (not b!19543))

(assert (not b!19550))

(assert (not d!6384))

(assert (not b!19546))

(assert (not d!6418))

(assert (not b!19544))

(assert (not d!6348))

(assert (not d!6382))

(assert (not b!19433))

(assert (not b!19545))

(assert (not b!19540))

(assert (not b!19548))

(assert (not d!6340))

(assert (not b!19419))

(assert (not b!19420))

(assert (not d!6344))

(assert (not b!19418))

(assert (not d!6342))

(assert (not b!19430))

(assert (not b!19542))

(assert (not b!19428))

(assert (not d!6420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

