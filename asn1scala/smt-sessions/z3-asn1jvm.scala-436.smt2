; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11810 () Bool)

(assert start!11810)

(declare-fun b!58614 () Bool)

(declare-fun e!38904 () Bool)

(declare-fun e!38897 () Bool)

(assert (=> b!58614 (= e!38904 e!38897)))

(declare-fun res!48700 () Bool)

(assert (=> b!58614 (=> res!48700 e!38897)))

(declare-datatypes ((array!2667 0))(
  ( (array!2668 (arr!1773 (Array (_ BitVec 32) (_ BitVec 8))) (size!1209 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2106 0))(
  ( (BitStream!2107 (buf!1590 array!2667) (currentByte!3208 (_ BitVec 32)) (currentBit!3203 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4041 0))(
  ( (Unit!4042) )
))
(declare-datatypes ((tuple2!5334 0))(
  ( (tuple2!5335 (_1!2778 Unit!4041) (_2!2778 BitStream!2106)) )
))
(declare-fun lt!92479 () tuple2!5334)

(declare-fun lt!92476 () tuple2!5334)

(assert (=> b!58614 (= res!48700 (not (= (size!1209 (buf!1590 (_2!2778 lt!92479))) (size!1209 (buf!1590 (_2!2778 lt!92476))))))))

(declare-fun e!38898 () Bool)

(assert (=> b!58614 e!38898))

(declare-fun res!48707 () Bool)

(assert (=> b!58614 (=> (not res!48707) (not e!38898))))

(declare-fun thiss!1379 () BitStream!2106)

(assert (=> b!58614 (= res!48707 (= (size!1209 (buf!1590 (_2!2778 lt!92476))) (size!1209 (buf!1590 thiss!1379))))))

(declare-fun b!58615 () Bool)

(declare-fun e!38900 () Bool)

(declare-fun e!38899 () Bool)

(assert (=> b!58615 (= e!38900 e!38899)))

(declare-fun res!48711 () Bool)

(assert (=> b!58615 (=> res!48711 e!38899)))

(declare-fun isPrefixOf!0 (BitStream!2106 BitStream!2106) Bool)

(assert (=> b!58615 (= res!48711 (not (isPrefixOf!0 (_2!2778 lt!92479) (_2!2778 lt!92476))))))

(assert (=> b!58615 (isPrefixOf!0 thiss!1379 (_2!2778 lt!92476))))

(declare-fun lt!92471 () Unit!4041)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2106 BitStream!2106 BitStream!2106) Unit!4041)

(assert (=> b!58615 (= lt!92471 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2778 lt!92479) (_2!2778 lt!92476)))))

(declare-fun srcBuffer!2 () array!2667)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2106 array!2667 (_ BitVec 64) (_ BitVec 64)) tuple2!5334)

