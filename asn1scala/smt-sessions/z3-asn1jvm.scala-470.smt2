; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!13778 () Bool)

(assert start!13778)

(declare-fun b!70546 () Bool)

(declare-fun res!58214 () Bool)

(declare-fun e!45988 () Bool)

(assert (=> b!70546 (=> res!58214 e!45988)))

(declare-datatypes ((array!2919 0))(
  ( (array!2920 (arr!1944 (Array (_ BitVec 32) (_ BitVec 8))) (size!1359 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2310 0))(
  ( (BitStream!2311 (buf!1740 array!2919) (currentByte!3454 (_ BitVec 32)) (currentBit!3449 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!4723 0))(
  ( (Unit!4724) )
))
(declare-datatypes ((tuple2!6126 0))(
  ( (tuple2!6127 (_1!3177 Unit!4723) (_2!3177 BitStream!2310)) )
))
(declare-fun lt!113563 () tuple2!6126)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!70546 (= res!58214 (not (invariant!0 (currentBit!3449 (_2!3177 lt!113563)) (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113563))))))))

(declare-fun srcBuffer!2 () array!2919)

(declare-datatypes ((tuple2!6128 0))(
  ( (tuple2!6129 (_1!3178 BitStream!2310) (_2!3178 BitStream!2310)) )
))
(declare-fun lt!113581 () tuple2!6128)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!70547 () Bool)

(declare-fun e!45981 () Bool)

(declare-datatypes ((List!730 0))(
  ( (Nil!727) (Cons!726 (h!845 Bool) (t!1480 List!730)) )
))
(declare-fun head!549 (List!730) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2310 array!2919 (_ BitVec 64) (_ BitVec 64)) List!730)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2310 BitStream!2310 (_ BitVec 64)) List!730)

(assert (=> b!70547 (= e!45981 (= (head!549 (byteArrayBitContentToList!0 (_2!3177 lt!113563) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!549 (bitStreamReadBitsIntoList!0 (_2!3177 lt!113563) (_1!3178 lt!113581) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!70548 () Bool)

(declare-fun res!58206 () Bool)

(declare-fun e!45986 () Bool)

(assert (=> b!70548 (=> res!58206 e!45986)))

(declare-fun thiss!1379 () BitStream!2310)

(declare-fun lt!113566 () tuple2!6126)

(assert (=> b!70548 (= res!58206 (not (= (size!1359 (buf!1740 thiss!1379)) (size!1359 (buf!1740 (_2!3177 lt!113566))))))))

(declare-fun b!70549 () Bool)

(declare-fun res!58202 () Bool)

(assert (=> b!70549 (=> res!58202 e!45988)))

(assert (=> b!70549 (= res!58202 (not (invariant!0 (currentBit!3449 (_2!3177 lt!113563)) (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113566))))))))

(declare-fun res!58216 () Bool)

(declare-fun e!45992 () Bool)

(assert (=> start!13778 (=> (not res!58216) (not e!45992))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!13778 (= res!58216 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1359 srcBuffer!2))))))))

(assert (=> start!13778 e!45992))

(assert (=> start!13778 true))

(declare-fun array_inv!1214 (array!2919) Bool)

(assert (=> start!13778 (array_inv!1214 srcBuffer!2)))

(declare-fun e!45995 () Bool)

(declare-fun inv!12 (BitStream!2310) Bool)

(assert (=> start!13778 (and (inv!12 thiss!1379) e!45995)))

(declare-fun b!70550 () Bool)

(declare-fun e!45983 () Bool)

(declare-fun e!45980 () Bool)

(assert (=> b!70550 (= e!45983 e!45980)))

(declare-fun res!58213 () Bool)

(assert (=> b!70550 (=> res!58213 e!45980)))

(declare-fun lt!113584 () Bool)

(declare-fun lt!113562 () Bool)

(assert (=> b!70550 (= res!58213 (not (= lt!113584 lt!113562)))))

(declare-fun lt!113573 () Bool)

(assert (=> b!70550 (= lt!113573 lt!113584)))

(declare-fun lt!113568 () (_ BitVec 64))

(declare-fun bitAt!0 (array!2919 (_ BitVec 64)) Bool)

(assert (=> b!70550 (= lt!113584 (bitAt!0 (buf!1740 (_2!3177 lt!113566)) lt!113568))))

(declare-fun lt!113575 () (_ BitVec 64))

(declare-fun lt!113577 () Unit!4723)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!2919 array!2919 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4723)

(assert (=> b!70550 (= lt!113577 (arrayBitRangesEqImpliesEq!0 (buf!1740 (_2!3177 lt!113563)) (buf!1740 (_2!3177 lt!113566)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113568 lt!113575))))

(declare-fun b!70551 () Bool)

(declare-fun e!45985 () Bool)

(declare-fun e!45991 () Bool)

(assert (=> b!70551 (= e!45985 e!45991)))

(declare-fun res!58219 () Bool)

(assert (=> b!70551 (=> res!58219 e!45991)))

(declare-fun isPrefixOf!0 (BitStream!2310 BitStream!2310) Bool)

(assert (=> b!70551 (= res!58219 (not (isPrefixOf!0 thiss!1379 (_2!3177 lt!113563))))))

(declare-fun lt!113570 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70551 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!113570)))

(assert (=> b!70551 (= lt!113570 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113579 () Unit!4723)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2310 BitStream!2310 (_ BitVec 64) (_ BitVec 64)) Unit!4723)

(assert (=> b!70551 (= lt!113579 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3177 lt!113563) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2310 (_ BitVec 8) (_ BitVec 32)) tuple2!6126)

