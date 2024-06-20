; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11902 () Bool)

(assert start!11902)

(declare-fun b!60581 () Bool)

(declare-fun res!50536 () Bool)

(declare-fun e!40440 () Bool)

(assert (=> b!60581 (=> res!50536 e!40440)))

(declare-datatypes ((array!2759 0))(
  ( (array!2760 (arr!1819 (Array (_ BitVec 32) (_ BitVec 8))) (size!1255 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2198 0))(
  ( (BitStream!2199 (buf!1636 array!2759) (currentByte!3254 (_ BitVec 32)) (currentBit!3249 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4133 0))(
  ( (Unit!4134) )
))
(declare-datatypes ((tuple2!5518 0))(
  ( (tuple2!5519 (_1!2870 Unit!4133) (_2!2870 BitStream!2198)) )
))
(declare-fun lt!94473 () tuple2!5518)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!60581 (= res!50536 (not (invariant!0 (currentBit!3249 (_2!2870 lt!94473)) (currentByte!3254 (_2!2870 lt!94473)) (size!1255 (buf!1636 (_2!2870 lt!94473))))))))

(declare-fun b!60582 () Bool)

(declare-fun e!40447 () Bool)

(assert (=> b!60582 (= e!40447 true)))

(declare-fun lt!94474 () Int)

(declare-datatypes ((List!674 0))(
  ( (Nil!671) (Cons!670 (h!789 Bool) (t!1424 List!674)) )
))
(declare-fun lt!94472 () List!674)

(declare-fun length!302 (List!674) Int)

(assert (=> b!60582 (= lt!94474 (length!302 lt!94472))))

(declare-fun b!60583 () Bool)

(declare-fun e!40450 () Bool)

(declare-fun e!40448 () Bool)

(assert (=> b!60583 (= e!40450 (not e!40448))))

(declare-fun res!50533 () Bool)

(assert (=> b!60583 (=> res!50533 e!40448)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!60583 (= res!50533 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!2198)

(declare-fun isPrefixOf!0 (BitStream!2198 BitStream!2198) Bool)

(assert (=> b!60583 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!94467 () Unit!4133)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2198) Unit!4133)

(assert (=> b!60583 (= lt!94467 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!94479 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!60583 (= lt!94479 (bitIndex!0 (size!1255 (buf!1636 thiss!1379)) (currentByte!3254 thiss!1379) (currentBit!3249 thiss!1379)))))

(declare-fun b!60584 () Bool)

(declare-fun e!40441 () Bool)

(assert (=> b!60584 (= e!40441 e!40440)))

(declare-fun res!50528 () Bool)

(assert (=> b!60584 (=> res!50528 e!40440)))

(declare-fun lt!94475 () (_ BitVec 64))

(assert (=> b!60584 (= res!50528 (not (= lt!94475 (bvsub (bvadd lt!94479 to!314) i!635))))))

(assert (=> b!60584 (= lt!94475 (bitIndex!0 (size!1255 (buf!1636 (_2!2870 lt!94473))) (currentByte!3254 (_2!2870 lt!94473)) (currentBit!3249 (_2!2870 lt!94473))))))

(declare-fun b!60585 () Bool)

(declare-fun res!50538 () Bool)

(declare-fun e!40442 () Bool)

(assert (=> b!60585 (=> res!50538 e!40442)))

(declare-fun lt!94465 () tuple2!5518)

(assert (=> b!60585 (= res!50538 (not (invariant!0 (currentBit!3249 (_2!2870 lt!94465)) (currentByte!3254 (_2!2870 lt!94465)) (size!1255 (buf!1636 (_2!2870 lt!94473))))))))

(declare-fun b!60586 () Bool)

(assert (=> b!60586 (= e!40442 e!40447)))

(declare-fun res!50537 () Bool)

(assert (=> b!60586 (=> res!50537 e!40447)))

(assert (=> b!60586 (= res!50537 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!94469 () (_ BitVec 64))

(declare-datatypes ((tuple2!5520 0))(
  ( (tuple2!5521 (_1!2871 BitStream!2198) (_2!2871 BitStream!2198)) )
))
(declare-fun lt!94478 () tuple2!5520)

(declare-fun lt!94471 () List!674)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2198 BitStream!2198 (_ BitVec 64)) List!674)

(assert (=> b!60586 (= lt!94471 (bitStreamReadBitsIntoList!0 (_2!2870 lt!94473) (_1!2871 lt!94478) lt!94469))))

(declare-fun lt!94476 () tuple2!5520)

(assert (=> b!60586 (= lt!94472 (bitStreamReadBitsIntoList!0 (_2!2870 lt!94473) (_1!2871 lt!94476) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!60586 (validate_offset_bits!1 ((_ sign_extend 32) (size!1255 (buf!1636 (_2!2870 lt!94473)))) ((_ sign_extend 32) (currentByte!3254 (_2!2870 lt!94465))) ((_ sign_extend 32) (currentBit!3249 (_2!2870 lt!94465))) lt!94469)))

(declare-fun lt!94470 () Unit!4133)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2198 array!2759 (_ BitVec 64)) Unit!4133)

(assert (=> b!60586 (= lt!94470 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!2870 lt!94465) (buf!1636 (_2!2870 lt!94473)) lt!94469))))

(declare-fun reader!0 (BitStream!2198 BitStream!2198) tuple2!5520)

(assert (=> b!60586 (= lt!94478 (reader!0 (_2!2870 lt!94465) (_2!2870 lt!94473)))))

(assert (=> b!60586 (validate_offset_bits!1 ((_ sign_extend 32) (size!1255 (buf!1636 (_2!2870 lt!94473)))) ((_ sign_extend 32) (currentByte!3254 thiss!1379)) ((_ sign_extend 32) (currentBit!3249 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!94468 () Unit!4133)

(assert (=> b!60586 (= lt!94468 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1636 (_2!2870 lt!94473)) (bvsub to!314 i!635)))))

(assert (=> b!60586 (= lt!94476 (reader!0 thiss!1379 (_2!2870 lt!94473)))))

(declare-fun res!50529 () Bool)

(assert (=> start!11902 (=> (not res!50529) (not e!40450))))

(declare-fun srcBuffer!2 () array!2759)

(assert (=> start!11902 (= res!50529 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1255 srcBuffer!2))))))))

