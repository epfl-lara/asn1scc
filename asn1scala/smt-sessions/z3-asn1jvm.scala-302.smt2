; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5986 () Bool)

(assert start!5986)

(declare-datatypes ((array!1723 0))(
  ( (array!1724 (arr!1206 (Array (_ BitVec 32) (_ BitVec 8))) (size!744 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1723)

(declare-fun b!27468 () Bool)

(declare-datatypes ((BitStream!1320 0))(
  ( (BitStream!1321 (buf!1071 array!1723) (currentByte!2396 (_ BitVec 32)) (currentBit!2391 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!3006 0))(
  ( (tuple2!3007 (_1!1590 BitStream!1320) (_2!1590 BitStream!1320)) )
))
(declare-fun lt!39021 () tuple2!3006)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((Unit!2191 0))(
  ( (Unit!2192) )
))
(declare-datatypes ((tuple2!3008 0))(
  ( (tuple2!3009 (_1!1591 Unit!2191) (_2!1591 BitStream!1320)) )
))
(declare-fun lt!39016 () tuple2!3008)

(declare-fun e!18564 () Bool)

(declare-datatypes ((List!361 0))(
  ( (Nil!358) (Cons!357 (h!476 Bool) (t!1111 List!361)) )
))
(declare-fun head!198 (List!361) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1320 array!1723 (_ BitVec 64) (_ BitVec 64)) List!361)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1320 BitStream!1320 (_ BitVec 64)) List!361)

(assert (=> b!27468 (= e!18564 (= (head!198 (byteArrayBitContentToList!0 (_2!1591 lt!39016) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!198 (bitStreamReadBitsIntoList!0 (_2!1591 lt!39016) (_1!1590 lt!39021) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun e!18568 () Bool)

(declare-fun b!27469 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!39017 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!27469 (= e!18568 (= lt!39017 (bvsub (bvsub (bvadd (bitIndex!0 (size!744 (buf!1071 (_2!1591 lt!39016))) (currentByte!2396 (_2!1591 lt!39016)) (currentBit!2391 (_2!1591 lt!39016))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!27470 () Bool)

(declare-fun e!18563 () Bool)

(declare-fun e!18559 () Bool)

(assert (=> b!27470 (= e!18563 e!18559)))

(declare-fun res!23779 () Bool)

(assert (=> b!27470 (=> res!23779 e!18559)))

(declare-fun lt!39026 () tuple2!3008)

(assert (=> b!27470 (= res!23779 (not (= (size!744 (buf!1071 (_2!1591 lt!39016))) (size!744 (buf!1071 (_2!1591 lt!39026))))))))

(assert (=> b!27470 e!18568))

(declare-fun res!23777 () Bool)

(assert (=> b!27470 (=> (not res!23777) (not e!18568))))

(declare-fun thiss!1379 () BitStream!1320)

(assert (=> b!27470 (= res!23777 (= (size!744 (buf!1071 (_2!1591 lt!39026))) (size!744 (buf!1071 thiss!1379))))))

(declare-fun b!27471 () Bool)

(declare-fun res!23781 () Bool)

(assert (=> b!27471 (=> res!23781 e!18559)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!27471 (= res!23781 (not (invariant!0 (currentBit!2391 (_2!1591 lt!39016)) (currentByte!2396 (_2!1591 lt!39016)) (size!744 (buf!1071 (_2!1591 lt!39016))))))))

(declare-fun b!27472 () Bool)

(declare-fun res!23767 () Bool)

(declare-fun e!18561 () Bool)

(assert (=> b!27472 (=> res!23767 e!18561)))

(declare-fun lt!39019 () tuple2!3006)

(declare-fun lt!39012 () tuple2!3006)

(declare-fun isPrefixOf!0 (BitStream!1320 BitStream!1320) Bool)

(assert (=> b!27472 (= res!23767 (not (isPrefixOf!0 (_1!1590 lt!39019) (_1!1590 lt!39012))))))

(declare-fun b!27473 () Bool)

(declare-fun e!18558 () Bool)

(assert (=> b!27473 (= e!18558 e!18563)))

(declare-fun res!23765 () Bool)

(assert (=> b!27473 (=> res!23765 e!18563)))

(declare-fun lt!39022 () (_ BitVec 64))

(assert (=> b!27473 (= res!23765 (not (= lt!39017 (bvsub (bvadd lt!39022 to!314) i!635))))))

(assert (=> b!27473 (= lt!39017 (bitIndex!0 (size!744 (buf!1071 (_2!1591 lt!39026))) (currentByte!2396 (_2!1591 lt!39026)) (currentBit!2391 (_2!1591 lt!39026))))))

(declare-fun b!27475 () Bool)

(assert (=> b!27475 (= e!18559 e!18561)))

(declare-fun res!23773 () Bool)

(assert (=> b!27475 (=> res!23773 e!18561)))

(assert (=> b!27475 (= res!23773 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!39024 () List!361)

(declare-fun lt!39028 () (_ BitVec 64))

(assert (=> b!27475 (= lt!39024 (bitStreamReadBitsIntoList!0 (_2!1591 lt!39026) (_1!1590 lt!39012) lt!39028))))

(declare-fun lt!39025 () List!361)

(assert (=> b!27475 (= lt!39025 (bitStreamReadBitsIntoList!0 (_2!1591 lt!39026) (_1!1590 lt!39019) (bvsub to!314 i!635)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!27475 (validate_offset_bits!1 ((_ sign_extend 32) (size!744 (buf!1071 (_2!1591 lt!39026)))) ((_ sign_extend 32) (currentByte!2396 (_2!1591 lt!39016))) ((_ sign_extend 32) (currentBit!2391 (_2!1591 lt!39016))) lt!39028)))

(declare-fun lt!39020 () Unit!2191)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1320 array!1723 (_ BitVec 64)) Unit!2191)

(assert (=> b!27475 (= lt!39020 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1591 lt!39016) (buf!1071 (_2!1591 lt!39026)) lt!39028))))

(declare-fun reader!0 (BitStream!1320 BitStream!1320) tuple2!3006)

(assert (=> b!27475 (= lt!39012 (reader!0 (_2!1591 lt!39016) (_2!1591 lt!39026)))))

(assert (=> b!27475 (validate_offset_bits!1 ((_ sign_extend 32) (size!744 (buf!1071 (_2!1591 lt!39026)))) ((_ sign_extend 32) (currentByte!2396 thiss!1379)) ((_ sign_extend 32) (currentBit!2391 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!39015 () Unit!2191)

(assert (=> b!27475 (= lt!39015 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1071 (_2!1591 lt!39026)) (bvsub to!314 i!635)))))

(assert (=> b!27475 (= lt!39019 (reader!0 thiss!1379 (_2!1591 lt!39026)))))

(declare-fun b!27476 () Bool)

(declare-fun e!18565 () Bool)

(assert (=> b!27476 (= e!18565 e!18558)))

(declare-fun res!23776 () Bool)

(assert (=> b!27476 (=> res!23776 e!18558)))

(assert (=> b!27476 (= res!23776 (not (isPrefixOf!0 (_2!1591 lt!39016) (_2!1591 lt!39026))))))

(assert (=> b!27476 (isPrefixOf!0 thiss!1379 (_2!1591 lt!39026))))

(declare-fun lt!39027 () Unit!2191)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1320 BitStream!1320 BitStream!1320) Unit!2191)

(assert (=> b!27476 (= lt!39027 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1591 lt!39016) (_2!1591 lt!39026)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1320 array!1723 (_ BitVec 64) (_ BitVec 64)) tuple2!3008)

(assert (=> b!27476 (= lt!39026 (appendBitsMSBFirstLoop!0 (_2!1591 lt!39016) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!27476 e!18564))

(declare-fun res!23775 () Bool)

(assert (=> b!27476 (=> (not res!23775) (not e!18564))))

(assert (=> b!27476 (= res!23775 (validate_offset_bits!1 ((_ sign_extend 32) (size!744 (buf!1071 (_2!1591 lt!39016)))) ((_ sign_extend 32) (currentByte!2396 thiss!1379)) ((_ sign_extend 32) (currentBit!2391 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39023 () Unit!2191)

(assert (=> b!27476 (= lt!39023 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1071 (_2!1591 lt!39016)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!27476 (= lt!39021 (reader!0 thiss!1379 (_2!1591 lt!39016)))))

(declare-fun b!27477 () Bool)

(declare-fun res!23766 () Bool)

(assert (=> b!27477 (=> res!23766 e!18561)))

(declare-fun length!87 (List!361) Int)

(assert (=> b!27477 (= res!23766 (<= (length!87 lt!39025) 0))))

(declare-fun b!27478 () Bool)

(declare-fun e!18560 () Bool)

(declare-fun array_inv!713 (array!1723) Bool)

(assert (=> b!27478 (= e!18560 (array_inv!713 (buf!1071 thiss!1379)))))

(declare-fun b!27479 () Bool)

(declare-fun res!23774 () Bool)

(assert (=> b!27479 (=> res!23774 e!18563)))

(assert (=> b!27479 (= res!23774 (not (= (size!744 (buf!1071 thiss!1379)) (size!744 (buf!1071 (_2!1591 lt!39026))))))))

(declare-fun b!27480 () Bool)

(declare-fun res!23764 () Bool)

(assert (=> b!27480 (=> res!23764 e!18561)))

(assert (=> b!27480 (= res!23764 (not (isPrefixOf!0 (_1!1590 lt!39019) (_2!1591 lt!39026))))))

(declare-fun b!27481 () Bool)

(declare-fun e!18557 () Bool)

(declare-fun e!18566 () Bool)

(assert (=> b!27481 (= e!18557 (not e!18566))))

(declare-fun res!23763 () Bool)

(assert (=> b!27481 (=> res!23763 e!18566)))

(assert (=> b!27481 (= res!23763 (bvsge i!635 to!314))))

(assert (=> b!27481 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!39013 () Unit!2191)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1320) Unit!2191)

(assert (=> b!27481 (= lt!39013 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!27481 (= lt!39022 (bitIndex!0 (size!744 (buf!1071 thiss!1379)) (currentByte!2396 thiss!1379) (currentBit!2391 thiss!1379)))))

(declare-fun b!27482 () Bool)

(declare-fun res!23769 () Bool)

(assert (=> b!27482 (=> res!23769 e!18561)))

(assert (=> b!27482 (= res!23769 (or (not (= (buf!1071 (_1!1590 lt!39019)) (buf!1071 (_1!1590 lt!39012)))) (not (= (buf!1071 (_1!1590 lt!39019)) (buf!1071 (_2!1591 lt!39026)))) (bvsge lt!39017 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 (bvsub to!314 i!635)))))))

(declare-fun b!27483 () Bool)

(declare-fun res!23768 () Bool)

(assert (=> b!27483 (=> res!23768 e!18563)))

(assert (=> b!27483 (= res!23768 (not (invariant!0 (currentBit!2391 (_2!1591 lt!39026)) (currentByte!2396 (_2!1591 lt!39026)) (size!744 (buf!1071 (_2!1591 lt!39026))))))))

(declare-fun b!27484 () Bool)

(declare-fun res!23770 () Bool)

(assert (=> b!27484 (=> res!23770 e!18561)))

(assert (=> b!27484 (= res!23770 (not (isPrefixOf!0 (_1!1590 lt!39012) (_2!1591 lt!39026))))))

(declare-fun b!27485 () Bool)

(assert (=> b!27485 (= e!18561 true)))

(declare-fun lt!39014 () (_ BitVec 64))

(assert (=> b!27485 (= lt!39014 (bitIndex!0 (size!744 (buf!1071 (_1!1590 lt!39012))) (currentByte!2396 (_1!1590 lt!39012)) (currentBit!2391 (_1!1590 lt!39012))))))

(declare-fun lt!39018 () (_ BitVec 64))

(assert (=> b!27485 (= lt!39018 (bitIndex!0 (size!744 (buf!1071 (_1!1590 lt!39019))) (currentByte!2396 (_1!1590 lt!39019)) (currentBit!2391 (_1!1590 lt!39019))))))

(declare-fun b!27486 () Bool)

(declare-fun res!23778 () Bool)

(assert (=> b!27486 (=> (not res!23778) (not e!18557))))

(assert (=> b!27486 (= res!23778 (validate_offset_bits!1 ((_ sign_extend 32) (size!744 (buf!1071 thiss!1379))) ((_ sign_extend 32) (currentByte!2396 thiss!1379)) ((_ sign_extend 32) (currentBit!2391 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!27487 () Bool)

(declare-fun res!23780 () Bool)

(assert (=> b!27487 (=> res!23780 e!18559)))

(assert (=> b!27487 (= res!23780 (not (invariant!0 (currentBit!2391 (_2!1591 lt!39016)) (currentByte!2396 (_2!1591 lt!39016)) (size!744 (buf!1071 (_2!1591 lt!39026))))))))

(declare-fun b!27474 () Bool)

(assert (=> b!27474 (= e!18566 e!18565)))

(declare-fun res!23771 () Bool)

(assert (=> b!27474 (=> res!23771 e!18565)))

(assert (=> b!27474 (= res!23771 (not (isPrefixOf!0 thiss!1379 (_2!1591 lt!39016))))))

(assert (=> b!27474 (validate_offset_bits!1 ((_ sign_extend 32) (size!744 (buf!1071 (_2!1591 lt!39016)))) ((_ sign_extend 32) (currentByte!2396 (_2!1591 lt!39016))) ((_ sign_extend 32) (currentBit!2391 (_2!1591 lt!39016))) lt!39028)))

(assert (=> b!27474 (= lt!39028 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!39011 () Unit!2191)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1320 BitStream!1320 (_ BitVec 64) (_ BitVec 64)) Unit!2191)

(assert (=> b!27474 (= lt!39011 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1591 lt!39016) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1320 (_ BitVec 8) (_ BitVec 32)) tuple2!3008)

(assert (=> b!27474 (= lt!39016 (appendBitFromByte!0 thiss!1379 (select (arr!1206 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!23772 () Bool)

(assert (=> start!5986 (=> (not res!23772) (not e!18557))))

(assert (=> start!5986 (= res!23772 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!744 srcBuffer!2))))))))

(assert (=> start!5986 e!18557))

(assert (=> start!5986 true))

(assert (=> start!5986 (array_inv!713 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1320) Bool)

(assert (=> start!5986 (and (inv!12 thiss!1379) e!18560)))

(assert (= (and start!5986 res!23772) b!27486))

(assert (= (and b!27486 res!23778) b!27481))

(assert (= (and b!27481 (not res!23763)) b!27474))

(assert (= (and b!27474 (not res!23771)) b!27476))

(assert (= (and b!27476 res!23775) b!27468))

(assert (= (and b!27476 (not res!23776)) b!27473))

(assert (= (and b!27473 (not res!23765)) b!27483))

(assert (= (and b!27483 (not res!23768)) b!27479))

(assert (= (and b!27479 (not res!23774)) b!27470))

(assert (= (and b!27470 res!23777) b!27469))

(assert (= (and b!27470 (not res!23779)) b!27471))

(assert (= (and b!27471 (not res!23781)) b!27487))

(assert (= (and b!27487 (not res!23780)) b!27475))

(assert (= (and b!27475 (not res!23773)) b!27477))

(assert (= (and b!27477 (not res!23766)) b!27480))

(assert (= (and b!27480 (not res!23764)) b!27484))

(assert (= (and b!27484 (not res!23770)) b!27472))

(assert (= (and b!27472 (not res!23767)) b!27482))

(assert (= (and b!27482 (not res!23769)) b!27485))

(assert (= start!5986 b!27478))

(declare-fun m!39357 () Bool)

(assert (=> b!27485 m!39357))

(declare-fun m!39359 () Bool)

(assert (=> b!27485 m!39359))

(declare-fun m!39361 () Bool)

(assert (=> b!27481 m!39361))

(declare-fun m!39363 () Bool)

(assert (=> b!27481 m!39363))

(declare-fun m!39365 () Bool)

(assert (=> b!27481 m!39365))

(declare-fun m!39367 () Bool)

(assert (=> b!27468 m!39367))

(assert (=> b!27468 m!39367))

(declare-fun m!39369 () Bool)

(assert (=> b!27468 m!39369))

(declare-fun m!39371 () Bool)

(assert (=> b!27468 m!39371))

(assert (=> b!27468 m!39371))

(declare-fun m!39373 () Bool)

(assert (=> b!27468 m!39373))

(declare-fun m!39375 () Bool)

(assert (=> start!5986 m!39375))

(declare-fun m!39377 () Bool)

(assert (=> start!5986 m!39377))

(declare-fun m!39379 () Bool)

(assert (=> b!27476 m!39379))

(declare-fun m!39381 () Bool)

(assert (=> b!27476 m!39381))

(declare-fun m!39383 () Bool)

(assert (=> b!27476 m!39383))

(declare-fun m!39385 () Bool)

(assert (=> b!27476 m!39385))

(declare-fun m!39387 () Bool)

(assert (=> b!27476 m!39387))

(declare-fun m!39389 () Bool)

(assert (=> b!27476 m!39389))

(declare-fun m!39391 () Bool)

(assert (=> b!27476 m!39391))

(declare-fun m!39393 () Bool)

(assert (=> b!27475 m!39393))

(declare-fun m!39395 () Bool)

(assert (=> b!27475 m!39395))

(declare-fun m!39397 () Bool)

(assert (=> b!27475 m!39397))

(declare-fun m!39399 () Bool)

(assert (=> b!27475 m!39399))

(declare-fun m!39401 () Bool)

(assert (=> b!27475 m!39401))

(declare-fun m!39403 () Bool)

(assert (=> b!27475 m!39403))

(declare-fun m!39405 () Bool)

(assert (=> b!27475 m!39405))

(declare-fun m!39407 () Bool)

(assert (=> b!27475 m!39407))

(declare-fun m!39409 () Bool)

(assert (=> b!27484 m!39409))

(declare-fun m!39411 () Bool)

(assert (=> b!27474 m!39411))

(declare-fun m!39413 () Bool)

(assert (=> b!27474 m!39413))

(assert (=> b!27474 m!39413))

(declare-fun m!39415 () Bool)

(assert (=> b!27474 m!39415))

(declare-fun m!39417 () Bool)

(assert (=> b!27474 m!39417))

(declare-fun m!39419 () Bool)

(assert (=> b!27474 m!39419))

(declare-fun m!39421 () Bool)

(assert (=> b!27483 m!39421))

(declare-fun m!39423 () Bool)

(assert (=> b!27487 m!39423))

(declare-fun m!39425 () Bool)

(assert (=> b!27486 m!39425))

(declare-fun m!39427 () Bool)

(assert (=> b!27480 m!39427))

(declare-fun m!39429 () Bool)

(assert (=> b!27477 m!39429))

(declare-fun m!39431 () Bool)

(assert (=> b!27472 m!39431))

(declare-fun m!39433 () Bool)

(assert (=> b!27473 m!39433))

(declare-fun m!39435 () Bool)

(assert (=> b!27471 m!39435))

(declare-fun m!39437 () Bool)

(assert (=> b!27469 m!39437))

(declare-fun m!39439 () Bool)

(assert (=> b!27478 m!39439))

(check-sat (not start!5986) (not b!27485) (not b!27475) (not b!27480) (not b!27472) (not b!27484) (not b!27481) (not b!27478) (not b!27486) (not b!27487) (not b!27476) (not b!27477) (not b!27483) (not b!27474) (not b!27468) (not b!27471) (not b!27469) (not b!27473))