(assert (=> b!58615 (= lt!92476 (appendBitsMSBFirstLoop!0 (_2!2778 lt!92479) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!38896 () Bool)

(assert (=> b!58615 e!38896))

(declare-fun res!48703 () Bool)

(assert (=> b!58615 (=> (not res!48703) (not e!38896))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58615 (= res!48703 (validate_offset_bits!1 ((_ sign_extend 32) (size!1209 (buf!1590 (_2!2778 lt!92479)))) ((_ sign_extend 32) (currentByte!3208 thiss!1379)) ((_ sign_extend 32) (currentBit!3203 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92477 () Unit!4041)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2106 array!2667 (_ BitVec 64)) Unit!4041)

(assert (=> b!58615 (= lt!92477 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1590 (_2!2778 lt!92479)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5336 0))(
  ( (tuple2!5337 (_1!2779 BitStream!2106) (_2!2779 BitStream!2106)) )
))
(declare-fun lt!92480 () tuple2!5336)

(declare-fun reader!0 (BitStream!2106 BitStream!2106) tuple2!5336)

(assert (=> b!58615 (= lt!92480 (reader!0 thiss!1379 (_2!2778 lt!92479)))))

(declare-fun b!58616 () Bool)

(assert (=> b!58616 (= e!38899 e!38904)))

(declare-fun res!48706 () Bool)

(assert (=> b!58616 (=> res!48706 e!38904)))

(declare-fun lt!92478 () (_ BitVec 64))

(declare-fun lt!92482 () (_ BitVec 64))

(assert (=> b!58616 (= res!48706 (not (= lt!92482 (bvsub (bvadd lt!92478 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58616 (= lt!92482 (bitIndex!0 (size!1209 (buf!1590 (_2!2778 lt!92476))) (currentByte!3208 (_2!2778 lt!92476)) (currentBit!3203 (_2!2778 lt!92476))))))

(declare-fun b!58617 () Bool)

(declare-fun res!48704 () Bool)

(declare-fun e!38902 () Bool)

(assert (=> b!58617 (=> (not res!48704) (not e!38902))))

(assert (=> b!58617 (= res!48704 (validate_offset_bits!1 ((_ sign_extend 32) (size!1209 (buf!1590 thiss!1379))) ((_ sign_extend 32) (currentByte!3208 thiss!1379)) ((_ sign_extend 32) (currentBit!3203 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58618 () Bool)

(declare-fun e!38905 () Bool)

(assert (=> b!58618 (= e!38905 e!38900)))

(declare-fun res!48710 () Bool)

(assert (=> b!58618 (=> res!48710 e!38900)))

(assert (=> b!58618 (= res!48710 (not (isPrefixOf!0 thiss!1379 (_2!2778 lt!92479))))))

(assert (=> b!58618 (validate_offset_bits!1 ((_ sign_extend 32) (size!1209 (buf!1590 (_2!2778 lt!92479)))) ((_ sign_extend 32) (currentByte!3208 (_2!2778 lt!92479))) ((_ sign_extend 32) (currentBit!3203 (_2!2778 lt!92479))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92475 () Unit!4041)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2106 BitStream!2106 (_ BitVec 64) (_ BitVec 64)) Unit!4041)

(assert (=> b!58618 (= lt!92475 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2778 lt!92479) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2106 (_ BitVec 8) (_ BitVec 32)) tuple2!5334)

(assert (=> b!58618 (= lt!92479 (appendBitFromByte!0 thiss!1379 (select (arr!1773 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!48708 () Bool)

(assert (=> start!11810 (=> (not res!48708) (not e!38902))))

(assert (=> start!11810 (= res!48708 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1209 srcBuffer!2))))))))

(assert (=> start!11810 e!38902))

(assert (=> start!11810 true))

(declare-fun array_inv!1112 (array!2667) Bool)

(assert (=> start!11810 (array_inv!1112 srcBuffer!2)))

(declare-fun e!38906 () Bool)

(declare-fun inv!12 (BitStream!2106) Bool)

(assert (=> start!11810 (and (inv!12 thiss!1379) e!38906)))

(declare-fun b!58619 () Bool)

(assert (=> b!58619 (= e!38906 (array_inv!1112 (buf!1590 thiss!1379)))))

(declare-fun b!58620 () Bool)

(declare-fun res!48701 () Bool)

(assert (=> b!58620 (=> res!48701 e!38904)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58620 (= res!48701 (not (invariant!0 (currentBit!3203 (_2!2778 lt!92476)) (currentByte!3208 (_2!2778 lt!92476)) (size!1209 (buf!1590 (_2!2778 lt!92476))))))))

(declare-fun b!58621 () Bool)

(declare-fun res!48705 () Bool)

(assert (=> b!58621 (=> res!48705 e!38897)))

(assert (=> b!58621 (= res!48705 (not (invariant!0 (currentBit!3203 (_2!2778 lt!92479)) (currentByte!3208 (_2!2778 lt!92479)) (size!1209 (buf!1590 (_2!2778 lt!92476))))))))

(declare-fun b!58622 () Bool)

(assert (=> b!58622 (= e!38902 (not e!38905))))

(declare-fun res!48699 () Bool)

(assert (=> b!58622 (=> res!48699 e!38905)))

(assert (=> b!58622 (= res!48699 (bvsge i!635 to!314))))

(assert (=> b!58622 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92474 () Unit!4041)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2106) Unit!4041)

(assert (=> b!58622 (= lt!92474 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!58622 (= lt!92478 (bitIndex!0 (size!1209 (buf!1590 thiss!1379)) (currentByte!3208 thiss!1379) (currentBit!3203 thiss!1379)))))

(declare-fun b!58623 () Bool)

(declare-datatypes ((List!628 0))(
  ( (Nil!625) (Cons!624 (h!743 Bool) (t!1378 List!628)) )
))
(declare-fun head!447 (List!628) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2106 array!2667 (_ BitVec 64) (_ BitVec 64)) List!628)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2106 BitStream!2106 (_ BitVec 64)) List!628)

(assert (=> b!58623 (= e!38896 (= (head!447 (byteArrayBitContentToList!0 (_2!2778 lt!92479) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!447 (bitStreamReadBitsIntoList!0 (_2!2778 lt!92479) (_1!2779 lt!92480) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58624 () Bool)

(assert (=> b!58624 (= e!38897 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!92473 () tuple2!5336)

(assert (=> b!58624 (= lt!92473 (reader!0 (_2!2778 lt!92479) (_2!2778 lt!92476)))))

(assert (=> b!58624 (validate_offset_bits!1 ((_ sign_extend 32) (size!1209 (buf!1590 (_2!2778 lt!92476)))) ((_ sign_extend 32) (currentByte!3208 thiss!1379)) ((_ sign_extend 32) (currentBit!3203 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!92481 () Unit!4041)

(assert (=> b!58624 (= lt!92481 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1590 (_2!2778 lt!92476)) (bvsub to!314 i!635)))))

(declare-fun lt!92472 () tuple2!5336)

(assert (=> b!58624 (= lt!92472 (reader!0 thiss!1379 (_2!2778 lt!92476)))))

(declare-fun b!58625 () Bool)

(declare-fun res!48702 () Bool)

(assert (=> b!58625 (=> res!48702 e!38897)))

(assert (=> b!58625 (= res!48702 (not (invariant!0 (currentBit!3203 (_2!2778 lt!92479)) (currentByte!3208 (_2!2778 lt!92479)) (size!1209 (buf!1590 (_2!2778 lt!92479))))))))

(declare-fun b!58626 () Bool)

(declare-fun res!48709 () Bool)

(assert (=> b!58626 (=> res!48709 e!38904)))

(assert (=> b!58626 (= res!48709 (not (= (size!1209 (buf!1590 thiss!1379)) (size!1209 (buf!1590 (_2!2778 lt!92476))))))))

(declare-fun b!58627 () Bool)

(assert (=> b!58627 (= e!38898 (= lt!92482 (bvsub (bvsub (bvadd (bitIndex!0 (size!1209 (buf!1590 (_2!2778 lt!92479))) (currentByte!3208 (_2!2778 lt!92479)) (currentBit!3203 (_2!2778 lt!92479))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!11810 res!48708) b!58617))

(assert (= (and b!58617 res!48704) b!58622))

(assert (= (and b!58622 (not res!48699)) b!58618))

(assert (= (and b!58618 (not res!48710)) b!58615))

(assert (= (and b!58615 res!48703) b!58623))

(assert (= (and b!58615 (not res!48711)) b!58616))

(assert (= (and b!58616 (not res!48706)) b!58620))

(assert (= (and b!58620 (not res!48701)) b!58626))

(assert (= (and b!58626 (not res!48709)) b!58614))

(assert (= (and b!58614 res!48707) b!58627))

(assert (= (and b!58614 (not res!48700)) b!58625))

(assert (= (and b!58625 (not res!48702)) b!58621))

(assert (= (and b!58621 (not res!48705)) b!58624))

(assert (= start!11810 b!58619))

(declare-fun m!92321 () Bool)

(assert (=> b!58622 m!92321))

(declare-fun m!92323 () Bool)

(assert (=> b!58622 m!92323))

(declare-fun m!92325 () Bool)

(assert (=> b!58622 m!92325))

(declare-fun m!92327 () Bool)

(assert (=> start!11810 m!92327))

(declare-fun m!92329 () Bool)

(assert (=> start!11810 m!92329))

(declare-fun m!92331 () Bool)

(assert (=> b!58627 m!92331))

(declare-fun m!92333 () Bool)

(assert (=> b!58620 m!92333))

(declare-fun m!92335 () Bool)

(assert (=> b!58618 m!92335))

(declare-fun m!92337 () Bool)

(assert (=> b!58618 m!92337))

(declare-fun m!92339 () Bool)

(assert (=> b!58618 m!92339))

(declare-fun m!92341 () Bool)

(assert (=> b!58618 m!92341))

(assert (=> b!58618 m!92337))

(declare-fun m!92343 () Bool)

(assert (=> b!58618 m!92343))

(declare-fun m!92345 () Bool)

(assert (=> b!58615 m!92345))

(declare-fun m!92347 () Bool)

(assert (=> b!58615 m!92347))

(declare-fun m!92349 () Bool)

(assert (=> b!58615 m!92349))

(declare-fun m!92351 () Bool)

(assert (=> b!58615 m!92351))

(declare-fun m!92353 () Bool)

(assert (=> b!58615 m!92353))

(declare-fun m!92355 () Bool)

(assert (=> b!58615 m!92355))

(declare-fun m!92357 () Bool)

(assert (=> b!58615 m!92357))

(declare-fun m!92359 () Bool)

(assert (=> b!58623 m!92359))

(assert (=> b!58623 m!92359))

(declare-fun m!92361 () Bool)

(assert (=> b!58623 m!92361))

(declare-fun m!92363 () Bool)

(assert (=> b!58623 m!92363))

(assert (=> b!58623 m!92363))

(declare-fun m!92365 () Bool)

(assert (=> b!58623 m!92365))

(declare-fun m!92367 () Bool)

(assert (=> b!58619 m!92367))

(declare-fun m!92369 () Bool)

(assert (=> b!58621 m!92369))

(declare-fun m!92371 () Bool)

(assert (=> b!58616 m!92371))

(declare-fun m!92373 () Bool)

(assert (=> b!58624 m!92373))

(declare-fun m!92375 () Bool)

(assert (=> b!58624 m!92375))

(declare-fun m!92377 () Bool)

(assert (=> b!58624 m!92377))

(declare-fun m!92379 () Bool)

(assert (=> b!58624 m!92379))

(declare-fun m!92381 () Bool)

(assert (=> b!58617 m!92381))

(declare-fun m!92383 () Bool)

(assert (=> b!58625 m!92383))

(check-sat (not b!58625) (not b!58621) (not b!58616) (not b!58627) (not b!58617) (not b!58618) (not start!11810) (not b!58622) (not b!58619) (not b!58624) (not b!58623) (not b!58615) (not b!58620))
(check-sat)