(assert (=> start!11902 e!40450))

(assert (=> start!11902 true))

(declare-fun array_inv!1158 (array!2759) Bool)

(assert (=> start!11902 (array_inv!1158 srcBuffer!2)))

(declare-fun e!40446 () Bool)

(declare-fun inv!12 (BitStream!2198) Bool)

(assert (=> start!11902 (and (inv!12 thiss!1379) e!40446)))

(declare-fun b!60587 () Bool)

(assert (=> b!60587 (= e!40446 (array_inv!1158 (buf!1636 thiss!1379)))))

(declare-fun b!60588 () Bool)

(declare-fun e!40451 () Bool)

(assert (=> b!60588 (= e!40451 e!40441)))

(declare-fun res!50541 () Bool)

(assert (=> b!60588 (=> res!50541 e!40441)))

(assert (=> b!60588 (= res!50541 (not (isPrefixOf!0 (_2!2870 lt!94465) (_2!2870 lt!94473))))))

(assert (=> b!60588 (isPrefixOf!0 thiss!1379 (_2!2870 lt!94473))))

(declare-fun lt!94477 () Unit!4133)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2198 BitStream!2198 BitStream!2198) Unit!4133)

(assert (=> b!60588 (= lt!94477 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2870 lt!94465) (_2!2870 lt!94473)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2198 array!2759 (_ BitVec 64) (_ BitVec 64)) tuple2!5518)