(assert (=> b!70551 (= lt!113563 (appendBitFromByte!0 thiss!1379 (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!70552 () Bool)

(declare-fun e!45990 () Bool)

(assert (=> b!70552 (= e!45990 e!45983)))

(declare-fun res!58211 () Bool)

(assert (=> b!70552 (=> res!58211 e!45983)))

(assert (=> b!70552 (= res!58211 (not (= lt!113573 lt!113562)))))

(assert (=> b!70552 (= lt!113573 (bitAt!0 (buf!1740 (_2!3177 lt!113563)) lt!113568))))

(declare-fun b!70553 () Bool)

(declare-fun res!58221 () Bool)

(assert (=> b!70553 (=> res!58221 e!45980)))

(declare-fun lt!113585 () tuple2!6128)

(declare-datatypes ((tuple2!6130 0))(
  ( (tuple2!6131 (_1!3179 BitStream!2310) (_2!3179 Bool)) )
))
(declare-fun readBitPure!0 (BitStream!2310) tuple2!6130)

(assert (=> b!70553 (= res!58221 (not (= (_2!3179 (readBitPure!0 (_1!3178 lt!113585))) lt!113562)))))

(declare-fun b!70554 () Bool)

(declare-fun e!45984 () Bool)

(declare-fun e!45982 () Bool)

(assert (=> b!70554 (= e!45984 e!45982)))

(declare-fun res!58220 () Bool)

(assert (=> b!70554 (=> res!58220 e!45982)))

(declare-fun lt!113578 () Bool)

(declare-fun lt!113561 () Bool)

(assert (=> b!70554 (= res!58220 (not (= lt!113578 lt!113561)))))

(declare-fun lt!113567 () List!730)

(assert (=> b!70554 (= lt!113578 (head!549 lt!113567))))

(declare-fun b!70555 () Bool)

(declare-fun e!45989 () Bool)

(assert (=> b!70555 (= e!45991 e!45989)))

(declare-fun res!58204 () Bool)

(assert (=> b!70555 (=> res!58204 e!45989)))

(assert (=> b!70555 (= res!58204 (not (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!113566))))))

(assert (=> b!70555 (isPrefixOf!0 thiss!1379 (_2!3177 lt!113566))))

(declare-fun lt!113574 () Unit!4723)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2310 BitStream!2310 BitStream!2310) Unit!4723)

(assert (=> b!70555 (= lt!113574 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3177 lt!113563) (_2!3177 lt!113566)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2310 array!2919 (_ BitVec 64) (_ BitVec 64)) tuple2!6126)

(assert (=> b!70555 (= lt!113566 (appendBitsMSBFirstLoop!0 (_2!3177 lt!113563) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!70555 e!45981))

(declare-fun res!58208 () Bool)

(assert (=> b!70555 (=> (not res!58208) (not e!45981))))

(assert (=> b!70555 (= res!58208 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!113564 () Unit!4723)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2310 array!2919 (_ BitVec 64)) Unit!4723)

(assert (=> b!70555 (= lt!113564 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1740 (_2!3177 lt!113563)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2310 BitStream!2310) tuple2!6128)

(assert (=> b!70555 (= lt!113581 (reader!0 thiss!1379 (_2!3177 lt!113563)))))

(declare-fun b!70556 () Bool)

(assert (=> b!70556 (= e!45982 e!45990)))

(declare-fun res!58201 () Bool)

(assert (=> b!70556 (=> res!58201 e!45990)))

(declare-fun lt!113586 () Bool)

(assert (=> b!70556 (= res!58201 (not (= lt!113586 lt!113562)))))

(assert (=> b!70556 (= lt!113562 (bitAt!0 srcBuffer!2 i!635))))

(assert (=> b!70556 (= lt!113586 (head!549 (byteArrayBitContentToList!0 (_2!3177 lt!113566) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(declare-fun b!70557 () Bool)

(declare-fun res!58203 () Bool)

(assert (=> b!70557 (=> (not res!58203) (not e!45992))))

(assert (=> b!70557 (= res!58203 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 thiss!1379))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!70558 () Bool)

(assert (=> b!70558 (= e!45989 e!45986)))

(declare-fun res!58212 () Bool)

(assert (=> b!70558 (=> res!58212 e!45986)))

(declare-fun lt!113565 () (_ BitVec 64))

(declare-fun lt!113569 () (_ BitVec 64))

(assert (=> b!70558 (= res!58212 (not (= lt!113569 (bvsub lt!113565 i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!70558 (= lt!113569 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113566))) (currentByte!3454 (_2!3177 lt!113566)) (currentBit!3449 (_2!3177 lt!113566))))))

(assert (=> b!70558 (= lt!113565 (bvadd lt!113568 to!314))))

(declare-fun b!70559 () Bool)

(assert (=> b!70559 (= e!45986 e!45988)))

(declare-fun res!58215 () Bool)

(assert (=> b!70559 (=> res!58215 e!45988)))

(assert (=> b!70559 (= res!58215 (not (= (size!1359 (buf!1740 (_2!3177 lt!113563))) (size!1359 (buf!1740 (_2!3177 lt!113566))))))))

(assert (=> b!70559 (= lt!113569 (bvsub (bvsub (bvadd lt!113575 to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!70559 (= lt!113575 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))))))

(assert (=> b!70559 (= (size!1359 (buf!1740 (_2!3177 lt!113566))) (size!1359 (buf!1740 thiss!1379)))))

(declare-fun b!70560 () Bool)

(declare-fun e!45987 () Bool)

(assert (=> b!70560 (= e!45987 e!45984)))

(declare-fun res!58218 () Bool)

(assert (=> b!70560 (=> res!58218 e!45984)))

(declare-fun lt!113587 () tuple2!6128)

(assert (=> b!70560 (= res!58218 (not (= lt!113561 (bitAt!0 (buf!1740 (_1!3178 lt!113587)) lt!113568))))))

(assert (=> b!70560 (= lt!113561 (bitAt!0 (buf!1740 (_1!3178 lt!113585)) lt!113568))))

(declare-fun b!70561 () Bool)

(declare-fun res!58209 () Bool)

(declare-fun e!45994 () Bool)

(assert (=> b!70561 (=> res!58209 e!45994)))

(declare-fun length!358 (List!730) Int)

(assert (=> b!70561 (= res!58209 (<= (length!358 lt!113567) 0))))

(declare-fun b!70562 () Bool)

(assert (=> b!70562 (= e!45992 (not e!45985))))

(declare-fun res!58207 () Bool)

(assert (=> b!70562 (=> res!58207 e!45985)))

(assert (=> b!70562 (= res!58207 (bvsge i!635 to!314))))

(assert (=> b!70562 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!113580 () Unit!4723)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2310) Unit!4723)

(assert (=> b!70562 (= lt!113580 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!70562 (= lt!113568 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(declare-fun b!70563 () Bool)

(assert (=> b!70563 (= e!45994 e!45987)))

(declare-fun res!58217 () Bool)

(assert (=> b!70563 (=> res!58217 e!45987)))

(declare-fun lt!113582 () List!730)

(declare-fun lt!113576 () List!730)

(assert (=> b!70563 (= res!58217 (not (= lt!113582 lt!113576)))))

(assert (=> b!70563 (= lt!113576 lt!113582)))

(declare-fun tail!334 (List!730) List!730)

(assert (=> b!70563 (= lt!113582 (tail!334 lt!113567))))

(declare-fun lt!113572 () Unit!4723)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!2310 BitStream!2310 BitStream!2310 BitStream!2310 (_ BitVec 64) List!730) Unit!4723)

(assert (=> b!70563 (= lt!113572 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3177 lt!113566) (_2!3177 lt!113566) (_1!3178 lt!113585) (_1!3178 lt!113587) (bvsub to!314 i!635) lt!113567))))

(declare-fun b!70564 () Bool)

(declare-fun res!58210 () Bool)

(assert (=> b!70564 (=> res!58210 e!45986)))

(assert (=> b!70564 (= res!58210 (not (invariant!0 (currentBit!3449 (_2!3177 lt!113566)) (currentByte!3454 (_2!3177 lt!113566)) (size!1359 (buf!1740 (_2!3177 lt!113566))))))))

(declare-fun b!70565 () Bool)

(assert (=> b!70565 (= e!45988 e!45994)))

(declare-fun res!58205 () Bool)

(assert (=> b!70565 (=> res!58205 e!45994)))

(assert (=> b!70565 (= res!58205 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!70565 (= lt!113576 (bitStreamReadBitsIntoList!0 (_2!3177 lt!113566) (_1!3178 lt!113587) lt!113570))))

(assert (=> b!70565 (= lt!113567 (bitStreamReadBitsIntoList!0 (_2!3177 lt!113566) (_1!3178 lt!113585) (bvsub to!314 i!635)))))

(assert (=> b!70565 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!113570)))

(declare-fun lt!113571 () Unit!4723)

(assert (=> b!70565 (= lt!113571 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3177 lt!113563) (buf!1740 (_2!3177 lt!113566)) lt!113570))))

(assert (=> b!70565 (= lt!113587 (reader!0 (_2!3177 lt!113563) (_2!3177 lt!113566)))))

(assert (=> b!70565 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!113583 () Unit!4723)

(assert (=> b!70565 (= lt!113583 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1740 (_2!3177 lt!113566)) (bvsub to!314 i!635)))))

(assert (=> b!70565 (= lt!113585 (reader!0 thiss!1379 (_2!3177 lt!113566)))))

(declare-fun b!70566 () Bool)

(assert (=> b!70566 (= e!45980 (or (not (= lt!113578 lt!113586)) (let ((bdg!3309 (bvand lt!113568 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!3309 (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!3309 (bvand lt!113565 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!70567 () Bool)

(assert (=> b!70567 (= e!45995 (array_inv!1214 (buf!1740 thiss!1379)))))

(assert (= (and start!13778 res!58216) b!70557))

(assert (= (and b!70557 res!58203) b!70562))

(assert (= (and b!70562 (not res!58207)) b!70551))

(assert (= (and b!70551 (not res!58219)) b!70555))

(assert (= (and b!70555 res!58208) b!70547))

(assert (= (and b!70555 (not res!58204)) b!70558))

(assert (= (and b!70558 (not res!58212)) b!70564))

(assert (= (and b!70564 (not res!58210)) b!70548))

(assert (= (and b!70548 (not res!58206)) b!70559))

(assert (= (and b!70559 (not res!58215)) b!70546))

(assert (= (and b!70546 (not res!58214)) b!70549))

(assert (= (and b!70549 (not res!58202)) b!70565))

(assert (= (and b!70565 (not res!58205)) b!70561))

(assert (= (and b!70561 (not res!58209)) b!70563))

(assert (= (and b!70563 (not res!58217)) b!70560))

(assert (= (and b!70560 (not res!58218)) b!70554))

(assert (= (and b!70554 (not res!58220)) b!70556))

(assert (= (and b!70556 (not res!58201)) b!70552))

(assert (= (and b!70552 (not res!58211)) b!70550))

(assert (= (and b!70550 (not res!58213)) b!70553))

(assert (= (and b!70553 (not res!58221)) b!70566))

(assert (= start!13778 b!70567))

(declare-fun m!112977 () Bool)

(assert (=> b!70547 m!112977))

(assert (=> b!70547 m!112977))

(declare-fun m!112979 () Bool)

(assert (=> b!70547 m!112979))

(declare-fun m!112981 () Bool)

(assert (=> b!70547 m!112981))

(assert (=> b!70547 m!112981))

(declare-fun m!112983 () Bool)

(assert (=> b!70547 m!112983))

(declare-fun m!112985 () Bool)

(assert (=> b!70549 m!112985))

(declare-fun m!112987 () Bool)

(assert (=> b!70556 m!112987))

(declare-fun m!112989 () Bool)

(assert (=> b!70556 m!112989))

(assert (=> b!70556 m!112989))

(declare-fun m!112991 () Bool)

(assert (=> b!70556 m!112991))

(declare-fun m!112993 () Bool)

(assert (=> start!13778 m!112993))

(declare-fun m!112995 () Bool)

(assert (=> start!13778 m!112995))

(declare-fun m!112997 () Bool)

(assert (=> b!70567 m!112997))

(declare-fun m!112999 () Bool)

(assert (=> b!70559 m!112999))

(declare-fun m!113001 () Bool)

(assert (=> b!70561 m!113001))

(declare-fun m!113003 () Bool)

(assert (=> b!70546 m!113003))

(declare-fun m!113005 () Bool)

(assert (=> b!70551 m!113005))

(declare-fun m!113007 () Bool)

(assert (=> b!70551 m!113007))

(declare-fun m!113009 () Bool)

(assert (=> b!70551 m!113009))

(assert (=> b!70551 m!113005))

(declare-fun m!113011 () Bool)

(assert (=> b!70551 m!113011))

(declare-fun m!113013 () Bool)

(assert (=> b!70551 m!113013))

(declare-fun m!113015 () Bool)

(assert (=> b!70562 m!113015))

(declare-fun m!113017 () Bool)

(assert (=> b!70562 m!113017))

(declare-fun m!113019 () Bool)

(assert (=> b!70562 m!113019))

(declare-fun m!113021 () Bool)

(assert (=> b!70560 m!113021))

(declare-fun m!113023 () Bool)

(assert (=> b!70560 m!113023))

(declare-fun m!113025 () Bool)

(assert (=> b!70557 m!113025))

(declare-fun m!113027 () Bool)

(assert (=> b!70555 m!113027))

(declare-fun m!113029 () Bool)

(assert (=> b!70555 m!113029))

(declare-fun m!113031 () Bool)

(assert (=> b!70555 m!113031))

(declare-fun m!113033 () Bool)

(assert (=> b!70555 m!113033))

(declare-fun m!113035 () Bool)

(assert (=> b!70555 m!113035))

(declare-fun m!113037 () Bool)

(assert (=> b!70555 m!113037))

(declare-fun m!113039 () Bool)

(assert (=> b!70555 m!113039))

(declare-fun m!113041 () Bool)

(assert (=> b!70558 m!113041))

(declare-fun m!113043 () Bool)

(assert (=> b!70565 m!113043))

(declare-fun m!113045 () Bool)

(assert (=> b!70565 m!113045))

(declare-fun m!113047 () Bool)

(assert (=> b!70565 m!113047))

(declare-fun m!113049 () Bool)

(assert (=> b!70565 m!113049))

(declare-fun m!113051 () Bool)

(assert (=> b!70565 m!113051))

(declare-fun m!113053 () Bool)

(assert (=> b!70565 m!113053))

(declare-fun m!113055 () Bool)

(assert (=> b!70565 m!113055))

(declare-fun m!113057 () Bool)

(assert (=> b!70565 m!113057))

(declare-fun m!113059 () Bool)

(assert (=> b!70552 m!113059))

(declare-fun m!113061 () Bool)

(assert (=> b!70564 m!113061))

(declare-fun m!113063 () Bool)

(assert (=> b!70563 m!113063))

(declare-fun m!113065 () Bool)

(assert (=> b!70563 m!113065))

(declare-fun m!113067 () Bool)

(assert (=> b!70553 m!113067))

(declare-fun m!113069 () Bool)

(assert (=> b!70550 m!113069))

(declare-fun m!113071 () Bool)

(assert (=> b!70550 m!113071))

(declare-fun m!113073 () Bool)

(assert (=> b!70554 m!113073))

(check-sat (not b!70550) (not b!70551) (not b!70552) (not b!70565) (not start!13778) (not b!70549) (not b!70560) (not b!70559) (not b!70553) (not b!70558) (not b!70557) (not b!70563) (not b!70555) (not b!70546) (not b!70556) (not b!70562) (not b!70561) (not b!70554) (not b!70547) (not b!70564) (not b!70567))
(check-sat)
(get-model)

(declare-fun d!22666 () Bool)

(assert (=> d!22666 (= (invariant!0 (currentBit!3449 (_2!3177 lt!113563)) (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113566)))) (and (bvsge (currentBit!3449 (_2!3177 lt!113563)) #b00000000000000000000000000000000) (bvslt (currentBit!3449 (_2!3177 lt!113563)) #b00000000000000000000000000001000) (bvsge (currentByte!3454 (_2!3177 lt!113563)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113566)))) (and (= (currentBit!3449 (_2!3177 lt!113563)) #b00000000000000000000000000000000) (= (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113566))))))))))

(assert (=> b!70549 d!22666))

(declare-fun d!22668 () Bool)

(assert (=> d!22668 (= (bitAt!0 (buf!1740 (_1!3178 lt!113587)) lt!113568) (not (= (bvand ((_ sign_extend 24) (select (arr!1944 (buf!1740 (_1!3178 lt!113587))) ((_ extract 31 0) (bvsdiv lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5436 () Bool)

(assert (= bs!5436 d!22668))

(declare-fun m!113173 () Bool)

(assert (=> bs!5436 m!113173))

(declare-fun m!113175 () Bool)

(assert (=> bs!5436 m!113175))

(assert (=> b!70560 d!22668))

(declare-fun d!22670 () Bool)

(assert (=> d!22670 (= (bitAt!0 (buf!1740 (_1!3178 lt!113585)) lt!113568) (not (= (bvand ((_ sign_extend 24) (select (arr!1944 (buf!1740 (_1!3178 lt!113585))) ((_ extract 31 0) (bvsdiv lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5437 () Bool)

(assert (= bs!5437 d!22670))

(declare-fun m!113177 () Bool)

(assert (=> bs!5437 m!113177))

(assert (=> bs!5437 m!113175))

(assert (=> b!70560 d!22670))

(declare-fun d!22672 () Bool)

(declare-fun size!1361 (List!730) Int)

(assert (=> d!22672 (= (length!358 lt!113567) (size!1361 lt!113567))))

(declare-fun bs!5438 () Bool)

(assert (= bs!5438 d!22672))

(declare-fun m!113179 () Bool)

(assert (=> bs!5438 m!113179))

(assert (=> b!70561 d!22672))

(declare-fun d!22674 () Bool)

(assert (=> d!22674 (= (bitAt!0 (buf!1740 (_2!3177 lt!113566)) lt!113568) (not (= (bvand ((_ sign_extend 24) (select (arr!1944 (buf!1740 (_2!3177 lt!113566))) ((_ extract 31 0) (bvsdiv lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5439 () Bool)

(assert (= bs!5439 d!22674))

(declare-fun m!113181 () Bool)

(assert (=> bs!5439 m!113181))

(assert (=> bs!5439 m!113175))

(assert (=> b!70550 d!22674))

(declare-fun d!22676 () Bool)

(assert (=> d!22676 (= (bitAt!0 (buf!1740 (_2!3177 lt!113563)) lt!113568) (bitAt!0 (buf!1740 (_2!3177 lt!113566)) lt!113568))))

(declare-fun lt!113671 () Unit!4723)

(declare-fun choose!31 (array!2919 array!2919 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!4723)

(assert (=> d!22676 (= lt!113671 (choose!31 (buf!1740 (_2!3177 lt!113563)) (buf!1740 (_2!3177 lt!113566)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113568 lt!113575))))

(assert (=> d!22676 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113575))))

(assert (=> d!22676 (= (arrayBitRangesEqImpliesEq!0 (buf!1740 (_2!3177 lt!113563)) (buf!1740 (_2!3177 lt!113566)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!113568 lt!113575) lt!113671)))

(declare-fun bs!5440 () Bool)

(assert (= bs!5440 d!22676))

(assert (=> bs!5440 m!113059))

(assert (=> bs!5440 m!113069))

(declare-fun m!113183 () Bool)

(assert (=> bs!5440 m!113183))

(assert (=> b!70550 d!22676))

(declare-fun d!22678 () Bool)

(declare-fun res!58291 () Bool)

(declare-fun e!46052 () Bool)

(assert (=> d!22678 (=> (not res!58291) (not e!46052))))

(assert (=> d!22678 (= res!58291 (= (size!1359 (buf!1740 thiss!1379)) (size!1359 (buf!1740 (_2!3177 lt!113563)))))))

(assert (=> d!22678 (= (isPrefixOf!0 thiss!1379 (_2!3177 lt!113563)) e!46052)))

(declare-fun b!70640 () Bool)

(declare-fun res!58292 () Bool)

(assert (=> b!70640 (=> (not res!58292) (not e!46052))))

(assert (=> b!70640 (= res!58292 (bvsle (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)) (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563)))))))

(declare-fun b!70641 () Bool)

(declare-fun e!46051 () Bool)

(assert (=> b!70641 (= e!46052 e!46051)))

(declare-fun res!58293 () Bool)

(assert (=> b!70641 (=> res!58293 e!46051)))

(assert (=> b!70641 (= res!58293 (= (size!1359 (buf!1740 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70642 () Bool)

(declare-fun arrayBitRangesEq!0 (array!2919 array!2919 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70642 (= e!46051 (arrayBitRangesEq!0 (buf!1740 thiss!1379) (buf!1740 (_2!3177 lt!113563)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379))))))

(assert (= (and d!22678 res!58291) b!70640))

(assert (= (and b!70640 res!58292) b!70641))

(assert (= (and b!70641 (not res!58293)) b!70642))

(assert (=> b!70640 m!113019))

(assert (=> b!70640 m!112999))

(assert (=> b!70642 m!113019))

(assert (=> b!70642 m!113019))

(declare-fun m!113185 () Bool)

(assert (=> b!70642 m!113185))

(assert (=> b!70551 d!22678))

(declare-fun d!22680 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!22680 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!113570) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563)))) lt!113570))))

(declare-fun bs!5441 () Bool)

(assert (= bs!5441 d!22680))

(declare-fun m!113187 () Bool)

(assert (=> bs!5441 m!113187))

(assert (=> b!70551 d!22680))

(declare-fun d!22682 () Bool)

(declare-fun e!46055 () Bool)

(assert (=> d!22682 e!46055))

(declare-fun res!58296 () Bool)

(assert (=> d!22682 (=> (not res!58296) (not e!46055))))

(assert (=> d!22682 (= res!58296 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!113674 () Unit!4723)

(declare-fun choose!27 (BitStream!2310 BitStream!2310 (_ BitVec 64) (_ BitVec 64)) Unit!4723)

(assert (=> d!22682 (= lt!113674 (choose!27 thiss!1379 (_2!3177 lt!113563) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!22682 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!22682 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!3177 lt!113563) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!113674)))

(declare-fun b!70645 () Bool)

(assert (=> b!70645 (= e!46055 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22682 res!58296) b!70645))

(declare-fun m!113189 () Bool)

(assert (=> d!22682 m!113189))

(declare-fun m!113191 () Bool)

(assert (=> b!70645 m!113191))

(assert (=> b!70551 d!22682))

(declare-fun b!70663 () Bool)

(declare-fun e!46064 () Bool)

(declare-fun e!46067 () Bool)

(assert (=> b!70663 (= e!46064 e!46067)))

(declare-fun res!58318 () Bool)

(assert (=> b!70663 (=> (not res!58318) (not e!46067))))

(declare-fun lt!113708 () tuple2!6126)

(declare-fun lt!113709 () (_ BitVec 8))

(declare-fun lt!113710 () tuple2!6130)

(assert (=> b!70663 (= res!58318 (and (= (_2!3179 lt!113710) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!113709)) #b00000000000000000000000000000000))) (= (_1!3179 lt!113710) (_2!3177 lt!113708))))))

(declare-datatypes ((tuple2!6138 0))(
  ( (tuple2!6139 (_1!3183 array!2919) (_2!3183 BitStream!2310)) )
))
(declare-fun lt!113706 () tuple2!6138)

(declare-fun lt!113702 () BitStream!2310)

(declare-fun readBits!0 (BitStream!2310 (_ BitVec 64)) tuple2!6138)

(assert (=> b!70663 (= lt!113706 (readBits!0 lt!113702 #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!70663 (= lt!113710 (readBitPure!0 lt!113702))))

(declare-fun readerFrom!0 (BitStream!2310 (_ BitVec 32) (_ BitVec 32)) BitStream!2310)

(assert (=> b!70663 (= lt!113702 (readerFrom!0 (_2!3177 lt!113708) (currentBit!3449 thiss!1379) (currentByte!3454 thiss!1379)))))

(declare-fun b!70664 () Bool)

(declare-fun res!58317 () Bool)

(assert (=> b!70664 (=> (not res!58317) (not e!46064))))

(declare-fun lt!113705 () (_ BitVec 64))

(declare-fun lt!113703 () (_ BitVec 64))

(assert (=> b!70664 (= res!58317 (= (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113708))) (currentByte!3454 (_2!3177 lt!113708)) (currentBit!3449 (_2!3177 lt!113708))) (bvadd lt!113705 lt!113703)))))

(assert (=> b!70664 (or (not (= (bvand lt!113705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113703 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!113705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!113705 lt!113703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70664 (= lt!113703 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!70664 (= lt!113705 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(declare-fun b!70665 () Bool)

(declare-fun e!46065 () Bool)

(declare-fun e!46066 () Bool)

(assert (=> b!70665 (= e!46065 e!46066)))

(declare-fun res!58319 () Bool)

(assert (=> b!70665 (=> (not res!58319) (not e!46066))))

(declare-fun lt!113700 () tuple2!6130)

(declare-fun lt!113699 () tuple2!6126)

(declare-fun lt!113704 () Bool)

(assert (=> b!70665 (= res!58319 (and (= (_2!3179 lt!113700) lt!113704) (= (_1!3179 lt!113700) (_2!3177 lt!113699))))))

(assert (=> b!70665 (= lt!113700 (readBitPure!0 (readerFrom!0 (_2!3177 lt!113699) (currentBit!3449 thiss!1379) (currentByte!3454 thiss!1379))))))

(declare-fun b!70666 () Bool)

(assert (=> b!70666 (= e!46067 (= (bitIndex!0 (size!1359 (buf!1740 (_1!3179 lt!113710))) (currentByte!3454 (_1!3179 lt!113710)) (currentBit!3449 (_1!3179 lt!113710))) (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113708))) (currentByte!3454 (_2!3177 lt!113708)) (currentBit!3449 (_2!3177 lt!113708)))))))

(declare-fun d!22684 () Bool)

(assert (=> d!22684 e!46064))

(declare-fun res!58315 () Bool)

(assert (=> d!22684 (=> (not res!58315) (not e!46064))))

(assert (=> d!22684 (= res!58315 (= (size!1359 (buf!1740 (_2!3177 lt!113708))) (size!1359 (buf!1740 thiss!1379))))))

(declare-fun lt!113701 () array!2919)

(assert (=> d!22684 (= lt!113709 (select (arr!1944 lt!113701) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!22684 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!1359 lt!113701)))))

(assert (=> d!22684 (= lt!113701 (array!2920 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!113707 () tuple2!6126)

(assert (=> d!22684 (= lt!113708 (tuple2!6127 (_1!3177 lt!113707) (_2!3177 lt!113707)))))

(assert (=> d!22684 (= lt!113707 lt!113699)))

(assert (=> d!22684 e!46065))

(declare-fun res!58313 () Bool)

(assert (=> d!22684 (=> (not res!58313) (not e!46065))))

(assert (=> d!22684 (= res!58313 (= (size!1359 (buf!1740 thiss!1379)) (size!1359 (buf!1740 (_2!3177 lt!113699)))))))

(declare-fun appendBit!0 (BitStream!2310 Bool) tuple2!6126)

(assert (=> d!22684 (= lt!113699 (appendBit!0 thiss!1379 lt!113704))))

(assert (=> d!22684 (= lt!113704 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!22684 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!22684 (= (appendBitFromByte!0 thiss!1379 (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!113708)))

(declare-fun b!70667 () Bool)

(assert (=> b!70667 (= e!46066 (= (bitIndex!0 (size!1359 (buf!1740 (_1!3179 lt!113700))) (currentByte!3454 (_1!3179 lt!113700)) (currentBit!3449 (_1!3179 lt!113700))) (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113699))) (currentByte!3454 (_2!3177 lt!113699)) (currentBit!3449 (_2!3177 lt!113699)))))))

(declare-fun b!70668 () Bool)

(declare-fun res!58320 () Bool)

(assert (=> b!70668 (=> (not res!58320) (not e!46065))))

(assert (=> b!70668 (= res!58320 (isPrefixOf!0 thiss!1379 (_2!3177 lt!113699)))))

(declare-fun b!70669 () Bool)

(declare-fun res!58316 () Bool)

(assert (=> b!70669 (=> (not res!58316) (not e!46064))))

(assert (=> b!70669 (= res!58316 (isPrefixOf!0 thiss!1379 (_2!3177 lt!113708)))))

(declare-fun b!70670 () Bool)

(declare-fun res!58314 () Bool)

(assert (=> b!70670 (=> (not res!58314) (not e!46065))))

(assert (=> b!70670 (= res!58314 (= (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113699))) (currentByte!3454 (_2!3177 lt!113699)) (currentBit!3449 (_2!3177 lt!113699))) (bvadd (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!22684 res!58313) b!70670))

(assert (= (and b!70670 res!58314) b!70668))

(assert (= (and b!70668 res!58320) b!70665))

(assert (= (and b!70665 res!58319) b!70667))

(assert (= (and d!22684 res!58315) b!70664))

(assert (= (and b!70664 res!58317) b!70669))

(assert (= (and b!70669 res!58316) b!70663))

(assert (= (and b!70663 res!58318) b!70666))

(declare-fun m!113193 () Bool)

(assert (=> b!70669 m!113193))

(declare-fun m!113195 () Bool)

(assert (=> b!70663 m!113195))

(declare-fun m!113197 () Bool)

(assert (=> b!70663 m!113197))

(declare-fun m!113199 () Bool)

(assert (=> b!70663 m!113199))

(declare-fun m!113201 () Bool)

(assert (=> b!70664 m!113201))

(assert (=> b!70664 m!113019))

(declare-fun m!113203 () Bool)

(assert (=> b!70665 m!113203))

(assert (=> b!70665 m!113203))

(declare-fun m!113205 () Bool)

(assert (=> b!70665 m!113205))

(declare-fun m!113207 () Bool)

(assert (=> b!70670 m!113207))

(assert (=> b!70670 m!113019))

(declare-fun m!113209 () Bool)

(assert (=> b!70666 m!113209))

(assert (=> b!70666 m!113201))

(declare-fun m!113211 () Bool)

(assert (=> d!22684 m!113211))

(declare-fun m!113213 () Bool)

(assert (=> d!22684 m!113213))

(declare-fun m!113215 () Bool)

(assert (=> d!22684 m!113215))

(declare-fun m!113217 () Bool)

(assert (=> b!70667 m!113217))

(assert (=> b!70667 m!113207))

(declare-fun m!113219 () Bool)

(assert (=> b!70668 m!113219))

(assert (=> b!70551 d!22684))

(declare-fun d!22686 () Bool)

(declare-fun res!58321 () Bool)

(declare-fun e!46069 () Bool)

(assert (=> d!22686 (=> (not res!58321) (not e!46069))))

(assert (=> d!22686 (= res!58321 (= (size!1359 (buf!1740 thiss!1379)) (size!1359 (buf!1740 thiss!1379))))))

(assert (=> d!22686 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!46069)))

(declare-fun b!70671 () Bool)

(declare-fun res!58322 () Bool)

(assert (=> b!70671 (=> (not res!58322) (not e!46069))))

(assert (=> b!70671 (= res!58322 (bvsle (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)) (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379))))))

(declare-fun b!70672 () Bool)

(declare-fun e!46068 () Bool)

(assert (=> b!70672 (= e!46069 e!46068)))

(declare-fun res!58323 () Bool)

(assert (=> b!70672 (=> res!58323 e!46068)))

(assert (=> b!70672 (= res!58323 (= (size!1359 (buf!1740 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70673 () Bool)

(assert (=> b!70673 (= e!46068 (arrayBitRangesEq!0 (buf!1740 thiss!1379) (buf!1740 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379))))))

(assert (= (and d!22686 res!58321) b!70671))

(assert (= (and b!70671 res!58322) b!70672))

(assert (= (and b!70672 (not res!58323)) b!70673))

(assert (=> b!70671 m!113019))

(assert (=> b!70671 m!113019))

(assert (=> b!70673 m!113019))

(assert (=> b!70673 m!113019))

(declare-fun m!113221 () Bool)

(assert (=> b!70673 m!113221))

(assert (=> b!70562 d!22686))

(declare-fun d!22688 () Bool)

(assert (=> d!22688 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!113713 () Unit!4723)

(declare-fun choose!11 (BitStream!2310) Unit!4723)

(assert (=> d!22688 (= lt!113713 (choose!11 thiss!1379))))

(assert (=> d!22688 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!113713)))

(declare-fun bs!5443 () Bool)

(assert (= bs!5443 d!22688))

(assert (=> bs!5443 m!113015))

(declare-fun m!113223 () Bool)

(assert (=> bs!5443 m!113223))

(assert (=> b!70562 d!22688))

(declare-fun d!22690 () Bool)

(declare-fun e!46072 () Bool)

(assert (=> d!22690 e!46072))

(declare-fun res!58329 () Bool)

(assert (=> d!22690 (=> (not res!58329) (not e!46072))))

(declare-fun lt!113730 () (_ BitVec 64))

(declare-fun lt!113727 () (_ BitVec 64))

(declare-fun lt!113728 () (_ BitVec 64))

(assert (=> d!22690 (= res!58329 (= lt!113727 (bvsub lt!113730 lt!113728)))))

(assert (=> d!22690 (or (= (bvand lt!113730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113728 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113730 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113730 lt!113728) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22690 (= lt!113728 (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 thiss!1379))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379))))))

(declare-fun lt!113729 () (_ BitVec 64))

(declare-fun lt!113726 () (_ BitVec 64))

(assert (=> d!22690 (= lt!113730 (bvmul lt!113729 lt!113726))))

(assert (=> d!22690 (or (= lt!113729 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!113726 (bvsdiv (bvmul lt!113729 lt!113726) lt!113729)))))

(assert (=> d!22690 (= lt!113726 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22690 (= lt!113729 ((_ sign_extend 32) (size!1359 (buf!1740 thiss!1379))))))

(assert (=> d!22690 (= lt!113727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3454 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3449 thiss!1379))))))

(assert (=> d!22690 (invariant!0 (currentBit!3449 thiss!1379) (currentByte!3454 thiss!1379) (size!1359 (buf!1740 thiss!1379)))))

(assert (=> d!22690 (= (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)) lt!113727)))

(declare-fun b!70678 () Bool)

(declare-fun res!58328 () Bool)

(assert (=> b!70678 (=> (not res!58328) (not e!46072))))

(assert (=> b!70678 (= res!58328 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!113727))))

(declare-fun b!70679 () Bool)

(declare-fun lt!113731 () (_ BitVec 64))

(assert (=> b!70679 (= e!46072 (bvsle lt!113727 (bvmul lt!113731 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70679 (or (= lt!113731 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!113731 #b0000000000000000000000000000000000000000000000000000000000001000) lt!113731)))))

(assert (=> b!70679 (= lt!113731 ((_ sign_extend 32) (size!1359 (buf!1740 thiss!1379))))))

(assert (= (and d!22690 res!58329) b!70678))

(assert (= (and b!70678 res!58328) b!70679))

(declare-fun m!113225 () Bool)

(assert (=> d!22690 m!113225))

(declare-fun m!113227 () Bool)

(assert (=> d!22690 m!113227))

(assert (=> b!70562 d!22690))

(declare-fun d!22692 () Bool)

(assert (=> d!22692 (= (array_inv!1214 srcBuffer!2) (bvsge (size!1359 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!13778 d!22692))

(declare-fun d!22694 () Bool)

(assert (=> d!22694 (= (inv!12 thiss!1379) (invariant!0 (currentBit!3449 thiss!1379) (currentByte!3454 thiss!1379) (size!1359 (buf!1740 thiss!1379))))))

(declare-fun bs!5444 () Bool)

(assert (= bs!5444 d!22694))

(assert (=> bs!5444 m!113227))

(assert (=> start!13778 d!22694))

(declare-fun d!22696 () Bool)

(assert (=> d!22696 (= (tail!334 lt!113567) (t!1480 lt!113567))))

(assert (=> b!70563 d!22696))

(declare-fun d!22698 () Bool)

(declare-fun e!46075 () Bool)

(assert (=> d!22698 e!46075))

(declare-fun res!58332 () Bool)

(assert (=> d!22698 (=> (not res!58332) (not e!46075))))

(declare-fun lt!113737 () (_ BitVec 64))

(assert (=> d!22698 (= res!58332 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113737 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!113737) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!22698 (= lt!113737 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!113736 () Unit!4723)

(declare-fun choose!42 (BitStream!2310 BitStream!2310 BitStream!2310 BitStream!2310 (_ BitVec 64) List!730) Unit!4723)

(assert (=> d!22698 (= lt!113736 (choose!42 (_2!3177 lt!113566) (_2!3177 lt!113566) (_1!3178 lt!113585) (_1!3178 lt!113587) (bvsub to!314 i!635) lt!113567))))

(assert (=> d!22698 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22698 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3177 lt!113566) (_2!3177 lt!113566) (_1!3178 lt!113585) (_1!3178 lt!113587) (bvsub to!314 i!635) lt!113567) lt!113736)))

(declare-fun b!70682 () Bool)

(assert (=> b!70682 (= e!46075 (= (bitStreamReadBitsIntoList!0 (_2!3177 lt!113566) (_1!3178 lt!113587) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!334 lt!113567)))))

(assert (= (and d!22698 res!58332) b!70682))

(declare-fun m!113229 () Bool)

(assert (=> d!22698 m!113229))

(declare-fun m!113231 () Bool)

(assert (=> b!70682 m!113231))

(assert (=> b!70682 m!113063))

(assert (=> b!70563 d!22698))

(declare-fun d!22700 () Bool)

(assert (=> d!22700 (= (bitAt!0 (buf!1740 (_2!3177 lt!113563)) lt!113568) (not (= (bvand ((_ sign_extend 24) (select (arr!1944 (buf!1740 (_2!3177 lt!113563))) ((_ extract 31 0) (bvsdiv lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!113568 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5445 () Bool)

(assert (= bs!5445 d!22700))

(declare-fun m!113233 () Bool)

(assert (=> bs!5445 m!113233))

(assert (=> bs!5445 m!113175))

(assert (=> b!70552 d!22700))

(declare-fun d!22702 () Bool)

(declare-datatypes ((tuple2!6140 0))(
  ( (tuple2!6141 (_1!3184 Bool) (_2!3184 BitStream!2310)) )
))
(declare-fun lt!113740 () tuple2!6140)

(declare-fun readBit!0 (BitStream!2310) tuple2!6140)

(assert (=> d!22702 (= lt!113740 (readBit!0 (_1!3178 lt!113585)))))

(assert (=> d!22702 (= (readBitPure!0 (_1!3178 lt!113585)) (tuple2!6131 (_2!3184 lt!113740) (_1!3184 lt!113740)))))

(declare-fun bs!5446 () Bool)

(assert (= bs!5446 d!22702))

(declare-fun m!113235 () Bool)

(assert (=> bs!5446 m!113235))

(assert (=> b!70553 d!22702))

(declare-fun d!22704 () Bool)

(assert (=> d!22704 (= (invariant!0 (currentBit!3449 (_2!3177 lt!113566)) (currentByte!3454 (_2!3177 lt!113566)) (size!1359 (buf!1740 (_2!3177 lt!113566)))) (and (bvsge (currentBit!3449 (_2!3177 lt!113566)) #b00000000000000000000000000000000) (bvslt (currentBit!3449 (_2!3177 lt!113566)) #b00000000000000000000000000001000) (bvsge (currentByte!3454 (_2!3177 lt!113566)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3454 (_2!3177 lt!113566)) (size!1359 (buf!1740 (_2!3177 lt!113566)))) (and (= (currentBit!3449 (_2!3177 lt!113566)) #b00000000000000000000000000000000) (= (currentByte!3454 (_2!3177 lt!113566)) (size!1359 (buf!1740 (_2!3177 lt!113566))))))))))

(assert (=> b!70564 d!22704))

(declare-fun d!22706 () Bool)

(assert (=> d!22706 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!113570) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563)))) lt!113570))))

(declare-fun bs!5447 () Bool)

(assert (= bs!5447 d!22706))

(declare-fun m!113237 () Bool)

(assert (=> bs!5447 m!113237))

(assert (=> b!70565 d!22706))

(declare-fun b!70691 () Bool)

(declare-datatypes ((tuple2!6142 0))(
  ( (tuple2!6143 (_1!3185 List!730) (_2!3185 BitStream!2310)) )
))
(declare-fun e!46080 () tuple2!6142)

(assert (=> b!70691 (= e!46080 (tuple2!6143 Nil!727 (_1!3178 lt!113587)))))

(declare-fun b!70693 () Bool)

(declare-fun e!46081 () Bool)

(declare-fun lt!113747 () List!730)

(declare-fun isEmpty!228 (List!730) Bool)

(assert (=> b!70693 (= e!46081 (isEmpty!228 lt!113747))))

(declare-fun b!70692 () Bool)

(declare-fun lt!113749 () tuple2!6140)

(declare-fun lt!113748 () (_ BitVec 64))

(assert (=> b!70692 (= e!46080 (tuple2!6143 (Cons!726 (_1!3184 lt!113749) (bitStreamReadBitsIntoList!0 (_2!3177 lt!113566) (_2!3184 lt!113749) (bvsub lt!113570 lt!113748))) (_2!3184 lt!113749)))))

(assert (=> b!70692 (= lt!113749 (readBit!0 (_1!3178 lt!113587)))))

(assert (=> b!70692 (= lt!113748 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!22708 () Bool)

(assert (=> d!22708 e!46081))

(declare-fun c!5270 () Bool)

(assert (=> d!22708 (= c!5270 (= lt!113570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22708 (= lt!113747 (_1!3185 e!46080))))

(declare-fun c!5271 () Bool)

(assert (=> d!22708 (= c!5271 (= lt!113570 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22708 (bvsge lt!113570 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22708 (= (bitStreamReadBitsIntoList!0 (_2!3177 lt!113566) (_1!3178 lt!113587) lt!113570) lt!113747)))

(declare-fun b!70694 () Bool)

(assert (=> b!70694 (= e!46081 (> (length!358 lt!113747) 0))))

(assert (= (and d!22708 c!5271) b!70691))

(assert (= (and d!22708 (not c!5271)) b!70692))

(assert (= (and d!22708 c!5270) b!70693))

(assert (= (and d!22708 (not c!5270)) b!70694))

(declare-fun m!113239 () Bool)

(assert (=> b!70693 m!113239))

(declare-fun m!113241 () Bool)

(assert (=> b!70692 m!113241))

(declare-fun m!113243 () Bool)

(assert (=> b!70692 m!113243))

(declare-fun m!113245 () Bool)

(assert (=> b!70694 m!113245))

(assert (=> b!70565 d!22708))

(declare-fun b!70705 () Bool)

(declare-fun res!58341 () Bool)

(declare-fun e!46087 () Bool)

(assert (=> b!70705 (=> (not res!58341) (not e!46087))))

(declare-fun lt!113794 () tuple2!6128)

(assert (=> b!70705 (= res!58341 (isPrefixOf!0 (_2!3178 lt!113794) (_2!3177 lt!113566)))))

(declare-fun b!70706 () Bool)

(declare-fun lt!113799 () (_ BitVec 64))

(declare-fun lt!113793 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!2310 (_ BitVec 64)) BitStream!2310)

(assert (=> b!70706 (= e!46087 (= (_1!3178 lt!113794) (withMovedBitIndex!0 (_2!3178 lt!113794) (bvsub lt!113799 lt!113793))))))

(assert (=> b!70706 (or (= (bvand lt!113799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113793 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113799 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113799 lt!113793) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70706 (= lt!113793 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113566))) (currentByte!3454 (_2!3177 lt!113566)) (currentBit!3449 (_2!3177 lt!113566))))))

(assert (=> b!70706 (= lt!113799 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(declare-fun b!70707 () Bool)

(declare-fun res!58339 () Bool)

(assert (=> b!70707 (=> (not res!58339) (not e!46087))))

(assert (=> b!70707 (= res!58339 (isPrefixOf!0 (_1!3178 lt!113794) thiss!1379))))

(declare-fun b!70708 () Bool)

(declare-fun e!46086 () Unit!4723)

(declare-fun lt!113807 () Unit!4723)

(assert (=> b!70708 (= e!46086 lt!113807)))

(declare-fun lt!113806 () (_ BitVec 64))

(assert (=> b!70708 (= lt!113806 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113805 () (_ BitVec 64))

(assert (=> b!70708 (= lt!113805 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!2919 array!2919 (_ BitVec 64) (_ BitVec 64)) Unit!4723)

(assert (=> b!70708 (= lt!113807 (arrayBitRangesEqSymmetric!0 (buf!1740 thiss!1379) (buf!1740 (_2!3177 lt!113566)) lt!113806 lt!113805))))

(assert (=> b!70708 (arrayBitRangesEq!0 (buf!1740 (_2!3177 lt!113566)) (buf!1740 thiss!1379) lt!113806 lt!113805)))

(declare-fun d!22710 () Bool)

(assert (=> d!22710 e!46087))

(declare-fun res!58340 () Bool)

(assert (=> d!22710 (=> (not res!58340) (not e!46087))))

(assert (=> d!22710 (= res!58340 (isPrefixOf!0 (_1!3178 lt!113794) (_2!3178 lt!113794)))))

(declare-fun lt!113798 () BitStream!2310)

(assert (=> d!22710 (= lt!113794 (tuple2!6129 lt!113798 (_2!3177 lt!113566)))))

(declare-fun lt!113804 () Unit!4723)

(declare-fun lt!113800 () Unit!4723)

(assert (=> d!22710 (= lt!113804 lt!113800)))

(assert (=> d!22710 (isPrefixOf!0 lt!113798 (_2!3177 lt!113566))))

(assert (=> d!22710 (= lt!113800 (lemmaIsPrefixTransitive!0 lt!113798 (_2!3177 lt!113566) (_2!3177 lt!113566)))))

(declare-fun lt!113808 () Unit!4723)

(declare-fun lt!113790 () Unit!4723)

(assert (=> d!22710 (= lt!113808 lt!113790)))

(assert (=> d!22710 (isPrefixOf!0 lt!113798 (_2!3177 lt!113566))))

(assert (=> d!22710 (= lt!113790 (lemmaIsPrefixTransitive!0 lt!113798 thiss!1379 (_2!3177 lt!113566)))))

(declare-fun lt!113803 () Unit!4723)

(assert (=> d!22710 (= lt!113803 e!46086)))

(declare-fun c!5274 () Bool)

(assert (=> d!22710 (= c!5274 (not (= (size!1359 (buf!1740 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!113802 () Unit!4723)

(declare-fun lt!113796 () Unit!4723)

(assert (=> d!22710 (= lt!113802 lt!113796)))

(assert (=> d!22710 (isPrefixOf!0 (_2!3177 lt!113566) (_2!3177 lt!113566))))

(assert (=> d!22710 (= lt!113796 (lemmaIsPrefixRefl!0 (_2!3177 lt!113566)))))

(declare-fun lt!113795 () Unit!4723)

(declare-fun lt!113791 () Unit!4723)

(assert (=> d!22710 (= lt!113795 lt!113791)))

(assert (=> d!22710 (= lt!113791 (lemmaIsPrefixRefl!0 (_2!3177 lt!113566)))))

(declare-fun lt!113797 () Unit!4723)

(declare-fun lt!113792 () Unit!4723)

(assert (=> d!22710 (= lt!113797 lt!113792)))

(assert (=> d!22710 (isPrefixOf!0 lt!113798 lt!113798)))

(assert (=> d!22710 (= lt!113792 (lemmaIsPrefixRefl!0 lt!113798))))

(declare-fun lt!113801 () Unit!4723)

(declare-fun lt!113809 () Unit!4723)

(assert (=> d!22710 (= lt!113801 lt!113809)))

(assert (=> d!22710 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22710 (= lt!113809 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22710 (= lt!113798 (BitStream!2311 (buf!1740 (_2!3177 lt!113566)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(assert (=> d!22710 (isPrefixOf!0 thiss!1379 (_2!3177 lt!113566))))

(assert (=> d!22710 (= (reader!0 thiss!1379 (_2!3177 lt!113566)) lt!113794)))

(declare-fun b!70709 () Bool)

(declare-fun Unit!4727 () Unit!4723)

(assert (=> b!70709 (= e!46086 Unit!4727)))

(assert (= (and d!22710 c!5274) b!70708))

(assert (= (and d!22710 (not c!5274)) b!70709))

(assert (= (and d!22710 res!58340) b!70707))

(assert (= (and b!70707 res!58339) b!70705))

(assert (= (and b!70705 res!58341) b!70706))

(declare-fun m!113247 () Bool)

(assert (=> b!70707 m!113247))

(declare-fun m!113249 () Bool)

(assert (=> b!70706 m!113249))

(assert (=> b!70706 m!113041))

(assert (=> b!70706 m!113019))

(assert (=> b!70708 m!113019))

(declare-fun m!113251 () Bool)

(assert (=> b!70708 m!113251))

(declare-fun m!113253 () Bool)

(assert (=> b!70708 m!113253))

(declare-fun m!113255 () Bool)

(assert (=> b!70705 m!113255))

(declare-fun m!113257 () Bool)

(assert (=> d!22710 m!113257))

(declare-fun m!113259 () Bool)

(assert (=> d!22710 m!113259))

(assert (=> d!22710 m!113017))

(assert (=> d!22710 m!113035))

(declare-fun m!113261 () Bool)

(assert (=> d!22710 m!113261))

(declare-fun m!113263 () Bool)

(assert (=> d!22710 m!113263))

(declare-fun m!113265 () Bool)

(assert (=> d!22710 m!113265))

(declare-fun m!113267 () Bool)

(assert (=> d!22710 m!113267))

(declare-fun m!113269 () Bool)

(assert (=> d!22710 m!113269))

(assert (=> d!22710 m!113015))

(declare-fun m!113271 () Bool)

(assert (=> d!22710 m!113271))

(assert (=> b!70565 d!22710))

(declare-fun b!70710 () Bool)

(declare-fun e!46088 () tuple2!6142)

(assert (=> b!70710 (= e!46088 (tuple2!6143 Nil!727 (_1!3178 lt!113585)))))

(declare-fun b!70712 () Bool)

(declare-fun e!46089 () Bool)

(declare-fun lt!113810 () List!730)

(assert (=> b!70712 (= e!46089 (isEmpty!228 lt!113810))))

(declare-fun b!70711 () Bool)

(declare-fun lt!113812 () tuple2!6140)

(declare-fun lt!113811 () (_ BitVec 64))

(assert (=> b!70711 (= e!46088 (tuple2!6143 (Cons!726 (_1!3184 lt!113812) (bitStreamReadBitsIntoList!0 (_2!3177 lt!113566) (_2!3184 lt!113812) (bvsub (bvsub to!314 i!635) lt!113811))) (_2!3184 lt!113812)))))

(assert (=> b!70711 (= lt!113812 (readBit!0 (_1!3178 lt!113585)))))

(assert (=> b!70711 (= lt!113811 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!22712 () Bool)

(assert (=> d!22712 e!46089))

(declare-fun c!5275 () Bool)

(assert (=> d!22712 (= c!5275 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22712 (= lt!113810 (_1!3185 e!46088))))

(declare-fun c!5276 () Bool)

(assert (=> d!22712 (= c!5276 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22712 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22712 (= (bitStreamReadBitsIntoList!0 (_2!3177 lt!113566) (_1!3178 lt!113585) (bvsub to!314 i!635)) lt!113810)))

(declare-fun b!70713 () Bool)

(assert (=> b!70713 (= e!46089 (> (length!358 lt!113810) 0))))

(assert (= (and d!22712 c!5276) b!70710))

(assert (= (and d!22712 (not c!5276)) b!70711))

(assert (= (and d!22712 c!5275) b!70712))

(assert (= (and d!22712 (not c!5275)) b!70713))

(declare-fun m!113273 () Bool)

(assert (=> b!70712 m!113273))

(declare-fun m!113275 () Bool)

(assert (=> b!70711 m!113275))

(assert (=> b!70711 m!113235))

(declare-fun m!113277 () Bool)

(assert (=> b!70713 m!113277))

(assert (=> b!70565 d!22712))

(declare-fun d!22714 () Bool)

(assert (=> d!22714 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!113815 () Unit!4723)

(declare-fun choose!9 (BitStream!2310 array!2919 (_ BitVec 64) BitStream!2310) Unit!4723)

(assert (=> d!22714 (= lt!113815 (choose!9 thiss!1379 (buf!1740 (_2!3177 lt!113566)) (bvsub to!314 i!635) (BitStream!2311 (buf!1740 (_2!3177 lt!113566)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379))))))

(assert (=> d!22714 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1740 (_2!3177 lt!113566)) (bvsub to!314 i!635)) lt!113815)))

(declare-fun bs!5448 () Bool)

(assert (= bs!5448 d!22714))

(assert (=> bs!5448 m!113043))

(declare-fun m!113279 () Bool)

(assert (=> bs!5448 m!113279))

(assert (=> b!70565 d!22714))

(declare-fun d!22716 () Bool)

(assert (=> d!22716 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!113570)))

(declare-fun lt!113816 () Unit!4723)

(assert (=> d!22716 (= lt!113816 (choose!9 (_2!3177 lt!113563) (buf!1740 (_2!3177 lt!113566)) lt!113570 (BitStream!2311 (buf!1740 (_2!3177 lt!113566)) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563)))))))

(assert (=> d!22716 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3177 lt!113563) (buf!1740 (_2!3177 lt!113566)) lt!113570) lt!113816)))

(declare-fun bs!5449 () Bool)

(assert (= bs!5449 d!22716))

(assert (=> bs!5449 m!113049))

(declare-fun m!113281 () Bool)

(assert (=> bs!5449 m!113281))

(assert (=> b!70565 d!22716))

(declare-fun d!22718 () Bool)

(assert (=> d!22718 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5450 () Bool)

(assert (= bs!5450 d!22718))

(declare-fun m!113283 () Bool)

(assert (=> bs!5450 m!113283))

(assert (=> b!70565 d!22718))

(declare-fun b!70714 () Bool)

(declare-fun res!58344 () Bool)

(declare-fun e!46091 () Bool)

(assert (=> b!70714 (=> (not res!58344) (not e!46091))))

(declare-fun lt!113821 () tuple2!6128)

(assert (=> b!70714 (= res!58344 (isPrefixOf!0 (_2!3178 lt!113821) (_2!3177 lt!113566)))))

(declare-fun b!70715 () Bool)

(declare-fun lt!113826 () (_ BitVec 64))

(declare-fun lt!113820 () (_ BitVec 64))

(assert (=> b!70715 (= e!46091 (= (_1!3178 lt!113821) (withMovedBitIndex!0 (_2!3178 lt!113821) (bvsub lt!113826 lt!113820))))))

(assert (=> b!70715 (or (= (bvand lt!113826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113826 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113826 lt!113820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70715 (= lt!113820 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113566))) (currentByte!3454 (_2!3177 lt!113566)) (currentBit!3449 (_2!3177 lt!113566))))))

(assert (=> b!70715 (= lt!113826 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))))))

(declare-fun b!70716 () Bool)

(declare-fun res!58342 () Bool)

(assert (=> b!70716 (=> (not res!58342) (not e!46091))))

(assert (=> b!70716 (= res!58342 (isPrefixOf!0 (_1!3178 lt!113821) (_2!3177 lt!113563)))))

(declare-fun b!70717 () Bool)

(declare-fun e!46090 () Unit!4723)

(declare-fun lt!113834 () Unit!4723)

(assert (=> b!70717 (= e!46090 lt!113834)))

(declare-fun lt!113833 () (_ BitVec 64))

(assert (=> b!70717 (= lt!113833 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113832 () (_ BitVec 64))

(assert (=> b!70717 (= lt!113832 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))))))

(assert (=> b!70717 (= lt!113834 (arrayBitRangesEqSymmetric!0 (buf!1740 (_2!3177 lt!113563)) (buf!1740 (_2!3177 lt!113566)) lt!113833 lt!113832))))

(assert (=> b!70717 (arrayBitRangesEq!0 (buf!1740 (_2!3177 lt!113566)) (buf!1740 (_2!3177 lt!113563)) lt!113833 lt!113832)))

(declare-fun d!22720 () Bool)

(assert (=> d!22720 e!46091))

(declare-fun res!58343 () Bool)

(assert (=> d!22720 (=> (not res!58343) (not e!46091))))

(assert (=> d!22720 (= res!58343 (isPrefixOf!0 (_1!3178 lt!113821) (_2!3178 lt!113821)))))

(declare-fun lt!113825 () BitStream!2310)

(assert (=> d!22720 (= lt!113821 (tuple2!6129 lt!113825 (_2!3177 lt!113566)))))

(declare-fun lt!113831 () Unit!4723)

(declare-fun lt!113827 () Unit!4723)

(assert (=> d!22720 (= lt!113831 lt!113827)))

(assert (=> d!22720 (isPrefixOf!0 lt!113825 (_2!3177 lt!113566))))

(assert (=> d!22720 (= lt!113827 (lemmaIsPrefixTransitive!0 lt!113825 (_2!3177 lt!113566) (_2!3177 lt!113566)))))

(declare-fun lt!113835 () Unit!4723)

(declare-fun lt!113817 () Unit!4723)

(assert (=> d!22720 (= lt!113835 lt!113817)))

(assert (=> d!22720 (isPrefixOf!0 lt!113825 (_2!3177 lt!113566))))

(assert (=> d!22720 (= lt!113817 (lemmaIsPrefixTransitive!0 lt!113825 (_2!3177 lt!113563) (_2!3177 lt!113566)))))

(declare-fun lt!113830 () Unit!4723)

(assert (=> d!22720 (= lt!113830 e!46090)))

(declare-fun c!5277 () Bool)

(assert (=> d!22720 (= c!5277 (not (= (size!1359 (buf!1740 (_2!3177 lt!113563))) #b00000000000000000000000000000000)))))

(declare-fun lt!113829 () Unit!4723)

(declare-fun lt!113823 () Unit!4723)

(assert (=> d!22720 (= lt!113829 lt!113823)))

(assert (=> d!22720 (isPrefixOf!0 (_2!3177 lt!113566) (_2!3177 lt!113566))))

(assert (=> d!22720 (= lt!113823 (lemmaIsPrefixRefl!0 (_2!3177 lt!113566)))))

(declare-fun lt!113822 () Unit!4723)

(declare-fun lt!113818 () Unit!4723)

(assert (=> d!22720 (= lt!113822 lt!113818)))

(assert (=> d!22720 (= lt!113818 (lemmaIsPrefixRefl!0 (_2!3177 lt!113566)))))

(declare-fun lt!113824 () Unit!4723)

(declare-fun lt!113819 () Unit!4723)

(assert (=> d!22720 (= lt!113824 lt!113819)))

(assert (=> d!22720 (isPrefixOf!0 lt!113825 lt!113825)))

(assert (=> d!22720 (= lt!113819 (lemmaIsPrefixRefl!0 lt!113825))))

(declare-fun lt!113828 () Unit!4723)

(declare-fun lt!113836 () Unit!4723)

(assert (=> d!22720 (= lt!113828 lt!113836)))

(assert (=> d!22720 (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!113563))))

(assert (=> d!22720 (= lt!113836 (lemmaIsPrefixRefl!0 (_2!3177 lt!113563)))))

(assert (=> d!22720 (= lt!113825 (BitStream!2311 (buf!1740 (_2!3177 lt!113566)) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))))))

(assert (=> d!22720 (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!113566))))

(assert (=> d!22720 (= (reader!0 (_2!3177 lt!113563) (_2!3177 lt!113566)) lt!113821)))

(declare-fun b!70718 () Bool)

(declare-fun Unit!4728 () Unit!4723)

(assert (=> b!70718 (= e!46090 Unit!4728)))

(assert (= (and d!22720 c!5277) b!70717))

(assert (= (and d!22720 (not c!5277)) b!70718))

(assert (= (and d!22720 res!58343) b!70716))

(assert (= (and b!70716 res!58342) b!70714))

(assert (= (and b!70714 res!58344) b!70715))

(declare-fun m!113285 () Bool)

(assert (=> b!70716 m!113285))

(declare-fun m!113287 () Bool)

(assert (=> b!70715 m!113287))

(assert (=> b!70715 m!113041))

(assert (=> b!70715 m!112999))

(assert (=> b!70717 m!112999))

(declare-fun m!113289 () Bool)

(assert (=> b!70717 m!113289))

(declare-fun m!113291 () Bool)

(assert (=> b!70717 m!113291))

(declare-fun m!113293 () Bool)

(assert (=> b!70714 m!113293))

(declare-fun m!113295 () Bool)

(assert (=> d!22720 m!113295))

(declare-fun m!113297 () Bool)

(assert (=> d!22720 m!113297))

(declare-fun m!113299 () Bool)

(assert (=> d!22720 m!113299))

(assert (=> d!22720 m!113027))

(declare-fun m!113301 () Bool)

(assert (=> d!22720 m!113301))

(assert (=> d!22720 m!113263))

(assert (=> d!22720 m!113265))

(declare-fun m!113303 () Bool)

(assert (=> d!22720 m!113303))

(declare-fun m!113305 () Bool)

(assert (=> d!22720 m!113305))

(declare-fun m!113307 () Bool)

(assert (=> d!22720 m!113307))

(declare-fun m!113309 () Bool)

(assert (=> d!22720 m!113309))

(assert (=> b!70565 d!22720))

(declare-fun d!22722 () Bool)

(assert (=> d!22722 (= (head!549 lt!113567) (h!845 lt!113567))))

(assert (=> b!70554 d!22722))

(declare-fun d!22724 () Bool)

(declare-fun res!58345 () Bool)

(declare-fun e!46093 () Bool)

(assert (=> d!22724 (=> (not res!58345) (not e!46093))))

(assert (=> d!22724 (= res!58345 (= (size!1359 (buf!1740 thiss!1379)) (size!1359 (buf!1740 (_2!3177 lt!113566)))))))

(assert (=> d!22724 (= (isPrefixOf!0 thiss!1379 (_2!3177 lt!113566)) e!46093)))

(declare-fun b!70719 () Bool)

(declare-fun res!58346 () Bool)

(assert (=> b!70719 (=> (not res!58346) (not e!46093))))

(assert (=> b!70719 (= res!58346 (bvsle (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)) (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113566))) (currentByte!3454 (_2!3177 lt!113566)) (currentBit!3449 (_2!3177 lt!113566)))))))

(declare-fun b!70720 () Bool)

(declare-fun e!46092 () Bool)

(assert (=> b!70720 (= e!46093 e!46092)))

(declare-fun res!58347 () Bool)

(assert (=> b!70720 (=> res!58347 e!46092)))

(assert (=> b!70720 (= res!58347 (= (size!1359 (buf!1740 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!70721 () Bool)

(assert (=> b!70721 (= e!46092 (arrayBitRangesEq!0 (buf!1740 thiss!1379) (buf!1740 (_2!3177 lt!113566)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379))))))

(assert (= (and d!22724 res!58345) b!70719))

(assert (= (and b!70719 res!58346) b!70720))

(assert (= (and b!70720 (not res!58347)) b!70721))

(assert (=> b!70719 m!113019))

(assert (=> b!70719 m!113041))

(assert (=> b!70721 m!113019))

(assert (=> b!70721 m!113019))

(declare-fun m!113311 () Bool)

(assert (=> b!70721 m!113311))

(assert (=> b!70555 d!22724))

(declare-fun d!22726 () Bool)

(declare-fun res!58348 () Bool)

(declare-fun e!46095 () Bool)

(assert (=> d!22726 (=> (not res!58348) (not e!46095))))

(assert (=> d!22726 (= res!58348 (= (size!1359 (buf!1740 (_2!3177 lt!113563))) (size!1359 (buf!1740 (_2!3177 lt!113566)))))))

(assert (=> d!22726 (= (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!113566)) e!46095)))

(declare-fun b!70722 () Bool)

(declare-fun res!58349 () Bool)

(assert (=> b!70722 (=> (not res!58349) (not e!46095))))

(assert (=> b!70722 (= res!58349 (bvsle (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))) (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113566))) (currentByte!3454 (_2!3177 lt!113566)) (currentBit!3449 (_2!3177 lt!113566)))))))

(declare-fun b!70723 () Bool)

(declare-fun e!46094 () Bool)

(assert (=> b!70723 (= e!46095 e!46094)))

(declare-fun res!58350 () Bool)

(assert (=> b!70723 (=> res!58350 e!46094)))

(assert (=> b!70723 (= res!58350 (= (size!1359 (buf!1740 (_2!3177 lt!113563))) #b00000000000000000000000000000000))))

(declare-fun b!70724 () Bool)

(assert (=> b!70724 (= e!46094 (arrayBitRangesEq!0 (buf!1740 (_2!3177 lt!113563)) (buf!1740 (_2!3177 lt!113566)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563)))))))

(assert (= (and d!22726 res!58348) b!70722))

(assert (= (and b!70722 res!58349) b!70723))

(assert (= (and b!70723 (not res!58350)) b!70724))

(assert (=> b!70722 m!112999))

(assert (=> b!70722 m!113041))

(assert (=> b!70724 m!112999))

(assert (=> b!70724 m!112999))

(declare-fun m!113313 () Bool)

(assert (=> b!70724 m!113313))

(assert (=> b!70555 d!22726))

(declare-fun d!22728 () Bool)

(assert (=> d!22728 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!5451 () Bool)

(assert (= bs!5451 d!22728))

(declare-fun m!113315 () Bool)

(assert (=> bs!5451 m!113315))

(assert (=> b!70555 d!22728))

(declare-fun b!70725 () Bool)

(declare-fun res!58353 () Bool)

(declare-fun e!46097 () Bool)

(assert (=> b!70725 (=> (not res!58353) (not e!46097))))

(declare-fun lt!113841 () tuple2!6128)

(assert (=> b!70725 (= res!58353 (isPrefixOf!0 (_2!3178 lt!113841) (_2!3177 lt!113563)))))

(declare-fun lt!113846 () (_ BitVec 64))

(declare-fun b!70726 () Bool)

(declare-fun lt!113840 () (_ BitVec 64))

(assert (=> b!70726 (= e!46097 (= (_1!3178 lt!113841) (withMovedBitIndex!0 (_2!3178 lt!113841) (bvsub lt!113846 lt!113840))))))

(assert (=> b!70726 (or (= (bvand lt!113846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!113840 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!113846 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!113846 lt!113840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70726 (= lt!113840 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))))))

(assert (=> b!70726 (= lt!113846 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(declare-fun b!70727 () Bool)

(declare-fun res!58351 () Bool)

(assert (=> b!70727 (=> (not res!58351) (not e!46097))))

(assert (=> b!70727 (= res!58351 (isPrefixOf!0 (_1!3178 lt!113841) thiss!1379))))

(declare-fun b!70728 () Bool)

(declare-fun e!46096 () Unit!4723)

(declare-fun lt!113854 () Unit!4723)

(assert (=> b!70728 (= e!46096 lt!113854)))

(declare-fun lt!113853 () (_ BitVec 64))

(assert (=> b!70728 (= lt!113853 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!113852 () (_ BitVec 64))

(assert (=> b!70728 (= lt!113852 (bitIndex!0 (size!1359 (buf!1740 thiss!1379)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(assert (=> b!70728 (= lt!113854 (arrayBitRangesEqSymmetric!0 (buf!1740 thiss!1379) (buf!1740 (_2!3177 lt!113563)) lt!113853 lt!113852))))

(assert (=> b!70728 (arrayBitRangesEq!0 (buf!1740 (_2!3177 lt!113563)) (buf!1740 thiss!1379) lt!113853 lt!113852)))

(declare-fun d!22730 () Bool)

(assert (=> d!22730 e!46097))

(declare-fun res!58352 () Bool)

(assert (=> d!22730 (=> (not res!58352) (not e!46097))))

(assert (=> d!22730 (= res!58352 (isPrefixOf!0 (_1!3178 lt!113841) (_2!3178 lt!113841)))))

(declare-fun lt!113845 () BitStream!2310)

(assert (=> d!22730 (= lt!113841 (tuple2!6129 lt!113845 (_2!3177 lt!113563)))))

(declare-fun lt!113851 () Unit!4723)

(declare-fun lt!113847 () Unit!4723)

(assert (=> d!22730 (= lt!113851 lt!113847)))

(assert (=> d!22730 (isPrefixOf!0 lt!113845 (_2!3177 lt!113563))))

(assert (=> d!22730 (= lt!113847 (lemmaIsPrefixTransitive!0 lt!113845 (_2!3177 lt!113563) (_2!3177 lt!113563)))))

(declare-fun lt!113855 () Unit!4723)

(declare-fun lt!113837 () Unit!4723)

(assert (=> d!22730 (= lt!113855 lt!113837)))

(assert (=> d!22730 (isPrefixOf!0 lt!113845 (_2!3177 lt!113563))))

(assert (=> d!22730 (= lt!113837 (lemmaIsPrefixTransitive!0 lt!113845 thiss!1379 (_2!3177 lt!113563)))))

(declare-fun lt!113850 () Unit!4723)

(assert (=> d!22730 (= lt!113850 e!46096)))

(declare-fun c!5278 () Bool)

(assert (=> d!22730 (= c!5278 (not (= (size!1359 (buf!1740 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!113849 () Unit!4723)

(declare-fun lt!113843 () Unit!4723)

(assert (=> d!22730 (= lt!113849 lt!113843)))

(assert (=> d!22730 (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!113563))))

(assert (=> d!22730 (= lt!113843 (lemmaIsPrefixRefl!0 (_2!3177 lt!113563)))))

(declare-fun lt!113842 () Unit!4723)

(declare-fun lt!113838 () Unit!4723)

(assert (=> d!22730 (= lt!113842 lt!113838)))

(assert (=> d!22730 (= lt!113838 (lemmaIsPrefixRefl!0 (_2!3177 lt!113563)))))

(declare-fun lt!113844 () Unit!4723)

(declare-fun lt!113839 () Unit!4723)

(assert (=> d!22730 (= lt!113844 lt!113839)))

(assert (=> d!22730 (isPrefixOf!0 lt!113845 lt!113845)))

(assert (=> d!22730 (= lt!113839 (lemmaIsPrefixRefl!0 lt!113845))))

(declare-fun lt!113848 () Unit!4723)

(declare-fun lt!113856 () Unit!4723)

(assert (=> d!22730 (= lt!113848 lt!113856)))

(assert (=> d!22730 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!22730 (= lt!113856 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!22730 (= lt!113845 (BitStream!2311 (buf!1740 (_2!3177 lt!113563)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379)))))

(assert (=> d!22730 (isPrefixOf!0 thiss!1379 (_2!3177 lt!113563))))

(assert (=> d!22730 (= (reader!0 thiss!1379 (_2!3177 lt!113563)) lt!113841)))

(declare-fun b!70729 () Bool)

(declare-fun Unit!4729 () Unit!4723)

(assert (=> b!70729 (= e!46096 Unit!4729)))

(assert (= (and d!22730 c!5278) b!70728))

(assert (= (and d!22730 (not c!5278)) b!70729))

(assert (= (and d!22730 res!58352) b!70727))

(assert (= (and b!70727 res!58351) b!70725))

(assert (= (and b!70725 res!58353) b!70726))

(declare-fun m!113317 () Bool)

(assert (=> b!70727 m!113317))

(declare-fun m!113319 () Bool)

(assert (=> b!70726 m!113319))

(assert (=> b!70726 m!112999))

(assert (=> b!70726 m!113019))

(assert (=> b!70728 m!113019))

(declare-fun m!113321 () Bool)

(assert (=> b!70728 m!113321))

(declare-fun m!113323 () Bool)

(assert (=> b!70728 m!113323))

(declare-fun m!113325 () Bool)

(assert (=> b!70725 m!113325))

(declare-fun m!113327 () Bool)

(assert (=> d!22730 m!113327))

(declare-fun m!113329 () Bool)

(assert (=> d!22730 m!113329))

(assert (=> d!22730 m!113017))

(assert (=> d!22730 m!113013))

(declare-fun m!113331 () Bool)

(assert (=> d!22730 m!113331))

(assert (=> d!22730 m!113299))

(assert (=> d!22730 m!113307))

(declare-fun m!113333 () Bool)

(assert (=> d!22730 m!113333))

(declare-fun m!113335 () Bool)

(assert (=> d!22730 m!113335))

(assert (=> d!22730 m!113015))

(declare-fun m!113337 () Bool)

(assert (=> d!22730 m!113337))

(assert (=> b!70555 d!22730))

(declare-fun b!70949 () Bool)

(declare-fun res!58500 () Bool)

(declare-fun e!46212 () Bool)

(assert (=> b!70949 (=> (not res!58500) (not e!46212))))

(declare-fun lt!114336 () tuple2!6126)

(assert (=> b!70949 (= res!58500 (= (size!1359 (buf!1740 (_2!3177 lt!113563))) (size!1359 (buf!1740 (_2!3177 lt!114336)))))))

(declare-fun b!70950 () Bool)

(declare-fun res!58497 () Bool)

(assert (=> b!70950 (=> (not res!58497) (not e!46212))))

(assert (=> b!70950 (= res!58497 (invariant!0 (currentBit!3449 (_2!3177 lt!114336)) (currentByte!3454 (_2!3177 lt!114336)) (size!1359 (buf!1740 (_2!3177 lt!114336)))))))

(declare-fun b!70951 () Bool)

(declare-fun e!46211 () tuple2!6126)

(declare-fun Unit!4730 () Unit!4723)

(assert (=> b!70951 (= e!46211 (tuple2!6127 Unit!4730 (_2!3177 lt!113563)))))

(assert (=> b!70951 (= (size!1359 (buf!1740 (_2!3177 lt!113563))) (size!1359 (buf!1740 (_2!3177 lt!113563))))))

(declare-fun lt!114324 () Unit!4723)

(declare-fun Unit!4731 () Unit!4723)

(assert (=> b!70951 (= lt!114324 Unit!4731)))

(declare-fun call!919 () tuple2!6128)

(declare-fun checkByteArrayBitContent!0 (BitStream!2310 array!2919 array!2919 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!70951 (checkByteArrayBitContent!0 (_2!3177 lt!113563) srcBuffer!2 (_1!3183 (readBits!0 (_1!3178 call!919) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!70953 () Bool)

(declare-fun res!58495 () Bool)

(assert (=> b!70953 (=> (not res!58495) (not e!46212))))

(assert (=> b!70953 (= res!58495 (= (size!1359 (buf!1740 (_2!3177 lt!114336))) (size!1359 (buf!1740 (_2!3177 lt!113563)))))))

(declare-fun lt!114354 () tuple2!6128)

(declare-fun b!70954 () Bool)

(assert (=> b!70954 (= e!46212 (= (bitStreamReadBitsIntoList!0 (_2!3177 lt!114336) (_1!3178 lt!114354) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!3177 lt!114336) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!70954 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70954 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!114350 () Unit!4723)

(declare-fun lt!114322 () Unit!4723)

(assert (=> b!70954 (= lt!114350 lt!114322)))

(declare-fun lt!114342 () (_ BitVec 64))

(assert (=> b!70954 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!114336)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!114342)))

(assert (=> b!70954 (= lt!114322 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3177 lt!113563) (buf!1740 (_2!3177 lt!114336)) lt!114342))))

(declare-fun e!46210 () Bool)

(assert (=> b!70954 e!46210))

(declare-fun res!58499 () Bool)

(assert (=> b!70954 (=> (not res!58499) (not e!46210))))

(assert (=> b!70954 (= res!58499 (and (= (size!1359 (buf!1740 (_2!3177 lt!113563))) (size!1359 (buf!1740 (_2!3177 lt!114336)))) (bvsge lt!114342 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70954 (= lt!114342 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!70954 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!70954 (= lt!114354 (reader!0 (_2!3177 lt!113563) (_2!3177 lt!114336)))))

(declare-fun b!70955 () Bool)

(declare-fun res!58498 () Bool)

(assert (=> b!70955 (=> (not res!58498) (not e!46212))))

(assert (=> b!70955 (= res!58498 (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!114336)))))

(declare-fun c!5317 () Bool)

(declare-fun lt!114348 () tuple2!6126)

(declare-fun lt!114362 () tuple2!6126)

(declare-fun bm!916 () Bool)

(assert (=> bm!916 (= call!919 (reader!0 (ite c!5317 (_2!3177 lt!114362) (_2!3177 lt!113563)) (ite c!5317 (_2!3177 lt!114348) (_2!3177 lt!113563))))))

(declare-fun b!70956 () Bool)

(assert (=> b!70956 (= e!46210 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!114342))))

(declare-fun b!70952 () Bool)

(declare-fun Unit!4732 () Unit!4723)

(assert (=> b!70952 (= e!46211 (tuple2!6127 Unit!4732 (_2!3177 lt!114348)))))

(assert (=> b!70952 (= lt!114362 (appendBitFromByte!0 (_2!3177 lt!113563) (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!114335 () (_ BitVec 64))

(assert (=> b!70952 (= lt!114335 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114359 () (_ BitVec 64))

(assert (=> b!70952 (= lt!114359 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114360 () Unit!4723)

(assert (=> b!70952 (= lt!114360 (validateOffsetBitsIneqLemma!0 (_2!3177 lt!113563) (_2!3177 lt!114362) lt!114335 lt!114359))))

(assert (=> b!70952 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!114362)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!114362))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!114362))) (bvsub lt!114335 lt!114359))))

(declare-fun lt!114329 () Unit!4723)

(assert (=> b!70952 (= lt!114329 lt!114360)))

(declare-fun lt!114363 () tuple2!6128)

(assert (=> b!70952 (= lt!114363 (reader!0 (_2!3177 lt!113563) (_2!3177 lt!114362)))))

(declare-fun lt!114356 () (_ BitVec 64))

(assert (=> b!70952 (= lt!114356 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114340 () Unit!4723)

(assert (=> b!70952 (= lt!114340 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3177 lt!113563) (buf!1740 (_2!3177 lt!114362)) lt!114356))))

(assert (=> b!70952 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!114362)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!114356)))

(declare-fun lt!114347 () Unit!4723)

(assert (=> b!70952 (= lt!114347 lt!114340)))

(assert (=> b!70952 (= (head!549 (byteArrayBitContentToList!0 (_2!3177 lt!114362) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!549 (bitStreamReadBitsIntoList!0 (_2!3177 lt!114362) (_1!3178 lt!114363) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114325 () Unit!4723)

(declare-fun Unit!4733 () Unit!4723)

(assert (=> b!70952 (= lt!114325 Unit!4733)))

(assert (=> b!70952 (= lt!114348 (appendBitsMSBFirstLoop!0 (_2!3177 lt!114362) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!114343 () Unit!4723)

(assert (=> b!70952 (= lt!114343 (lemmaIsPrefixTransitive!0 (_2!3177 lt!113563) (_2!3177 lt!114362) (_2!3177 lt!114348)))))

(assert (=> b!70952 (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!114348))))

(declare-fun lt!114328 () Unit!4723)

(assert (=> b!70952 (= lt!114328 lt!114343)))

(assert (=> b!70952 (= (size!1359 (buf!1740 (_2!3177 lt!114348))) (size!1359 (buf!1740 (_2!3177 lt!113563))))))

(declare-fun lt!114353 () Unit!4723)

(declare-fun Unit!4734 () Unit!4723)

(assert (=> b!70952 (= lt!114353 Unit!4734)))

(assert (=> b!70952 (= (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!114348))) (currentByte!3454 (_2!3177 lt!114348)) (currentBit!3449 (_2!3177 lt!114348))) (bvsub (bvadd (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114327 () Unit!4723)

(declare-fun Unit!4735 () Unit!4723)

(assert (=> b!70952 (= lt!114327 Unit!4735)))

(assert (=> b!70952 (= (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!114348))) (currentByte!3454 (_2!3177 lt!114348)) (currentBit!3449 (_2!3177 lt!114348))) (bvsub (bvsub (bvadd (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!114362))) (currentByte!3454 (_2!3177 lt!114362)) (currentBit!3449 (_2!3177 lt!114362))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114338 () Unit!4723)

(declare-fun Unit!4736 () Unit!4723)

(assert (=> b!70952 (= lt!114338 Unit!4736)))

(declare-fun lt!114333 () tuple2!6128)

(assert (=> b!70952 (= lt!114333 (reader!0 (_2!3177 lt!113563) (_2!3177 lt!114348)))))

(declare-fun lt!114323 () (_ BitVec 64))

(assert (=> b!70952 (= lt!114323 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114345 () Unit!4723)

(assert (=> b!70952 (= lt!114345 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3177 lt!113563) (buf!1740 (_2!3177 lt!114348)) lt!114323))))

(assert (=> b!70952 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!114348)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563))) lt!114323)))

(declare-fun lt!114326 () Unit!4723)

(assert (=> b!70952 (= lt!114326 lt!114345)))

(declare-fun lt!114344 () tuple2!6128)

(assert (=> b!70952 (= lt!114344 call!919)))

(declare-fun lt!114361 () (_ BitVec 64))

(assert (=> b!70952 (= lt!114361 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!114320 () Unit!4723)

(assert (=> b!70952 (= lt!114320 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!3177 lt!114362) (buf!1740 (_2!3177 lt!114348)) lt!114361))))

(assert (=> b!70952 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!114348)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!114362))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!114362))) lt!114361)))

(declare-fun lt!114351 () Unit!4723)

(assert (=> b!70952 (= lt!114351 lt!114320)))

(declare-fun lt!114358 () List!730)

(assert (=> b!70952 (= lt!114358 (byteArrayBitContentToList!0 (_2!3177 lt!114348) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!114332 () List!730)

(assert (=> b!70952 (= lt!114332 (byteArrayBitContentToList!0 (_2!3177 lt!114348) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114352 () List!730)

(assert (=> b!70952 (= lt!114352 (bitStreamReadBitsIntoList!0 (_2!3177 lt!114348) (_1!3178 lt!114333) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!114346 () List!730)

(assert (=> b!70952 (= lt!114346 (bitStreamReadBitsIntoList!0 (_2!3177 lt!114348) (_1!3178 lt!114344) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!114355 () (_ BitVec 64))

(assert (=> b!70952 (= lt!114355 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!114331 () Unit!4723)

(assert (=> b!70952 (= lt!114331 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!3177 lt!114348) (_2!3177 lt!114348) (_1!3178 lt!114333) (_1!3178 lt!114344) lt!114355 lt!114352))))

(assert (=> b!70952 (= (bitStreamReadBitsIntoList!0 (_2!3177 lt!114348) (_1!3178 lt!114344) (bvsub lt!114355 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!334 lt!114352))))

(declare-fun lt!114349 () Unit!4723)

(assert (=> b!70952 (= lt!114349 lt!114331)))

(declare-fun lt!114321 () (_ BitVec 64))

(declare-fun lt!114357 () Unit!4723)

(assert (=> b!70952 (= lt!114357 (arrayBitRangesEqImpliesEq!0 (buf!1740 (_2!3177 lt!114362)) (buf!1740 (_2!3177 lt!114348)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!114321 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!114362))) (currentByte!3454 (_2!3177 lt!114362)) (currentBit!3449 (_2!3177 lt!114362)))))))

(assert (=> b!70952 (= (bitAt!0 (buf!1740 (_2!3177 lt!114362)) lt!114321) (bitAt!0 (buf!1740 (_2!3177 lt!114348)) lt!114321))))

(declare-fun lt!114339 () Unit!4723)

(assert (=> b!70952 (= lt!114339 lt!114357)))

(declare-fun d!22732 () Bool)

(assert (=> d!22732 e!46212))

(declare-fun res!58496 () Bool)

(assert (=> d!22732 (=> (not res!58496) (not e!46212))))

(declare-fun lt!114341 () (_ BitVec 64))

(assert (=> d!22732 (= res!58496 (= (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!114336))) (currentByte!3454 (_2!3177 lt!114336)) (currentBit!3449 (_2!3177 lt!114336))) (bvsub lt!114341 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!22732 (or (= (bvand lt!114341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114341 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!114334 () (_ BitVec 64))

(assert (=> d!22732 (= lt!114341 (bvadd lt!114334 to!314))))

(assert (=> d!22732 (or (not (= (bvand lt!114334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!114334 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!114334 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22732 (= lt!114334 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))))))

(assert (=> d!22732 (= lt!114336 e!46211)))

(assert (=> d!22732 (= c!5317 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!114337 () Unit!4723)

(declare-fun lt!114330 () Unit!4723)

(assert (=> d!22732 (= lt!114337 lt!114330)))

(assert (=> d!22732 (isPrefixOf!0 (_2!3177 lt!113563) (_2!3177 lt!113563))))

(assert (=> d!22732 (= lt!114330 (lemmaIsPrefixRefl!0 (_2!3177 lt!113563)))))

(assert (=> d!22732 (= lt!114321 (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))))))

(assert (=> d!22732 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22732 (= (appendBitsMSBFirstLoop!0 (_2!3177 lt!113563) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!114336)))

(assert (= (and d!22732 c!5317) b!70952))

(assert (= (and d!22732 (not c!5317)) b!70951))

(assert (= (or b!70952 b!70951) bm!916))

(assert (= (and d!22732 res!58496) b!70950))

(assert (= (and b!70950 res!58497) b!70949))

(assert (= (and b!70949 res!58500) b!70955))

(assert (= (and b!70955 res!58498) b!70953))

(assert (= (and b!70953 res!58495) b!70954))

(assert (= (and b!70954 res!58499) b!70956))

(declare-fun m!113661 () Bool)

(assert (=> b!70950 m!113661))

(declare-fun m!113663 () Bool)

(assert (=> b!70955 m!113663))

(declare-fun m!113665 () Bool)

(assert (=> b!70954 m!113665))

(declare-fun m!113667 () Bool)

(assert (=> b!70954 m!113667))

(declare-fun m!113669 () Bool)

(assert (=> b!70954 m!113669))

(declare-fun m!113671 () Bool)

(assert (=> b!70954 m!113671))

(declare-fun m!113673 () Bool)

(assert (=> b!70954 m!113673))

(declare-fun m!113675 () Bool)

(assert (=> b!70952 m!113675))

(declare-fun m!113677 () Bool)

(assert (=> b!70952 m!113677))

(declare-fun m!113679 () Bool)

(assert (=> b!70952 m!113679))

(declare-fun m!113681 () Bool)

(assert (=> b!70952 m!113681))

(declare-fun m!113683 () Bool)

(assert (=> b!70952 m!113683))

(declare-fun m!113685 () Bool)

(assert (=> b!70952 m!113685))

(declare-fun m!113687 () Bool)

(assert (=> b!70952 m!113687))

(declare-fun m!113689 () Bool)

(assert (=> b!70952 m!113689))

(declare-fun m!113691 () Bool)

(assert (=> b!70952 m!113691))

(declare-fun m!113693 () Bool)

(assert (=> b!70952 m!113693))

(declare-fun m!113695 () Bool)

(assert (=> b!70952 m!113695))

(declare-fun m!113697 () Bool)

(assert (=> b!70952 m!113697))

(declare-fun m!113699 () Bool)

(assert (=> b!70952 m!113699))

(assert (=> b!70952 m!113689))

(declare-fun m!113701 () Bool)

(assert (=> b!70952 m!113701))

(declare-fun m!113703 () Bool)

(assert (=> b!70952 m!113703))

(declare-fun m!113705 () Bool)

(assert (=> b!70952 m!113705))

(declare-fun m!113707 () Bool)

(assert (=> b!70952 m!113707))

(declare-fun m!113709 () Bool)

(assert (=> b!70952 m!113709))

(declare-fun m!113711 () Bool)

(assert (=> b!70952 m!113711))

(assert (=> b!70952 m!113685))

(declare-fun m!113713 () Bool)

(assert (=> b!70952 m!113713))

(declare-fun m!113715 () Bool)

(assert (=> b!70952 m!113715))

(assert (=> b!70952 m!112999))

(assert (=> b!70952 m!113693))

(declare-fun m!113717 () Bool)

(assert (=> b!70952 m!113717))

(declare-fun m!113719 () Bool)

(assert (=> b!70952 m!113719))

(declare-fun m!113721 () Bool)

(assert (=> b!70952 m!113721))

(declare-fun m!113723 () Bool)

(assert (=> b!70952 m!113723))

(declare-fun m!113725 () Bool)

(assert (=> b!70952 m!113725))

(declare-fun m!113727 () Bool)

(assert (=> b!70952 m!113727))

(assert (=> b!70952 m!113721))

(declare-fun m!113729 () Bool)

(assert (=> b!70952 m!113729))

(declare-fun m!113731 () Bool)

(assert (=> b!70952 m!113731))

(declare-fun m!113733 () Bool)

(assert (=> b!70952 m!113733))

(declare-fun m!113735 () Bool)

(assert (=> b!70952 m!113735))

(declare-fun m!113737 () Bool)

(assert (=> b!70951 m!113737))

(declare-fun m!113739 () Bool)

(assert (=> b!70951 m!113739))

(declare-fun m!113741 () Bool)

(assert (=> bm!916 m!113741))

(declare-fun m!113743 () Bool)

(assert (=> b!70956 m!113743))

(declare-fun m!113745 () Bool)

(assert (=> d!22732 m!113745))

(assert (=> d!22732 m!112999))

(assert (=> d!22732 m!113307))

(assert (=> d!22732 m!113299))

(assert (=> b!70555 d!22732))

(declare-fun d!22888 () Bool)

(assert (=> d!22888 (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!114364 () Unit!4723)

(assert (=> d!22888 (= lt!114364 (choose!9 thiss!1379 (buf!1740 (_2!3177 lt!113563)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!2311 (buf!1740 (_2!3177 lt!113563)) (currentByte!3454 thiss!1379) (currentBit!3449 thiss!1379))))))

(assert (=> d!22888 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1740 (_2!3177 lt!113563)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!114364)))

(declare-fun bs!5484 () Bool)

(assert (= bs!5484 d!22888))

(assert (=> bs!5484 m!113039))

(declare-fun m!113747 () Bool)

(assert (=> bs!5484 m!113747))

(assert (=> b!70555 d!22888))

(declare-fun d!22890 () Bool)

(assert (=> d!22890 (isPrefixOf!0 thiss!1379 (_2!3177 lt!113566))))

(declare-fun lt!114367 () Unit!4723)

(declare-fun choose!30 (BitStream!2310 BitStream!2310 BitStream!2310) Unit!4723)

(assert (=> d!22890 (= lt!114367 (choose!30 thiss!1379 (_2!3177 lt!113563) (_2!3177 lt!113566)))))

(assert (=> d!22890 (isPrefixOf!0 thiss!1379 (_2!3177 lt!113563))))

(assert (=> d!22890 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!3177 lt!113563) (_2!3177 lt!113566)) lt!114367)))

(declare-fun bs!5485 () Bool)

(assert (= bs!5485 d!22890))

(assert (=> bs!5485 m!113035))

(declare-fun m!113749 () Bool)

(assert (=> bs!5485 m!113749))

(assert (=> bs!5485 m!113013))

(assert (=> b!70555 d!22890))

(declare-fun d!22892 () Bool)

(assert (=> d!22892 (= (array_inv!1214 (buf!1740 thiss!1379)) (bvsge (size!1359 (buf!1740 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!70567 d!22892))

(declare-fun d!22894 () Bool)

(assert (=> d!22894 (= (bitAt!0 srcBuffer!2 i!635) (not (= (bvand ((_ sign_extend 24) (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!5486 () Bool)

(assert (= bs!5486 d!22894))

(assert (=> bs!5486 m!113005))

(assert (=> bs!5486 m!113215))

(assert (=> b!70556 d!22894))

(declare-fun d!22896 () Bool)

(assert (=> d!22896 (= (head!549 (byteArrayBitContentToList!0 (_2!3177 lt!113566) srcBuffer!2 i!635 (bvsub to!314 i!635))) (h!845 (byteArrayBitContentToList!0 (_2!3177 lt!113566) srcBuffer!2 i!635 (bvsub to!314 i!635))))))

(assert (=> b!70556 d!22896))

(declare-fun d!22898 () Bool)

(declare-fun c!5320 () Bool)

(assert (=> d!22898 (= c!5320 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46215 () List!730)

(assert (=> d!22898 (= (byteArrayBitContentToList!0 (_2!3177 lt!113566) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!46215)))

(declare-fun b!70961 () Bool)

(assert (=> b!70961 (= e!46215 Nil!727)))

(declare-fun b!70962 () Bool)

(assert (=> b!70962 (= e!46215 (Cons!726 (not (= (bvand ((_ sign_extend 24) (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3177 lt!113566) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22898 c!5320) b!70961))

(assert (= (and d!22898 (not c!5320)) b!70962))

(assert (=> b!70962 m!113005))

(assert (=> b!70962 m!113215))

(declare-fun m!113751 () Bool)

(assert (=> b!70962 m!113751))

(assert (=> b!70556 d!22898))

(declare-fun d!22900 () Bool)

(assert (=> d!22900 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1359 (buf!1740 thiss!1379))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 thiss!1379))) ((_ sign_extend 32) (currentByte!3454 thiss!1379)) ((_ sign_extend 32) (currentBit!3449 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!5487 () Bool)

(assert (= bs!5487 d!22900))

(assert (=> bs!5487 m!113225))

(assert (=> b!70557 d!22900))

(declare-fun d!22902 () Bool)

(assert (=> d!22902 (= (invariant!0 (currentBit!3449 (_2!3177 lt!113563)) (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113563)))) (and (bvsge (currentBit!3449 (_2!3177 lt!113563)) #b00000000000000000000000000000000) (bvslt (currentBit!3449 (_2!3177 lt!113563)) #b00000000000000000000000000001000) (bvsge (currentByte!3454 (_2!3177 lt!113563)) #b00000000000000000000000000000000) (or (bvslt (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113563)))) (and (= (currentBit!3449 (_2!3177 lt!113563)) #b00000000000000000000000000000000) (= (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113563))))))))))

(assert (=> b!70546 d!22902))

(declare-fun d!22904 () Bool)

(assert (=> d!22904 (= (head!549 (byteArrayBitContentToList!0 (_2!3177 lt!113563) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!845 (byteArrayBitContentToList!0 (_2!3177 lt!113563) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!70547 d!22904))

(declare-fun d!22906 () Bool)

(declare-fun c!5321 () Bool)

(assert (=> d!22906 (= c!5321 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!46216 () List!730)

(assert (=> d!22906 (= (byteArrayBitContentToList!0 (_2!3177 lt!113563) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!46216)))

(declare-fun b!70963 () Bool)

(assert (=> b!70963 (= e!46216 Nil!727)))

(declare-fun b!70964 () Bool)

(assert (=> b!70964 (= e!46216 (Cons!726 (not (= (bvand ((_ sign_extend 24) (select (arr!1944 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!3177 lt!113563) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!22906 c!5321) b!70963))

(assert (= (and d!22906 (not c!5321)) b!70964))

(assert (=> b!70964 m!113005))

(assert (=> b!70964 m!113215))

(declare-fun m!113753 () Bool)

(assert (=> b!70964 m!113753))

(assert (=> b!70547 d!22906))

(declare-fun d!22908 () Bool)

(assert (=> d!22908 (= (head!549 (bitStreamReadBitsIntoList!0 (_2!3177 lt!113563) (_1!3178 lt!113581) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!845 (bitStreamReadBitsIntoList!0 (_2!3177 lt!113563) (_1!3178 lt!113581) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!70547 d!22908))

(declare-fun b!70965 () Bool)

(declare-fun e!46217 () tuple2!6142)

(assert (=> b!70965 (= e!46217 (tuple2!6143 Nil!727 (_1!3178 lt!113581)))))

(declare-fun b!70967 () Bool)

(declare-fun e!46218 () Bool)

(declare-fun lt!114368 () List!730)

(assert (=> b!70967 (= e!46218 (isEmpty!228 lt!114368))))

(declare-fun lt!114370 () tuple2!6140)

(declare-fun b!70966 () Bool)

(declare-fun lt!114369 () (_ BitVec 64))

(assert (=> b!70966 (= e!46217 (tuple2!6143 (Cons!726 (_1!3184 lt!114370) (bitStreamReadBitsIntoList!0 (_2!3177 lt!113563) (_2!3184 lt!114370) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!114369))) (_2!3184 lt!114370)))))

(assert (=> b!70966 (= lt!114370 (readBit!0 (_1!3178 lt!113581)))))

(assert (=> b!70966 (= lt!114369 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!22910 () Bool)

(assert (=> d!22910 e!46218))

(declare-fun c!5322 () Bool)

(assert (=> d!22910 (= c!5322 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22910 (= lt!114368 (_1!3185 e!46217))))

(declare-fun c!5323 () Bool)

(assert (=> d!22910 (= c!5323 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!22910 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!22910 (= (bitStreamReadBitsIntoList!0 (_2!3177 lt!113563) (_1!3178 lt!113581) #b0000000000000000000000000000000000000000000000000000000000000001) lt!114368)))

(declare-fun b!70968 () Bool)

(assert (=> b!70968 (= e!46218 (> (length!358 lt!114368) 0))))

(assert (= (and d!22910 c!5323) b!70965))

(assert (= (and d!22910 (not c!5323)) b!70966))

(assert (= (and d!22910 c!5322) b!70967))

(assert (= (and d!22910 (not c!5322)) b!70968))

(declare-fun m!113755 () Bool)

(assert (=> b!70967 m!113755))

(declare-fun m!113757 () Bool)

(assert (=> b!70966 m!113757))

(declare-fun m!113759 () Bool)

(assert (=> b!70966 m!113759))

(declare-fun m!113761 () Bool)

(assert (=> b!70968 m!113761))

(assert (=> b!70547 d!22910))

(declare-fun d!22912 () Bool)

(declare-fun e!46219 () Bool)

(assert (=> d!22912 e!46219))

(declare-fun res!58502 () Bool)

(assert (=> d!22912 (=> (not res!58502) (not e!46219))))

(declare-fun lt!114372 () (_ BitVec 64))

(declare-fun lt!114375 () (_ BitVec 64))

(declare-fun lt!114373 () (_ BitVec 64))

(assert (=> d!22912 (= res!58502 (= lt!114372 (bvsub lt!114375 lt!114373)))))

(assert (=> d!22912 (or (= (bvand lt!114375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114373 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114375 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114375 lt!114373) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22912 (= lt!114373 (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113566))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113566)))))))

(declare-fun lt!114374 () (_ BitVec 64))

(declare-fun lt!114371 () (_ BitVec 64))

(assert (=> d!22912 (= lt!114375 (bvmul lt!114374 lt!114371))))

(assert (=> d!22912 (or (= lt!114374 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114371 (bvsdiv (bvmul lt!114374 lt!114371) lt!114374)))))

(assert (=> d!22912 (= lt!114371 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22912 (= lt!114374 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))))))

(assert (=> d!22912 (= lt!114372 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113566))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113566)))))))

(assert (=> d!22912 (invariant!0 (currentBit!3449 (_2!3177 lt!113566)) (currentByte!3454 (_2!3177 lt!113566)) (size!1359 (buf!1740 (_2!3177 lt!113566))))))

(assert (=> d!22912 (= (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113566))) (currentByte!3454 (_2!3177 lt!113566)) (currentBit!3449 (_2!3177 lt!113566))) lt!114372)))

(declare-fun b!70969 () Bool)

(declare-fun res!58501 () Bool)

(assert (=> b!70969 (=> (not res!58501) (not e!46219))))

(assert (=> b!70969 (= res!58501 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114372))))

(declare-fun b!70970 () Bool)

(declare-fun lt!114376 () (_ BitVec 64))

(assert (=> b!70970 (= e!46219 (bvsle lt!114372 (bvmul lt!114376 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70970 (or (= lt!114376 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114376 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114376)))))

(assert (=> b!70970 (= lt!114376 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113566)))))))

(assert (= (and d!22912 res!58502) b!70969))

(assert (= (and b!70969 res!58501) b!70970))

(declare-fun m!113763 () Bool)

(assert (=> d!22912 m!113763))

(assert (=> d!22912 m!113061))

(assert (=> b!70558 d!22912))

(declare-fun d!22914 () Bool)

(declare-fun e!46220 () Bool)

(assert (=> d!22914 e!46220))

(declare-fun res!58504 () Bool)

(assert (=> d!22914 (=> (not res!58504) (not e!46220))))

(declare-fun lt!114378 () (_ BitVec 64))

(declare-fun lt!114381 () (_ BitVec 64))

(declare-fun lt!114379 () (_ BitVec 64))

(assert (=> d!22914 (= res!58504 (= lt!114378 (bvsub lt!114381 lt!114379)))))

(assert (=> d!22914 (or (= (bvand lt!114381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!114379 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!114381 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!114381 lt!114379) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!22914 (= lt!114379 (remainingBits!0 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))) ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563)))))))

(declare-fun lt!114380 () (_ BitVec 64))

(declare-fun lt!114377 () (_ BitVec 64))

(assert (=> d!22914 (= lt!114381 (bvmul lt!114380 lt!114377))))

(assert (=> d!22914 (or (= lt!114380 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!114377 (bvsdiv (bvmul lt!114380 lt!114377) lt!114380)))))

(assert (=> d!22914 (= lt!114377 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!22914 (= lt!114380 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))))))

(assert (=> d!22914 (= lt!114378 (bvadd (bvmul ((_ sign_extend 32) (currentByte!3454 (_2!3177 lt!113563))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!3449 (_2!3177 lt!113563)))))))

(assert (=> d!22914 (invariant!0 (currentBit!3449 (_2!3177 lt!113563)) (currentByte!3454 (_2!3177 lt!113563)) (size!1359 (buf!1740 (_2!3177 lt!113563))))))

(assert (=> d!22914 (= (bitIndex!0 (size!1359 (buf!1740 (_2!3177 lt!113563))) (currentByte!3454 (_2!3177 lt!113563)) (currentBit!3449 (_2!3177 lt!113563))) lt!114378)))

(declare-fun b!70971 () Bool)

(declare-fun res!58503 () Bool)

(assert (=> b!70971 (=> (not res!58503) (not e!46220))))

(assert (=> b!70971 (= res!58503 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!114378))))

(declare-fun b!70972 () Bool)

(declare-fun lt!114382 () (_ BitVec 64))

(assert (=> b!70972 (= e!46220 (bvsle lt!114378 (bvmul lt!114382 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!70972 (or (= lt!114382 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!114382 #b0000000000000000000000000000000000000000000000000000000000001000) lt!114382)))))

(assert (=> b!70972 (= lt!114382 ((_ sign_extend 32) (size!1359 (buf!1740 (_2!3177 lt!113563)))))))

(assert (= (and d!22914 res!58504) b!70971))

(assert (= (and b!70971 res!58503) b!70972))

(assert (=> d!22914 m!113187))

(assert (=> d!22914 m!113003))

(assert (=> b!70559 d!22914))

(check-sat (not b!70694) (not d!22684) (not d!22694) (not b!70951) (not b!70717) (not b!70964) (not b!70956) (not b!70711) (not b!70673) (not d!22680) (not d!22720) (not b!70670) (not b!70682) (not d!22690) (not b!70666) (not b!70966) (not d!22702) (not d!22698) (not b!70950) (not b!70671) (not b!70726) (not bm!916) (not b!70714) (not b!70669) (not d!22714) (not d!22718) (not b!70667) (not d!22672) (not d!22900) (not d!22912) (not d!22732) (not b!70962) (not b!70705) (not d!22676) (not b!70727) (not b!70967) (not b!70722) (not b!70668) (not d!22914) (not b!70725) (not b!70706) (not b!70716) (not b!70663) (not b!70708) (not b!70724) (not d!22890) (not d!22716) (not b!70642) (not b!70712) (not d!22688) (not b!70692) (not b!70952) (not b!70645) (not d!22730) (not b!70640) (not b!70664) (not b!70693) (not b!70728) (not b!70719) (not d!22682) (not b!70665) (not b!70721) (not b!70713) (not b!70968) (not d!22728) (not b!70955) (not d!22706) (not b!70954) (not b!70707) (not d!22710) (not d!22888) (not b!70715))
