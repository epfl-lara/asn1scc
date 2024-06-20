; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5704 () Bool)

(assert start!5704)

(declare-fun b!24420 () Bool)

(declare-fun e!16645 () Bool)

(declare-datatypes ((array!1627 0))(
  ( (array!1628 (arr!1155 (Array (_ BitVec 32) (_ BitVec 8))) (size!699 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1230 0))(
  ( (BitStream!1231 (buf!1020 array!1627) (currentByte!2333 (_ BitVec 32)) (currentBit!2328 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1230)

(declare-fun array_inv!668 (array!1627) Bool)

(assert (=> b!24420 (= e!16645 (array_inv!668 (buf!1020 thiss!1379)))))

(declare-fun res!21079 () Bool)

(declare-fun e!16648 () Bool)

(assert (=> start!5704 (=> (not res!21079) (not e!16648))))

(declare-fun srcBuffer!2 () array!1627)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5704 (= res!21079 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!699 srcBuffer!2))))))))

(assert (=> start!5704 e!16648))

(assert (=> start!5704 true))

(assert (=> start!5704 (array_inv!668 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1230) Bool)

(assert (=> start!5704 (and (inv!12 thiss!1379) e!16645)))

(declare-fun b!24421 () Bool)

(declare-fun res!21082 () Bool)

(declare-fun e!16644 () Bool)

(assert (=> b!24421 (=> res!21082 e!16644)))

(declare-datatypes ((Unit!2041 0))(
  ( (Unit!2042) )
))
(declare-datatypes ((tuple2!2778 0))(
  ( (tuple2!2779 (_1!1476 Unit!2041) (_2!1476 BitStream!1230)) )
))
(declare-fun lt!34904 () tuple2!2778)

(declare-fun lt!34897 () tuple2!2778)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24421 (= res!21082 (not (invariant!0 (currentBit!2328 (_2!1476 lt!34904)) (currentByte!2333 (_2!1476 lt!34904)) (size!699 (buf!1020 (_2!1476 lt!34897))))))))

(declare-fun b!24422 () Bool)

(declare-fun e!16640 () Bool)

(assert (=> b!24422 (= e!16648 (not e!16640))))

(declare-fun res!21073 () Bool)

(assert (=> b!24422 (=> res!21073 e!16640)))

(assert (=> b!24422 (= res!21073 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1230 BitStream!1230) Bool)

(assert (=> b!24422 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34907 () Unit!2041)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1230) Unit!2041)

(assert (=> b!24422 (= lt!34907 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!34898 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24422 (= lt!34898 (bitIndex!0 (size!699 (buf!1020 thiss!1379)) (currentByte!2333 thiss!1379) (currentBit!2328 thiss!1379)))))

(declare-fun b!24423 () Bool)

(declare-fun res!21081 () Bool)

(declare-fun e!16641 () Bool)

(assert (=> b!24423 (=> res!21081 e!16641)))

(assert (=> b!24423 (= res!21081 (not (= (size!699 (buf!1020 thiss!1379)) (size!699 (buf!1020 (_2!1476 lt!34897))))))))

(declare-fun b!24424 () Bool)

(assert (=> b!24424 (= e!16644 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!34901 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24424 (validate_offset_bits!1 ((_ sign_extend 32) (size!699 (buf!1020 (_2!1476 lt!34897)))) ((_ sign_extend 32) (currentByte!2333 (_2!1476 lt!34904))) ((_ sign_extend 32) (currentBit!2328 (_2!1476 lt!34904))) lt!34901)))

(declare-fun lt!34902 () Unit!2041)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1230 array!1627 (_ BitVec 64)) Unit!2041)

(assert (=> b!24424 (= lt!34902 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1476 lt!34904) (buf!1020 (_2!1476 lt!34897)) lt!34901))))

(declare-datatypes ((tuple2!2780 0))(
  ( (tuple2!2781 (_1!1477 BitStream!1230) (_2!1477 BitStream!1230)) )
))
(declare-fun lt!34900 () tuple2!2780)