(assert (=> b!60588 (= lt!94473 (appendBitsMSBFirstLoop!0 (_2!2870 lt!94465) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!40449 () Bool)

(assert (=> b!60588 e!40449))

(declare-fun res!50530 () Bool)

(assert (=> b!60588 (=> (not res!50530) (not e!40449))))

(assert (=> b!60588 (= res!50530 (validate_offset_bits!1 ((_ sign_extend 32) (size!1255 (buf!1636 (_2!2870 lt!94465)))) ((_ sign_extend 32) (currentByte!3254 thiss!1379)) ((_ sign_extend 32) (currentBit!3249 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94480 () Unit!4133)

(assert (=> b!60588 (= lt!94480 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1636 (_2!2870 lt!94465)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94466 () tuple2!5520)

(assert (=> b!60588 (= lt!94466 (reader!0 thiss!1379 (_2!2870 lt!94465)))))

(declare-fun b!60589 () Bool)

(declare-fun e!40444 () Bool)

(assert (=> b!60589 (= e!40444 (= lt!94475 (bvsub (bvsub (bvadd (bitIndex!0 (size!1255 (buf!1636 (_2!2870 lt!94465))) (currentByte!3254 (_2!2870 lt!94465)) (currentBit!3249 (_2!2870 lt!94465))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!60590 () Bool)

(assert (=> b!60590 (= e!40440 e!40442)))

(declare-fun res!50532 () Bool)

(assert (=> b!60590 (=> res!50532 e!40442)))

(assert (=> b!60590 (= res!50532 (not (= (size!1255 (buf!1636 (_2!2870 lt!94465))) (size!1255 (buf!1636 (_2!2870 lt!94473))))))))

(assert (=> b!60590 e!40444))

(declare-fun res!50531 () Bool)

(assert (=> b!60590 (=> (not res!50531) (not e!40444))))

(assert (=> b!60590 (= res!50531 (= (size!1255 (buf!1636 (_2!2870 lt!94473))) (size!1255 (buf!1636 thiss!1379))))))

(declare-fun b!60591 () Bool)

(declare-fun res!50535 () Bool)

(assert (=> b!60591 (=> res!50535 e!40440)))

(assert (=> b!60591 (= res!50535 (not (= (size!1255 (buf!1636 thiss!1379)) (size!1255 (buf!1636 (_2!2870 lt!94473))))))))

(declare-fun b!60592 () Bool)

(assert (=> b!60592 (= e!40448 e!40451)))

(declare-fun res!50534 () Bool)

(assert (=> b!60592 (=> res!50534 e!40451)))

(assert (=> b!60592 (= res!50534 (not (isPrefixOf!0 thiss!1379 (_2!2870 lt!94465))))))

(assert (=> b!60592 (validate_offset_bits!1 ((_ sign_extend 32) (size!1255 (buf!1636 (_2!2870 lt!94465)))) ((_ sign_extend 32) (currentByte!3254 (_2!2870 lt!94465))) ((_ sign_extend 32) (currentBit!3249 (_2!2870 lt!94465))) lt!94469)))

(assert (=> b!60592 (= lt!94469 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!94464 () Unit!4133)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2198 BitStream!2198 (_ BitVec 64) (_ BitVec 64)) Unit!4133)

(assert (=> b!60592 (= lt!94464 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2870 lt!94465) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2198 (_ BitVec 8) (_ BitVec 32)) tuple2!5518)

(assert (=> b!60592 (= lt!94465 (appendBitFromByte!0 thiss!1379 (select (arr!1819 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!60593 () Bool)

(declare-fun head!493 (List!674) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2198 array!2759 (_ BitVec 64) (_ BitVec 64)) List!674)

(assert (=> b!60593 (= e!40449 (= (head!493 (byteArrayBitContentToList!0 (_2!2870 lt!94465) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!493 (bitStreamReadBitsIntoList!0 (_2!2870 lt!94465) (_1!2871 lt!94466) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!60594 () Bool)

(declare-fun res!50540 () Bool)

(assert (=> b!60594 (=> res!50540 e!40442)))

(assert (=> b!60594 (= res!50540 (not (invariant!0 (currentBit!3249 (_2!2870 lt!94465)) (currentByte!3254 (_2!2870 lt!94465)) (size!1255 (buf!1636 (_2!2870 lt!94465))))))))

(declare-fun b!60595 () Bool)

(declare-fun res!50539 () Bool)

(assert (=> b!60595 (=> (not res!50539) (not e!40450))))

(assert (=> b!60595 (= res!50539 (validate_offset_bits!1 ((_ sign_extend 32) (size!1255 (buf!1636 thiss!1379))) ((_ sign_extend 32) (currentByte!3254 thiss!1379)) ((_ sign_extend 32) (currentBit!3249 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!11902 res!50529) b!60595))

(assert (= (and b!60595 res!50539) b!60583))

(assert (= (and b!60583 (not res!50533)) b!60592))

(assert (= (and b!60592 (not res!50534)) b!60588))

(assert (= (and b!60588 res!50530) b!60593))

(assert (= (and b!60588 (not res!50541)) b!60584))

(assert (= (and b!60584 (not res!50528)) b!60581))

(assert (= (and b!60581 (not res!50536)) b!60591))

(assert (= (and b!60591 (not res!50535)) b!60590))

(assert (= (and b!60590 res!50531) b!60589))

(assert (= (and b!60590 (not res!50532)) b!60594))

(assert (= (and b!60594 (not res!50540)) b!60585))

(assert (= (and b!60585 (not res!50538)) b!60586))

(assert (= (and b!60586 (not res!50537)) b!60582))

(assert (= start!11902 b!60587))

(declare-fun m!95465 () Bool)

(assert (=> b!60585 m!95465))

(declare-fun m!95467 () Bool)

(assert (=> b!60584 m!95467))

(declare-fun m!95469 () Bool)

(assert (=> b!60594 m!95469))

(declare-fun m!95471 () Bool)

(assert (=> b!60593 m!95471))

(assert (=> b!60593 m!95471))

(declare-fun m!95473 () Bool)

(assert (=> b!60593 m!95473))

(declare-fun m!95475 () Bool)

(assert (=> b!60593 m!95475))

(assert (=> b!60593 m!95475))

(declare-fun m!95477 () Bool)

(assert (=> b!60593 m!95477))

(declare-fun m!95479 () Bool)

(assert (=> start!11902 m!95479))

(declare-fun m!95481 () Bool)

(assert (=> start!11902 m!95481))

(declare-fun m!95483 () Bool)

(assert (=> b!60582 m!95483))

(declare-fun m!95485 () Bool)

(assert (=> b!60581 m!95485))

(declare-fun m!95487 () Bool)

(assert (=> b!60595 m!95487))

(declare-fun m!95489 () Bool)

(assert (=> b!60586 m!95489))

(declare-fun m!95491 () Bool)

(assert (=> b!60586 m!95491))

(declare-fun m!95493 () Bool)

(assert (=> b!60586 m!95493))

(declare-fun m!95495 () Bool)

(assert (=> b!60586 m!95495))

(declare-fun m!95497 () Bool)

(assert (=> b!60586 m!95497))

(declare-fun m!95499 () Bool)

(assert (=> b!60586 m!95499))

(declare-fun m!95501 () Bool)

(assert (=> b!60586 m!95501))

(declare-fun m!95503 () Bool)

(assert (=> b!60586 m!95503))

(declare-fun m!95505 () Bool)

(assert (=> b!60583 m!95505))

(declare-fun m!95507 () Bool)

(assert (=> b!60583 m!95507))

(declare-fun m!95509 () Bool)

(assert (=> b!60583 m!95509))

(declare-fun m!95511 () Bool)

(assert (=> b!60588 m!95511))

(declare-fun m!95513 () Bool)

(assert (=> b!60588 m!95513))

(declare-fun m!95515 () Bool)

(assert (=> b!60588 m!95515))

(declare-fun m!95517 () Bool)

(assert (=> b!60588 m!95517))

(declare-fun m!95519 () Bool)

(assert (=> b!60588 m!95519))

(declare-fun m!95521 () Bool)

(assert (=> b!60588 m!95521))

(declare-fun m!95523 () Bool)

(assert (=> b!60588 m!95523))

(declare-fun m!95525 () Bool)

(assert (=> b!60587 m!95525))

(declare-fun m!95527 () Bool)

(assert (=> b!60592 m!95527))

(declare-fun m!95529 () Bool)

(assert (=> b!60592 m!95529))

(assert (=> b!60592 m!95529))

(declare-fun m!95531 () Bool)

(assert (=> b!60592 m!95531))

(declare-fun m!95533 () Bool)

(assert (=> b!60592 m!95533))

(declare-fun m!95535 () Bool)

(assert (=> b!60592 m!95535))

(declare-fun m!95537 () Bool)

(assert (=> b!60589 m!95537))

(push 1)

