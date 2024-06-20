; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54056 () Bool)

(assert start!54056)

(declare-fun b!251452 () Bool)

(declare-fun e!174225 () Bool)

(declare-fun e!174224 () Bool)

(assert (=> b!251452 (= e!174225 e!174224)))

(declare-fun res!210582 () Bool)

(assert (=> b!251452 (=> (not res!210582) (not e!174224))))

(declare-datatypes ((array!13680 0))(
  ( (array!13681 (arr!6986 (Array (_ BitVec 32) (_ BitVec 8))) (size!5999 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10920 0))(
  ( (BitStream!10921 (buf!6501 array!13680) (currentByte!11956 (_ BitVec 32)) (currentBit!11951 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18146 0))(
  ( (Unit!18147) )
))
(declare-datatypes ((tuple2!21564 0))(
  ( (tuple2!21565 (_1!11710 Unit!18146) (_2!11710 BitStream!10920)) )
))
(declare-fun lt!390786 () tuple2!21564)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21566 0))(
  ( (tuple2!21567 (_1!11711 BitStream!10920) (_2!11711 Bool)) )
))
(declare-fun lt!390783 () tuple2!21566)

(assert (=> b!251452 (= res!210582 (and (= (_2!11711 lt!390783) bit!26) (= (_1!11711 lt!390783) (_2!11710 lt!390786))))))

(declare-fun thiss!1005 () BitStream!10920)

(declare-fun readBitPure!0 (BitStream!10920) tuple2!21566)

(declare-fun readerFrom!0 (BitStream!10920 (_ BitVec 32) (_ BitVec 32)) BitStream!10920)

(assert (=> b!251452 (= lt!390783 (readBitPure!0 (readerFrom!0 (_2!11710 lt!390786) (currentBit!11951 thiss!1005) (currentByte!11956 thiss!1005))))))

(declare-fun b!251453 () Bool)

(declare-fun lt!390784 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251453 (= e!174224 (= (bitIndex!0 (size!5999 (buf!6501 (_1!11711 lt!390783))) (currentByte!11956 (_1!11711 lt!390783)) (currentBit!11951 (_1!11711 lt!390783))) lt!390784))))

(declare-fun b!251454 () Bool)

(declare-fun e!174223 () Bool)

(declare-fun e!174226 () Bool)

(assert (=> b!251454 (= e!174223 e!174226)))

(declare-fun res!210588 () Bool)

(assert (=> b!251454 (=> (not res!210588) (not e!174226))))

(declare-fun lt!390798 () (_ BitVec 64))

(declare-fun lt!390787 () tuple2!21564)

