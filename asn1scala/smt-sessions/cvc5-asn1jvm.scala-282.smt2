; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5672 () Bool)

(assert start!5672)

(declare-fun b!23748 () Bool)

(declare-fun e!16112 () Bool)

(declare-fun e!16111 () Bool)

(assert (=> b!23748 (= e!16112 e!16111)))

(declare-fun res!20454 () Bool)

(assert (=> b!23748 (=> res!20454 e!16111)))

(declare-datatypes ((array!1595 0))(
  ( (array!1596 (arr!1139 (Array (_ BitVec 32) (_ BitVec 8))) (size!683 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1198 0))(
  ( (BitStream!1199 (buf!1004 array!1595) (currentByte!2317 (_ BitVec 32)) (currentBit!2312 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2009 0))(
  ( (Unit!2010) )
))
(declare-datatypes ((tuple2!2714 0))(
  ( (tuple2!2715 (_1!1444 Unit!2009) (_2!1444 BitStream!1198)) )
))
(declare-fun lt!34249 () tuple2!2714)

(declare-fun lt!34242 () tuple2!2714)

(assert (=> b!23748 (= res!20454 (not (= (size!683 (buf!1004 (_2!1444 lt!34249))) (size!683 (buf!1004 (_2!1444 lt!34242))))))))

(declare-fun e!16120 () Bool)

(assert (=> b!23748 e!16120))

(declare-fun res!20451 () Bool)

(assert (=> b!23748 (=> (not res!20451) (not e!16120))))

(declare-fun thiss!1379 () BitStream!1198)

(assert (=> b!23748 (= res!20451 (= (size!683 (buf!1004 (_2!1444 lt!34242))) (size!683 (buf!1004 thiss!1379))))))

(declare-fun b!23749 () Bool)

(declare-fun e!16114 () Bool)

(declare-fun e!16119 () Bool)

(assert (=> b!23749 (= e!16114 e!16119)))

(declare-fun res!20450 () Bool)

(assert (=> b!23749 (=> res!20450 e!16119)))

(declare-fun isPrefixOf!0 (BitStream!1198 BitStream!1198) Bool)

(assert (=> b!23749 (= res!20450 (not (isPrefixOf!0 thiss!1379 (_2!1444 lt!34249))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23749 (validate_offset_bits!1 ((_ sign_extend 32) (size!683 (buf!1004 (_2!1444 lt!34249)))) ((_ sign_extend 32) (currentByte!2317 (_2!1444 lt!34249))) ((_ sign_extend 32) (currentBit!2312 (_2!1444 lt!34249))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34246 () Unit!2009)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1198 BitStream!1198 (_ BitVec 64) (_ BitVec 64)) Unit!2009)

(assert (=> b!23749 (= lt!34246 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1444 lt!34249) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1595)

(declare-fun appendBitFromByte!0 (BitStream!1198 (_ BitVec 8) (_ BitVec 32)) tuple2!2714)

(assert (=> b!23749 (= lt!34249 (appendBitFromByte!0 thiss!1379 (select (arr!1139 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!23750 () Bool)

(declare-fun lt!34243 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23750 (= e!16120 (= lt!34243 (bvsub (bvsub (bvadd (bitIndex!0 (size!683 (buf!1004 (_2!1444 lt!34249))) (currentByte!2317 (_2!1444 lt!34249)) (currentBit!2312 (_2!1444 lt!34249))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23751 () Bool)

(declare-fun res!20458 () Bool)

(declare-fun e!16113 () Bool)

(assert (=> b!23751 (=> (not res!20458) (not e!16113))))

(assert (=> b!23751 (= res!20458 (validate_offset_bits!1 ((_ sign_extend 32) (size!683 (buf!1004 thiss!1379))) ((_ sign_extend 32) (currentByte!2317 thiss!1379)) ((_ sign_extend 32) (currentBit!2312 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23752 () Bool)

(declare-fun res!20456 () Bool)

(assert (=> b!23752 (=> res!20456 e!16112)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23752 (= res!20456 (not (invariant!0 (currentBit!2312 (_2!1444 lt!34242)) (currentByte!2317 (_2!1444 lt!34242)) (size!683 (buf!1004 (_2!1444 lt!34242))))))))

(declare-fun b!23753 () Bool)

(declare-fun res!20449 () Bool)

(assert (=> b!23753 (=> res!20449 e!16111)))

(assert (=> b!23753 (= res!20449 (not (invariant!0 (currentBit!2312 (_2!1444 lt!34249)) (currentByte!2317 (_2!1444 lt!34249)) (size!683 (buf!1004 (_2!1444 lt!34242))))))))

(declare-fun b!23754 () Bool)

(declare-fun res!20457 () Bool)

(assert (=> b!23754 (=> res!20457 e!16111)))

(assert (=> b!23754 (= res!20457 (not (invariant!0 (currentBit!2312 (_2!1444 lt!34249)) (currentByte!2317 (_2!1444 lt!34249)) (size!683 (buf!1004 (_2!1444 lt!34249))))))))

(declare-fun res!20448 () Bool)

(assert (=> start!5672 (=> (not res!20448) (not e!16113))))

(assert (=> start!5672 (= res!20448 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!683 srcBuffer!2))))))))

(assert (=> start!5672 e!16113))

(assert (=> start!5672 true))

(declare-fun array_inv!652 (array!1595) Bool)

(assert (=> start!5672 (array_inv!652 srcBuffer!2)))

(declare-fun e!16115 () Bool)

(declare-fun inv!12 (BitStream!1198) Bool)

(assert (=> start!5672 (and (inv!12 thiss!1379) e!16115)))

(declare-fun b!23755 () Bool)

(declare-fun res!20452 () Bool)

(assert (=> b!23755 (=> res!20452 e!16112)))

(assert (=> b!23755 (= res!20452 (not (= (size!683 (buf!1004 thiss!1379)) (size!683 (buf!1004 (_2!1444 lt!34242))))))))

(declare-fun b!23756 () Bool)

(declare-fun e!16116 () Bool)

(assert (=> b!23756 (= e!16116 e!16112)))

(declare-fun res!20459 () Bool)

(assert (=> b!23756 (=> res!20459 e!16112)))

(declare-fun lt!34238 () (_ BitVec 64))

(assert (=> b!23756 (= res!20459 (not (= lt!34243 (bvsub (bvadd lt!34238 to!314) i!635))))))

(assert (=> b!23756 (= lt!34243 (bitIndex!0 (size!683 (buf!1004 (_2!1444 lt!34242))) (currentByte!2317 (_2!1444 lt!34242)) (currentBit!2312 (_2!1444 lt!34242))))))

(declare-fun e!16117 () Bool)

(declare-datatypes ((tuple2!2716 0))(
  ( (tuple2!2717 (_1!1445 BitStream!1198) (_2!1445 BitStream!1198)) )
))
(declare-fun lt!34244 () tuple2!2716)

(declare-fun b!23757 () Bool)

(declare-datatypes ((List!300 0))(
  ( (Nil!297) (Cons!296 (h!415 Bool) (t!1050 List!300)) )
))
(declare-fun head!137 (List!300) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1198 array!1595 (_ BitVec 64) (_ BitVec 64)) List!300)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1198 BitStream!1198 (_ BitVec 64)) List!300)

(assert (=> b!23757 (= e!16117 (= (head!137 (byteArrayBitContentToList!0 (_2!1444 lt!34249) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!137 (bitStreamReadBitsIntoList!0 (_2!1444 lt!34249) (_1!1445 lt!34244) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23758 () Bool)

(assert (=> b!23758 (= e!16111 true)))

(declare-fun lt!34241 () tuple2!2716)

(declare-fun reader!0 (BitStream!1198 BitStream!1198) tuple2!2716)

(assert (=> b!23758 (= lt!34241 (reader!0 (_2!1444 lt!34249) (_2!1444 lt!34242)))))

(assert (=> b!23758 (validate_offset_bits!1 ((_ sign_extend 32) (size!683 (buf!1004 (_2!1444 lt!34242)))) ((_ sign_extend 32) (currentByte!2317 thiss!1379)) ((_ sign_extend 32) (currentBit!2312 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34247 () Unit!2009)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1198 array!1595 (_ BitVec 64)) Unit!2009)

(assert (=> b!23758 (= lt!34247 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1004 (_2!1444 lt!34242)) (bvsub to!314 i!635)))))

(declare-fun lt!34248 () tuple2!2716)

(assert (=> b!23758 (= lt!34248 (reader!0 thiss!1379 (_2!1444 lt!34242)))))

(declare-fun b!23759 () Bool)

(assert (=> b!23759 (= e!16119 e!16116)))

(declare-fun res!20455 () Bool)

(assert (=> b!23759 (=> res!20455 e!16116)))

(assert (=> b!23759 (= res!20455 (not (isPrefixOf!0 (_2!1444 lt!34249) (_2!1444 lt!34242))))))

(assert (=> b!23759 (isPrefixOf!0 thiss!1379 (_2!1444 lt!34242))))

(declare-fun lt!34239 () Unit!2009)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1198 BitStream!1198 BitStream!1198) Unit!2009)

(assert (=> b!23759 (= lt!34239 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1444 lt!34249) (_2!1444 lt!34242)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1198 array!1595 (_ BitVec 64) (_ BitVec 64)) tuple2!2714)

(assert (=> b!23759 (= lt!34242 (appendBitsMSBFirstLoop!0 (_2!1444 lt!34249) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!23759 e!16117))

(declare-fun res!20460 () Bool)

(assert (=> b!23759 (=> (not res!20460) (not e!16117))))

(assert (=> b!23759 (= res!20460 (validate_offset_bits!1 ((_ sign_extend 32) (size!683 (buf!1004 (_2!1444 lt!34249)))) ((_ sign_extend 32) (currentByte!2317 thiss!1379)) ((_ sign_extend 32) (currentBit!2312 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34240 () Unit!2009)

(assert (=> b!23759 (= lt!34240 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1004 (_2!1444 lt!34249)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!23759 (= lt!34244 (reader!0 thiss!1379 (_2!1444 lt!34249)))))

(declare-fun b!23760 () Bool)

(assert (=> b!23760 (= e!16115 (array_inv!652 (buf!1004 thiss!1379)))))

(declare-fun b!23761 () Bool)

(assert (=> b!23761 (= e!16113 (not e!16114))))

(declare-fun res!20453 () Bool)

(assert (=> b!23761 (=> res!20453 e!16114)))

(assert (=> b!23761 (= res!20453 (bvsge i!635 to!314))))

(assert (=> b!23761 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34245 () Unit!2009)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1198) Unit!2009)

(assert (=> b!23761 (= lt!34245 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23761 (= lt!34238 (bitIndex!0 (size!683 (buf!1004 thiss!1379)) (currentByte!2317 thiss!1379) (currentBit!2312 thiss!1379)))))

(assert (= (and start!5672 res!20448) b!23751))

(assert (= (and b!23751 res!20458) b!23761))

(assert (= (and b!23761 (not res!20453)) b!23749))

(assert (= (and b!23749 (not res!20450)) b!23759))

(assert (= (and b!23759 res!20460) b!23757))

(assert (= (and b!23759 (not res!20455)) b!23756))

(assert (= (and b!23756 (not res!20459)) b!23752))

(assert (= (and b!23752 (not res!20456)) b!23755))

(assert (= (and b!23755 (not res!20452)) b!23748))

(assert (= (and b!23748 res!20451) b!23750))

(assert (= (and b!23748 (not res!20454)) b!23754))

(assert (= (and b!23754 (not res!20457)) b!23753))

(assert (= (and b!23753 (not res!20449)) b!23758))

(assert (= start!5672 b!23760))

(declare-fun m!33405 () Bool)

(assert (=> b!23753 m!33405))

(declare-fun m!33407 () Bool)

(assert (=> b!23751 m!33407))

(declare-fun m!33409 () Bool)

(assert (=> b!23757 m!33409))

(assert (=> b!23757 m!33409))

(declare-fun m!33411 () Bool)

(assert (=> b!23757 m!33411))

(declare-fun m!33413 () Bool)

(assert (=> b!23757 m!33413))

(assert (=> b!23757 m!33413))

(declare-fun m!33415 () Bool)

(assert (=> b!23757 m!33415))

(declare-fun m!33417 () Bool)

(assert (=> start!5672 m!33417))

(declare-fun m!33419 () Bool)

(assert (=> start!5672 m!33419))

(declare-fun m!33421 () Bool)

(assert (=> b!23749 m!33421))

(declare-fun m!33423 () Bool)

(assert (=> b!23749 m!33423))

(declare-fun m!33425 () Bool)

(assert (=> b!23749 m!33425))

(declare-fun m!33427 () Bool)

(assert (=> b!23749 m!33427))

(assert (=> b!23749 m!33423))

(declare-fun m!33429 () Bool)

(assert (=> b!23749 m!33429))

(declare-fun m!33431 () Bool)

(assert (=> b!23761 m!33431))

(declare-fun m!33433 () Bool)

(assert (=> b!23761 m!33433))

(declare-fun m!33435 () Bool)

(assert (=> b!23761 m!33435))

(declare-fun m!33437 () Bool)

(assert (=> b!23758 m!33437))

(declare-fun m!33439 () Bool)

(assert (=> b!23758 m!33439))

(declare-fun m!33441 () Bool)

(assert (=> b!23758 m!33441))

(declare-fun m!33443 () Bool)

(assert (=> b!23758 m!33443))

(declare-fun m!33445 () Bool)

(assert (=> b!23756 m!33445))

(declare-fun m!33447 () Bool)

(assert (=> b!23759 m!33447))

(declare-fun m!33449 () Bool)

(assert (=> b!23759 m!33449))

(declare-fun m!33451 () Bool)

(assert (=> b!23759 m!33451))

(declare-fun m!33453 () Bool)

(assert (=> b!23759 m!33453))

(declare-fun m!33455 () Bool)

(assert (=> b!23759 m!33455))

(declare-fun m!33457 () Bool)

(assert (=> b!23759 m!33457))

(declare-fun m!33459 () Bool)

(assert (=> b!23759 m!33459))

(declare-fun m!33461 () Bool)

(assert (=> b!23760 m!33461))

(declare-fun m!33463 () Bool)

(assert (=> b!23750 m!33463))

(declare-fun m!33465 () Bool)

(assert (=> b!23752 m!33465))

(declare-fun m!33467 () Bool)

(assert (=> b!23754 m!33467))

(push 1)

