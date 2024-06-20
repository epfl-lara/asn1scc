; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52768 () Bool)

(assert start!52768)

(declare-fun b!244495 () Bool)

(declare-fun e!169463 () Bool)

(declare-fun e!169464 () Bool)

(assert (=> b!244495 (= e!169463 e!169464)))

(declare-fun res!204366 () Bool)

(assert (=> b!244495 (=> (not res!204366) (not e!169464))))

(declare-datatypes ((array!13387 0))(
  ( (array!13388 (arr!6857 (Array (_ BitVec 32) (_ BitVec 8))) (size!5870 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10662 0))(
  ( (BitStream!10663 (buf!6342 array!13387) (currentByte!11720 (_ BitVec 32)) (currentBit!11715 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17835 0))(
  ( (Unit!17836) )
))
(declare-datatypes ((tuple2!20982 0))(
  ( (tuple2!20983 (_1!11413 Unit!17835) (_2!11413 BitStream!10662)) )
))
(declare-fun lt!381034 () tuple2!20982)

(declare-fun lt!381038 () tuple2!20982)

(declare-fun lt!381048 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244495 (= res!204366 (= (bitIndex!0 (size!5870 (buf!6342 (_2!11413 lt!381038))) (currentByte!11720 (_2!11413 lt!381038)) (currentBit!11715 (_2!11413 lt!381038))) (bvadd (bitIndex!0 (size!5870 (buf!6342 (_2!11413 lt!381034))) (currentByte!11720 (_2!11413 lt!381034)) (currentBit!11715 (_2!11413 lt!381034))) lt!381048)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!244495 (= lt!381048 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!244496 () Bool)

(declare-fun res!204368 () Bool)

(assert (=> b!244496 (=> (not res!204368) (not e!169464))))

(declare-fun isPrefixOf!0 (BitStream!10662 BitStream!10662) Bool)

(assert (=> b!244496 (= res!204368 (isPrefixOf!0 (_2!11413 lt!381034) (_2!11413 lt!381038)))))

(declare-fun b!244497 () Bool)

(declare-fun e!169467 () Bool)

(declare-datatypes ((tuple2!20984 0))(
  ( (tuple2!20985 (_1!11414 BitStream!10662) (_2!11414 Bool)) )
))
(declare-fun lt!381044 () tuple2!20984)

(declare-fun lt!381039 () (_ BitVec 64))

(assert (=> b!244497 (= e!169467 (= (bitIndex!0 (size!5870 (buf!6342 (_1!11414 lt!381044))) (currentByte!11720 (_1!11414 lt!381044)) (currentBit!11715 (_1!11414 lt!381044))) lt!381039))))

(declare-fun b!244498 () Bool)

(declare-fun e!169466 () Bool)

(assert (=> b!244498 (= e!169466 e!169467)))

(declare-fun res!204365 () Bool)

(assert (=> b!244498 (=> (not res!204365) (not e!169467))))

(declare-fun bit!26 () Bool)

(assert (=> b!244498 (= res!204365 (and (= (_2!11414 lt!381044) bit!26) (= (_1!11414 lt!381044) (_2!11413 lt!381034))))))

(declare-fun thiss!1005 () BitStream!10662)

(declare-fun readBitPure!0 (BitStream!10662) tuple2!20984)

(declare-fun readerFrom!0 (BitStream!10662 (_ BitVec 32) (_ BitVec 32)) BitStream!10662)

(assert (=> b!244498 (= lt!381044 (readBitPure!0 (readerFrom!0 (_2!11413 lt!381034) (currentBit!11715 thiss!1005) (currentByte!11720 thiss!1005))))))

(declare-fun b!244499 () Bool)

(declare-fun e!169470 () Bool)

(assert (=> b!244499 (= e!169470 e!169466)))

(declare-fun res!204367 () Bool)

(assert (=> b!244499 (=> (not res!204367) (not e!169466))))

(declare-fun lt!381043 () (_ BitVec 64))

(assert (=> b!244499 (= res!204367 (= lt!381039 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!381043)))))

(assert (=> b!244499 (= lt!381039 (bitIndex!0 (size!5870 (buf!6342 (_2!11413 lt!381034))) (currentByte!11720 (_2!11413 lt!381034)) (currentBit!11715 (_2!11413 lt!381034))))))

(assert (=> b!244499 (= lt!381043 (bitIndex!0 (size!5870 (buf!6342 thiss!1005)) (currentByte!11720 thiss!1005) (currentBit!11715 thiss!1005)))))

(declare-fun b!244500 () Bool)

(declare-fun res!204361 () Bool)

(assert (=> b!244500 (=> (not res!204361) (not e!169466))))

(assert (=> b!244500 (= res!204361 (isPrefixOf!0 thiss!1005 (_2!11413 lt!381034)))))

(declare-fun b!244501 () Bool)

(declare-fun e!169465 () Bool)

(declare-fun lt!381037 () tuple2!20984)

(declare-fun lt!381051 () tuple2!20984)

(assert (=> b!244501 (= e!169465 (= (_2!11414 lt!381037) (_2!11414 lt!381051)))))

(declare-fun b!244503 () Bool)

(declare-fun e!169468 () Bool)

(assert (=> b!244503 (= e!169468 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun lt!381050 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244503 (validate_offset_bits!1 ((_ sign_extend 32) (size!5870 (buf!6342 (_2!11413 lt!381038)))) ((_ sign_extend 32) (currentByte!11720 (_2!11413 lt!381034))) ((_ sign_extend 32) (currentBit!11715 (_2!11413 lt!381034))) lt!381050)))

(declare-fun lt!381049 () Unit!17835)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10662 array!13387 (_ BitVec 64)) Unit!17835)

(assert (=> b!244503 (= lt!381049 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11413 lt!381034) (buf!6342 (_2!11413 lt!381038)) lt!381050))))

(declare-fun lt!381042 () tuple2!20984)

(declare-datatypes ((tuple2!20986 0))(
  ( (tuple2!20987 (_1!11415 BitStream!10662) (_2!11415 BitStream!10662)) )
))
(declare-fun lt!381031 () tuple2!20986)

(declare-fun checkBitsLoopPure!0 (BitStream!10662 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20984)

(assert (=> b!244503 (= lt!381042 (checkBitsLoopPure!0 (_1!11415 lt!381031) nBits!297 bit!26 from!289))))

(assert (=> b!244503 (validate_offset_bits!1 ((_ sign_extend 32) (size!5870 (buf!6342 (_2!11413 lt!381038)))) ((_ sign_extend 32) (currentByte!11720 thiss!1005)) ((_ sign_extend 32) (currentBit!11715 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!381032 () Unit!17835)

(assert (=> b!244503 (= lt!381032 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6342 (_2!11413 lt!381038)) (bvsub nBits!297 from!289)))))

(assert (=> b!244503 (= (_2!11414 (readBitPure!0 (_1!11415 lt!381031))) bit!26)))

(declare-fun lt!381041 () tuple2!20986)

(declare-fun reader!0 (BitStream!10662 BitStream!10662) tuple2!20986)

(assert (=> b!244503 (= lt!381041 (reader!0 (_2!11413 lt!381034) (_2!11413 lt!381038)))))

(assert (=> b!244503 (= lt!381031 (reader!0 thiss!1005 (_2!11413 lt!381038)))))

(assert (=> b!244503 e!169465))

(declare-fun res!204363 () Bool)

(assert (=> b!244503 (=> (not res!204363) (not e!169465))))

(assert (=> b!244503 (= res!204363 (= (bitIndex!0 (size!5870 (buf!6342 (_1!11414 lt!381037))) (currentByte!11720 (_1!11414 lt!381037)) (currentBit!11715 (_1!11414 lt!381037))) (bitIndex!0 (size!5870 (buf!6342 (_1!11414 lt!381051))) (currentByte!11720 (_1!11414 lt!381051)) (currentBit!11715 (_1!11414 lt!381051)))))))

(declare-fun lt!381035 () Unit!17835)

(declare-fun lt!381033 () BitStream!10662)

(declare-fun readBitPrefixLemma!0 (BitStream!10662 BitStream!10662) Unit!17835)

(assert (=> b!244503 (= lt!381035 (readBitPrefixLemma!0 lt!381033 (_2!11413 lt!381038)))))

(assert (=> b!244503 (= lt!381051 (readBitPure!0 (BitStream!10663 (buf!6342 (_2!11413 lt!381038)) (currentByte!11720 thiss!1005) (currentBit!11715 thiss!1005))))))

(assert (=> b!244503 (= lt!381037 (readBitPure!0 lt!381033))))

(assert (=> b!244503 (= lt!381033 (BitStream!10663 (buf!6342 (_2!11413 lt!381034)) (currentByte!11720 thiss!1005) (currentBit!11715 thiss!1005)))))

(declare-fun e!169471 () Bool)

(assert (=> b!244503 e!169471))

(declare-fun res!204357 () Bool)

(assert (=> b!244503 (=> (not res!204357) (not e!169471))))

(assert (=> b!244503 (= res!204357 (isPrefixOf!0 thiss!1005 (_2!11413 lt!381038)))))

(declare-fun lt!381040 () Unit!17835)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10662 BitStream!10662 BitStream!10662) Unit!17835)

(assert (=> b!244503 (= lt!381040 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11413 lt!381034) (_2!11413 lt!381038)))))

(assert (=> b!244503 e!169463))

(declare-fun res!204369 () Bool)

(assert (=> b!244503 (=> (not res!204369) (not e!169463))))

(assert (=> b!244503 (= res!204369 (= (size!5870 (buf!6342 (_2!11413 lt!381034))) (size!5870 (buf!6342 (_2!11413 lt!381038)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10662 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20982)

(assert (=> b!244503 (= lt!381038 (appendNBitsLoop!0 (_2!11413 lt!381034) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244503 (validate_offset_bits!1 ((_ sign_extend 32) (size!5870 (buf!6342 (_2!11413 lt!381034)))) ((_ sign_extend 32) (currentByte!11720 (_2!11413 lt!381034))) ((_ sign_extend 32) (currentBit!11715 (_2!11413 lt!381034))) lt!381050)))

(assert (=> b!244503 (= lt!381050 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!381047 () Unit!17835)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10662 BitStream!10662 (_ BitVec 64) (_ BitVec 64)) Unit!17835)

(assert (=> b!244503 (= lt!381047 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11413 lt!381034) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!244503 e!169470))

(declare-fun res!204364 () Bool)

(assert (=> b!244503 (=> (not res!204364) (not e!169470))))

(assert (=> b!244503 (= res!204364 (= (size!5870 (buf!6342 thiss!1005)) (size!5870 (buf!6342 (_2!11413 lt!381034)))))))

(declare-fun appendBit!0 (BitStream!10662 Bool) tuple2!20982)

(assert (=> b!244503 (= lt!381034 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244504 () Bool)

(declare-fun res!204360 () Bool)

(assert (=> b!244504 (=> (not res!204360) (not e!169471))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244504 (= res!204360 (invariant!0 (currentBit!11715 thiss!1005) (currentByte!11720 thiss!1005) (size!5870 (buf!6342 (_2!11413 lt!381034)))))))

(declare-fun b!244505 () Bool)

(assert (=> b!244505 (= e!169471 (invariant!0 (currentBit!11715 thiss!1005) (currentByte!11720 thiss!1005) (size!5870 (buf!6342 (_2!11413 lt!381038)))))))

(declare-fun b!244506 () Bool)

(declare-fun lt!381046 () tuple2!20984)

(declare-fun lt!381045 () tuple2!20986)

(assert (=> b!244506 (= e!169464 (not (or (not (_2!11414 lt!381046)) (not (= (_1!11414 lt!381046) (_2!11415 lt!381045))))))))

(assert (=> b!244506 (= lt!381046 (checkBitsLoopPure!0 (_1!11415 lt!381045) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244506 (validate_offset_bits!1 ((_ sign_extend 32) (size!5870 (buf!6342 (_2!11413 lt!381038)))) ((_ sign_extend 32) (currentByte!11720 (_2!11413 lt!381034))) ((_ sign_extend 32) (currentBit!11715 (_2!11413 lt!381034))) lt!381048)))

(declare-fun lt!381036 () Unit!17835)

(assert (=> b!244506 (= lt!381036 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11413 lt!381034) (buf!6342 (_2!11413 lt!381038)) lt!381048))))

(assert (=> b!244506 (= lt!381045 (reader!0 (_2!11413 lt!381034) (_2!11413 lt!381038)))))

(declare-fun b!244507 () Bool)

(declare-fun e!169469 () Bool)

(declare-fun array_inv!5611 (array!13387) Bool)

(assert (=> b!244507 (= e!169469 (array_inv!5611 (buf!6342 thiss!1005)))))

(declare-fun b!244508 () Bool)

(declare-fun res!204358 () Bool)

(assert (=> b!244508 (=> (not res!204358) (not e!169468))))

(assert (=> b!244508 (= res!204358 (bvslt from!289 nBits!297))))

(declare-fun b!244502 () Bool)

(declare-fun res!204359 () Bool)

(assert (=> b!244502 (=> (not res!204359) (not e!169468))))

(assert (=> b!244502 (= res!204359 (validate_offset_bits!1 ((_ sign_extend 32) (size!5870 (buf!6342 thiss!1005))) ((_ sign_extend 32) (currentByte!11720 thiss!1005)) ((_ sign_extend 32) (currentBit!11715 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun res!204362 () Bool)

(assert (=> start!52768 (=> (not res!204362) (not e!169468))))

(assert (=> start!52768 (= res!204362 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52768 e!169468))

(assert (=> start!52768 true))

(declare-fun inv!12 (BitStream!10662) Bool)

(assert (=> start!52768 (and (inv!12 thiss!1005) e!169469)))

(assert (= (and start!52768 res!204362) b!244502))

(assert (= (and b!244502 res!204359) b!244508))

(assert (= (and b!244508 res!204358) b!244503))

(assert (= (and b!244503 res!204364) b!244499))

(assert (= (and b!244499 res!204367) b!244500))

(assert (= (and b!244500 res!204361) b!244498))

(assert (= (and b!244498 res!204365) b!244497))

(assert (= (and b!244503 res!204369) b!244495))

(assert (= (and b!244495 res!204366) b!244496))

(assert (= (and b!244496 res!204368) b!244506))

(assert (= (and b!244503 res!204357) b!244504))

(assert (= (and b!244504 res!204360) b!244505))

(assert (= (and b!244503 res!204363) b!244501))

(assert (= start!52768 b!244507))

(declare-fun m!368499 () Bool)

(assert (=> b!244506 m!368499))

(declare-fun m!368501 () Bool)

(assert (=> b!244506 m!368501))

(declare-fun m!368503 () Bool)

(assert (=> b!244506 m!368503))

(declare-fun m!368505 () Bool)

(assert (=> b!244506 m!368505))

(declare-fun m!368507 () Bool)

(assert (=> b!244497 m!368507))

(declare-fun m!368509 () Bool)

(assert (=> b!244498 m!368509))

(assert (=> b!244498 m!368509))

(declare-fun m!368511 () Bool)

(assert (=> b!244498 m!368511))

(declare-fun m!368513 () Bool)

(assert (=> b!244503 m!368513))

(declare-fun m!368515 () Bool)

(assert (=> b!244503 m!368515))

(declare-fun m!368517 () Bool)

(assert (=> b!244503 m!368517))

(declare-fun m!368519 () Bool)

(assert (=> b!244503 m!368519))

(declare-fun m!368521 () Bool)

(assert (=> b!244503 m!368521))

(declare-fun m!368523 () Bool)

(assert (=> b!244503 m!368523))

(declare-fun m!368525 () Bool)

(assert (=> b!244503 m!368525))

(declare-fun m!368527 () Bool)

(assert (=> b!244503 m!368527))

(declare-fun m!368529 () Bool)

(assert (=> b!244503 m!368529))

(declare-fun m!368531 () Bool)

(assert (=> b!244503 m!368531))

(declare-fun m!368533 () Bool)

(assert (=> b!244503 m!368533))

(declare-fun m!368535 () Bool)

(assert (=> b!244503 m!368535))

(declare-fun m!368537 () Bool)

(assert (=> b!244503 m!368537))

(declare-fun m!368539 () Bool)

(assert (=> b!244503 m!368539))

(declare-fun m!368541 () Bool)

(assert (=> b!244503 m!368541))

(declare-fun m!368543 () Bool)

(assert (=> b!244503 m!368543))

(declare-fun m!368545 () Bool)

(assert (=> b!244503 m!368545))

(declare-fun m!368547 () Bool)

(assert (=> b!244503 m!368547))

(assert (=> b!244503 m!368505))

(declare-fun m!368549 () Bool)

(assert (=> b!244495 m!368549))

(declare-fun m!368551 () Bool)

(assert (=> b!244495 m!368551))

(declare-fun m!368553 () Bool)

(assert (=> b!244496 m!368553))

(assert (=> b!244499 m!368551))

(declare-fun m!368555 () Bool)

(assert (=> b!244499 m!368555))

(declare-fun m!368557 () Bool)

(assert (=> b!244505 m!368557))

(declare-fun m!368559 () Bool)

(assert (=> start!52768 m!368559))

(declare-fun m!368561 () Bool)

(assert (=> b!244502 m!368561))

(declare-fun m!368563 () Bool)

(assert (=> b!244507 m!368563))

(declare-fun m!368565 () Bool)

(assert (=> b!244500 m!368565))

(declare-fun m!368567 () Bool)

(assert (=> b!244504 m!368567))

(check-sat (not b!244496) (not start!52768) (not b!244502) (not b!244495) (not b!244498) (not b!244505) (not b!244499) (not b!244500) (not b!244497) (not b!244503) (not b!244507) (not b!244506) (not b!244504))
(check-sat)
