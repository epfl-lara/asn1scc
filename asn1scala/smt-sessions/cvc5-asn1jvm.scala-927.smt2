; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!26336 () Bool)

(assert start!26336)

(declare-fun b!134461 () Bool)

(declare-fun e!89204 () Bool)

(assert (=> b!134461 (= e!89204 (not true))))

(declare-datatypes ((array!6136 0))(
  ( (array!6137 (arr!3441 (Array (_ BitVec 32) (_ BitVec 8))) (size!2776 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4816 0))(
  ( (BitStream!4817 (buf!3169 array!6136) (currentByte!5966 (_ BitVec 32)) (currentBit!5961 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!11604 0))(
  ( (tuple2!11605 (_1!6118 BitStream!4816) (_2!6118 array!6136)) )
))
(declare-fun lt!208514 () tuple2!11604)

(declare-fun lt!208530 () tuple2!11604)

(declare-fun to!404 () (_ BitVec 32))

(declare-fun arrayRangesEq!179 (array!6136 array!6136 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134461 (arrayRangesEq!179 (_2!6118 lt!208514) (_2!6118 lt!208530) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((Unit!8390 0))(
  ( (Unit!8391) )
))
(declare-fun lt!208525 () Unit!8390)

(declare-fun arr!237 () array!6136)

(declare-fun from!447 () (_ BitVec 32))

(declare-datatypes ((tuple2!11606 0))(
  ( (tuple2!11607 (_1!6119 BitStream!4816) (_2!6119 BitStream!4816)) )
))
(declare-fun lt!208527 () tuple2!11606)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!4816 array!6136 (_ BitVec 32) (_ BitVec 32)) Unit!8390)

(assert (=> b!134461 (= lt!208525 (readByteArrayLoopArrayPrefixLemma!0 (_1!6119 lt!208527) arr!237 from!447 to!404))))

(declare-fun lt!208532 () array!6136)

(declare-fun readByteArrayLoopPure!0 (BitStream!4816 array!6136 (_ BitVec 32) (_ BitVec 32)) tuple2!11604)

(declare-fun withMovedByteIndex!0 (BitStream!4816 (_ BitVec 32)) BitStream!4816)

(assert (=> b!134461 (= lt!208530 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6119 lt!208527) #b00000000000000000000000000000001) lt!208532 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!208537 () tuple2!11606)

(declare-fun lt!208513 () tuple2!11604)

(assert (=> b!134461 (= lt!208513 (readByteArrayLoopPure!0 (_1!6119 lt!208537) lt!208532 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!11608 0))(
  ( (tuple2!11609 (_1!6120 BitStream!4816) (_2!6120 (_ BitVec 8))) )
))
(declare-fun lt!208518 () tuple2!11608)

(assert (=> b!134461 (= lt!208532 (array!6137 (store (arr!3441 arr!237) from!447 (_2!6120 lt!208518)) (size!2776 arr!237)))))

(declare-datatypes ((tuple2!11610 0))(
  ( (tuple2!11611 (_1!6121 Unit!8390) (_2!6121 BitStream!4816)) )
))
(declare-fun lt!208528 () tuple2!11610)

(declare-fun lt!208517 () tuple2!11610)

(declare-fun lt!208523 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!134461 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2776 (buf!3169 (_2!6121 lt!208528)))) ((_ sign_extend 32) (currentByte!5966 (_2!6121 lt!208517))) ((_ sign_extend 32) (currentBit!5961 (_2!6121 lt!208517))) lt!208523)))

(declare-fun lt!208535 () Unit!8390)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!4816 array!6136 (_ BitVec 32)) Unit!8390)

(assert (=> b!134461 (= lt!208535 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6121 lt!208517) (buf!3169 (_2!6121 lt!208528)) lt!208523))))

(assert (=> b!134461 (= (_1!6118 lt!208514) (_2!6119 lt!208527))))

(assert (=> b!134461 (= lt!208514 (readByteArrayLoopPure!0 (_1!6119 lt!208527) arr!237 from!447 to!404))))

(declare-fun thiss!1634 () BitStream!4816)

