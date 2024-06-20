; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5838 () Bool)

(assert start!5838)

(declare-fun b!25587 () Bool)

(declare-fun e!17450 () Bool)

(declare-fun e!17447 () Bool)

(assert (=> b!25587 (= e!17450 (not e!17447))))

(declare-fun res!22083 () Bool)

(assert (=> b!25587 (=> res!22083 e!17447)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!25587 (= res!22083 (bvsge i!635 to!314))))

(declare-datatypes ((array!1668 0))(
  ( (array!1669 (arr!1177 (Array (_ BitVec 32) (_ BitVec 8))) (size!718 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1268 0))(
  ( (BitStream!1269 (buf!1042 array!1668) (currentByte!2361 (_ BitVec 32)) (currentBit!2356 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1268)

(declare-fun isPrefixOf!0 (BitStream!1268 BitStream!1268) Bool)

(assert (=> b!25587 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2109 0))(
  ( (Unit!2110) )
))
(declare-fun lt!36665 () Unit!2109)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1268) Unit!2109)

(assert (=> b!25587 (= lt!36665 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!36672 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!25587 (= lt!36672 (bitIndex!0 (size!718 (buf!1042 thiss!1379)) (currentByte!2361 thiss!1379) (currentBit!2356 thiss!1379)))))

(declare-fun b!25588 () Bool)

(declare-fun e!17454 () Bool)

(declare-fun e!17453 () Bool)

(assert (=> b!25588 (= e!17454 e!17453)))

(declare-fun res!22085 () Bool)

(assert (=> b!25588 (=> res!22085 e!17453)))

(declare-datatypes ((tuple2!2878 0))(
  ( (tuple2!2879 (_1!1526 Unit!2109) (_2!1526 BitStream!1268)) )
))
(declare-fun lt!36677 () tuple2!2878)

(declare-fun lt!36671 () tuple2!2878)

(assert (=> b!25588 (= res!22085 (not (= (size!718 (buf!1042 (_2!1526 lt!36677))) (size!718 (buf!1042 (_2!1526 lt!36671))))))))

(declare-fun e!17448 () Bool)

(assert (=> b!25588 e!17448))

(declare-fun res!22088 () Bool)

(assert (=> b!25588 (=> (not res!22088) (not e!17448))))

(assert (=> b!25588 (= res!22088 (= (size!718 (buf!1042 (_2!1526 lt!36671))) (size!718 (buf!1042 thiss!1379))))))

(declare-fun b!25589 () Bool)

(declare-fun e!17449 () Bool)

(declare-fun array_inv!687 (array!1668) Bool)

(assert (=> b!25589 (= e!17449 (array_inv!687 (buf!1042 thiss!1379)))))

(declare-fun b!25590 () Bool)

(declare-fun e!17446 () Bool)

(assert (=> b!25590 (= e!17446 e!17454)))

(declare-fun res!22086 () Bool)

(assert (=> b!25590 (=> res!22086 e!17454)))

(declare-fun lt!36676 () (_ BitVec 64))

(assert (=> b!25590 (= res!22086 (not (= lt!36676 (bvsub (bvadd lt!36672 to!314) i!635))))))

(assert (=> b!25590 (= lt!36676 (bitIndex!0 (size!718 (buf!1042 (_2!1526 lt!36671))) (currentByte!2361 (_2!1526 lt!36671)) (currentBit!2356 (_2!1526 lt!36671))))))

(declare-fun b!25591 () Bool)

(declare-fun e!17455 () Bool)

(assert (=> b!25591 (= e!17447 e!17455)))

(declare-fun res!22082 () Bool)

(assert (=> b!25591 (=> res!22082 e!17455)))

(assert (=> b!25591 (= res!22082 (not (isPrefixOf!0 thiss!1379 (_2!1526 lt!36677))))))

(declare-fun lt!36670 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!25591 (validate_offset_bits!1 ((_ sign_extend 32) (size!718 (buf!1042 (_2!1526 lt!36677)))) ((_ sign_extend 32) (currentByte!2361 (_2!1526 lt!36677))) ((_ sign_extend 32) (currentBit!2356 (_2!1526 lt!36677))) lt!36670)))

(assert (=> b!25591 (= lt!36670 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36669 () Unit!2109)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1268 BitStream!1268 (_ BitVec 64) (_ BitVec 64)) Unit!2109)

(assert (=> b!25591 (= lt!36669 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1526 lt!36677) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1668)

(declare-fun appendBitFromByte!0 (BitStream!1268 (_ BitVec 8) (_ BitVec 32)) tuple2!2878)

(assert (=> b!25591 (= lt!36677 (appendBitFromByte!0 thiss!1379 (select (arr!1177 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!25592 () Bool)

(declare-fun res!22081 () Bool)

(assert (=> b!25592 (=> res!22081 e!17453)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!25592 (= res!22081 (not (invariant!0 (currentBit!2356 (_2!1526 lt!36677)) (currentByte!2361 (_2!1526 lt!36677)) (size!718 (buf!1042 (_2!1526 lt!36677))))))))

(declare-datatypes ((tuple2!2880 0))(
  ( (tuple2!2881 (_1!1527 BitStream!1268) (_2!1527 BitStream!1268)) )
))
(declare-fun lt!36678 () tuple2!2880)

(declare-fun e!17451 () Bool)

(declare-fun b!25593 () Bool)

(declare-datatypes ((List!335 0))(
  ( (Nil!332) (Cons!331 (h!450 Bool) (t!1085 List!335)) )
))
(declare-fun head!172 (List!335) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1268 array!1668 (_ BitVec 64) (_ BitVec 64)) List!335)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1268 BitStream!1268 (_ BitVec 64)) List!335)

(assert (=> b!25593 (= e!17451 (= (head!172 (byteArrayBitContentToList!0 (_2!1526 lt!36677) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!172 (bitStreamReadBitsIntoList!0 (_2!1526 lt!36677) (_1!1527 lt!36678) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!25594 () Bool)

(assert (=> b!25594 (= e!17448 (= lt!36676 (bvsub (bvsub (bvadd (bitIndex!0 (size!718 (buf!1042 (_2!1526 lt!36677))) (currentByte!2361 (_2!1526 lt!36677)) (currentBit!2356 (_2!1526 lt!36677))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!25595 () Bool)

(declare-fun res!22077 () Bool)

(assert (=> b!25595 (=> (not res!22077) (not e!17450))))

(assert (=> b!25595 (= res!22077 (validate_offset_bits!1 ((_ sign_extend 32) (size!718 (buf!1042 thiss!1379))) ((_ sign_extend 32) (currentByte!2361 thiss!1379)) ((_ sign_extend 32) (currentBit!2356 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!22087 () Bool)

(assert (=> start!5838 (=> (not res!22087) (not e!17450))))

(assert (=> start!5838 (= res!22087 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!718 srcBuffer!2))))))))

(assert (=> start!5838 e!17450))

(assert (=> start!5838 true))

(assert (=> start!5838 (array_inv!687 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1268) Bool)

(assert (=> start!5838 (and (inv!12 thiss!1379) e!17449)))

(declare-fun b!25596 () Bool)

(assert (=> b!25596 (= e!17455 e!17446)))

(declare-fun res!22080 () Bool)

(assert (=> b!25596 (=> res!22080 e!17446)))

(assert (=> b!25596 (= res!22080 (not (isPrefixOf!0 (_2!1526 lt!36677) (_2!1526 lt!36671))))))

(assert (=> b!25596 (isPrefixOf!0 thiss!1379 (_2!1526 lt!36671))))

(declare-fun lt!36674 () Unit!2109)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1268 BitStream!1268 BitStream!1268) Unit!2109)

(assert (=> b!25596 (= lt!36674 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1526 lt!36677) (_2!1526 lt!36671)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1268 array!1668 (_ BitVec 64) (_ BitVec 64)) tuple2!2878)

(assert (=> b!25596 (= lt!36671 (appendBitsMSBFirstLoop!0 (_2!1526 lt!36677) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!25596 e!17451))

(declare-fun res!22084 () Bool)

(assert (=> b!25596 (=> (not res!22084) (not e!17451))))

(assert (=> b!25596 (= res!22084 (validate_offset_bits!1 ((_ sign_extend 32) (size!718 (buf!1042 (_2!1526 lt!36677)))) ((_ sign_extend 32) (currentByte!2361 thiss!1379)) ((_ sign_extend 32) (currentBit!2356 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!36668 () Unit!2109)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1268 array!1668 (_ BitVec 64)) Unit!2109)

(assert (=> b!25596 (= lt!36668 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1042 (_2!1526 lt!36677)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1268 BitStream!1268) tuple2!2880)

(assert (=> b!25596 (= lt!36678 (reader!0 thiss!1379 (_2!1526 lt!36677)))))

(declare-fun b!25597 () Bool)

(declare-fun res!22078 () Bool)

(assert (=> b!25597 (=> res!22078 e!17453)))

(assert (=> b!25597 (= res!22078 (not (invariant!0 (currentBit!2356 (_2!1526 lt!36677)) (currentByte!2361 (_2!1526 lt!36677)) (size!718 (buf!1042 (_2!1526 lt!36671))))))))

(declare-fun b!25598 () Bool)

(declare-fun res!22089 () Bool)

(assert (=> b!25598 (=> res!22089 e!17454)))

(assert (=> b!25598 (= res!22089 (not (= (size!718 (buf!1042 thiss!1379)) (size!718 (buf!1042 (_2!1526 lt!36671))))))))

(declare-fun b!25599 () Bool)

(declare-fun res!22079 () Bool)

(assert (=> b!25599 (=> res!22079 e!17454)))

(assert (=> b!25599 (= res!22079 (not (invariant!0 (currentBit!2356 (_2!1526 lt!36671)) (currentByte!2361 (_2!1526 lt!36671)) (size!718 (buf!1042 (_2!1526 lt!36671))))))))

(declare-fun b!25600 () Bool)

(assert (=> b!25600 (= e!17453 true)))

(declare-fun lt!36679 () List!335)

(declare-fun lt!36667 () tuple2!2880)

(assert (=> b!25600 (= lt!36679 (bitStreamReadBitsIntoList!0 (_2!1526 lt!36671) (_1!1527 lt!36667) (bvsub to!314 i!635)))))

(assert (=> b!25600 (validate_offset_bits!1 ((_ sign_extend 32) (size!718 (buf!1042 (_2!1526 lt!36671)))) ((_ sign_extend 32) (currentByte!2361 (_2!1526 lt!36677))) ((_ sign_extend 32) (currentBit!2356 (_2!1526 lt!36677))) lt!36670)))

(declare-fun lt!36673 () Unit!2109)

(assert (=> b!25600 (= lt!36673 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1526 lt!36677) (buf!1042 (_2!1526 lt!36671)) lt!36670))))

(declare-fun lt!36666 () tuple2!2880)

(assert (=> b!25600 (= lt!36666 (reader!0 (_2!1526 lt!36677) (_2!1526 lt!36671)))))

(assert (=> b!25600 (validate_offset_bits!1 ((_ sign_extend 32) (size!718 (buf!1042 (_2!1526 lt!36671)))) ((_ sign_extend 32) (currentByte!2361 thiss!1379)) ((_ sign_extend 32) (currentBit!2356 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!36675 () Unit!2109)

(assert (=> b!25600 (= lt!36675 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1042 (_2!1526 lt!36671)) (bvsub to!314 i!635)))))

(assert (=> b!25600 (= lt!36667 (reader!0 thiss!1379 (_2!1526 lt!36671)))))

(assert (= (and start!5838 res!22087) b!25595))

(assert (= (and b!25595 res!22077) b!25587))

(assert (= (and b!25587 (not res!22083)) b!25591))

(assert (= (and b!25591 (not res!22082)) b!25596))

(assert (= (and b!25596 res!22084) b!25593))

(assert (= (and b!25596 (not res!22080)) b!25590))

(assert (= (and b!25590 (not res!22086)) b!25599))

(assert (= (and b!25599 (not res!22079)) b!25598))

(assert (= (and b!25598 (not res!22089)) b!25588))

(assert (= (and b!25588 res!22088) b!25594))

(assert (= (and b!25588 (not res!22085)) b!25592))

(assert (= (and b!25592 (not res!22081)) b!25597))

(assert (= (and b!25597 (not res!22078)) b!25600))

(assert (= start!5838 b!25589))

(declare-fun m!36491 () Bool)

(assert (=> b!25589 m!36491))

(declare-fun m!36493 () Bool)

(assert (=> b!25592 m!36493))

(declare-fun m!36495 () Bool)

(assert (=> b!25591 m!36495))

(declare-fun m!36497 () Bool)

(assert (=> b!25591 m!36497))

(declare-fun m!36499 () Bool)

(assert (=> b!25591 m!36499))

(assert (=> b!25591 m!36495))

(declare-fun m!36501 () Bool)

(assert (=> b!25591 m!36501))

(declare-fun m!36503 () Bool)

(assert (=> b!25591 m!36503))

(declare-fun m!36505 () Bool)

(assert (=> b!25597 m!36505))

(declare-fun m!36507 () Bool)

(assert (=> start!5838 m!36507))

(declare-fun m!36509 () Bool)

(assert (=> start!5838 m!36509))

(declare-fun m!36511 () Bool)

(assert (=> b!25595 m!36511))

(declare-fun m!36513 () Bool)

(assert (=> b!25587 m!36513))

(declare-fun m!36515 () Bool)

(assert (=> b!25587 m!36515))

(declare-fun m!36517 () Bool)

(assert (=> b!25587 m!36517))

(declare-fun m!36519 () Bool)

(assert (=> b!25596 m!36519))

(declare-fun m!36521 () Bool)

(assert (=> b!25596 m!36521))

(declare-fun m!36523 () Bool)

(assert (=> b!25596 m!36523))

(declare-fun m!36525 () Bool)

(assert (=> b!25596 m!36525))

(declare-fun m!36527 () Bool)

(assert (=> b!25596 m!36527))

(declare-fun m!36529 () Bool)

(assert (=> b!25596 m!36529))

(declare-fun m!36531 () Bool)

(assert (=> b!25596 m!36531))

(declare-fun m!36533 () Bool)

(assert (=> b!25593 m!36533))

(assert (=> b!25593 m!36533))

(declare-fun m!36535 () Bool)

(assert (=> b!25593 m!36535))

(declare-fun m!36537 () Bool)

(assert (=> b!25593 m!36537))

(assert (=> b!25593 m!36537))

(declare-fun m!36539 () Bool)

(assert (=> b!25593 m!36539))

(declare-fun m!36541 () Bool)

(assert (=> b!25594 m!36541))

(declare-fun m!36543 () Bool)

(assert (=> b!25599 m!36543))

(declare-fun m!36545 () Bool)

(assert (=> b!25600 m!36545))

(declare-fun m!36547 () Bool)

(assert (=> b!25600 m!36547))

(declare-fun m!36549 () Bool)

(assert (=> b!25600 m!36549))

(declare-fun m!36551 () Bool)

(assert (=> b!25600 m!36551))

(declare-fun m!36553 () Bool)

(assert (=> b!25600 m!36553))

(declare-fun m!36555 () Bool)

(assert (=> b!25600 m!36555))

(declare-fun m!36557 () Bool)

(assert (=> b!25600 m!36557))

(declare-fun m!36559 () Bool)

(assert (=> b!25590 m!36559))

(push 1)