(assert (=> b!251454 (= res!210588 (= (bitIndex!0 (size!5999 (buf!6501 (_2!11710 lt!390787))) (currentByte!11956 (_2!11710 lt!390787)) (currentBit!11951 (_2!11710 lt!390787))) (bvadd (bitIndex!0 (size!5999 (buf!6501 (_2!11710 lt!390786))) (currentByte!11956 (_2!11710 lt!390786)) (currentBit!11951 (_2!11710 lt!390786))) lt!390798)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!251454 (= lt!390798 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251455 () Bool)

(declare-fun e!174227 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251455 (= e!174227 (invariant!0 (currentBit!11951 thiss!1005) (currentByte!11956 thiss!1005) (size!5999 (buf!6501 (_2!11710 lt!390787)))))))

(declare-fun res!210576 () Bool)

(declare-fun e!174222 () Bool)

(assert (=> start!54056 (=> (not res!210576) (not e!174222))))

(assert (=> start!54056 (= res!210576 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54056 e!174222))

(assert (=> start!54056 true))

(declare-fun e!174221 () Bool)

(declare-fun inv!12 (BitStream!10920) Bool)

(assert (=> start!54056 (and (inv!12 thiss!1005) e!174221)))

(declare-fun b!251456 () Bool)

(declare-fun e!174230 () Bool)

(assert (=> b!251456 (= e!174230 e!174225)))

(declare-fun res!210577 () Bool)

(assert (=> b!251456 (=> (not res!210577) (not e!174225))))

(declare-fun lt!390794 () (_ BitVec 64))

(assert (=> b!251456 (= res!210577 (= lt!390784 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!390794)))))

(assert (=> b!251456 (= lt!390784 (bitIndex!0 (size!5999 (buf!6501 (_2!11710 lt!390786))) (currentByte!11956 (_2!11710 lt!390786)) (currentBit!11951 (_2!11710 lt!390786))))))

(assert (=> b!251456 (= lt!390794 (bitIndex!0 (size!5999 (buf!6501 thiss!1005)) (currentByte!11956 thiss!1005) (currentBit!11951 thiss!1005)))))

(declare-fun b!251457 () Bool)

(declare-fun lt!390782 () tuple2!21566)

(declare-datatypes ((tuple2!21568 0))(
  ( (tuple2!21569 (_1!11712 BitStream!10920) (_2!11712 BitStream!10920)) )
))
(declare-fun lt!390791 () tuple2!21568)

(assert (=> b!251457 (= e!174226 (not (or (not (_2!11711 lt!390782)) (not (= (_1!11711 lt!390782) (_2!11712 lt!390791))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10920 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21566)

(assert (=> b!251457 (= lt!390782 (checkBitsLoopPure!0 (_1!11712 lt!390791) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251457 (validate_offset_bits!1 ((_ sign_extend 32) (size!5999 (buf!6501 (_2!11710 lt!390787)))) ((_ sign_extend 32) (currentByte!11956 (_2!11710 lt!390786))) ((_ sign_extend 32) (currentBit!11951 (_2!11710 lt!390786))) lt!390798)))

(declare-fun lt!390796 () Unit!18146)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10920 array!13680 (_ BitVec 64)) Unit!18146)

(assert (=> b!251457 (= lt!390796 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11710 lt!390786) (buf!6501 (_2!11710 lt!390787)) lt!390798))))

(declare-fun reader!0 (BitStream!10920 BitStream!10920) tuple2!21568)

(assert (=> b!251457 (= lt!390791 (reader!0 (_2!11710 lt!390786) (_2!11710 lt!390787)))))

(declare-fun b!251458 () Bool)

(declare-fun res!210580 () Bool)

(assert (=> b!251458 (=> (not res!210580) (not e!174227))))

(assert (=> b!251458 (= res!210580 (invariant!0 (currentBit!11951 thiss!1005) (currentByte!11956 thiss!1005) (size!5999 (buf!6501 (_2!11710 lt!390786)))))))

(declare-fun b!251459 () Bool)

(declare-fun e!174229 () Bool)

(declare-fun lt!390788 () tuple2!21566)

(declare-fun lt!390785 () tuple2!21566)

(assert (=> b!251459 (= e!174229 (= (_2!11711 lt!390788) (_2!11711 lt!390785)))))

(declare-fun b!251460 () Bool)

(declare-fun array_inv!5740 (array!13680) Bool)

(assert (=> b!251460 (= e!174221 (array_inv!5740 (buf!6501 thiss!1005)))))

(declare-fun b!251461 () Bool)

(declare-fun res!210584 () Bool)

(assert (=> b!251461 (=> (not res!210584) (not e!174222))))

(assert (=> b!251461 (= res!210584 (validate_offset_bits!1 ((_ sign_extend 32) (size!5999 (buf!6501 thiss!1005))) ((_ sign_extend 32) (currentByte!11956 thiss!1005)) ((_ sign_extend 32) (currentBit!11951 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251462 () Bool)

(assert (=> b!251462 (= e!174222 (not (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!390795 () tuple2!21568)

(assert (=> b!251462 (= (_2!11711 (readBitPure!0 (_1!11712 lt!390795))) bit!26)))

(declare-fun lt!390792 () tuple2!21568)

(assert (=> b!251462 (= lt!390792 (reader!0 (_2!11710 lt!390786) (_2!11710 lt!390787)))))

(assert (=> b!251462 (= lt!390795 (reader!0 thiss!1005 (_2!11710 lt!390787)))))

(assert (=> b!251462 e!174229))

(declare-fun res!210579 () Bool)

(assert (=> b!251462 (=> (not res!210579) (not e!174229))))

(assert (=> b!251462 (= res!210579 (= (bitIndex!0 (size!5999 (buf!6501 (_1!11711 lt!390788))) (currentByte!11956 (_1!11711 lt!390788)) (currentBit!11951 (_1!11711 lt!390788))) (bitIndex!0 (size!5999 (buf!6501 (_1!11711 lt!390785))) (currentByte!11956 (_1!11711 lt!390785)) (currentBit!11951 (_1!11711 lt!390785)))))))

(declare-fun lt!390797 () Unit!18146)

(declare-fun lt!390793 () BitStream!10920)

(declare-fun readBitPrefixLemma!0 (BitStream!10920 BitStream!10920) Unit!18146)

(assert (=> b!251462 (= lt!390797 (readBitPrefixLemma!0 lt!390793 (_2!11710 lt!390787)))))

(assert (=> b!251462 (= lt!390785 (readBitPure!0 (BitStream!10921 (buf!6501 (_2!11710 lt!390787)) (currentByte!11956 thiss!1005) (currentBit!11951 thiss!1005))))))

(assert (=> b!251462 (= lt!390788 (readBitPure!0 lt!390793))))

(assert (=> b!251462 (= lt!390793 (BitStream!10921 (buf!6501 (_2!11710 lt!390786)) (currentByte!11956 thiss!1005) (currentBit!11951 thiss!1005)))))

(assert (=> b!251462 e!174227))

(declare-fun res!210587 () Bool)

(assert (=> b!251462 (=> (not res!210587) (not e!174227))))

(declare-fun isPrefixOf!0 (BitStream!10920 BitStream!10920) Bool)

(assert (=> b!251462 (= res!210587 (isPrefixOf!0 thiss!1005 (_2!11710 lt!390787)))))

(declare-fun lt!390790 () Unit!18146)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10920 BitStream!10920 BitStream!10920) Unit!18146)

(assert (=> b!251462 (= lt!390790 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11710 lt!390786) (_2!11710 lt!390787)))))

(assert (=> b!251462 e!174223))

(declare-fun res!210585 () Bool)

(assert (=> b!251462 (=> (not res!210585) (not e!174223))))

(assert (=> b!251462 (= res!210585 (= (size!5999 (buf!6501 (_2!11710 lt!390786))) (size!5999 (buf!6501 (_2!11710 lt!390787)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10920 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21564)

(assert (=> b!251462 (= lt!390787 (appendNBitsLoop!0 (_2!11710 lt!390786) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251462 (validate_offset_bits!1 ((_ sign_extend 32) (size!5999 (buf!6501 (_2!11710 lt!390786)))) ((_ sign_extend 32) (currentByte!11956 (_2!11710 lt!390786))) ((_ sign_extend 32) (currentBit!11951 (_2!11710 lt!390786))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!390789 () Unit!18146)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10920 BitStream!10920 (_ BitVec 64) (_ BitVec 64)) Unit!18146)

(assert (=> b!251462 (= lt!390789 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11710 lt!390786) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251462 e!174230))

(declare-fun res!210586 () Bool)

(assert (=> b!251462 (=> (not res!210586) (not e!174230))))

(assert (=> b!251462 (= res!210586 (= (size!5999 (buf!6501 thiss!1005)) (size!5999 (buf!6501 (_2!11710 lt!390786)))))))

(declare-fun appendBit!0 (BitStream!10920 Bool) tuple2!21564)

(assert (=> b!251462 (= lt!390786 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251463 () Bool)

(declare-fun res!210578 () Bool)

(assert (=> b!251463 (=> (not res!210578) (not e!174226))))

(assert (=> b!251463 (= res!210578 (isPrefixOf!0 (_2!11710 lt!390786) (_2!11710 lt!390787)))))

(declare-fun b!251464 () Bool)

(declare-fun res!210581 () Bool)

(assert (=> b!251464 (=> (not res!210581) (not e!174225))))

(assert (=> b!251464 (= res!210581 (isPrefixOf!0 thiss!1005 (_2!11710 lt!390786)))))

(declare-fun b!251465 () Bool)

(declare-fun res!210583 () Bool)

(assert (=> b!251465 (=> (not res!210583) (not e!174222))))

(assert (=> b!251465 (= res!210583 (bvslt from!289 nBits!297))))

(assert (= (and start!54056 res!210576) b!251461))

(assert (= (and b!251461 res!210584) b!251465))

(assert (= (and b!251465 res!210583) b!251462))

(assert (= (and b!251462 res!210586) b!251456))

(assert (= (and b!251456 res!210577) b!251464))

(assert (= (and b!251464 res!210581) b!251452))

(assert (= (and b!251452 res!210582) b!251453))

(assert (= (and b!251462 res!210585) b!251454))

(assert (= (and b!251454 res!210588) b!251463))

(assert (= (and b!251463 res!210578) b!251457))

(assert (= (and b!251462 res!210587) b!251458))

(assert (= (and b!251458 res!210580) b!251455))

(assert (= (and b!251462 res!210579) b!251459))

(assert (= start!54056 b!251460))

(declare-fun m!378327 () Bool)

(assert (=> b!251458 m!378327))

(declare-fun m!378329 () Bool)

(assert (=> start!54056 m!378329))

(declare-fun m!378331 () Bool)

(assert (=> b!251457 m!378331))

(declare-fun m!378333 () Bool)

(assert (=> b!251457 m!378333))

(declare-fun m!378335 () Bool)

(assert (=> b!251457 m!378335))

(declare-fun m!378337 () Bool)

(assert (=> b!251457 m!378337))

(declare-fun m!378339 () Bool)

(assert (=> b!251461 m!378339))

(declare-fun m!378341 () Bool)

(assert (=> b!251455 m!378341))

(declare-fun m!378343 () Bool)

(assert (=> b!251460 m!378343))

(declare-fun m!378345 () Bool)

(assert (=> b!251464 m!378345))

(declare-fun m!378347 () Bool)

(assert (=> b!251453 m!378347))

(declare-fun m!378349 () Bool)

(assert (=> b!251463 m!378349))

(declare-fun m!378351 () Bool)

(assert (=> b!251456 m!378351))

(declare-fun m!378353 () Bool)

(assert (=> b!251456 m!378353))

(declare-fun m!378355 () Bool)

(assert (=> b!251462 m!378355))

(declare-fun m!378357 () Bool)

(assert (=> b!251462 m!378357))

(declare-fun m!378359 () Bool)

(assert (=> b!251462 m!378359))

(declare-fun m!378361 () Bool)

(assert (=> b!251462 m!378361))

(declare-fun m!378363 () Bool)

(assert (=> b!251462 m!378363))

(declare-fun m!378365 () Bool)

(assert (=> b!251462 m!378365))

(declare-fun m!378367 () Bool)

(assert (=> b!251462 m!378367))

(declare-fun m!378369 () Bool)

(assert (=> b!251462 m!378369))

(declare-fun m!378371 () Bool)

(assert (=> b!251462 m!378371))

(declare-fun m!378373 () Bool)

(assert (=> b!251462 m!378373))

(declare-fun m!378375 () Bool)

(assert (=> b!251462 m!378375))

(declare-fun m!378377 () Bool)

(assert (=> b!251462 m!378377))

(assert (=> b!251462 m!378337))

(declare-fun m!378379 () Bool)

(assert (=> b!251462 m!378379))

(declare-fun m!378381 () Bool)

(assert (=> b!251454 m!378381))

(assert (=> b!251454 m!378351))

(declare-fun m!378383 () Bool)

(assert (=> b!251452 m!378383))

(assert (=> b!251452 m!378383))

(declare-fun m!378385 () Bool)

(assert (=> b!251452 m!378385))

(check-sat (not b!251462) (not b!251460) (not b!251455) (not b!251452) (not b!251458) (not b!251463) (not b!251456) (not b!251464) (not b!251453) (not b!251454) (not b!251457) (not start!54056) (not b!251461))
(check-sat)