(declare-fun reader!0 (BitStream!1230 BitStream!1230) tuple2!2780)

(assert (=> b!24424 (= lt!34900 (reader!0 (_2!1476 lt!34904) (_2!1476 lt!34897)))))

(assert (=> b!24424 (validate_offset_bits!1 ((_ sign_extend 32) (size!699 (buf!1020 (_2!1476 lt!34897)))) ((_ sign_extend 32) (currentByte!2333 thiss!1379)) ((_ sign_extend 32) (currentBit!2328 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34896 () Unit!2041)

(assert (=> b!24424 (= lt!34896 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1020 (_2!1476 lt!34897)) (bvsub to!314 i!635)))))

(declare-fun lt!34909 () tuple2!2780)

(assert (=> b!24424 (= lt!34909 (reader!0 thiss!1379 (_2!1476 lt!34897)))))

(declare-fun b!24425 () Bool)

(declare-fun res!21078 () Bool)

(assert (=> b!24425 (=> res!21078 e!16644)))

(assert (=> b!24425 (= res!21078 (not (invariant!0 (currentBit!2328 (_2!1476 lt!34904)) (currentByte!2333 (_2!1476 lt!34904)) (size!699 (buf!1020 (_2!1476 lt!34904))))))))

(declare-fun b!24426 () Bool)

(declare-fun res!21084 () Bool)

(assert (=> b!24426 (=> (not res!21084) (not e!16648))))

(assert (=> b!24426 (= res!21084 (validate_offset_bits!1 ((_ sign_extend 32) (size!699 (buf!1020 thiss!1379))) ((_ sign_extend 32) (currentByte!2333 thiss!1379)) ((_ sign_extend 32) (currentBit!2328 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!24427 () Bool)

(declare-fun e!16642 () Bool)

(assert (=> b!24427 (= e!16642 e!16641)))

(declare-fun res!21083 () Bool)

(assert (=> b!24427 (=> res!21083 e!16641)))

(declare-fun lt!34903 () (_ BitVec 64))

(assert (=> b!24427 (= res!21083 (not (= lt!34903 (bvsub (bvadd lt!34898 to!314) i!635))))))

(assert (=> b!24427 (= lt!34903 (bitIndex!0 (size!699 (buf!1020 (_2!1476 lt!34897))) (currentByte!2333 (_2!1476 lt!34897)) (currentBit!2328 (_2!1476 lt!34897))))))

(declare-fun b!24428 () Bool)

(assert (=> b!24428 (= e!16641 e!16644)))

(declare-fun res!21080 () Bool)

(assert (=> b!24428 (=> res!21080 e!16644)))

(assert (=> b!24428 (= res!21080 (not (= (size!699 (buf!1020 (_2!1476 lt!34904))) (size!699 (buf!1020 (_2!1476 lt!34897))))))))

(declare-fun e!16639 () Bool)

(assert (=> b!24428 e!16639))

(declare-fun res!21077 () Bool)

(assert (=> b!24428 (=> (not res!21077) (not e!16639))))

(assert (=> b!24428 (= res!21077 (= (size!699 (buf!1020 (_2!1476 lt!34897))) (size!699 (buf!1020 thiss!1379))))))

(declare-fun b!24429 () Bool)

(declare-fun e!16646 () Bool)

(assert (=> b!24429 (= e!16640 e!16646)))

(declare-fun res!21074 () Bool)

(assert (=> b!24429 (=> res!21074 e!16646)))

(assert (=> b!24429 (= res!21074 (not (isPrefixOf!0 thiss!1379 (_2!1476 lt!34904))))))

(assert (=> b!24429 (validate_offset_bits!1 ((_ sign_extend 32) (size!699 (buf!1020 (_2!1476 lt!34904)))) ((_ sign_extend 32) (currentByte!2333 (_2!1476 lt!34904))) ((_ sign_extend 32) (currentBit!2328 (_2!1476 lt!34904))) lt!34901)))

(assert (=> b!24429 (= lt!34901 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34908 () Unit!2041)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1230 BitStream!1230 (_ BitVec 64) (_ BitVec 64)) Unit!2041)

(assert (=> b!24429 (= lt!34908 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1476 lt!34904) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1230 (_ BitVec 8) (_ BitVec 32)) tuple2!2778)

(assert (=> b!24429 (= lt!34904 (appendBitFromByte!0 thiss!1379 (select (arr!1155 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24430 () Bool)

(assert (=> b!24430 (= e!16639 (= lt!34903 (bvsub (bvsub (bvadd (bitIndex!0 (size!699 (buf!1020 (_2!1476 lt!34904))) (currentByte!2333 (_2!1476 lt!34904)) (currentBit!2328 (_2!1476 lt!34904))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24431 () Bool)

(assert (=> b!24431 (= e!16646 e!16642)))

(declare-fun res!21072 () Bool)

(assert (=> b!24431 (=> res!21072 e!16642)))

(assert (=> b!24431 (= res!21072 (not (isPrefixOf!0 (_2!1476 lt!34904) (_2!1476 lt!34897))))))

(assert (=> b!24431 (isPrefixOf!0 thiss!1379 (_2!1476 lt!34897))))

(declare-fun lt!34899 () Unit!2041)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1230 BitStream!1230 BitStream!1230) Unit!2041)

(assert (=> b!24431 (= lt!34899 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1476 lt!34904) (_2!1476 lt!34897)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1230 array!1627 (_ BitVec 64) (_ BitVec 64)) tuple2!2778)

(assert (=> b!24431 (= lt!34897 (appendBitsMSBFirstLoop!0 (_2!1476 lt!34904) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16638 () Bool)

(assert (=> b!24431 e!16638))

(declare-fun res!21075 () Bool)

(assert (=> b!24431 (=> (not res!21075) (not e!16638))))

(assert (=> b!24431 (= res!21075 (validate_offset_bits!1 ((_ sign_extend 32) (size!699 (buf!1020 (_2!1476 lt!34904)))) ((_ sign_extend 32) (currentByte!2333 thiss!1379)) ((_ sign_extend 32) (currentBit!2328 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34906 () Unit!2041)

(assert (=> b!24431 (= lt!34906 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1020 (_2!1476 lt!34904)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34905 () tuple2!2780)

(assert (=> b!24431 (= lt!34905 (reader!0 thiss!1379 (_2!1476 lt!34904)))))

(declare-fun b!24432 () Bool)

(declare-fun res!21076 () Bool)

(assert (=> b!24432 (=> res!21076 e!16641)))

(assert (=> b!24432 (= res!21076 (not (invariant!0 (currentBit!2328 (_2!1476 lt!34897)) (currentByte!2333 (_2!1476 lt!34897)) (size!699 (buf!1020 (_2!1476 lt!34897))))))))

(declare-fun b!24433 () Bool)

(declare-datatypes ((List!316 0))(
  ( (Nil!313) (Cons!312 (h!431 Bool) (t!1066 List!316)) )
))
(declare-fun head!153 (List!316) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1230 array!1627 (_ BitVec 64) (_ BitVec 64)) List!316)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1230 BitStream!1230 (_ BitVec 64)) List!316)

(assert (=> b!24433 (= e!16638 (= (head!153 (byteArrayBitContentToList!0 (_2!1476 lt!34904) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!153 (bitStreamReadBitsIntoList!0 (_2!1476 lt!34904) (_1!1477 lt!34905) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and start!5704 res!21079) b!24426))

(assert (= (and b!24426 res!21084) b!24422))

(assert (= (and b!24422 (not res!21073)) b!24429))

(assert (= (and b!24429 (not res!21074)) b!24431))

(assert (= (and b!24431 res!21075) b!24433))

(assert (= (and b!24431 (not res!21072)) b!24427))

(assert (= (and b!24427 (not res!21083)) b!24432))

(assert (= (and b!24432 (not res!21076)) b!24423))

(assert (= (and b!24423 (not res!21081)) b!24428))

(assert (= (and b!24428 res!21077) b!24430))

(assert (= (and b!24428 (not res!21080)) b!24425))

(assert (= (and b!24425 (not res!21078)) b!24421))

(assert (= (and b!24421 (not res!21082)) b!24424))

(assert (= start!5704 b!24420))

(declare-fun m!34481 () Bool)

(assert (=> b!24429 m!34481))

(declare-fun m!34483 () Bool)

(assert (=> b!24429 m!34483))

(assert (=> b!24429 m!34481))

(declare-fun m!34485 () Bool)

(assert (=> b!24429 m!34485))

(declare-fun m!34487 () Bool)

(assert (=> b!24429 m!34487))

(declare-fun m!34489 () Bool)

(assert (=> b!24429 m!34489))

(declare-fun m!34491 () Bool)

(assert (=> b!24425 m!34491))

(declare-fun m!34493 () Bool)

(assert (=> b!24422 m!34493))

(declare-fun m!34495 () Bool)

(assert (=> b!24422 m!34495))

(declare-fun m!34497 () Bool)

(assert (=> b!24422 m!34497))

(declare-fun m!34499 () Bool)

(assert (=> start!5704 m!34499))

(declare-fun m!34501 () Bool)

(assert (=> start!5704 m!34501))

(declare-fun m!34503 () Bool)

(assert (=> b!24427 m!34503))

(declare-fun m!34505 () Bool)

(assert (=> b!24431 m!34505))

(declare-fun m!34507 () Bool)

(assert (=> b!24431 m!34507))

(declare-fun m!34509 () Bool)

(assert (=> b!24431 m!34509))

(declare-fun m!34511 () Bool)

(assert (=> b!24431 m!34511))

(declare-fun m!34513 () Bool)

(assert (=> b!24431 m!34513))

(declare-fun m!34515 () Bool)

(assert (=> b!24431 m!34515))

(declare-fun m!34517 () Bool)

(assert (=> b!24431 m!34517))

(declare-fun m!34519 () Bool)

(assert (=> b!24426 m!34519))

(declare-fun m!34521 () Bool)

(assert (=> b!24432 m!34521))

(declare-fun m!34523 () Bool)

(assert (=> b!24421 m!34523))

(declare-fun m!34525 () Bool)

(assert (=> b!24424 m!34525))

(declare-fun m!34527 () Bool)

(assert (=> b!24424 m!34527))

(declare-fun m!34529 () Bool)

(assert (=> b!24424 m!34529))

(declare-fun m!34531 () Bool)

(assert (=> b!24424 m!34531))

(declare-fun m!34533 () Bool)

(assert (=> b!24424 m!34533))

(declare-fun m!34535 () Bool)

(assert (=> b!24424 m!34535))

(declare-fun m!34537 () Bool)

(assert (=> b!24420 m!34537))

(declare-fun m!34539 () Bool)

(assert (=> b!24433 m!34539))

(assert (=> b!24433 m!34539))

(declare-fun m!34541 () Bool)

(assert (=> b!24433 m!34541))

(declare-fun m!34543 () Bool)

(assert (=> b!24433 m!34543))

(assert (=> b!24433 m!34543))

(declare-fun m!34545 () Bool)

(assert (=> b!24433 m!34545))

(declare-fun m!34547 () Bool)

(assert (=> b!24430 m!34547))

(check-sat (not b!24422) (not start!5704) (not b!24432) (not b!24426) (not b!24424) (not b!24427) (not b!24429) (not b!24433) (not b!24421) (not b!24431) (not b!24425) (not b!24430) (not b!24420))
(check-sat)
