; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52766 () Bool)

(assert start!52766)

(declare-fun b!244453 () Bool)

(declare-fun e!169440 () Bool)

(declare-datatypes ((array!13385 0))(
  ( (array!13386 (arr!6856 (Array (_ BitVec 32) (_ BitVec 8))) (size!5869 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10660 0))(
  ( (BitStream!10661 (buf!6341 array!13385) (currentByte!11719 (_ BitVec 32)) (currentBit!11714 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20976 0))(
  ( (tuple2!20977 (_1!11410 BitStream!10660) (_2!11410 Bool)) )
))
(declare-fun lt!380968 () tuple2!20976)

(declare-fun lt!380988 () tuple2!20976)

(assert (=> b!244453 (= e!169440 (= (_2!11410 lt!380968) (_2!11410 lt!380988)))))

(declare-fun b!244454 () Bool)

(declare-fun res!204326 () Bool)

(declare-fun e!169437 () Bool)

(assert (=> b!244454 (=> (not res!204326) (not e!169437))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun thiss!1005 () BitStream!10660)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!244454 (= res!204326 (validate_offset_bits!1 ((_ sign_extend 32) (size!5869 (buf!6341 thiss!1005))) ((_ sign_extend 32) (currentByte!11719 thiss!1005)) ((_ sign_extend 32) (currentBit!11714 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!244455 () Bool)

(declare-fun e!169442 () Bool)

(declare-fun e!169438 () Bool)

(assert (=> b!244455 (= e!169442 e!169438)))

(declare-fun res!204325 () Bool)

(assert (=> b!244455 (=> (not res!204325) (not e!169438))))

(declare-datatypes ((Unit!17833 0))(
  ( (Unit!17834) )
))
(declare-datatypes ((tuple2!20978 0))(
  ( (tuple2!20979 (_1!11411 Unit!17833) (_2!11411 BitStream!10660)) )
))
(declare-fun lt!380970 () tuple2!20978)

(declare-fun lt!380969 () tuple2!20978)

(declare-fun lt!380974 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!244455 (= res!204325 (= (bitIndex!0 (size!5869 (buf!6341 (_2!11411 lt!380969))) (currentByte!11719 (_2!11411 lt!380969)) (currentBit!11714 (_2!11411 lt!380969))) (bvadd (bitIndex!0 (size!5869 (buf!6341 (_2!11411 lt!380970))) (currentByte!11719 (_2!11411 lt!380970)) (currentBit!11714 (_2!11411 lt!380970))) lt!380974)))))

(assert (=> b!244455 (= lt!380974 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!204323 () Bool)

(assert (=> start!52766 (=> (not res!204323) (not e!169437))))

(assert (=> start!52766 (= res!204323 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52766 e!169437))

(assert (=> start!52766 true))

(declare-fun e!169439 () Bool)

(declare-fun inv!12 (BitStream!10660) Bool)

(assert (=> start!52766 (and (inv!12 thiss!1005) e!169439)))

(declare-fun b!244456 () Bool)

(declare-fun e!169435 () Bool)

(declare-fun lt!380972 () tuple2!20976)

(declare-fun lt!380980 () (_ BitVec 64))

(assert (=> b!244456 (= e!169435 (= (bitIndex!0 (size!5869 (buf!6341 (_1!11410 lt!380972))) (currentByte!11719 (_1!11410 lt!380972)) (currentBit!11714 (_1!11410 lt!380972))) lt!380980))))

(declare-fun b!244457 () Bool)

(declare-fun res!204318 () Bool)

(declare-fun e!169434 () Bool)

(assert (=> b!244457 (=> (not res!204318) (not e!169434))))

(declare-fun isPrefixOf!0 (BitStream!10660 BitStream!10660) Bool)

(assert (=> b!244457 (= res!204318 (isPrefixOf!0 thiss!1005 (_2!11411 lt!380970)))))

(declare-fun b!244458 () Bool)

(assert (=> b!244458 (= e!169437 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun lt!380985 () (_ BitVec 64))

(assert (=> b!244458 (validate_offset_bits!1 ((_ sign_extend 32) (size!5869 (buf!6341 (_2!11411 lt!380969)))) ((_ sign_extend 32) (currentByte!11719 (_2!11411 lt!380970))) ((_ sign_extend 32) (currentBit!11714 (_2!11411 lt!380970))) lt!380985)))

(declare-fun lt!380975 () Unit!17833)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10660 array!13385 (_ BitVec 64)) Unit!17833)

(assert (=> b!244458 (= lt!380975 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11411 lt!380970) (buf!6341 (_2!11411 lt!380969)) lt!380985))))

(declare-datatypes ((tuple2!20980 0))(
  ( (tuple2!20981 (_1!11412 BitStream!10660) (_2!11412 BitStream!10660)) )
))
(declare-fun lt!380984 () tuple2!20980)

(declare-fun lt!380977 () tuple2!20976)

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10660 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20976)

(assert (=> b!244458 (= lt!380977 (checkBitsLoopPure!0 (_1!11412 lt!380984) nBits!297 bit!26 from!289))))

(assert (=> b!244458 (validate_offset_bits!1 ((_ sign_extend 32) (size!5869 (buf!6341 (_2!11411 lt!380969)))) ((_ sign_extend 32) (currentByte!11719 thiss!1005)) ((_ sign_extend 32) (currentBit!11714 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380978 () Unit!17833)

(assert (=> b!244458 (= lt!380978 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6341 (_2!11411 lt!380969)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10660) tuple2!20976)

(assert (=> b!244458 (= (_2!11410 (readBitPure!0 (_1!11412 lt!380984))) bit!26)))

(declare-fun lt!380986 () tuple2!20980)

(declare-fun reader!0 (BitStream!10660 BitStream!10660) tuple2!20980)

(assert (=> b!244458 (= lt!380986 (reader!0 (_2!11411 lt!380970) (_2!11411 lt!380969)))))

(assert (=> b!244458 (= lt!380984 (reader!0 thiss!1005 (_2!11411 lt!380969)))))

(assert (=> b!244458 e!169440))

(declare-fun res!204321 () Bool)

(assert (=> b!244458 (=> (not res!204321) (not e!169440))))

(assert (=> b!244458 (= res!204321 (= (bitIndex!0 (size!5869 (buf!6341 (_1!11410 lt!380968))) (currentByte!11719 (_1!11410 lt!380968)) (currentBit!11714 (_1!11410 lt!380968))) (bitIndex!0 (size!5869 (buf!6341 (_1!11410 lt!380988))) (currentByte!11719 (_1!11410 lt!380988)) (currentBit!11714 (_1!11410 lt!380988)))))))

(declare-fun lt!380971 () Unit!17833)

(declare-fun lt!380979 () BitStream!10660)

(declare-fun readBitPrefixLemma!0 (BitStream!10660 BitStream!10660) Unit!17833)

(assert (=> b!244458 (= lt!380971 (readBitPrefixLemma!0 lt!380979 (_2!11411 lt!380969)))))

(assert (=> b!244458 (= lt!380988 (readBitPure!0 (BitStream!10661 (buf!6341 (_2!11411 lt!380969)) (currentByte!11719 thiss!1005) (currentBit!11714 thiss!1005))))))

(assert (=> b!244458 (= lt!380968 (readBitPure!0 lt!380979))))

(assert (=> b!244458 (= lt!380979 (BitStream!10661 (buf!6341 (_2!11411 lt!380970)) (currentByte!11719 thiss!1005) (currentBit!11714 thiss!1005)))))

(declare-fun e!169433 () Bool)

(assert (=> b!244458 e!169433))

(declare-fun res!204322 () Bool)

(assert (=> b!244458 (=> (not res!204322) (not e!169433))))

(assert (=> b!244458 (= res!204322 (isPrefixOf!0 thiss!1005 (_2!11411 lt!380969)))))

(declare-fun lt!380987 () Unit!17833)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10660 BitStream!10660 BitStream!10660) Unit!17833)

(assert (=> b!244458 (= lt!380987 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11411 lt!380970) (_2!11411 lt!380969)))))

(assert (=> b!244458 e!169442))

(declare-fun res!204327 () Bool)

(assert (=> b!244458 (=> (not res!204327) (not e!169442))))

(assert (=> b!244458 (= res!204327 (= (size!5869 (buf!6341 (_2!11411 lt!380970))) (size!5869 (buf!6341 (_2!11411 lt!380969)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10660 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20978)

(assert (=> b!244458 (= lt!380969 (appendNBitsLoop!0 (_2!11411 lt!380970) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244458 (validate_offset_bits!1 ((_ sign_extend 32) (size!5869 (buf!6341 (_2!11411 lt!380970)))) ((_ sign_extend 32) (currentByte!11719 (_2!11411 lt!380970))) ((_ sign_extend 32) (currentBit!11714 (_2!11411 lt!380970))) lt!380985)))

(assert (=> b!244458 (= lt!380985 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380982 () Unit!17833)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10660 BitStream!10660 (_ BitVec 64) (_ BitVec 64)) Unit!17833)

(assert (=> b!244458 (= lt!380982 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11411 lt!380970) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!169436 () Bool)

(assert (=> b!244458 e!169436))

(declare-fun res!204328 () Bool)

(assert (=> b!244458 (=> (not res!204328) (not e!169436))))

(assert (=> b!244458 (= res!204328 (= (size!5869 (buf!6341 thiss!1005)) (size!5869 (buf!6341 (_2!11411 lt!380970)))))))

(declare-fun appendBit!0 (BitStream!10660 Bool) tuple2!20978)

(assert (=> b!244458 (= lt!380970 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!244459 () Bool)

(declare-fun lt!380973 () tuple2!20976)

(declare-fun lt!380976 () tuple2!20980)

(assert (=> b!244459 (= e!169438 (not (or (not (_2!11410 lt!380973)) (not (= (_1!11410 lt!380973) (_2!11412 lt!380976))))))))

(assert (=> b!244459 (= lt!380973 (checkBitsLoopPure!0 (_1!11412 lt!380976) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!244459 (validate_offset_bits!1 ((_ sign_extend 32) (size!5869 (buf!6341 (_2!11411 lt!380969)))) ((_ sign_extend 32) (currentByte!11719 (_2!11411 lt!380970))) ((_ sign_extend 32) (currentBit!11714 (_2!11411 lt!380970))) lt!380974)))

(declare-fun lt!380981 () Unit!17833)

(assert (=> b!244459 (= lt!380981 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11411 lt!380970) (buf!6341 (_2!11411 lt!380969)) lt!380974))))

(assert (=> b!244459 (= lt!380976 (reader!0 (_2!11411 lt!380970) (_2!11411 lt!380969)))))

(declare-fun b!244460 () Bool)

(declare-fun res!204330 () Bool)

(assert (=> b!244460 (=> (not res!204330) (not e!169433))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244460 (= res!204330 (invariant!0 (currentBit!11714 thiss!1005) (currentByte!11719 thiss!1005) (size!5869 (buf!6341 (_2!11411 lt!380970)))))))

(declare-fun b!244461 () Bool)

(assert (=> b!244461 (= e!169436 e!169434)))

(declare-fun res!204324 () Bool)

(assert (=> b!244461 (=> (not res!204324) (not e!169434))))

(declare-fun lt!380983 () (_ BitVec 64))

(assert (=> b!244461 (= res!204324 (= lt!380980 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380983)))))

(assert (=> b!244461 (= lt!380980 (bitIndex!0 (size!5869 (buf!6341 (_2!11411 lt!380970))) (currentByte!11719 (_2!11411 lt!380970)) (currentBit!11714 (_2!11411 lt!380970))))))

(assert (=> b!244461 (= lt!380983 (bitIndex!0 (size!5869 (buf!6341 thiss!1005)) (currentByte!11719 thiss!1005) (currentBit!11714 thiss!1005)))))

(declare-fun b!244462 () Bool)

(declare-fun array_inv!5610 (array!13385) Bool)

(assert (=> b!244462 (= e!169439 (array_inv!5610 (buf!6341 thiss!1005)))))

(declare-fun b!244463 () Bool)

(assert (=> b!244463 (= e!169434 e!169435)))

(declare-fun res!204319 () Bool)

(assert (=> b!244463 (=> (not res!204319) (not e!169435))))

(assert (=> b!244463 (= res!204319 (and (= (_2!11410 lt!380972) bit!26) (= (_1!11410 lt!380972) (_2!11411 lt!380970))))))

(declare-fun readerFrom!0 (BitStream!10660 (_ BitVec 32) (_ BitVec 32)) BitStream!10660)

(assert (=> b!244463 (= lt!380972 (readBitPure!0 (readerFrom!0 (_2!11411 lt!380970) (currentBit!11714 thiss!1005) (currentByte!11719 thiss!1005))))))

(declare-fun b!244464 () Bool)

(declare-fun res!204329 () Bool)

(assert (=> b!244464 (=> (not res!204329) (not e!169438))))

(assert (=> b!244464 (= res!204329 (isPrefixOf!0 (_2!11411 lt!380970) (_2!11411 lt!380969)))))

(declare-fun b!244465 () Bool)

(declare-fun res!204320 () Bool)

(assert (=> b!244465 (=> (not res!204320) (not e!169437))))

(assert (=> b!244465 (= res!204320 (bvslt from!289 nBits!297))))

(declare-fun b!244466 () Bool)

(assert (=> b!244466 (= e!169433 (invariant!0 (currentBit!11714 thiss!1005) (currentByte!11719 thiss!1005) (size!5869 (buf!6341 (_2!11411 lt!380969)))))))

(assert (= (and start!52766 res!204323) b!244454))

(assert (= (and b!244454 res!204326) b!244465))

(assert (= (and b!244465 res!204320) b!244458))

(assert (= (and b!244458 res!204328) b!244461))

(assert (= (and b!244461 res!204324) b!244457))

(assert (= (and b!244457 res!204318) b!244463))

(assert (= (and b!244463 res!204319) b!244456))

(assert (= (and b!244458 res!204327) b!244455))

(assert (= (and b!244455 res!204325) b!244464))

(assert (= (and b!244464 res!204329) b!244459))

(assert (= (and b!244458 res!204322) b!244460))

(assert (= (and b!244460 res!204330) b!244466))

(assert (= (and b!244458 res!204321) b!244453))

(assert (= start!52766 b!244462))

(declare-fun m!368429 () Bool)

(assert (=> start!52766 m!368429))

(declare-fun m!368431 () Bool)

(assert (=> b!244456 m!368431))

(declare-fun m!368433 () Bool)

(assert (=> b!244462 m!368433))

(declare-fun m!368435 () Bool)

(assert (=> b!244457 m!368435))

(declare-fun m!368437 () Bool)

(assert (=> b!244466 m!368437))

(declare-fun m!368439 () Bool)

(assert (=> b!244459 m!368439))

(declare-fun m!368441 () Bool)

(assert (=> b!244459 m!368441))

(declare-fun m!368443 () Bool)

(assert (=> b!244459 m!368443))

(declare-fun m!368445 () Bool)

(assert (=> b!244459 m!368445))

(declare-fun m!368447 () Bool)

(assert (=> b!244464 m!368447))

(declare-fun m!368449 () Bool)

(assert (=> b!244460 m!368449))

(declare-fun m!368451 () Bool)

(assert (=> b!244463 m!368451))

(assert (=> b!244463 m!368451))

(declare-fun m!368453 () Bool)

(assert (=> b!244463 m!368453))

(declare-fun m!368455 () Bool)

(assert (=> b!244461 m!368455))

(declare-fun m!368457 () Bool)

(assert (=> b!244461 m!368457))

(declare-fun m!368459 () Bool)

(assert (=> b!244458 m!368459))

(declare-fun m!368461 () Bool)

(assert (=> b!244458 m!368461))

(declare-fun m!368463 () Bool)

(assert (=> b!244458 m!368463))

(declare-fun m!368465 () Bool)

(assert (=> b!244458 m!368465))

(assert (=> b!244458 m!368445))

(declare-fun m!368467 () Bool)

(assert (=> b!244458 m!368467))

(declare-fun m!368469 () Bool)

(assert (=> b!244458 m!368469))

(declare-fun m!368471 () Bool)

(assert (=> b!244458 m!368471))

(declare-fun m!368473 () Bool)

(assert (=> b!244458 m!368473))

(declare-fun m!368475 () Bool)

(assert (=> b!244458 m!368475))

(declare-fun m!368477 () Bool)

(assert (=> b!244458 m!368477))

(declare-fun m!368479 () Bool)

(assert (=> b!244458 m!368479))

(declare-fun m!368481 () Bool)

(assert (=> b!244458 m!368481))

(declare-fun m!368483 () Bool)

(assert (=> b!244458 m!368483))

(declare-fun m!368485 () Bool)

(assert (=> b!244458 m!368485))

(declare-fun m!368487 () Bool)

(assert (=> b!244458 m!368487))

(declare-fun m!368489 () Bool)

(assert (=> b!244458 m!368489))

(declare-fun m!368491 () Bool)

(assert (=> b!244458 m!368491))

(declare-fun m!368493 () Bool)

(assert (=> b!244458 m!368493))

(declare-fun m!368495 () Bool)

(assert (=> b!244454 m!368495))

(declare-fun m!368497 () Bool)

(assert (=> b!244455 m!368497))

(assert (=> b!244455 m!368455))

(push 1)

(assert (not b!244458))

(assert (not b!244466))

(assert (not b!244457))

(assert (not start!52766))

(assert (not b!244454))

(assert (not b!244463))

(assert (not b!244459))

(assert (not b!244462))

(assert (not b!244461))

(assert (not b!244456))

(assert (not b!244455))

(assert (not b!244464))

(assert (not b!244460))

(check-sat)

(pop 1)

(push 1)

(check-sat)