(assert (=> b!134461 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2776 (buf!3169 (_2!6121 lt!208528)))) ((_ sign_extend 32) (currentByte!5966 thiss!1634)) ((_ sign_extend 32) (currentBit!5961 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!208515 () Unit!8390)

(assert (=> b!134461 (= lt!208515 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3169 (_2!6121 lt!208528)) (bvsub to!404 from!447)))))

(assert (=> b!134461 (= (_2!6120 lt!208518) (select (arr!3441 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!4816) tuple2!11608)

(assert (=> b!134461 (= lt!208518 (readBytePure!0 (_1!6119 lt!208527)))))

(declare-fun reader!0 (BitStream!4816 BitStream!4816) tuple2!11606)

(assert (=> b!134461 (= lt!208537 (reader!0 (_2!6121 lt!208517) (_2!6121 lt!208528)))))

(assert (=> b!134461 (= lt!208527 (reader!0 thiss!1634 (_2!6121 lt!208528)))))

(declare-fun e!89203 () Bool)

(assert (=> b!134461 e!89203))

(declare-fun res!111736 () Bool)

(assert (=> b!134461 (=> (not res!111736) (not e!89203))))

(declare-fun lt!208516 () tuple2!11608)

(declare-fun lt!208534 () tuple2!11608)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!134461 (= res!111736 (= (bitIndex!0 (size!2776 (buf!3169 (_1!6120 lt!208516))) (currentByte!5966 (_1!6120 lt!208516)) (currentBit!5961 (_1!6120 lt!208516))) (bitIndex!0 (size!2776 (buf!3169 (_1!6120 lt!208534))) (currentByte!5966 (_1!6120 lt!208534)) (currentBit!5961 (_1!6120 lt!208534)))))))

(declare-fun lt!208524 () Unit!8390)

(declare-fun lt!208526 () BitStream!4816)

(declare-fun readBytePrefixLemma!0 (BitStream!4816 BitStream!4816) Unit!8390)

(assert (=> b!134461 (= lt!208524 (readBytePrefixLemma!0 lt!208526 (_2!6121 lt!208528)))))

(assert (=> b!134461 (= lt!208534 (readBytePure!0 (BitStream!4817 (buf!3169 (_2!6121 lt!208528)) (currentByte!5966 thiss!1634) (currentBit!5961 thiss!1634))))))

(assert (=> b!134461 (= lt!208516 (readBytePure!0 lt!208526))))

(assert (=> b!134461 (= lt!208526 (BitStream!4817 (buf!3169 (_2!6121 lt!208517)) (currentByte!5966 thiss!1634) (currentBit!5961 thiss!1634)))))

(declare-fun e!89202 () Bool)

(assert (=> b!134461 e!89202))

(declare-fun res!111735 () Bool)

(assert (=> b!134461 (=> (not res!111735) (not e!89202))))

(declare-fun isPrefixOf!0 (BitStream!4816 BitStream!4816) Bool)

(assert (=> b!134461 (= res!111735 (isPrefixOf!0 thiss!1634 (_2!6121 lt!208528)))))

(declare-fun lt!208531 () Unit!8390)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4816 BitStream!4816 BitStream!4816) Unit!8390)

(assert (=> b!134461 (= lt!208531 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6121 lt!208517) (_2!6121 lt!208528)))))

(declare-fun e!89211 () Bool)

(assert (=> b!134461 e!89211))

(declare-fun res!111734 () Bool)

(assert (=> b!134461 (=> (not res!111734) (not e!89211))))

