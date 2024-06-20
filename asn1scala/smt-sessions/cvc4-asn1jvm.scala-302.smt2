; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5988 () Bool)

(assert start!5988)

(declare-fun b!27528 () Bool)

(declare-fun e!18594 () Bool)

(declare-fun e!18598 () Bool)

(assert (=> b!27528 (= e!18594 e!18598)))

(declare-fun res!23825 () Bool)

(assert (=> b!27528 (=> res!23825 e!18598)))

(declare-datatypes ((array!1725 0))(
  ( (array!1726 (arr!1207 (Array (_ BitVec 32) (_ BitVec 8))) (size!745 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1322 0))(
  ( (BitStream!1323 (buf!1072 array!1725) (currentByte!2397 (_ BitVec 32)) (currentBit!2392 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1322)

(declare-datatypes ((Unit!2193 0))(
  ( (Unit!2194) )
))
(declare-datatypes ((tuple2!3010 0))(
  ( (tuple2!3011 (_1!1592 Unit!2193) (_2!1592 BitStream!1322)) )
))
(declare-fun lt!39068 () tuple2!3010)

(declare-fun isPrefixOf!0 (BitStream!1322 BitStream!1322) Bool)

(assert (=> b!27528 (= res!23825 (not (isPrefixOf!0 thiss!1379 (_2!1592 lt!39068))))))

(declare-fun lt!39080 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27528 (validate_offset_bits!1 ((_ sign_extend 32) (size!745 (buf!1072 (_2!1592 lt!39068)))) ((_ sign_extend 32) (currentByte!2397 (_2!1592 lt!39068))) ((_ sign_extend 32) (currentBit!2392 (_2!1592 lt!39068))) lt!39080)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!27528 (= lt!39080 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39074 () Unit!2193)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1322 BitStream!1322 (_ BitVec 64) (_ BitVec 64)) Unit!2193)

(assert (=> b!27528 (= lt!39074 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1592 lt!39068) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1725)

(declare-fun appendBitFromByte!0 (BitStream!1322 (_ BitVec 8) (_ BitVec 32)) tuple2!3010)

(assert (=> b!27528 (= lt!39068 (appendBitFromByte!0 thiss!1379 (select (arr!1207 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!27529 () Bool)

(declare-fun e!18599 () Bool)

(assert (=> b!27529 (= e!18598 e!18599)))

(declare-fun res!23831 () Bool)

(assert (=> b!27529 (=> res!23831 e!18599)))

(declare-fun lt!39075 () tuple2!3010)

(assert (=> b!27529 (= res!23831 (not (isPrefixOf!0 (_2!1592 lt!39068) (_2!1592 lt!39075))))))

(assert (=> b!27529 (isPrefixOf!0 thiss!1379 (_2!1592 lt!39075))))

(declare-fun lt!39071 () Unit!2193)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1322 BitStream!1322 BitStream!1322) Unit!2193)

(assert (=> b!27529 (= lt!39071 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1592 lt!39068) (_2!1592 lt!39075)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1322 array!1725 (_ BitVec 64) (_ BitVec 64)) tuple2!3010)

(assert (=> b!27529 (= lt!39075 (appendBitsMSBFirstLoop!0 (_2!1592 lt!39068) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!18596 () Bool)

(assert (=> b!27529 e!18596))

(declare-fun res!23838 () Bool)

(assert (=> b!27529 (=> (not res!23838) (not e!18596))))

(assert (=> b!27529 (= res!23838 (validate_offset_bits!1 ((_ sign_extend 32) (size!745 (buf!1072 (_2!1592 lt!39068)))) ((_ sign_extend 32) (currentByte!2397 thiss!1379)) ((_ sign_extend 32) (currentBit!2392 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39073 () Unit!2193)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1322 array!1725 (_ BitVec 64)) Unit!2193)

(assert (=> b!27529 (= lt!39073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1072 (_2!1592 lt!39068)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3012 0))(
  ( (tuple2!3013 (_1!1593 BitStream!1322) (_2!1593 BitStream!1322)) )
))
(declare-fun lt!39066 () tuple2!3012)

(declare-fun reader!0 (BitStream!1322 BitStream!1322) tuple2!3012)

(assert (=> b!27529 (= lt!39066 (reader!0 thiss!1379 (_2!1592 lt!39068)))))

(declare-fun b!27530 () Bool)

(declare-fun e!18604 () Bool)

(declare-fun array_inv!714 (array!1725) Bool)

(assert (=> b!27530 (= e!18604 (array_inv!714 (buf!1072 thiss!1379)))))

(declare-fun b!27531 () Bool)

(declare-fun res!23834 () Bool)

(declare-fun e!18601 () Bool)

(assert (=> b!27531 (=> res!23834 e!18601)))

(declare-fun lt!39072 () tuple2!3012)

(declare-fun lt!39076 () tuple2!3012)

(assert (=> b!27531 (= res!23834 (not (isPrefixOf!0 (_1!1593 lt!39072) (_1!1593 lt!39076))))))

(declare-fun e!18593 () Bool)

(declare-fun b!27532 () Bool)

(declare-fun lt!39067 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27532 (= e!18593 (= lt!39067 (bvsub (bvsub (bvadd (bitIndex!0 (size!745 (buf!1072 (_2!1592 lt!39068))) (currentByte!2397 (_2!1592 lt!39068)) (currentBit!2392 (_2!1592 lt!39068))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27533 () Bool)

(declare-fun e!18600 () Bool)

(assert (=> b!27533 (= e!18599 e!18600)))

(declare-fun res!23827 () Bool)

(assert (=> b!27533 (=> res!23827 e!18600)))

(declare-fun lt!39077 () (_ BitVec 64))

(assert (=> b!27533 (= res!23827 (not (= lt!39067 (bvsub (bvadd lt!39077 to!314) i!635))))))

(assert (=> b!27533 (= lt!39067 (bitIndex!0 (size!745 (buf!1072 (_2!1592 lt!39075))) (currentByte!2397 (_2!1592 lt!39075)) (currentBit!2392 (_2!1592 lt!39075))))))

(declare-fun b!27534 () Bool)

(declare-fun res!23822 () Bool)

(declare-fun e!18597 () Bool)

(assert (=> b!27534 (=> res!23822 e!18597)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27534 (= res!23822 (not (invariant!0 (currentBit!2392 (_2!1592 lt!39068)) (currentByte!2397 (_2!1592 lt!39068)) (size!745 (buf!1072 (_2!1592 lt!39075))))))))

(declare-fun b!27535 () Bool)

(declare-fun e!18602 () Bool)

(assert (=> b!27535 (= e!18602 (not e!18594))))

(declare-fun res!23821 () Bool)

(assert (=> b!27535 (=> res!23821 e!18594)))

(assert (=> b!27535 (= res!23821 (bvsge i!635 to!314))))

(assert (=> b!27535 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39070 () Unit!2193)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1322) Unit!2193)

(assert (=> b!27535 (= lt!39070 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!27535 (= lt!39077 (bitIndex!0 (size!745 (buf!1072 thiss!1379)) (currentByte!2397 thiss!1379) (currentBit!2392 thiss!1379)))))

(declare-fun b!27536 () Bool)

(assert (=> b!27536 (= e!18601 true)))

(declare-fun lt!39079 () (_ BitVec 64))

(assert (=> b!27536 (= lt!39079 (bitIndex!0 (size!745 (buf!1072 (_1!1593 lt!39076))) (currentByte!2397 (_1!1593 lt!39076)) (currentBit!2392 (_1!1593 lt!39076))))))

(declare-fun lt!39082 () (_ BitVec 64))

(assert (=> b!27536 (= lt!39082 (bitIndex!0 (size!745 (buf!1072 (_1!1593 lt!39072))) (currentByte!2397 (_1!1593 lt!39072)) (currentBit!2392 (_1!1593 lt!39072))))))

(declare-fun b!27537 () Bool)

(declare-fun res!23833 () Bool)

(assert (=> b!27537 (=> res!23833 e!18601)))

(declare-datatypes ((List!362 0))(
  ( (Nil!359) (Cons!358 (h!477 Bool) (t!1112 List!362)) )
))
(declare-fun lt!39065 () List!362)

(declare-fun length!88 (List!362) Int)

(assert (=> b!27537 (= res!23833 (<= (length!88 lt!39065) 0))))

(declare-fun res!23823 () Bool)

(assert (=> start!5988 (=> (not res!23823) (not e!18602))))

(assert (=> start!5988 (= res!23823 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!745 srcBuffer!2))))))))

(assert (=> start!5988 e!18602))

(assert (=> start!5988 true))

(assert (=> start!5988 (array_inv!714 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1322) Bool)

(assert (=> start!5988 (and (inv!12 thiss!1379) e!18604)))

(declare-fun b!27538 () Bool)

(declare-fun res!23820 () Bool)

(assert (=> b!27538 (=> res!23820 e!18600)))

(assert (=> b!27538 (= res!23820 (not (invariant!0 (currentBit!2392 (_2!1592 lt!39075)) (currentByte!2397 (_2!1592 lt!39075)) (size!745 (buf!1072 (_2!1592 lt!39075))))))))

(declare-fun b!27539 () Bool)

(assert (=> b!27539 (= e!18597 e!18601)))

(declare-fun res!23826 () Bool)

(assert (=> b!27539 (=> res!23826 e!18601)))

(assert (=> b!27539 (= res!23826 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39078 () List!362)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1322 BitStream!1322 (_ BitVec 64)) List!362)

(assert (=> b!27539 (= lt!39078 (bitStreamReadBitsIntoList!0 (_2!1592 lt!39075) (_1!1593 lt!39076) lt!39080))))

(assert (=> b!27539 (= lt!39065 (bitStreamReadBitsIntoList!0 (_2!1592 lt!39075) (_1!1593 lt!39072) (bvsub to!314 i!635)))))

(assert (=> b!27539 (validate_offset_bits!1 ((_ sign_extend 32) (size!745 (buf!1072 (_2!1592 lt!39075)))) ((_ sign_extend 32) (currentByte!2397 (_2!1592 lt!39068))) ((_ sign_extend 32) (currentBit!2392 (_2!1592 lt!39068))) lt!39080)))

(declare-fun lt!39069 () Unit!2193)

(assert (=> b!27539 (= lt!39069 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1592 lt!39068) (buf!1072 (_2!1592 lt!39075)) lt!39080))))

(assert (=> b!27539 (= lt!39076 (reader!0 (_2!1592 lt!39068) (_2!1592 lt!39075)))))

(assert (=> b!27539 (validate_offset_bits!1 ((_ sign_extend 32) (size!745 (buf!1072 (_2!1592 lt!39075)))) ((_ sign_extend 32) (currentByte!2397 thiss!1379)) ((_ sign_extend 32) (currentBit!2392 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39081 () Unit!2193)

(assert (=> b!27539 (= lt!39081 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1072 (_2!1592 lt!39075)) (bvsub to!314 i!635)))))

(assert (=> b!27539 (= lt!39072 (reader!0 thiss!1379 (_2!1592 lt!39075)))))

(declare-fun b!27540 () Bool)

(declare-fun res!23837 () Bool)

(assert (=> b!27540 (=> res!23837 e!18601)))

(assert (=> b!27540 (= res!23837 (not (isPrefixOf!0 (_1!1593 lt!39076) (_2!1592 lt!39075))))))

(declare-fun b!27541 () Bool)

(declare-fun res!23829 () Bool)

(assert (=> b!27541 (=> res!23829 e!18597)))

(assert (=> b!27541 (= res!23829 (not (invariant!0 (currentBit!2392 (_2!1592 lt!39068)) (currentByte!2397 (_2!1592 lt!39068)) (size!745 (buf!1072 (_2!1592 lt!39068))))))))

(declare-fun b!27542 () Bool)

(declare-fun res!23830 () Bool)

(assert (=> b!27542 (=> (not res!23830) (not e!18602))))

(assert (=> b!27542 (= res!23830 (validate_offset_bits!1 ((_ sign_extend 32) (size!745 (buf!1072 thiss!1379))) ((_ sign_extend 32) (currentByte!2397 thiss!1379)) ((_ sign_extend 32) (currentBit!2392 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27543 () Bool)

(assert (=> b!27543 (= e!18600 e!18597)))

(declare-fun res!23836 () Bool)

(assert (=> b!27543 (=> res!23836 e!18597)))

(assert (=> b!27543 (= res!23836 (not (= (size!745 (buf!1072 (_2!1592 lt!39068))) (size!745 (buf!1072 (_2!1592 lt!39075))))))))

(assert (=> b!27543 e!18593))

(declare-fun res!23832 () Bool)

(assert (=> b!27543 (=> (not res!23832) (not e!18593))))

(assert (=> b!27543 (= res!23832 (= (size!745 (buf!1072 (_2!1592 lt!39075))) (size!745 (buf!1072 thiss!1379))))))

(declare-fun b!27544 () Bool)

(declare-fun res!23824 () Bool)

(assert (=> b!27544 (=> res!23824 e!18601)))

(assert (=> b!27544 (= res!23824 (or (not (= (buf!1072 (_1!1593 lt!39072)) (buf!1072 (_1!1593 lt!39076)))) (not (= (buf!1072 (_1!1593 lt!39072)) (buf!1072 (_2!1592 lt!39075)))) (bvsge lt!39067 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27545 () Bool)

(declare-fun res!23828 () Bool)

(assert (=> b!27545 (=> res!23828 e!18601)))

(assert (=> b!27545 (= res!23828 (not (isPrefixOf!0 (_1!1593 lt!39072) (_2!1592 lt!39075))))))

(declare-fun b!27546 () Bool)

(declare-fun head!199 (List!362) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1322 array!1725 (_ BitVec 64) (_ BitVec 64)) List!362)

(assert (=> b!27546 (= e!18596 (= (head!199 (byteArrayBitContentToList!0 (_2!1592 lt!39068) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!199 (bitStreamReadBitsIntoList!0 (_2!1592 lt!39068) (_1!1593 lt!39066) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!27547 () Bool)

(declare-fun res!23835 () Bool)

(assert (=> b!27547 (=> res!23835 e!18600)))

(assert (=> b!27547 (= res!23835 (not (= (size!745 (buf!1072 thiss!1379)) (size!745 (buf!1072 (_2!1592 lt!39075))))))))

(assert (= (and start!5988 res!23823) b!27542))

(assert (= (and b!27542 res!23830) b!27535))

(assert (= (and b!27535 (not res!23821)) b!27528))

(assert (= (and b!27528 (not res!23825)) b!27529))

(assert (= (and b!27529 res!23838) b!27546))

(assert (= (and b!27529 (not res!23831)) b!27533))

(assert (= (and b!27533 (not res!23827)) b!27538))

(assert (= (and b!27538 (not res!23820)) b!27547))

(assert (= (and b!27547 (not res!23835)) b!27543))

(assert (= (and b!27543 res!23832) b!27532))

(assert (= (and b!27543 (not res!23836)) b!27541))

(assert (= (and b!27541 (not res!23829)) b!27534))

(assert (= (and b!27534 (not res!23822)) b!27539))

(assert (= (and b!27539 (not res!23826)) b!27537))

(assert (= (and b!27537 (not res!23833)) b!27545))

(assert (= (and b!27545 (not res!23828)) b!27540))

(assert (= (and b!27540 (not res!23837)) b!27531))

(assert (= (and b!27531 (not res!23834)) b!27544))

(assert (= (and b!27544 (not res!23824)) b!27536))

(assert (= start!5988 b!27530))

(declare-fun m!39441 () Bool)

(assert (=> b!27528 m!39441))

(assert (=> b!27528 m!39441))

(declare-fun m!39443 () Bool)

(assert (=> b!27528 m!39443))

(declare-fun m!39445 () Bool)

(assert (=> b!27528 m!39445))

(declare-fun m!39447 () Bool)

(assert (=> b!27528 m!39447))

(declare-fun m!39449 () Bool)

(assert (=> b!27528 m!39449))

(declare-fun m!39451 () Bool)

(assert (=> b!27534 m!39451))

(declare-fun m!39453 () Bool)

(assert (=> b!27533 m!39453))

(declare-fun m!39455 () Bool)

(assert (=> b!27542 m!39455))

(declare-fun m!39457 () Bool)

(assert (=> b!27529 m!39457))

(declare-fun m!39459 () Bool)

(assert (=> b!27529 m!39459))

(declare-fun m!39461 () Bool)

(assert (=> b!27529 m!39461))

(declare-fun m!39463 () Bool)

(assert (=> b!27529 m!39463))

(declare-fun m!39465 () Bool)

(assert (=> b!27529 m!39465))

(declare-fun m!39467 () Bool)

(assert (=> b!27529 m!39467))

(declare-fun m!39469 () Bool)

(assert (=> b!27529 m!39469))

(declare-fun m!39471 () Bool)

(assert (=> b!27539 m!39471))

(declare-fun m!39473 () Bool)

(assert (=> b!27539 m!39473))

(declare-fun m!39475 () Bool)

(assert (=> b!27539 m!39475))

(declare-fun m!39477 () Bool)

(assert (=> b!27539 m!39477))

(declare-fun m!39479 () Bool)

(assert (=> b!27539 m!39479))

(declare-fun m!39481 () Bool)

(assert (=> b!27539 m!39481))

(declare-fun m!39483 () Bool)

(assert (=> b!27539 m!39483))

(declare-fun m!39485 () Bool)

(assert (=> b!27539 m!39485))

(declare-fun m!39487 () Bool)

(assert (=> b!27540 m!39487))

(declare-fun m!39489 () Bool)

(assert (=> b!27536 m!39489))

(declare-fun m!39491 () Bool)

(assert (=> b!27536 m!39491))

(declare-fun m!39493 () Bool)

(assert (=> b!27532 m!39493))

(declare-fun m!39495 () Bool)

(assert (=> b!27530 m!39495))

(declare-fun m!39497 () Bool)

(assert (=> start!5988 m!39497))

(declare-fun m!39499 () Bool)

(assert (=> start!5988 m!39499))

(declare-fun m!39501 () Bool)

(assert (=> b!27545 m!39501))

(declare-fun m!39503 () Bool)

(assert (=> b!27535 m!39503))

(declare-fun m!39505 () Bool)

(assert (=> b!27535 m!39505))

(declare-fun m!39507 () Bool)

(assert (=> b!27535 m!39507))

(declare-fun m!39509 () Bool)

(assert (=> b!27537 m!39509))

(declare-fun m!39511 () Bool)

(assert (=> b!27531 m!39511))

(declare-fun m!39513 () Bool)

(assert (=> b!27541 m!39513))

(declare-fun m!39515 () Bool)

(assert (=> b!27546 m!39515))

(assert (=> b!27546 m!39515))

(declare-fun m!39517 () Bool)

(assert (=> b!27546 m!39517))

(declare-fun m!39519 () Bool)

(assert (=> b!27546 m!39519))

(assert (=> b!27546 m!39519))

(declare-fun m!39521 () Bool)

(assert (=> b!27546 m!39521))

(declare-fun m!39523 () Bool)

(assert (=> b!27538 m!39523))

(push 1)

(assert (not b!27539))

(assert (not b!27545))

(assert (not b!27538))

(assert (not b!27528))

(assert (not b!27531))

(assert (not b!27546))

(assert (not b!27537))

(assert (not b!27534))

(assert (not b!27535))

(assert (not b!27533))

(assert (not b!27542))

(assert (not b!27536))

(assert (not b!27530))

(assert (not start!5988))

(assert (not b!27532))

(assert (not b!27540))

(assert (not b!27529))

(assert (not b!27541))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