(assert (=> b!134461 (= res!111734 (= (size!2776 (buf!3169 (_2!6121 lt!208517))) (size!2776 (buf!3169 (_2!6121 lt!208528)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!4816 array!6136 (_ BitVec 32) (_ BitVec 32)) tuple2!11610)

(assert (=> b!134461 (= lt!208528 (appendByteArrayLoop!0 (_2!6121 lt!208517) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!134461 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2776 (buf!3169 (_2!6121 lt!208517)))) ((_ sign_extend 32) (currentByte!5966 (_2!6121 lt!208517))) ((_ sign_extend 32) (currentBit!5961 (_2!6121 lt!208517))) lt!208523)))

(assert (=> b!134461 (= lt!208523 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!208519 () Unit!8390)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!4816 BitStream!4816 (_ BitVec 64) (_ BitVec 32)) Unit!8390)

(assert (=> b!134461 (= lt!208519 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6121 lt!208517) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!89205 () Bool)

(assert (=> b!134461 e!89205))

(declare-fun res!111738 () Bool)

(assert (=> b!134461 (=> (not res!111738) (not e!89205))))

(assert (=> b!134461 (= res!111738 (= (size!2776 (buf!3169 thiss!1634)) (size!2776 (buf!3169 (_2!6121 lt!208517)))))))

(declare-fun appendByte!0 (BitStream!4816 (_ BitVec 8)) tuple2!11610)

(assert (=> b!134461 (= lt!208517 (appendByte!0 thiss!1634 (select (arr!3441 arr!237) from!447)))))

(declare-fun b!134462 () Bool)

(declare-fun res!111733 () Bool)

(assert (=> b!134462 (=> (not res!111733) (not e!89204))))

(assert (=> b!134462 (= res!111733 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2776 (buf!3169 thiss!1634))) ((_ sign_extend 32) (currentByte!5966 thiss!1634)) ((_ sign_extend 32) (currentBit!5961 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!134464 () Bool)

(declare-fun res!111742 () Bool)

(assert (=> b!134464 (=> (not res!111742) (not e!89204))))

(assert (=> b!134464 (= res!111742 (bvslt from!447 to!404))))

(declare-fun b!134465 () Bool)

(declare-fun lt!208522 () tuple2!11608)

(declare-fun lt!208521 () tuple2!11606)

(assert (=> b!134465 (= e!89205 (and (= (_2!6120 lt!208522) (select (arr!3441 arr!237) from!447)) (= (_1!6120 lt!208522) (_2!6119 lt!208521))))))

(assert (=> b!134465 (= lt!208522 (readBytePure!0 (_1!6119 lt!208521)))))

(assert (=> b!134465 (= lt!208521 (reader!0 thiss!1634 (_2!6121 lt!208517)))))

(declare-fun e!89207 () Bool)

(declare-fun lt!208536 () tuple2!11604)

(declare-fun b!134466 () Bool)

(assert (=> b!134466 (= e!89207 (not (arrayRangesEq!179 arr!237 (_2!6118 lt!208536) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!134467 () Bool)

(declare-fun e!89206 () Bool)

(assert (=> b!134467 (= e!89211 e!89206)))

(declare-fun res!111732 () Bool)

(assert (=> b!134467 (=> (not res!111732) (not e!89206))))

(declare-fun lt!208520 () (_ BitVec 64))

(assert (=> b!134467 (= res!111732 (= (bitIndex!0 (size!2776 (buf!3169 (_2!6121 lt!208528))) (currentByte!5966 (_2!6121 lt!208528)) (currentBit!5961 (_2!6121 lt!208528))) (bvadd (bitIndex!0 (size!2776 (buf!3169 (_2!6121 lt!208517))) (currentByte!5966 (_2!6121 lt!208517)) (currentBit!5961 (_2!6121 lt!208517))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!208520))))))

(assert (=> b!134467 (= lt!208520 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!134468 () Bool)

(assert (=> b!134468 (= e!89206 (not e!89207))))

(declare-fun res!111743 () Bool)

(assert (=> b!134468 (=> res!111743 e!89207)))

(declare-fun lt!208529 () tuple2!11606)

(assert (=> b!134468 (= res!111743 (or (not (= (size!2776 (_2!6118 lt!208536)) (size!2776 arr!237))) (not (= (_1!6118 lt!208536) (_2!6119 lt!208529)))))))

(assert (=> b!134468 (= lt!208536 (readByteArrayLoopPure!0 (_1!6119 lt!208529) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!134468 (validate_offset_bits!1 ((_ sign_extend 32) (size!2776 (buf!3169 (_2!6121 lt!208528)))) ((_ sign_extend 32) (currentByte!5966 (_2!6121 lt!208517))) ((_ sign_extend 32) (currentBit!5961 (_2!6121 lt!208517))) lt!208520)))

(declare-fun lt!208533 () Unit!8390)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4816 array!6136 (_ BitVec 64)) Unit!8390)

(assert (=> b!134468 (= lt!208533 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6121 lt!208517) (buf!3169 (_2!6121 lt!208528)) lt!208520))))

(assert (=> b!134468 (= lt!208529 (reader!0 (_2!6121 lt!208517) (_2!6121 lt!208528)))))

(declare-fun b!134469 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!134469 (= e!89202 (invariant!0 (currentBit!5961 thiss!1634) (currentByte!5966 thiss!1634) (size!2776 (buf!3169 (_2!6121 lt!208517)))))))

(declare-fun b!134470 () Bool)

(declare-fun e!89209 () Bool)

(declare-fun array_inv!2565 (array!6136) Bool)

(assert (=> b!134470 (= e!89209 (array_inv!2565 (buf!3169 thiss!1634)))))

(declare-fun b!134471 () Bool)

(assert (=> b!134471 (= e!89203 (= (_2!6120 lt!208516) (_2!6120 lt!208534)))))

(declare-fun b!134472 () Bool)

(declare-fun res!111737 () Bool)

(assert (=> b!134472 (=> (not res!111737) (not e!89204))))

(assert (=> b!134472 (= res!111737 (invariant!0 (currentBit!5961 thiss!1634) (currentByte!5966 thiss!1634) (size!2776 (buf!3169 thiss!1634))))))

(declare-fun b!134463 () Bool)

(declare-fun res!111739 () Bool)

(assert (=> b!134463 (=> (not res!111739) (not e!89205))))

(assert (=> b!134463 (= res!111739 (= (bitIndex!0 (size!2776 (buf!3169 (_2!6121 lt!208517))) (currentByte!5966 (_2!6121 lt!208517)) (currentBit!5961 (_2!6121 lt!208517))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2776 (buf!3169 thiss!1634)) (currentByte!5966 thiss!1634) (currentBit!5961 thiss!1634)))))))

(declare-fun res!111744 () Bool)

(assert (=> start!26336 (=> (not res!111744) (not e!89204))))

(assert (=> start!26336 (= res!111744 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2776 arr!237))))))

(assert (=> start!26336 e!89204))

(assert (=> start!26336 true))

(assert (=> start!26336 (array_inv!2565 arr!237)))

(declare-fun inv!12 (BitStream!4816) Bool)

(assert (=> start!26336 (and (inv!12 thiss!1634) e!89209)))

(declare-fun b!134473 () Bool)

(declare-fun res!111740 () Bool)

(assert (=> b!134473 (=> (not res!111740) (not e!89206))))

(assert (=> b!134473 (= res!111740 (isPrefixOf!0 (_2!6121 lt!208517) (_2!6121 lt!208528)))))

(declare-fun b!134474 () Bool)

(declare-fun res!111741 () Bool)

(assert (=> b!134474 (=> (not res!111741) (not e!89205))))

(assert (=> b!134474 (= res!111741 (isPrefixOf!0 thiss!1634 (_2!6121 lt!208517)))))

(assert (= (and start!26336 res!111744) b!134462))

(assert (= (and b!134462 res!111733) b!134464))

(assert (= (and b!134464 res!111742) b!134472))

(assert (= (and b!134472 res!111737) b!134461))

(assert (= (and b!134461 res!111738) b!134463))

(assert (= (and b!134463 res!111739) b!134474))

(assert (= (and b!134474 res!111741) b!134465))

(assert (= (and b!134461 res!111734) b!134467))

(assert (= (and b!134467 res!111732) b!134473))

(assert (= (and b!134473 res!111740) b!134468))

(assert (= (and b!134468 (not res!111743)) b!134466))

(assert (= (and b!134461 res!111735) b!134469))

(assert (= (and b!134461 res!111736) b!134471))

(assert (= start!26336 b!134470))

(declare-fun m!204625 () Bool)

(assert (=> b!134463 m!204625))

(declare-fun m!204627 () Bool)

(assert (=> b!134463 m!204627))

(declare-fun m!204629 () Bool)

(assert (=> b!134468 m!204629))

(declare-fun m!204631 () Bool)

(assert (=> b!134468 m!204631))

(declare-fun m!204633 () Bool)

(assert (=> b!134468 m!204633))

(declare-fun m!204635 () Bool)

(assert (=> b!134468 m!204635))

(declare-fun m!204637 () Bool)

(assert (=> b!134469 m!204637))

(declare-fun m!204639 () Bool)

(assert (=> b!134473 m!204639))

(declare-fun m!204641 () Bool)

(assert (=> b!134466 m!204641))

(declare-fun m!204643 () Bool)

(assert (=> b!134462 m!204643))

(declare-fun m!204645 () Bool)

(assert (=> b!134470 m!204645))

(declare-fun m!204647 () Bool)

(assert (=> start!26336 m!204647))

(declare-fun m!204649 () Bool)

(assert (=> start!26336 m!204649))

(declare-fun m!204651 () Bool)

(assert (=> b!134465 m!204651))

(declare-fun m!204653 () Bool)

(assert (=> b!134465 m!204653))

(declare-fun m!204655 () Bool)

(assert (=> b!134465 m!204655))

(declare-fun m!204657 () Bool)

(assert (=> b!134467 m!204657))

(assert (=> b!134467 m!204625))

(declare-fun m!204659 () Bool)

(assert (=> b!134472 m!204659))

(declare-fun m!204661 () Bool)

(assert (=> b!134474 m!204661))

(assert (=> b!134461 m!204635))

(declare-fun m!204663 () Bool)

(assert (=> b!134461 m!204663))

(declare-fun m!204665 () Bool)

(assert (=> b!134461 m!204665))

(declare-fun m!204667 () Bool)

(assert (=> b!134461 m!204667))

(declare-fun m!204669 () Bool)

(assert (=> b!134461 m!204669))

(declare-fun m!204671 () Bool)

(assert (=> b!134461 m!204671))

(declare-fun m!204673 () Bool)

(assert (=> b!134461 m!204673))

(assert (=> b!134461 m!204651))

(declare-fun m!204675 () Bool)

(assert (=> b!134461 m!204675))

(assert (=> b!134461 m!204651))

(declare-fun m!204677 () Bool)

(assert (=> b!134461 m!204677))

(declare-fun m!204679 () Bool)

(assert (=> b!134461 m!204679))

(declare-fun m!204681 () Bool)

(assert (=> b!134461 m!204681))

(declare-fun m!204683 () Bool)

(assert (=> b!134461 m!204683))

(declare-fun m!204685 () Bool)

(assert (=> b!134461 m!204685))

(declare-fun m!204687 () Bool)

(assert (=> b!134461 m!204687))

(declare-fun m!204689 () Bool)

(assert (=> b!134461 m!204689))

(assert (=> b!134461 m!204677))

(declare-fun m!204691 () Bool)

(assert (=> b!134461 m!204691))

(declare-fun m!204693 () Bool)

(assert (=> b!134461 m!204693))

(declare-fun m!204695 () Bool)

(assert (=> b!134461 m!204695))

(declare-fun m!204697 () Bool)

(assert (=> b!134461 m!204697))

(declare-fun m!204699 () Bool)

(assert (=> b!134461 m!204699))

(declare-fun m!204701 () Bool)

(assert (=> b!134461 m!204701))

(declare-fun m!204703 () Bool)

(assert (=> b!134461 m!204703))

(declare-fun m!204705 () Bool)

(assert (=> b!134461 m!204705))

(declare-fun m!204707 () Bool)

(assert (=> b!134461 m!204707))

(declare-fun m!204709 () Bool)

(assert (=> b!134461 m!204709))

(push 1)

(assert (not b!134467))

(assert (not b!134462))

(assert (not b!134461))

(assert (not b!134470))

(assert (not b!134465))

(assert (not b!134474))

(assert (not start!26336))

(assert (not b!134473))

(assert (not b!134468))

(assert (not b!134469))

(assert (not b!134472))

(assert (not b!134466))

(assert (not b!134463))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

