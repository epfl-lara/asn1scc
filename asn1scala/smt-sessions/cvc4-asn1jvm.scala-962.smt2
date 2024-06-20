; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!27126 () Bool)

(assert start!27126)

(declare-fun b!139583 () Bool)

(declare-fun res!116372 () Bool)

(declare-fun e!92996 () Bool)

(assert (=> b!139583 (=> (not res!116372) (not e!92996))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6370 0))(
  ( (array!6371 (arr!3578 (Array (_ BitVec 32) (_ BitVec 8))) (size!2883 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5030 0))(
  ( (BitStream!5031 (buf!3299 array!6370) (currentByte!6135 (_ BitVec 32)) (currentBit!6130 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5030)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139583 (= res!116372 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634)) (bvsub to!404 from!447)))))

(declare-datatypes ((tuple2!12252 0))(
  ( (tuple2!12253 (_1!6452 BitStream!5030) (_2!6452 array!6370)) )
))
(declare-fun lt!217531 () tuple2!12252)

(declare-fun lt!217524 () tuple2!12252)

(declare-fun b!139584 () Bool)

(declare-fun arrayRangesEq!247 (array!6370 array!6370 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139584 (= e!92996 (not (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217531) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!217535 () tuple2!12252)

(assert (=> b!139584 (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217535) #b00000000000000000000000000000000 to!404)))

(declare-datatypes ((Unit!8719 0))(
  ( (Unit!8720) )
))
(declare-fun lt!217538 () Unit!8719)

(declare-fun arr!237 () array!6370)

(declare-datatypes ((tuple2!12254 0))(
  ( (tuple2!12255 (_1!6453 BitStream!5030) (_2!6453 BitStream!5030)) )
))
(declare-fun lt!217532 () tuple2!12254)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5030 array!6370 (_ BitVec 32) (_ BitVec 32)) Unit!8719)

(assert (=> b!139584 (= lt!217538 (readByteArrayLoopArrayPrefixLemma!0 (_1!6453 lt!217532) arr!237 from!447 to!404))))

(declare-fun lt!217528 () array!6370)

(declare-fun readByteArrayLoopPure!0 (BitStream!5030 array!6370 (_ BitVec 32) (_ BitVec 32)) tuple2!12252)

(declare-fun withMovedByteIndex!0 (BitStream!5030 (_ BitVec 32)) BitStream!5030)

(assert (=> b!139584 (= lt!217535 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!217522 () tuple2!12254)

(assert (=> b!139584 (= lt!217531 (readByteArrayLoopPure!0 (_1!6453 lt!217522) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!12256 0))(
  ( (tuple2!12257 (_1!6454 BitStream!5030) (_2!6454 (_ BitVec 8))) )
))
(declare-fun lt!217515 () tuple2!12256)

(assert (=> b!139584 (= lt!217528 (array!6371 (store (arr!3578 arr!237) from!447 (_2!6454 lt!217515)) (size!2883 arr!237)))))

(declare-datatypes ((tuple2!12258 0))(
  ( (tuple2!12259 (_1!6455 Unit!8719) (_2!6455 BitStream!5030)) )
))
(declare-fun lt!217519 () tuple2!12258)

(declare-fun lt!217523 () tuple2!12258)

(declare-fun lt!217534 () (_ BitVec 32))

(assert (=> b!139584 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217534)))

(declare-fun lt!217527 () Unit!8719)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5030 array!6370 (_ BitVec 32)) Unit!8719)

(assert (=> b!139584 (= lt!217527 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217534))))

(assert (=> b!139584 (= (_1!6452 lt!217524) (_2!6453 lt!217532))))

(assert (=> b!139584 (= lt!217524 (readByteArrayLoopPure!0 (_1!6453 lt!217532) arr!237 from!447 to!404))))

(assert (=> b!139584 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!217536 () Unit!8719)

(assert (=> b!139584 (= lt!217536 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3299 (_2!6455 lt!217519)) (bvsub to!404 from!447)))))

(assert (=> b!139584 (= (_2!6454 lt!217515) (select (arr!3578 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5030) tuple2!12256)

(assert (=> b!139584 (= lt!217515 (readBytePure!0 (_1!6453 lt!217532)))))

(declare-fun reader!0 (BitStream!5030 BitStream!5030) tuple2!12254)

(assert (=> b!139584 (= lt!217522 (reader!0 (_2!6455 lt!217523) (_2!6455 lt!217519)))))

(assert (=> b!139584 (= lt!217532 (reader!0 thiss!1634 (_2!6455 lt!217519)))))

(declare-fun e!92998 () Bool)

(assert (=> b!139584 e!92998))

(declare-fun res!116365 () Bool)

(assert (=> b!139584 (=> (not res!116365) (not e!92998))))

(declare-fun lt!217526 () tuple2!12256)

(declare-fun lt!217533 () tuple2!12256)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139584 (= res!116365 (= (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217526))) (currentByte!6135 (_1!6454 lt!217526)) (currentBit!6130 (_1!6454 lt!217526))) (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217533))) (currentByte!6135 (_1!6454 lt!217533)) (currentBit!6130 (_1!6454 lt!217533)))))))

(declare-fun lt!217516 () Unit!8719)

(declare-fun lt!217517 () BitStream!5030)

(declare-fun readBytePrefixLemma!0 (BitStream!5030 BitStream!5030) Unit!8719)

(assert (=> b!139584 (= lt!217516 (readBytePrefixLemma!0 lt!217517 (_2!6455 lt!217519)))))

(assert (=> b!139584 (= lt!217533 (readBytePure!0 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (=> b!139584 (= lt!217526 (readBytePure!0 lt!217517))))

(assert (=> b!139584 (= lt!217517 (BitStream!5031 (buf!3299 (_2!6455 lt!217523)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(declare-fun e!92997 () Bool)

(assert (=> b!139584 e!92997))

(declare-fun res!116366 () Bool)

(assert (=> b!139584 (=> (not res!116366) (not e!92997))))

(declare-fun isPrefixOf!0 (BitStream!5030 BitStream!5030) Bool)

(assert (=> b!139584 (= res!116366 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217519)))))

(declare-fun lt!217529 () Unit!8719)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5030 BitStream!5030 BitStream!5030) Unit!8719)

(assert (=> b!139584 (= lt!217529 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6455 lt!217523) (_2!6455 lt!217519)))))

(declare-fun e!92994 () Bool)

(assert (=> b!139584 e!92994))

(declare-fun res!116361 () Bool)

(assert (=> b!139584 (=> (not res!116361) (not e!92994))))

(assert (=> b!139584 (= res!116361 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5030 array!6370 (_ BitVec 32) (_ BitVec 32)) tuple2!12258)

(assert (=> b!139584 (= lt!217519 (appendByteArrayLoop!0 (_2!6455 lt!217523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!139584 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217534)))

(assert (=> b!139584 (= lt!217534 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!217530 () Unit!8719)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5030 BitStream!5030 (_ BitVec 64) (_ BitVec 32)) Unit!8719)

(assert (=> b!139584 (= lt!217530 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6455 lt!217523) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!93002 () Bool)

(assert (=> b!139584 e!93002))

(declare-fun res!116368 () Bool)

(assert (=> b!139584 (=> (not res!116368) (not e!93002))))

(assert (=> b!139584 (= res!116368 (= (size!2883 (buf!3299 thiss!1634)) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(declare-fun appendByte!0 (BitStream!5030 (_ BitVec 8)) tuple2!12258)

(assert (=> b!139584 (= lt!217523 (appendByte!0 thiss!1634 (select (arr!3578 arr!237) from!447)))))

(declare-fun b!139585 () Bool)

(declare-fun e!93000 () Bool)

(declare-fun array_inv!2672 (array!6370) Bool)

(assert (=> b!139585 (= e!93000 (array_inv!2672 (buf!3299 thiss!1634)))))

(declare-fun b!139586 () Bool)

(declare-fun res!116364 () Bool)

(assert (=> b!139586 (=> (not res!116364) (not e!93002))))

(assert (=> b!139586 (= res!116364 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))))

(declare-fun res!116367 () Bool)

(assert (=> start!27126 (=> (not res!116367) (not e!92996))))

(assert (=> start!27126 (= res!116367 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2883 arr!237))))))

(assert (=> start!27126 e!92996))

(assert (=> start!27126 true))

(assert (=> start!27126 (array_inv!2672 arr!237)))

(declare-fun inv!12 (BitStream!5030) Bool)

(assert (=> start!27126 (and (inv!12 thiss!1634) e!93000)))

(declare-fun b!139587 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139587 (= e!92997 (invariant!0 (currentBit!6130 thiss!1634) (currentByte!6135 thiss!1634) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(declare-fun b!139588 () Bool)

(declare-fun e!93001 () Bool)

(assert (=> b!139588 (= e!92994 e!93001)))

(declare-fun res!116363 () Bool)

(assert (=> b!139588 (=> (not res!116363) (not e!93001))))

(declare-fun lt!217521 () (_ BitVec 64))

(assert (=> b!139588 (= res!116363 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519))) (bvadd (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217521))))))

(assert (=> b!139588 (= lt!217521 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun b!139589 () Bool)

(declare-fun res!116370 () Bool)

(assert (=> b!139589 (=> (not res!116370) (not e!93001))))

(assert (=> b!139589 (= res!116370 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217519)))))

(declare-fun b!139590 () Bool)

(declare-fun res!116371 () Bool)

(assert (=> b!139590 (=> (not res!116371) (not e!93002))))

(assert (=> b!139590 (= res!116371 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217523)))))

(declare-fun b!139591 () Bool)

(declare-fun lt!217525 () tuple2!12252)

(declare-fun e!92995 () Bool)

(assert (=> b!139591 (= e!92995 (not (arrayRangesEq!247 arr!237 (_2!6452 lt!217525) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!139592 () Bool)

(declare-fun res!116369 () Bool)

(assert (=> b!139592 (=> (not res!116369) (not e!92996))))

(assert (=> b!139592 (= res!116369 (bvslt from!447 to!404))))

(declare-fun lt!217518 () tuple2!12254)

(declare-fun lt!217537 () tuple2!12256)

(declare-fun b!139593 () Bool)

(assert (=> b!139593 (= e!93002 (and (= (_2!6454 lt!217537) (select (arr!3578 arr!237) from!447)) (= (_1!6454 lt!217537) (_2!6453 lt!217518))))))

(assert (=> b!139593 (= lt!217537 (readBytePure!0 (_1!6453 lt!217518)))))

(assert (=> b!139593 (= lt!217518 (reader!0 thiss!1634 (_2!6455 lt!217523)))))

(declare-fun b!139594 () Bool)

(assert (=> b!139594 (= e!92998 (= (_2!6454 lt!217526) (_2!6454 lt!217533)))))

(declare-fun b!139595 () Bool)

(assert (=> b!139595 (= e!93001 (not e!92995))))

(declare-fun res!116373 () Bool)

(assert (=> b!139595 (=> res!116373 e!92995)))

(declare-fun lt!217539 () tuple2!12254)

(assert (=> b!139595 (= res!116373 (or (not (= (size!2883 (_2!6452 lt!217525)) (size!2883 arr!237))) (not (= (_1!6452 lt!217525) (_2!6453 lt!217539)))))))

(assert (=> b!139595 (= lt!217525 (readByteArrayLoopPure!0 (_1!6453 lt!217539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139595 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217521)))

(declare-fun lt!217520 () Unit!8719)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5030 array!6370 (_ BitVec 64)) Unit!8719)

(assert (=> b!139595 (= lt!217520 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217521))))

(assert (=> b!139595 (= lt!217539 (reader!0 (_2!6455 lt!217523) (_2!6455 lt!217519)))))

(declare-fun b!139596 () Bool)

(declare-fun res!116362 () Bool)

(assert (=> b!139596 (=> (not res!116362) (not e!92996))))

(assert (=> b!139596 (= res!116362 (invariant!0 (currentBit!6130 thiss!1634) (currentByte!6135 thiss!1634) (size!2883 (buf!3299 thiss!1634))))))

(assert (= (and start!27126 res!116367) b!139583))

(assert (= (and b!139583 res!116372) b!139592))

(assert (= (and b!139592 res!116369) b!139596))

(assert (= (and b!139596 res!116362) b!139584))

(assert (= (and b!139584 res!116368) b!139586))

(assert (= (and b!139586 res!116364) b!139590))

(assert (= (and b!139590 res!116371) b!139593))

(assert (= (and b!139584 res!116361) b!139588))

(assert (= (and b!139588 res!116363) b!139589))

(assert (= (and b!139589 res!116370) b!139595))

(assert (= (and b!139595 (not res!116373)) b!139591))

(assert (= (and b!139584 res!116366) b!139587))

(assert (= (and b!139584 res!116365) b!139594))

(assert (= start!27126 b!139585))

(declare-fun m!214689 () Bool)

(assert (=> b!139589 m!214689))

(declare-fun m!214691 () Bool)

(assert (=> b!139590 m!214691))

(declare-fun m!214693 () Bool)

(assert (=> b!139584 m!214693))

(declare-fun m!214695 () Bool)

(assert (=> b!139584 m!214695))

(declare-fun m!214697 () Bool)

(assert (=> b!139584 m!214697))

(declare-fun m!214699 () Bool)

(assert (=> b!139584 m!214699))

(declare-fun m!214701 () Bool)

(assert (=> b!139584 m!214701))

(declare-fun m!214703 () Bool)

(assert (=> b!139584 m!214703))

(declare-fun m!214705 () Bool)

(assert (=> b!139584 m!214705))

(declare-fun m!214707 () Bool)

(assert (=> b!139584 m!214707))

(declare-fun m!214709 () Bool)

(assert (=> b!139584 m!214709))

(declare-fun m!214711 () Bool)

(assert (=> b!139584 m!214711))

(declare-fun m!214713 () Bool)

(assert (=> b!139584 m!214713))

(declare-fun m!214715 () Bool)

(assert (=> b!139584 m!214715))

(assert (=> b!139584 m!214699))

(declare-fun m!214717 () Bool)

(assert (=> b!139584 m!214717))

(declare-fun m!214719 () Bool)

(assert (=> b!139584 m!214719))

(declare-fun m!214721 () Bool)

(assert (=> b!139584 m!214721))

(declare-fun m!214723 () Bool)

(assert (=> b!139584 m!214723))

(declare-fun m!214725 () Bool)

(assert (=> b!139584 m!214725))

(declare-fun m!214727 () Bool)

(assert (=> b!139584 m!214727))

(declare-fun m!214729 () Bool)

(assert (=> b!139584 m!214729))

(declare-fun m!214731 () Bool)

(assert (=> b!139584 m!214731))

(declare-fun m!214733 () Bool)

(assert (=> b!139584 m!214733))

(declare-fun m!214735 () Bool)

(assert (=> b!139584 m!214735))

(declare-fun m!214737 () Bool)

(assert (=> b!139584 m!214737))

(declare-fun m!214739 () Bool)

(assert (=> b!139584 m!214739))

(declare-fun m!214741 () Bool)

(assert (=> b!139584 m!214741))

(declare-fun m!214743 () Bool)

(assert (=> b!139584 m!214743))

(declare-fun m!214745 () Bool)

(assert (=> b!139584 m!214745))

(assert (=> b!139584 m!214735))

(assert (=> b!139593 m!214735))

(declare-fun m!214747 () Bool)

(assert (=> b!139593 m!214747))

(declare-fun m!214749 () Bool)

(assert (=> b!139593 m!214749))

(declare-fun m!214751 () Bool)

(assert (=> b!139587 m!214751))

(declare-fun m!214753 () Bool)

(assert (=> b!139596 m!214753))

(declare-fun m!214755 () Bool)

(assert (=> b!139588 m!214755))

(declare-fun m!214757 () Bool)

(assert (=> b!139588 m!214757))

(assert (=> b!139586 m!214757))

(declare-fun m!214759 () Bool)

(assert (=> b!139586 m!214759))

(declare-fun m!214761 () Bool)

(assert (=> b!139585 m!214761))

(declare-fun m!214763 () Bool)

(assert (=> start!27126 m!214763))

(declare-fun m!214765 () Bool)

(assert (=> start!27126 m!214765))

(declare-fun m!214767 () Bool)

(assert (=> b!139591 m!214767))

(declare-fun m!214769 () Bool)

(assert (=> b!139583 m!214769))

(declare-fun m!214771 () Bool)

(assert (=> b!139595 m!214771))

(declare-fun m!214773 () Bool)

(assert (=> b!139595 m!214773))

(declare-fun m!214775 () Bool)

(assert (=> b!139595 m!214775))

(assert (=> b!139595 m!214701))

(push 1)

(assert (not b!139590))

(assert (not b!139583))

(assert (not b!139588))

(assert (not b!139593))

(assert (not b!139585))

(assert (not b!139589))

(assert (not b!139584))

(assert (not b!139591))

(assert (not start!27126))

(assert (not b!139586))

(assert (not b!139596))

(assert (not b!139595))

(assert (not b!139587))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!44807 () Bool)

(declare-fun res!116380 () Bool)

(declare-fun e!93008 () Bool)

(assert (=> d!44807 (=> (not res!116380) (not e!93008))))

(assert (=> d!44807 (= res!116380 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!44807 (= (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217519)) e!93008)))

(declare-fun b!139603 () Bool)

(declare-fun res!116381 () Bool)

(assert (=> b!139603 (=> (not res!116381) (not e!93008))))

(assert (=> b!139603 (= res!116381 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun b!139604 () Bool)

(declare-fun e!93009 () Bool)

(assert (=> b!139604 (= e!93008 e!93009)))

(declare-fun res!116382 () Bool)

(assert (=> b!139604 (=> res!116382 e!93009)))

(assert (=> b!139604 (= res!116382 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) #b00000000000000000000000000000000))))

(declare-fun b!139605 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6370 array!6370 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139605 (= e!93009 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (= (and d!44807 res!116380) b!139603))

(assert (= (and b!139603 res!116381) b!139604))

(assert (= (and b!139604 (not res!116382)) b!139605))

(assert (=> b!139603 m!214757))

(assert (=> b!139603 m!214755))

(assert (=> b!139605 m!214757))

(assert (=> b!139605 m!214757))

(declare-fun m!214777 () Bool)

(assert (=> b!139605 m!214777))

(assert (=> b!139589 d!44807))

(declare-fun d!44809 () Bool)

(declare-fun e!93012 () Bool)

(assert (=> d!44809 e!93012))

(declare-fun res!116387 () Bool)

(assert (=> d!44809 (=> (not res!116387) (not e!93012))))

(declare-fun lt!217553 () (_ BitVec 64))

(declare-fun lt!217555 () (_ BitVec 64))

(declare-fun lt!217552 () (_ BitVec 64))

(assert (=> d!44809 (= res!116387 (= lt!217553 (bvsub lt!217552 lt!217555)))))

(assert (=> d!44809 (or (= (bvand lt!217552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217555 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217552 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217552 lt!217555) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44809 (= lt!217555 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217519))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun lt!217557 () (_ BitVec 64))

(declare-fun lt!217556 () (_ BitVec 64))

(assert (=> d!44809 (= lt!217552 (bvmul lt!217557 lt!217556))))

(assert (=> d!44809 (or (= lt!217557 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217556 (bvsdiv (bvmul lt!217557 lt!217556) lt!217557)))))

(assert (=> d!44809 (= lt!217556 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44809 (= lt!217557 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!44809 (= lt!217553 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217519))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217519)))))))

(assert (=> d!44809 (invariant!0 (currentBit!6130 (_2!6455 lt!217519)) (currentByte!6135 (_2!6455 lt!217519)) (size!2883 (buf!3299 (_2!6455 lt!217519))))))

(assert (=> d!44809 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519))) lt!217553)))

(declare-fun b!139610 () Bool)

(declare-fun res!116388 () Bool)

(assert (=> b!139610 (=> (not res!116388) (not e!93012))))

(assert (=> b!139610 (= res!116388 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217553))))

(declare-fun b!139611 () Bool)

(declare-fun lt!217554 () (_ BitVec 64))

(assert (=> b!139611 (= e!93012 (bvsle lt!217553 (bvmul lt!217554 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139611 (or (= lt!217554 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217554 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217554)))))

(assert (=> b!139611 (= lt!217554 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (= (and d!44809 res!116387) b!139610))

(assert (= (and b!139610 res!116388) b!139611))

(declare-fun m!214779 () Bool)

(assert (=> d!44809 m!214779))

(declare-fun m!214781 () Bool)

(assert (=> d!44809 m!214781))

(assert (=> b!139588 d!44809))

(declare-fun d!44811 () Bool)

(declare-fun e!93013 () Bool)

(assert (=> d!44811 e!93013))

(declare-fun res!116389 () Bool)

(assert (=> d!44811 (=> (not res!116389) (not e!93013))))

(declare-fun lt!217559 () (_ BitVec 64))

(declare-fun lt!217561 () (_ BitVec 64))

(declare-fun lt!217558 () (_ BitVec 64))

(assert (=> d!44811 (= res!116389 (= lt!217559 (bvsub lt!217558 lt!217561)))))

(assert (=> d!44811 (or (= (bvand lt!217558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217561 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217558 lt!217561) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44811 (= lt!217561 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))))))

(declare-fun lt!217563 () (_ BitVec 64))

(declare-fun lt!217562 () (_ BitVec 64))

(assert (=> d!44811 (= lt!217558 (bvmul lt!217563 lt!217562))))

(assert (=> d!44811 (or (= lt!217563 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217562 (bvsdiv (bvmul lt!217563 lt!217562) lt!217563)))))

(assert (=> d!44811 (= lt!217562 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44811 (= lt!217563 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(assert (=> d!44811 (= lt!217559 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (=> d!44811 (invariant!0 (currentBit!6130 (_2!6455 lt!217523)) (currentByte!6135 (_2!6455 lt!217523)) (size!2883 (buf!3299 (_2!6455 lt!217523))))))

(assert (=> d!44811 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) lt!217559)))

(declare-fun b!139612 () Bool)

(declare-fun res!116390 () Bool)

(assert (=> b!139612 (=> (not res!116390) (not e!93013))))

(assert (=> b!139612 (= res!116390 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217559))))

(declare-fun b!139613 () Bool)

(declare-fun lt!217560 () (_ BitVec 64))

(assert (=> b!139613 (= e!93013 (bvsle lt!217559 (bvmul lt!217560 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139613 (or (= lt!217560 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217560 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217560)))))

(assert (=> b!139613 (= lt!217560 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(assert (= (and d!44811 res!116389) b!139612))

(assert (= (and b!139612 res!116390) b!139613))

(declare-fun m!214783 () Bool)

(assert (=> d!44811 m!214783))

(declare-fun m!214785 () Bool)

(assert (=> d!44811 m!214785))

(assert (=> b!139588 d!44811))

(declare-fun d!44813 () Bool)

(assert (=> d!44813 (= (invariant!0 (currentBit!6130 thiss!1634) (currentByte!6135 thiss!1634) (size!2883 (buf!3299 (_2!6455 lt!217523)))) (and (bvsge (currentBit!6130 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6130 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6135 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6135 thiss!1634) (size!2883 (buf!3299 (_2!6455 lt!217523)))) (and (= (currentBit!6130 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6135 thiss!1634) (size!2883 (buf!3299 (_2!6455 lt!217523))))))))))

(assert (=> b!139587 d!44813))

(declare-fun d!44815 () Bool)

(declare-fun res!116395 () Bool)

(declare-fun e!93018 () Bool)

(assert (=> d!44815 (=> res!116395 e!93018)))

(assert (=> d!44815 (= res!116395 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44815 (= (arrayRangesEq!247 arr!237 (_2!6452 lt!217525) #b00000000000000000000000000000000 to!404) e!93018)))

(declare-fun b!139618 () Bool)

(declare-fun e!93019 () Bool)

(assert (=> b!139618 (= e!93018 e!93019)))

(declare-fun res!116396 () Bool)

(assert (=> b!139618 (=> (not res!116396) (not e!93019))))

(assert (=> b!139618 (= res!116396 (= (select (arr!3578 arr!237) #b00000000000000000000000000000000) (select (arr!3578 (_2!6452 lt!217525)) #b00000000000000000000000000000000)))))

(declare-fun b!139619 () Bool)

(assert (=> b!139619 (= e!93019 (arrayRangesEq!247 arr!237 (_2!6452 lt!217525) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44815 (not res!116395)) b!139618))

(assert (= (and b!139618 res!116396) b!139619))

(declare-fun m!214787 () Bool)

(assert (=> b!139618 m!214787))

(declare-fun m!214789 () Bool)

(assert (=> b!139618 m!214789))

(declare-fun m!214791 () Bool)

(assert (=> b!139619 m!214791))

(assert (=> b!139591 d!44815))

(declare-fun d!44817 () Bool)

(declare-fun res!116397 () Bool)

(declare-fun e!93020 () Bool)

(assert (=> d!44817 (=> (not res!116397) (not e!93020))))

(assert (=> d!44817 (= res!116397 (= (size!2883 (buf!3299 thiss!1634)) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(assert (=> d!44817 (= (isPrefixOf!0 thiss!1634 (_2!6455 lt!217523)) e!93020)))

(declare-fun b!139620 () Bool)

(declare-fun res!116398 () Bool)

(assert (=> b!139620 (=> (not res!116398) (not e!93020))))

(assert (=> b!139620 (= res!116398 (bvsle (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(declare-fun b!139621 () Bool)

(declare-fun e!93021 () Bool)

(assert (=> b!139621 (= e!93020 e!93021)))

(declare-fun res!116399 () Bool)

(assert (=> b!139621 (=> res!116399 e!93021)))

(assert (=> b!139621 (= res!116399 (= (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139622 () Bool)

(assert (=> b!139622 (= e!93021 (arrayBitRangesEq!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (= (and d!44817 res!116397) b!139620))

(assert (= (and b!139620 res!116398) b!139621))

(assert (= (and b!139621 (not res!116399)) b!139622))

(assert (=> b!139620 m!214759))

(assert (=> b!139620 m!214757))

(assert (=> b!139622 m!214759))

(assert (=> b!139622 m!214759))

(declare-fun m!214793 () Bool)

(assert (=> b!139622 m!214793))

(assert (=> b!139590 d!44817))

(declare-fun d!44819 () Bool)

(assert (=> d!44819 (= (array_inv!2672 arr!237) (bvsge (size!2883 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27126 d!44819))

(declare-fun d!44821 () Bool)

(assert (=> d!44821 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6130 thiss!1634) (currentByte!6135 thiss!1634) (size!2883 (buf!3299 thiss!1634))))))

(declare-fun bs!10983 () Bool)

(assert (= bs!10983 d!44821))

(assert (=> bs!10983 m!214753))

(assert (=> start!27126 d!44821))

(declare-fun d!44823 () Bool)

(assert (=> d!44823 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10984 () Bool)

(assert (= bs!10984 d!44823))

(declare-fun m!214795 () Bool)

(assert (=> bs!10984 m!214795))

(assert (=> b!139583 d!44823))

(declare-fun d!44825 () Bool)

(declare-datatypes ((tuple2!12260 0))(
  ( (tuple2!12261 (_1!6456 (_ BitVec 8)) (_2!6456 BitStream!5030)) )
))
(declare-fun lt!217566 () tuple2!12260)

(declare-fun readByte!0 (BitStream!5030) tuple2!12260)

(assert (=> d!44825 (= lt!217566 (readByte!0 (_1!6453 lt!217518)))))

(assert (=> d!44825 (= (readBytePure!0 (_1!6453 lt!217518)) (tuple2!12257 (_2!6456 lt!217566) (_1!6456 lt!217566)))))

(declare-fun bs!10985 () Bool)

(assert (= bs!10985 d!44825))

(declare-fun m!214797 () Bool)

(assert (=> bs!10985 m!214797))

(assert (=> b!139593 d!44825))

(declare-fun b!139633 () Bool)

(declare-fun e!93026 () Unit!8719)

(declare-fun Unit!8721 () Unit!8719)

(assert (=> b!139633 (= e!93026 Unit!8721)))

(declare-fun lt!217617 () (_ BitVec 64))

(declare-fun lt!217614 () tuple2!12254)

(declare-fun b!139634 () Bool)

(declare-fun lt!217615 () (_ BitVec 64))

(declare-fun e!93027 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!5030 (_ BitVec 64)) BitStream!5030)

(assert (=> b!139634 (= e!93027 (= (_1!6453 lt!217614) (withMovedBitIndex!0 (_2!6453 lt!217614) (bvsub lt!217617 lt!217615))))))

(assert (=> b!139634 (or (= (bvand lt!217617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217615 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217617 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217617 lt!217615) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139634 (= lt!217615 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(assert (=> b!139634 (= lt!217617 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(declare-fun d!44827 () Bool)

(assert (=> d!44827 e!93027))

(declare-fun res!116408 () Bool)

(assert (=> d!44827 (=> (not res!116408) (not e!93027))))

(assert (=> d!44827 (= res!116408 (isPrefixOf!0 (_1!6453 lt!217614) (_2!6453 lt!217614)))))

(declare-fun lt!217611 () BitStream!5030)

(assert (=> d!44827 (= lt!217614 (tuple2!12255 lt!217611 (_2!6455 lt!217523)))))

(declare-fun lt!217613 () Unit!8719)

(declare-fun lt!217608 () Unit!8719)

(assert (=> d!44827 (= lt!217613 lt!217608)))

(assert (=> d!44827 (isPrefixOf!0 lt!217611 (_2!6455 lt!217523))))

(assert (=> d!44827 (= lt!217608 (lemmaIsPrefixTransitive!0 lt!217611 (_2!6455 lt!217523) (_2!6455 lt!217523)))))

(declare-fun lt!217607 () Unit!8719)

(declare-fun lt!217620 () Unit!8719)

(assert (=> d!44827 (= lt!217607 lt!217620)))

(assert (=> d!44827 (isPrefixOf!0 lt!217611 (_2!6455 lt!217523))))

(assert (=> d!44827 (= lt!217620 (lemmaIsPrefixTransitive!0 lt!217611 thiss!1634 (_2!6455 lt!217523)))))

(declare-fun lt!217626 () Unit!8719)

(assert (=> d!44827 (= lt!217626 e!93026)))

(declare-fun c!7762 () Bool)

(assert (=> d!44827 (= c!7762 (not (= (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!217624 () Unit!8719)

(declare-fun lt!217623 () Unit!8719)

(assert (=> d!44827 (= lt!217624 lt!217623)))

(assert (=> d!44827 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217523))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5030) Unit!8719)

(assert (=> d!44827 (= lt!217623 (lemmaIsPrefixRefl!0 (_2!6455 lt!217523)))))

(declare-fun lt!217616 () Unit!8719)

(declare-fun lt!217625 () Unit!8719)

(assert (=> d!44827 (= lt!217616 lt!217625)))

(assert (=> d!44827 (= lt!217625 (lemmaIsPrefixRefl!0 (_2!6455 lt!217523)))))

(declare-fun lt!217609 () Unit!8719)

(declare-fun lt!217618 () Unit!8719)

(assert (=> d!44827 (= lt!217609 lt!217618)))

(assert (=> d!44827 (isPrefixOf!0 lt!217611 lt!217611)))

(assert (=> d!44827 (= lt!217618 (lemmaIsPrefixRefl!0 lt!217611))))

(declare-fun lt!217619 () Unit!8719)

(declare-fun lt!217610 () Unit!8719)

(assert (=> d!44827 (= lt!217619 lt!217610)))

(assert (=> d!44827 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44827 (= lt!217610 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44827 (= lt!217611 (BitStream!5031 (buf!3299 (_2!6455 lt!217523)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(assert (=> d!44827 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217523))))

(assert (=> d!44827 (= (reader!0 thiss!1634 (_2!6455 lt!217523)) lt!217614)))

(declare-fun b!139635 () Bool)

(declare-fun res!116406 () Bool)

(assert (=> b!139635 (=> (not res!116406) (not e!93027))))

(assert (=> b!139635 (= res!116406 (isPrefixOf!0 (_2!6453 lt!217614) (_2!6455 lt!217523)))))

(declare-fun b!139636 () Bool)

(declare-fun lt!217622 () Unit!8719)

(assert (=> b!139636 (= e!93026 lt!217622)))

(declare-fun lt!217621 () (_ BitVec 64))

(assert (=> b!139636 (= lt!217621 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217612 () (_ BitVec 64))

(assert (=> b!139636 (= lt!217612 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6370 array!6370 (_ BitVec 64) (_ BitVec 64)) Unit!8719)

(assert (=> b!139636 (= lt!217622 (arrayBitRangesEqSymmetric!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217523)) lt!217621 lt!217612))))

(assert (=> b!139636 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 thiss!1634) lt!217621 lt!217612)))

(declare-fun b!139637 () Bool)

(declare-fun res!116407 () Bool)

(assert (=> b!139637 (=> (not res!116407) (not e!93027))))

(assert (=> b!139637 (= res!116407 (isPrefixOf!0 (_1!6453 lt!217614) thiss!1634))))

(assert (= (and d!44827 c!7762) b!139636))

(assert (= (and d!44827 (not c!7762)) b!139633))

(assert (= (and d!44827 res!116408) b!139637))

(assert (= (and b!139637 res!116407) b!139635))

(assert (= (and b!139635 res!116406) b!139634))

(declare-fun m!214799 () Bool)

(assert (=> b!139637 m!214799))

(declare-fun m!214801 () Bool)

(assert (=> b!139634 m!214801))

(assert (=> b!139634 m!214757))

(assert (=> b!139634 m!214759))

(assert (=> b!139636 m!214759))

(declare-fun m!214803 () Bool)

(assert (=> b!139636 m!214803))

(declare-fun m!214805 () Bool)

(assert (=> b!139636 m!214805))

(declare-fun m!214807 () Bool)

(assert (=> b!139635 m!214807))

(declare-fun m!214809 () Bool)

(assert (=> d!44827 m!214809))

(declare-fun m!214811 () Bool)

(assert (=> d!44827 m!214811))

(declare-fun m!214813 () Bool)

(assert (=> d!44827 m!214813))

(declare-fun m!214815 () Bool)

(assert (=> d!44827 m!214815))

(declare-fun m!214817 () Bool)

(assert (=> d!44827 m!214817))

(declare-fun m!214819 () Bool)

(assert (=> d!44827 m!214819))

(declare-fun m!214821 () Bool)

(assert (=> d!44827 m!214821))

(assert (=> d!44827 m!214691))

(declare-fun m!214823 () Bool)

(assert (=> d!44827 m!214823))

(declare-fun m!214825 () Bool)

(assert (=> d!44827 m!214825))

(declare-fun m!214827 () Bool)

(assert (=> d!44827 m!214827))

(assert (=> b!139593 d!44827))

(assert (=> b!139586 d!44811))

(declare-fun d!44829 () Bool)

(declare-fun e!93028 () Bool)

(assert (=> d!44829 e!93028))

(declare-fun res!116409 () Bool)

(assert (=> d!44829 (=> (not res!116409) (not e!93028))))

(declare-fun lt!217628 () (_ BitVec 64))

(declare-fun lt!217627 () (_ BitVec 64))

(declare-fun lt!217630 () (_ BitVec 64))

(assert (=> d!44829 (= res!116409 (= lt!217628 (bvsub lt!217627 lt!217630)))))

(assert (=> d!44829 (or (= (bvand lt!217627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217630 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217627 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217627 lt!217630) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44829 (= lt!217630 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634))))))

(declare-fun lt!217632 () (_ BitVec 64))

(declare-fun lt!217631 () (_ BitVec 64))

(assert (=> d!44829 (= lt!217627 (bvmul lt!217632 lt!217631))))

(assert (=> d!44829 (or (= lt!217632 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217631 (bvsdiv (bvmul lt!217632 lt!217631) lt!217632)))))

(assert (=> d!44829 (= lt!217631 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44829 (= lt!217632 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))))))

(assert (=> d!44829 (= lt!217628 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 thiss!1634))))))

(assert (=> d!44829 (invariant!0 (currentBit!6130 thiss!1634) (currentByte!6135 thiss!1634) (size!2883 (buf!3299 thiss!1634)))))

(assert (=> d!44829 (= (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) lt!217628)))

(declare-fun b!139638 () Bool)

(declare-fun res!116410 () Bool)

(assert (=> b!139638 (=> (not res!116410) (not e!93028))))

(assert (=> b!139638 (= res!116410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217628))))

(declare-fun b!139639 () Bool)

(declare-fun lt!217629 () (_ BitVec 64))

(assert (=> b!139639 (= e!93028 (bvsle lt!217628 (bvmul lt!217629 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139639 (or (= lt!217629 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217629 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217629)))))

(assert (=> b!139639 (= lt!217629 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))))))

(assert (= (and d!44829 res!116409) b!139638))

(assert (= (and b!139638 res!116410) b!139639))

(assert (=> d!44829 m!214795))

(assert (=> d!44829 m!214753))

(assert (=> b!139586 d!44829))

(declare-fun d!44831 () Bool)

(assert (=> d!44831 (= (invariant!0 (currentBit!6130 thiss!1634) (currentByte!6135 thiss!1634) (size!2883 (buf!3299 thiss!1634))) (and (bvsge (currentBit!6130 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6130 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6135 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6135 thiss!1634) (size!2883 (buf!3299 thiss!1634))) (and (= (currentBit!6130 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6135 thiss!1634) (size!2883 (buf!3299 thiss!1634)))))))))

(assert (=> b!139596 d!44831))

(declare-fun d!44833 () Bool)

(assert (=> d!44833 (= (array_inv!2672 (buf!3299 thiss!1634)) (bvsge (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139585 d!44833))

(declare-fun d!44835 () Bool)

(declare-fun e!93031 () Bool)

(assert (=> d!44835 e!93031))

(declare-fun res!116413 () Bool)

(assert (=> d!44835 (=> (not res!116413) (not e!93031))))

(declare-fun lt!217643 () tuple2!12256)

(declare-fun lt!217642 () tuple2!12256)

(assert (=> d!44835 (= res!116413 (= (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217643))) (currentByte!6135 (_1!6454 lt!217643)) (currentBit!6130 (_1!6454 lt!217643))) (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217642))) (currentByte!6135 (_1!6454 lt!217642)) (currentBit!6130 (_1!6454 lt!217642)))))))

(declare-fun lt!217641 () Unit!8719)

(declare-fun lt!217644 () BitStream!5030)

(declare-fun choose!14 (BitStream!5030 BitStream!5030 BitStream!5030 tuple2!12256 tuple2!12256 BitStream!5030 (_ BitVec 8) tuple2!12256 tuple2!12256 BitStream!5030 (_ BitVec 8)) Unit!8719)

(assert (=> d!44835 (= lt!217641 (choose!14 lt!217517 (_2!6455 lt!217519) lt!217644 lt!217643 (tuple2!12257 (_1!6454 lt!217643) (_2!6454 lt!217643)) (_1!6454 lt!217643) (_2!6454 lt!217643) lt!217642 (tuple2!12257 (_1!6454 lt!217642) (_2!6454 lt!217642)) (_1!6454 lt!217642) (_2!6454 lt!217642)))))

(assert (=> d!44835 (= lt!217642 (readBytePure!0 lt!217644))))

(assert (=> d!44835 (= lt!217643 (readBytePure!0 lt!217517))))

(assert (=> d!44835 (= lt!217644 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 lt!217517) (currentBit!6130 lt!217517)))))

(assert (=> d!44835 (= (readBytePrefixLemma!0 lt!217517 (_2!6455 lt!217519)) lt!217641)))

(declare-fun b!139642 () Bool)

(assert (=> b!139642 (= e!93031 (= (_2!6454 lt!217643) (_2!6454 lt!217642)))))

(assert (= (and d!44835 res!116413) b!139642))

(declare-fun m!214829 () Bool)

(assert (=> d!44835 m!214829))

(declare-fun m!214831 () Bool)

(assert (=> d!44835 m!214831))

(assert (=> d!44835 m!214745))

(declare-fun m!214833 () Bool)

(assert (=> d!44835 m!214833))

(declare-fun m!214835 () Bool)

(assert (=> d!44835 m!214835))

(assert (=> b!139584 d!44835))

(declare-fun d!44837 () Bool)

(declare-fun lt!217645 () tuple2!12260)

(assert (=> d!44837 (= lt!217645 (readByte!0 (_1!6453 lt!217532)))))

(assert (=> d!44837 (= (readBytePure!0 (_1!6453 lt!217532)) (tuple2!12257 (_2!6456 lt!217645) (_1!6456 lt!217645)))))

(declare-fun bs!10986 () Bool)

(assert (= bs!10986 d!44837))

(declare-fun m!214837 () Bool)

(assert (=> bs!10986 m!214837))

(assert (=> b!139584 d!44837))

(declare-fun b!139643 () Bool)

(declare-fun e!93032 () Unit!8719)

(declare-fun Unit!8722 () Unit!8719)

(assert (=> b!139643 (= e!93032 Unit!8722)))

(declare-fun e!93033 () Bool)

(declare-fun lt!217654 () (_ BitVec 64))

(declare-fun lt!217656 () (_ BitVec 64))

(declare-fun b!139644 () Bool)

(declare-fun lt!217653 () tuple2!12254)

(assert (=> b!139644 (= e!93033 (= (_1!6453 lt!217653) (withMovedBitIndex!0 (_2!6453 lt!217653) (bvsub lt!217656 lt!217654))))))

(assert (=> b!139644 (or (= (bvand lt!217656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217654 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217656 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217656 lt!217654) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139644 (= lt!217654 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519))))))

(assert (=> b!139644 (= lt!217656 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(declare-fun d!44839 () Bool)

(assert (=> d!44839 e!93033))

(declare-fun res!116416 () Bool)

(assert (=> d!44839 (=> (not res!116416) (not e!93033))))

(assert (=> d!44839 (= res!116416 (isPrefixOf!0 (_1!6453 lt!217653) (_2!6453 lt!217653)))))

(declare-fun lt!217650 () BitStream!5030)

(assert (=> d!44839 (= lt!217653 (tuple2!12255 lt!217650 (_2!6455 lt!217519)))))

(declare-fun lt!217652 () Unit!8719)

(declare-fun lt!217647 () Unit!8719)

(assert (=> d!44839 (= lt!217652 lt!217647)))

(assert (=> d!44839 (isPrefixOf!0 lt!217650 (_2!6455 lt!217519))))

(assert (=> d!44839 (= lt!217647 (lemmaIsPrefixTransitive!0 lt!217650 (_2!6455 lt!217519) (_2!6455 lt!217519)))))

(declare-fun lt!217646 () Unit!8719)

(declare-fun lt!217659 () Unit!8719)

(assert (=> d!44839 (= lt!217646 lt!217659)))

(assert (=> d!44839 (isPrefixOf!0 lt!217650 (_2!6455 lt!217519))))

(assert (=> d!44839 (= lt!217659 (lemmaIsPrefixTransitive!0 lt!217650 (_2!6455 lt!217523) (_2!6455 lt!217519)))))

(declare-fun lt!217665 () Unit!8719)

(assert (=> d!44839 (= lt!217665 e!93032)))

(declare-fun c!7763 () Bool)

(assert (=> d!44839 (= c!7763 (not (= (size!2883 (buf!3299 (_2!6455 lt!217523))) #b00000000000000000000000000000000)))))

(declare-fun lt!217663 () Unit!8719)

(declare-fun lt!217662 () Unit!8719)

(assert (=> d!44839 (= lt!217663 lt!217662)))

(assert (=> d!44839 (isPrefixOf!0 (_2!6455 lt!217519) (_2!6455 lt!217519))))

(assert (=> d!44839 (= lt!217662 (lemmaIsPrefixRefl!0 (_2!6455 lt!217519)))))

(declare-fun lt!217655 () Unit!8719)

(declare-fun lt!217664 () Unit!8719)

(assert (=> d!44839 (= lt!217655 lt!217664)))

(assert (=> d!44839 (= lt!217664 (lemmaIsPrefixRefl!0 (_2!6455 lt!217519)))))

(declare-fun lt!217648 () Unit!8719)

(declare-fun lt!217657 () Unit!8719)

(assert (=> d!44839 (= lt!217648 lt!217657)))

(assert (=> d!44839 (isPrefixOf!0 lt!217650 lt!217650)))

(assert (=> d!44839 (= lt!217657 (lemmaIsPrefixRefl!0 lt!217650))))

(declare-fun lt!217658 () Unit!8719)

(declare-fun lt!217649 () Unit!8719)

(assert (=> d!44839 (= lt!217658 lt!217649)))

(assert (=> d!44839 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217523))))

(assert (=> d!44839 (= lt!217649 (lemmaIsPrefixRefl!0 (_2!6455 lt!217523)))))

(assert (=> d!44839 (= lt!217650 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(assert (=> d!44839 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217519))))

(assert (=> d!44839 (= (reader!0 (_2!6455 lt!217523) (_2!6455 lt!217519)) lt!217653)))

(declare-fun b!139645 () Bool)

(declare-fun res!116414 () Bool)

(assert (=> b!139645 (=> (not res!116414) (not e!93033))))

(assert (=> b!139645 (= res!116414 (isPrefixOf!0 (_2!6453 lt!217653) (_2!6455 lt!217519)))))

(declare-fun b!139646 () Bool)

(declare-fun lt!217661 () Unit!8719)

(assert (=> b!139646 (= e!93032 lt!217661)))

(declare-fun lt!217660 () (_ BitVec 64))

(assert (=> b!139646 (= lt!217660 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217651 () (_ BitVec 64))

(assert (=> b!139646 (= lt!217651 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(assert (=> b!139646 (= lt!217661 (arrayBitRangesEqSymmetric!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217519)) lt!217660 lt!217651))))

(assert (=> b!139646 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217519)) (buf!3299 (_2!6455 lt!217523)) lt!217660 lt!217651)))

(declare-fun b!139647 () Bool)

(declare-fun res!116415 () Bool)

(assert (=> b!139647 (=> (not res!116415) (not e!93033))))

(assert (=> b!139647 (= res!116415 (isPrefixOf!0 (_1!6453 lt!217653) (_2!6455 lt!217523)))))

(assert (= (and d!44839 c!7763) b!139646))

(assert (= (and d!44839 (not c!7763)) b!139643))

(assert (= (and d!44839 res!116416) b!139647))

(assert (= (and b!139647 res!116415) b!139645))

(assert (= (and b!139645 res!116414) b!139644))

(declare-fun m!214839 () Bool)

(assert (=> b!139647 m!214839))

(declare-fun m!214841 () Bool)

(assert (=> b!139644 m!214841))

(assert (=> b!139644 m!214755))

(assert (=> b!139644 m!214757))

(assert (=> b!139646 m!214757))

(declare-fun m!214843 () Bool)

(assert (=> b!139646 m!214843))

(declare-fun m!214845 () Bool)

(assert (=> b!139646 m!214845))

(declare-fun m!214847 () Bool)

(assert (=> b!139645 m!214847))

(declare-fun m!214849 () Bool)

(assert (=> d!44839 m!214849))

(declare-fun m!214851 () Bool)

(assert (=> d!44839 m!214851))

(declare-fun m!214853 () Bool)

(assert (=> d!44839 m!214853))

(assert (=> d!44839 m!214809))

(declare-fun m!214855 () Bool)

(assert (=> d!44839 m!214855))

(declare-fun m!214857 () Bool)

(assert (=> d!44839 m!214857))

(declare-fun m!214859 () Bool)

(assert (=> d!44839 m!214859))

(assert (=> d!44839 m!214689))

(declare-fun m!214861 () Bool)

(assert (=> d!44839 m!214861))

(assert (=> d!44839 m!214817))

(declare-fun m!214863 () Bool)

(assert (=> d!44839 m!214863))

(assert (=> b!139584 d!44839))

(declare-fun d!44841 () Bool)

(declare-fun res!116417 () Bool)

(declare-fun e!93034 () Bool)

(assert (=> d!44841 (=> (not res!116417) (not e!93034))))

(assert (=> d!44841 (= res!116417 (= (size!2883 (buf!3299 thiss!1634)) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!44841 (= (isPrefixOf!0 thiss!1634 (_2!6455 lt!217519)) e!93034)))

(declare-fun b!139648 () Bool)

(declare-fun res!116418 () Bool)

(assert (=> b!139648 (=> (not res!116418) (not e!93034))))

(assert (=> b!139648 (= res!116418 (bvsle (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun b!139649 () Bool)

(declare-fun e!93035 () Bool)

(assert (=> b!139649 (= e!93034 e!93035)))

(declare-fun res!116419 () Bool)

(assert (=> b!139649 (=> res!116419 e!93035)))

(assert (=> b!139649 (= res!116419 (= (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139650 () Bool)

(assert (=> b!139650 (= e!93035 (arrayBitRangesEq!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (= (and d!44841 res!116417) b!139648))

(assert (= (and b!139648 res!116418) b!139649))

(assert (= (and b!139649 (not res!116419)) b!139650))

(assert (=> b!139648 m!214759))

(assert (=> b!139648 m!214755))

(assert (=> b!139650 m!214759))

(assert (=> b!139650 m!214759))

(declare-fun m!214865 () Bool)

(assert (=> b!139650 m!214865))

(assert (=> b!139584 d!44841))

(declare-fun d!44843 () Bool)

(declare-fun lt!217666 () tuple2!12260)

(assert (=> d!44843 (= lt!217666 (readByte!0 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (=> d!44843 (= (readBytePure!0 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) (tuple2!12257 (_2!6456 lt!217666) (_1!6456 lt!217666)))))

(declare-fun bs!10987 () Bool)

(assert (= bs!10987 d!44843))

(declare-fun m!214867 () Bool)

(assert (=> bs!10987 m!214867))

(assert (=> b!139584 d!44843))

(declare-fun b!139651 () Bool)

(declare-fun e!93036 () Unit!8719)

(declare-fun Unit!8723 () Unit!8719)

(assert (=> b!139651 (= e!93036 Unit!8723)))

(declare-fun e!93037 () Bool)

(declare-fun lt!217675 () (_ BitVec 64))

(declare-fun lt!217677 () (_ BitVec 64))

(declare-fun b!139652 () Bool)

(declare-fun lt!217674 () tuple2!12254)

(assert (=> b!139652 (= e!93037 (= (_1!6453 lt!217674) (withMovedBitIndex!0 (_2!6453 lt!217674) (bvsub lt!217677 lt!217675))))))

(assert (=> b!139652 (or (= (bvand lt!217677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217675 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217677 lt!217675) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139652 (= lt!217675 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519))))))

(assert (=> b!139652 (= lt!217677 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(declare-fun d!44845 () Bool)

(assert (=> d!44845 e!93037))

(declare-fun res!116422 () Bool)

(assert (=> d!44845 (=> (not res!116422) (not e!93037))))

(assert (=> d!44845 (= res!116422 (isPrefixOf!0 (_1!6453 lt!217674) (_2!6453 lt!217674)))))

(declare-fun lt!217671 () BitStream!5030)

(assert (=> d!44845 (= lt!217674 (tuple2!12255 lt!217671 (_2!6455 lt!217519)))))

(declare-fun lt!217673 () Unit!8719)

(declare-fun lt!217668 () Unit!8719)

(assert (=> d!44845 (= lt!217673 lt!217668)))

(assert (=> d!44845 (isPrefixOf!0 lt!217671 (_2!6455 lt!217519))))

(assert (=> d!44845 (= lt!217668 (lemmaIsPrefixTransitive!0 lt!217671 (_2!6455 lt!217519) (_2!6455 lt!217519)))))

(declare-fun lt!217667 () Unit!8719)

(declare-fun lt!217680 () Unit!8719)

(assert (=> d!44845 (= lt!217667 lt!217680)))

(assert (=> d!44845 (isPrefixOf!0 lt!217671 (_2!6455 lt!217519))))

(assert (=> d!44845 (= lt!217680 (lemmaIsPrefixTransitive!0 lt!217671 thiss!1634 (_2!6455 lt!217519)))))

(declare-fun lt!217686 () Unit!8719)

(assert (=> d!44845 (= lt!217686 e!93036)))

(declare-fun c!7764 () Bool)

(assert (=> d!44845 (= c!7764 (not (= (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!217684 () Unit!8719)

(declare-fun lt!217683 () Unit!8719)

(assert (=> d!44845 (= lt!217684 lt!217683)))

(assert (=> d!44845 (isPrefixOf!0 (_2!6455 lt!217519) (_2!6455 lt!217519))))

(assert (=> d!44845 (= lt!217683 (lemmaIsPrefixRefl!0 (_2!6455 lt!217519)))))

(declare-fun lt!217676 () Unit!8719)

(declare-fun lt!217685 () Unit!8719)

(assert (=> d!44845 (= lt!217676 lt!217685)))

(assert (=> d!44845 (= lt!217685 (lemmaIsPrefixRefl!0 (_2!6455 lt!217519)))))

(declare-fun lt!217669 () Unit!8719)

(declare-fun lt!217678 () Unit!8719)

(assert (=> d!44845 (= lt!217669 lt!217678)))

(assert (=> d!44845 (isPrefixOf!0 lt!217671 lt!217671)))

(assert (=> d!44845 (= lt!217678 (lemmaIsPrefixRefl!0 lt!217671))))

(declare-fun lt!217679 () Unit!8719)

(declare-fun lt!217670 () Unit!8719)

(assert (=> d!44845 (= lt!217679 lt!217670)))

(assert (=> d!44845 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!44845 (= lt!217670 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!44845 (= lt!217671 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(assert (=> d!44845 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217519))))

(assert (=> d!44845 (= (reader!0 thiss!1634 (_2!6455 lt!217519)) lt!217674)))

(declare-fun b!139653 () Bool)

(declare-fun res!116420 () Bool)

(assert (=> b!139653 (=> (not res!116420) (not e!93037))))

(assert (=> b!139653 (= res!116420 (isPrefixOf!0 (_2!6453 lt!217674) (_2!6455 lt!217519)))))

(declare-fun b!139654 () Bool)

(declare-fun lt!217682 () Unit!8719)

(assert (=> b!139654 (= e!93036 lt!217682)))

(declare-fun lt!217681 () (_ BitVec 64))

(assert (=> b!139654 (= lt!217681 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!217672 () (_ BitVec 64))

(assert (=> b!139654 (= lt!217672 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(assert (=> b!139654 (= lt!217682 (arrayBitRangesEqSymmetric!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217519)) lt!217681 lt!217672))))

(assert (=> b!139654 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217519)) (buf!3299 thiss!1634) lt!217681 lt!217672)))

(declare-fun b!139655 () Bool)

(declare-fun res!116421 () Bool)

(assert (=> b!139655 (=> (not res!116421) (not e!93037))))

(assert (=> b!139655 (= res!116421 (isPrefixOf!0 (_1!6453 lt!217674) thiss!1634))))

(assert (= (and d!44845 c!7764) b!139654))

(assert (= (and d!44845 (not c!7764)) b!139651))

(assert (= (and d!44845 res!116422) b!139655))

(assert (= (and b!139655 res!116421) b!139653))

(assert (= (and b!139653 res!116420) b!139652))

(declare-fun m!214869 () Bool)

(assert (=> b!139655 m!214869))

(declare-fun m!214871 () Bool)

(assert (=> b!139652 m!214871))

(assert (=> b!139652 m!214755))

(assert (=> b!139652 m!214759))

(assert (=> b!139654 m!214759))

(declare-fun m!214873 () Bool)

(assert (=> b!139654 m!214873))

(declare-fun m!214875 () Bool)

(assert (=> b!139654 m!214875))

(declare-fun m!214877 () Bool)

(assert (=> b!139653 m!214877))

(assert (=> d!44845 m!214849))

(declare-fun m!214879 () Bool)

(assert (=> d!44845 m!214879))

(declare-fun m!214881 () Bool)

(assert (=> d!44845 m!214881))

(assert (=> d!44845 m!214815))

(assert (=> d!44845 m!214855))

(declare-fun m!214883 () Bool)

(assert (=> d!44845 m!214883))

(declare-fun m!214885 () Bool)

(assert (=> d!44845 m!214885))

(assert (=> d!44845 m!214723))

(declare-fun m!214887 () Bool)

(assert (=> d!44845 m!214887))

(assert (=> d!44845 m!214825))

(declare-fun m!214889 () Bool)

(assert (=> d!44845 m!214889))

(assert (=> b!139584 d!44845))

(declare-fun d!44847 () Bool)

(declare-fun res!116423 () Bool)

(declare-fun e!93038 () Bool)

(assert (=> d!44847 (=> res!116423 e!93038)))

(assert (=> d!44847 (= res!116423 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44847 (= (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217531) #b00000000000000000000000000000000 to!404) e!93038)))

(declare-fun b!139656 () Bool)

(declare-fun e!93039 () Bool)

(assert (=> b!139656 (= e!93038 e!93039)))

(declare-fun res!116424 () Bool)

(assert (=> b!139656 (=> (not res!116424) (not e!93039))))

(assert (=> b!139656 (= res!116424 (= (select (arr!3578 (_2!6452 lt!217524)) #b00000000000000000000000000000000) (select (arr!3578 (_2!6452 lt!217531)) #b00000000000000000000000000000000)))))

(declare-fun b!139657 () Bool)

(assert (=> b!139657 (= e!93039 (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217531) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44847 (not res!116423)) b!139656))

(assert (= (and b!139656 res!116424) b!139657))

(declare-fun m!214891 () Bool)

(assert (=> b!139656 m!214891))

(declare-fun m!214893 () Bool)

(assert (=> b!139656 m!214893))

(declare-fun m!214895 () Bool)

(assert (=> b!139657 m!214895))

(assert (=> b!139584 d!44847))

(declare-fun d!44849 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5030 (_ BitVec 32)) tuple2!12258)

(assert (=> d!44849 (= (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) (_2!6455 (moveByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)))))

(declare-fun bs!10988 () Bool)

(assert (= bs!10988 d!44849))

(declare-fun m!214897 () Bool)

(assert (=> bs!10988 m!214897))

(assert (=> b!139584 d!44849))

(declare-fun d!44851 () Bool)

(assert (=> d!44851 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10989 () Bool)

(assert (= bs!10989 d!44851))

(declare-fun m!214899 () Bool)

(assert (=> bs!10989 m!214899))

(assert (=> b!139584 d!44851))

(declare-fun d!44853 () Bool)

(assert (=> d!44853 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217534)))

(declare-fun lt!217689 () Unit!8719)

(declare-fun choose!26 (BitStream!5030 array!6370 (_ BitVec 32) BitStream!5030) Unit!8719)

(assert (=> d!44853 (= lt!217689 (choose!26 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217534 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (=> d!44853 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217534) lt!217689)))

(declare-fun bs!10990 () Bool)

(assert (= bs!10990 d!44853))

(assert (=> bs!10990 m!214709))

(declare-fun m!214901 () Bool)

(assert (=> bs!10990 m!214901))

(assert (=> b!139584 d!44853))

(declare-fun d!44855 () Bool)

(declare-fun e!93042 () Bool)

(assert (=> d!44855 e!93042))

(declare-fun res!116431 () Bool)

(assert (=> d!44855 (=> (not res!116431) (not e!93042))))

(declare-fun lt!217700 () tuple2!12258)

(assert (=> d!44855 (= res!116431 (= (size!2883 (buf!3299 thiss!1634)) (size!2883 (buf!3299 (_2!6455 lt!217700)))))))

(declare-fun choose!6 (BitStream!5030 (_ BitVec 8)) tuple2!12258)

(assert (=> d!44855 (= lt!217700 (choose!6 thiss!1634 (select (arr!3578 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!44855 (validate_offset_byte!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634)))))

(assert (=> d!44855 (= (appendByte!0 thiss!1634 (select (arr!3578 arr!237) from!447)) lt!217700)))

(declare-fun b!139664 () Bool)

(declare-fun res!116432 () Bool)

(assert (=> b!139664 (=> (not res!116432) (not e!93042))))

(declare-fun lt!217701 () (_ BitVec 64))

(declare-fun lt!217704 () (_ BitVec 64))

(assert (=> b!139664 (= res!116432 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217700))) (currentByte!6135 (_2!6455 lt!217700)) (currentBit!6130 (_2!6455 lt!217700))) (bvadd lt!217701 lt!217704)))))

(assert (=> b!139664 (or (not (= (bvand lt!217701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217704 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!217701 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!217701 lt!217704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139664 (= lt!217704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!139664 (= lt!217701 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(declare-fun b!139665 () Bool)

(declare-fun res!116433 () Bool)

(assert (=> b!139665 (=> (not res!116433) (not e!93042))))

(assert (=> b!139665 (= res!116433 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217700)))))

(declare-fun lt!217703 () tuple2!12256)

(declare-fun b!139666 () Bool)

(declare-fun lt!217702 () tuple2!12254)

(assert (=> b!139666 (= e!93042 (and (= (_2!6454 lt!217703) (select (arr!3578 arr!237) from!447)) (= (_1!6454 lt!217703) (_2!6453 lt!217702))))))

(assert (=> b!139666 (= lt!217703 (readBytePure!0 (_1!6453 lt!217702)))))

(assert (=> b!139666 (= lt!217702 (reader!0 thiss!1634 (_2!6455 lt!217700)))))

(assert (= (and d!44855 res!116431) b!139664))

(assert (= (and b!139664 res!116432) b!139665))

(assert (= (and b!139665 res!116433) b!139666))

(assert (=> d!44855 m!214735))

(declare-fun m!214903 () Bool)

(assert (=> d!44855 m!214903))

(declare-fun m!214905 () Bool)

(assert (=> d!44855 m!214905))

(declare-fun m!214907 () Bool)

(assert (=> b!139664 m!214907))

(assert (=> b!139664 m!214759))

(declare-fun m!214909 () Bool)

(assert (=> b!139665 m!214909))

(declare-fun m!214911 () Bool)

(assert (=> b!139666 m!214911))

(declare-fun m!214913 () Bool)

(assert (=> b!139666 m!214913))

(assert (=> b!139584 d!44855))

(declare-fun d!44857 () Bool)

(declare-fun e!93043 () Bool)

(assert (=> d!44857 e!93043))

(declare-fun res!116434 () Bool)

(assert (=> d!44857 (=> (not res!116434) (not e!93043))))

(declare-fun lt!217708 () (_ BitVec 64))

(declare-fun lt!217706 () (_ BitVec 64))

(declare-fun lt!217705 () (_ BitVec 64))

(assert (=> d!44857 (= res!116434 (= lt!217706 (bvsub lt!217705 lt!217708)))))

(assert (=> d!44857 (or (= (bvand lt!217705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217708 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217705 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217705 lt!217708) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44857 (= lt!217708 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217533)))) ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217533))) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217533)))))))

(declare-fun lt!217710 () (_ BitVec 64))

(declare-fun lt!217709 () (_ BitVec 64))

(assert (=> d!44857 (= lt!217705 (bvmul lt!217710 lt!217709))))

(assert (=> d!44857 (or (= lt!217710 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217709 (bvsdiv (bvmul lt!217710 lt!217709) lt!217710)))))

(assert (=> d!44857 (= lt!217709 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44857 (= lt!217710 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217533)))))))

(assert (=> d!44857 (= lt!217706 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217533))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217533)))))))

(assert (=> d!44857 (invariant!0 (currentBit!6130 (_1!6454 lt!217533)) (currentByte!6135 (_1!6454 lt!217533)) (size!2883 (buf!3299 (_1!6454 lt!217533))))))

(assert (=> d!44857 (= (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217533))) (currentByte!6135 (_1!6454 lt!217533)) (currentBit!6130 (_1!6454 lt!217533))) lt!217706)))

(declare-fun b!139667 () Bool)

(declare-fun res!116435 () Bool)

(assert (=> b!139667 (=> (not res!116435) (not e!93043))))

(assert (=> b!139667 (= res!116435 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217706))))

(declare-fun b!139668 () Bool)

(declare-fun lt!217707 () (_ BitVec 64))

(assert (=> b!139668 (= e!93043 (bvsle lt!217706 (bvmul lt!217707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139668 (or (= lt!217707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217707)))))

(assert (=> b!139668 (= lt!217707 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217533)))))))

(assert (= (and d!44857 res!116434) b!139667))

(assert (= (and b!139667 res!116435) b!139668))

(declare-fun m!214915 () Bool)

(assert (=> d!44857 m!214915))

(declare-fun m!214917 () Bool)

(assert (=> d!44857 m!214917))

(assert (=> b!139584 d!44857))

(declare-fun d!44859 () Bool)

(declare-datatypes ((tuple3!530 0))(
  ( (tuple3!531 (_1!6457 Unit!8719) (_2!6457 BitStream!5030) (_3!326 array!6370)) )
))
(declare-fun lt!217713 () tuple3!530)

(declare-fun readByteArrayLoop!0 (BitStream!5030 array!6370 (_ BitVec 32) (_ BitVec 32)) tuple3!530)

(assert (=> d!44859 (= lt!217713 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44859 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12253 (_2!6457 lt!217713) (_3!326 lt!217713)))))

(declare-fun bs!10991 () Bool)

(assert (= bs!10991 d!44859))

(assert (=> bs!10991 m!214699))

(declare-fun m!214919 () Bool)

(assert (=> bs!10991 m!214919))

(assert (=> b!139584 d!44859))

(declare-fun d!44861 () Bool)

(declare-fun res!116436 () Bool)

(declare-fun e!93044 () Bool)

(assert (=> d!44861 (=> res!116436 e!93044)))

(assert (=> d!44861 (= res!116436 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44861 (= (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217535) #b00000000000000000000000000000000 to!404) e!93044)))

(declare-fun b!139669 () Bool)

(declare-fun e!93045 () Bool)

(assert (=> b!139669 (= e!93044 e!93045)))

(declare-fun res!116437 () Bool)

(assert (=> b!139669 (=> (not res!116437) (not e!93045))))

(assert (=> b!139669 (= res!116437 (= (select (arr!3578 (_2!6452 lt!217524)) #b00000000000000000000000000000000) (select (arr!3578 (_2!6452 lt!217535)) #b00000000000000000000000000000000)))))

(declare-fun b!139670 () Bool)

(assert (=> b!139670 (= e!93045 (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217535) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44861 (not res!116436)) b!139669))

(assert (= (and b!139669 res!116437) b!139670))

(assert (=> b!139669 m!214891))

(declare-fun m!214921 () Bool)

(assert (=> b!139669 m!214921))

(declare-fun m!214923 () Bool)

(assert (=> b!139670 m!214923))

(assert (=> b!139584 d!44861))

(declare-fun d!44863 () Bool)

(assert (=> d!44863 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217534) (bvsle ((_ sign_extend 32) lt!217534) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10992 () Bool)

(assert (= bs!10992 d!44863))

(declare-fun m!214925 () Bool)

(assert (=> bs!10992 m!214925))

(assert (=> b!139584 d!44863))

(declare-fun d!44865 () Bool)

(declare-fun lt!217714 () tuple3!530)

(assert (=> d!44865 (= lt!217714 (readByteArrayLoop!0 (_1!6453 lt!217522) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44865 (= (readByteArrayLoopPure!0 (_1!6453 lt!217522) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12253 (_2!6457 lt!217714) (_3!326 lt!217714)))))

(declare-fun bs!10993 () Bool)

(assert (= bs!10993 d!44865))

(declare-fun m!214927 () Bool)

(assert (=> bs!10993 m!214927))

(assert (=> b!139584 d!44865))

(declare-fun d!44867 () Bool)

(assert (=> d!44867 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!217715 () Unit!8719)

(assert (=> d!44867 (= lt!217715 (choose!26 thiss!1634 (buf!3299 (_2!6455 lt!217519)) (bvsub to!404 from!447) (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (=> d!44867 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3299 (_2!6455 lt!217519)) (bvsub to!404 from!447)) lt!217715)))

(declare-fun bs!10994 () Bool)

(assert (= bs!10994 d!44867))

(assert (=> bs!10994 m!214713))

(declare-fun m!214929 () Bool)

(assert (=> bs!10994 m!214929))

(assert (=> b!139584 d!44867))

(declare-fun d!44869 () Bool)

(declare-fun lt!217716 () tuple2!12260)

(assert (=> d!44869 (= lt!217716 (readByte!0 lt!217517))))

(assert (=> d!44869 (= (readBytePure!0 lt!217517) (tuple2!12257 (_2!6456 lt!217716) (_1!6456 lt!217716)))))

(declare-fun bs!10995 () Bool)

(assert (= bs!10995 d!44869))

(declare-fun m!214931 () Bool)

(assert (=> bs!10995 m!214931))

(assert (=> b!139584 d!44869))

(declare-fun d!44871 () Bool)

(declare-fun e!93048 () Bool)

(assert (=> d!44871 e!93048))

(declare-fun res!116440 () Bool)

(assert (=> d!44871 (=> (not res!116440) (not e!93048))))

(assert (=> d!44871 (= res!116440 (and (or (let ((rhs!3163 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3163 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3163) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!44872 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!44872 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!44872 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3162 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3162 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3162) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!217725 () Unit!8719)

(declare-fun choose!57 (BitStream!5030 BitStream!5030 (_ BitVec 64) (_ BitVec 32)) Unit!8719)

(assert (=> d!44871 (= lt!217725 (choose!57 thiss!1634 (_2!6455 lt!217523) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!44871 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6455 lt!217523) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!217725)))

(declare-fun lt!217724 () (_ BitVec 32))

(declare-fun b!139673 () Bool)

(assert (=> b!139673 (= e!93048 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) (bvsub (bvsub to!404 from!447) lt!217724)))))

(assert (=> b!139673 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!217724 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!217724) #b10000000000000000000000000000000)))))

(declare-fun lt!217723 () (_ BitVec 64))

(assert (=> b!139673 (= lt!217724 ((_ extract 31 0) lt!217723))))

(assert (=> b!139673 (and (bvslt lt!217723 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!217723 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!139673 (= lt!217723 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!44871 res!116440) b!139673))

(declare-fun m!214933 () Bool)

(assert (=> d!44871 m!214933))

(declare-fun m!214935 () Bool)

(assert (=> b!139673 m!214935))

(assert (=> b!139584 d!44871))

(declare-fun d!44874 () Bool)

(declare-fun lt!217726 () tuple3!530)

(assert (=> d!44874 (= lt!217726 (readByteArrayLoop!0 (_1!6453 lt!217532) arr!237 from!447 to!404))))

(assert (=> d!44874 (= (readByteArrayLoopPure!0 (_1!6453 lt!217532) arr!237 from!447 to!404) (tuple2!12253 (_2!6457 lt!217726) (_3!326 lt!217726)))))

(declare-fun bs!10996 () Bool)

(assert (= bs!10996 d!44874))

(declare-fun m!214937 () Bool)

(assert (=> bs!10996 m!214937))

(assert (=> b!139584 d!44874))

(declare-fun d!44876 () Bool)

(assert (=> d!44876 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217534) (bvsle ((_ sign_extend 32) lt!217534) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!10997 () Bool)

(assert (= bs!10997 d!44876))

(assert (=> bs!10997 m!214783))

(assert (=> b!139584 d!44876))

(declare-fun d!44878 () Bool)

(declare-fun lt!217735 () tuple2!12252)

(declare-fun lt!217737 () tuple2!12252)

(assert (=> d!44878 (arrayRangesEq!247 (_2!6452 lt!217735) (_2!6452 lt!217737) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!217738 () Unit!8719)

(declare-fun lt!217736 () BitStream!5030)

(declare-fun choose!35 (BitStream!5030 array!6370 (_ BitVec 32) (_ BitVec 32) tuple2!12252 array!6370 BitStream!5030 tuple2!12252 array!6370) Unit!8719)

(assert (=> d!44878 (= lt!217738 (choose!35 (_1!6453 lt!217532) arr!237 from!447 to!404 lt!217735 (_2!6452 lt!217735) lt!217736 lt!217737 (_2!6452 lt!217737)))))

(assert (=> d!44878 (= lt!217737 (readByteArrayLoopPure!0 lt!217736 (array!6371 (store (arr!3578 arr!237) from!447 (_2!6454 (readBytePure!0 (_1!6453 lt!217532)))) (size!2883 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!44878 (= lt!217736 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))))

(assert (=> d!44878 (= lt!217735 (readByteArrayLoopPure!0 (_1!6453 lt!217532) arr!237 from!447 to!404))))

(assert (=> d!44878 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6453 lt!217532) arr!237 from!447 to!404) lt!217738)))

(declare-fun bs!10999 () Bool)

(assert (= bs!10999 d!44878))

(assert (=> bs!10999 m!214743))

(declare-fun m!214939 () Bool)

(assert (=> bs!10999 m!214939))

(declare-fun m!214941 () Bool)

(assert (=> bs!10999 m!214941))

(assert (=> bs!10999 m!214699))

(assert (=> bs!10999 m!214693))

(declare-fun m!214943 () Bool)

(assert (=> bs!10999 m!214943))

(declare-fun m!214945 () Bool)

(assert (=> bs!10999 m!214945))

(assert (=> b!139584 d!44878))

(declare-fun d!44880 () Bool)

(assert (=> d!44880 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217519))))

(declare-fun lt!217741 () Unit!8719)

(declare-fun choose!30 (BitStream!5030 BitStream!5030 BitStream!5030) Unit!8719)

(assert (=> d!44880 (= lt!217741 (choose!30 thiss!1634 (_2!6455 lt!217523) (_2!6455 lt!217519)))))

(assert (=> d!44880 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217523))))

(assert (=> d!44880 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6455 lt!217523) (_2!6455 lt!217519)) lt!217741)))

(declare-fun bs!11000 () Bool)

(assert (= bs!11000 d!44880))

(assert (=> bs!11000 m!214723))

(declare-fun m!214947 () Bool)

(assert (=> bs!11000 m!214947))

(assert (=> bs!11000 m!214691))

(assert (=> b!139584 d!44880))

(declare-fun b!139684 () Bool)

(declare-fun e!93057 () Bool)

(declare-fun e!93055 () Bool)

(assert (=> b!139684 (= e!93057 e!93055)))

(declare-fun res!116452 () Bool)

(assert (=> b!139684 (=> (not res!116452) (not e!93055))))

(declare-fun lt!217768 () tuple2!12252)

(declare-fun lt!217764 () tuple2!12254)

(assert (=> b!139684 (= res!116452 (and (= (size!2883 (_2!6452 lt!217768)) (size!2883 arr!237)) (= (_1!6452 lt!217768) (_2!6453 lt!217764))))))

(assert (=> b!139684 (= lt!217768 (readByteArrayLoopPure!0 (_1!6453 lt!217764) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!217760 () Unit!8719)

(declare-fun lt!217765 () Unit!8719)

(assert (=> b!139684 (= lt!217760 lt!217765)))

(declare-fun lt!217762 () tuple2!12258)

(declare-fun lt!217761 () (_ BitVec 64))

(assert (=> b!139684 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217762)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217761)))

(assert (=> b!139684 (= lt!217765 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217762)) lt!217761))))

(declare-fun e!93056 () Bool)

(assert (=> b!139684 e!93056))

(declare-fun res!116453 () Bool)

(assert (=> b!139684 (=> (not res!116453) (not e!93056))))

(assert (=> b!139684 (= res!116453 (and (= (size!2883 (buf!3299 (_2!6455 lt!217523))) (size!2883 (buf!3299 (_2!6455 lt!217762)))) (bvsge lt!217761 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139684 (= lt!217761 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!139684 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!139684 (= lt!217764 (reader!0 (_2!6455 lt!217523) (_2!6455 lt!217762)))))

(declare-fun d!44882 () Bool)

(assert (=> d!44882 e!93057))

(declare-fun res!116455 () Bool)

(assert (=> d!44882 (=> (not res!116455) (not e!93057))))

(assert (=> d!44882 (= res!116455 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) (size!2883 (buf!3299 (_2!6455 lt!217762)))))))

(declare-fun choose!64 (BitStream!5030 array!6370 (_ BitVec 32) (_ BitVec 32)) tuple2!12258)

(assert (=> d!44882 (= lt!217762 (choose!64 (_2!6455 lt!217523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44882 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2883 arr!237)))))

(assert (=> d!44882 (= (appendByteArrayLoop!0 (_2!6455 lt!217523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!217762)))

(declare-fun b!139685 () Bool)

(declare-fun res!116454 () Bool)

(assert (=> b!139685 (=> (not res!116454) (not e!93057))))

(assert (=> b!139685 (= res!116454 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217762)))))

(declare-fun b!139686 () Bool)

(assert (=> b!139686 (= e!93056 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217761))))

(declare-fun b!139687 () Bool)

(assert (=> b!139687 (= e!93055 (arrayRangesEq!247 arr!237 (_2!6452 lt!217768) #b00000000000000000000000000000000 to!404))))

(declare-fun b!139688 () Bool)

(declare-fun res!116451 () Bool)

(assert (=> b!139688 (=> (not res!116451) (not e!93057))))

(declare-fun lt!217766 () (_ BitVec 64))

(declare-fun lt!217763 () (_ BitVec 64))

(assert (=> b!139688 (= res!116451 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217762))) (currentByte!6135 (_2!6455 lt!217762)) (currentBit!6130 (_2!6455 lt!217762))) (bvadd lt!217763 lt!217766)))))

(assert (=> b!139688 (or (not (= (bvand lt!217763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217766 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!217763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!217763 lt!217766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!217767 () (_ BitVec 64))

(assert (=> b!139688 (= lt!217766 (bvmul lt!217767 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!139688 (or (= lt!217767 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217767 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217767)))))

(assert (=> b!139688 (= lt!217767 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!139688 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!139688 (= lt!217763 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(assert (= (and d!44882 res!116455) b!139688))

(assert (= (and b!139688 res!116451) b!139685))

(assert (= (and b!139685 res!116454) b!139684))

(assert (= (and b!139684 res!116453) b!139686))

(assert (= (and b!139684 res!116452) b!139687))

(declare-fun m!214949 () Bool)

(assert (=> b!139687 m!214949))

(declare-fun m!214951 () Bool)

(assert (=> b!139684 m!214951))

(declare-fun m!214953 () Bool)

(assert (=> b!139684 m!214953))

(declare-fun m!214955 () Bool)

(assert (=> b!139684 m!214955))

(declare-fun m!214957 () Bool)

(assert (=> b!139684 m!214957))

(declare-fun m!214959 () Bool)

(assert (=> b!139685 m!214959))

(declare-fun m!214961 () Bool)

(assert (=> b!139688 m!214961))

(assert (=> b!139688 m!214757))

(declare-fun m!214963 () Bool)

(assert (=> b!139686 m!214963))

(declare-fun m!214965 () Bool)

(assert (=> d!44882 m!214965))

(assert (=> b!139584 d!44882))

(declare-fun d!44884 () Bool)

(declare-fun e!93058 () Bool)

(assert (=> d!44884 e!93058))

(declare-fun res!116456 () Bool)

(assert (=> d!44884 (=> (not res!116456) (not e!93058))))

(declare-fun lt!217772 () (_ BitVec 64))

(declare-fun lt!217770 () (_ BitVec 64))

(declare-fun lt!217769 () (_ BitVec 64))

(assert (=> d!44884 (= res!116456 (= lt!217770 (bvsub lt!217769 lt!217772)))))

(assert (=> d!44884 (or (= (bvand lt!217769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!217772 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!217769 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217769 lt!217772) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44884 (= lt!217772 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217526)))) ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217526))) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217526)))))))

(declare-fun lt!217774 () (_ BitVec 64))

(declare-fun lt!217773 () (_ BitVec 64))

(assert (=> d!44884 (= lt!217769 (bvmul lt!217774 lt!217773))))

(assert (=> d!44884 (or (= lt!217774 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!217773 (bvsdiv (bvmul lt!217774 lt!217773) lt!217774)))))

(assert (=> d!44884 (= lt!217773 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44884 (= lt!217774 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217526)))))))

(assert (=> d!44884 (= lt!217770 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217526)))))))

(assert (=> d!44884 (invariant!0 (currentBit!6130 (_1!6454 lt!217526)) (currentByte!6135 (_1!6454 lt!217526)) (size!2883 (buf!3299 (_1!6454 lt!217526))))))

(assert (=> d!44884 (= (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217526))) (currentByte!6135 (_1!6454 lt!217526)) (currentBit!6130 (_1!6454 lt!217526))) lt!217770)))

(declare-fun b!139689 () Bool)

(declare-fun res!116457 () Bool)

(assert (=> b!139689 (=> (not res!116457) (not e!93058))))

(assert (=> b!139689 (= res!116457 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217770))))

(declare-fun b!139690 () Bool)

(declare-fun lt!217771 () (_ BitVec 64))

(assert (=> b!139690 (= e!93058 (bvsle lt!217770 (bvmul lt!217771 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139690 (or (= lt!217771 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!217771 #b0000000000000000000000000000000000000000000000000000000000001000) lt!217771)))))

(assert (=> b!139690 (= lt!217771 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217526)))))))

(assert (= (and d!44884 res!116456) b!139689))

(assert (= (and b!139689 res!116457) b!139690))

(declare-fun m!214967 () Bool)

(assert (=> d!44884 m!214967))

(declare-fun m!214969 () Bool)

(assert (=> d!44884 m!214969))

(assert (=> b!139584 d!44884))

(declare-fun lt!217775 () tuple3!530)

(declare-fun d!44886 () Bool)

(assert (=> d!44886 (= lt!217775 (readByteArrayLoop!0 (_1!6453 lt!217539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44886 (= (readByteArrayLoopPure!0 (_1!6453 lt!217539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12253 (_2!6457 lt!217775) (_3!326 lt!217775)))))

(declare-fun bs!11001 () Bool)

(assert (= bs!11001 d!44886))

(declare-fun m!214971 () Bool)

(assert (=> bs!11001 m!214971))

(assert (=> b!139595 d!44886))

(declare-fun d!44888 () Bool)

(assert (=> d!44888 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217521) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) lt!217521))))

(declare-fun bs!11002 () Bool)

(assert (= bs!11002 d!44888))

(assert (=> bs!11002 m!214925))

(assert (=> b!139595 d!44888))

(declare-fun d!44890 () Bool)

(assert (=> d!44890 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217521)))

(declare-fun lt!217778 () Unit!8719)

(declare-fun choose!9 (BitStream!5030 array!6370 (_ BitVec 64) BitStream!5030) Unit!8719)

(assert (=> d!44890 (= lt!217778 (choose!9 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217521 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (=> d!44890 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217521) lt!217778)))

(declare-fun bs!11003 () Bool)

(assert (= bs!11003 d!44890))

(assert (=> bs!11003 m!214773))

(declare-fun m!214973 () Bool)

(assert (=> bs!11003 m!214973))

(assert (=> b!139595 d!44890))

(assert (=> b!139595 d!44839))

(push 1)

(assert (not d!44827))

(assert (not d!44829))

(assert (not b!139664))

(assert (not b!139646))

(assert (not d!44845))

(assert (not d!44849))

(assert (not b!139665))

(assert (not b!139655))

(assert (not b!139647))

(assert (not b!139654))

(assert (not d!44876))

(assert (not d!44853))

(assert (not b!139687))

(assert (not d!44823))

(assert (not b!139685))

(assert (not d!44857))

(assert (not b!139657))

(assert (not d!44863))

(assert (not b!139650))

(assert (not d!44825))

(assert (not d!44867))

(assert (not b!139684))

(assert (not d!44809))

(assert (not b!139620))

(assert (not d!44869))

(assert (not b!139652))

(assert (not d!44821))

(assert (not d!44890))

(assert (not d!44886))

(assert (not b!139670))

(assert (not d!44871))

(assert (not b!139603))

(assert (not b!139637))

(assert (not b!139636))

(assert (not b!139666))

(assert (not b!139619))

(assert (not d!44835))

(assert (not d!44855))

(assert (not b!139605))

(assert (not b!139644))

(assert (not d!44880))

(assert (not b!139686))

(assert (not b!139673))

(assert (not b!139653))

(assert (not d!44837))

(assert (not d!44882))

(assert (not d!44878))

(assert (not b!139622))

(assert (not b!139648))

(assert (not d!44811))

(assert (not d!44843))

(assert (not d!44884))

(assert (not b!139634))

(assert (not d!44874))

(assert (not d!44839))

(assert (not d!44851))

(assert (not d!44865))

(assert (not d!44888))

(assert (not d!44859))

(assert (not b!139645))

(assert (not b!139688))

(assert (not b!139635))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!45062 () Bool)

(assert (=> d!45062 (= (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) (bvsub (bvmul ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))))))))

(assert (=> d!44811 d!45062))

(declare-fun d!45064 () Bool)

(assert (=> d!45064 (= (invariant!0 (currentBit!6130 (_2!6455 lt!217523)) (currentByte!6135 (_2!6455 lt!217523)) (size!2883 (buf!3299 (_2!6455 lt!217523)))) (and (bvsge (currentBit!6130 (_2!6455 lt!217523)) #b00000000000000000000000000000000) (bvslt (currentBit!6130 (_2!6455 lt!217523)) #b00000000000000000000000000001000) (bvsge (currentByte!6135 (_2!6455 lt!217523)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6135 (_2!6455 lt!217523)) (size!2883 (buf!3299 (_2!6455 lt!217523)))) (and (= (currentBit!6130 (_2!6455 lt!217523)) #b00000000000000000000000000000000) (= (currentByte!6135 (_2!6455 lt!217523)) (size!2883 (buf!3299 (_2!6455 lt!217523))))))))))

(assert (=> d!44811 d!45064))

(declare-fun d!45066 () Bool)

(declare-fun lt!218274 () (_ BitVec 8))

(declare-fun lt!218272 () (_ BitVec 8))

(assert (=> d!45066 (= lt!218274 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 lt!217517)) (currentByte!6135 lt!217517))) ((_ sign_extend 24) lt!218272))))))

(assert (=> d!45066 (= lt!218272 ((_ extract 7 0) (currentBit!6130 lt!217517)))))

(declare-fun e!93174 () Bool)

(assert (=> d!45066 e!93174))

(declare-fun res!116631 () Bool)

(assert (=> d!45066 (=> (not res!116631) (not e!93174))))

(assert (=> d!45066 (= res!116631 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 lt!217517))) ((_ sign_extend 32) (currentByte!6135 lt!217517)) ((_ sign_extend 32) (currentBit!6130 lt!217517)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!12266 0))(
  ( (tuple2!12267 (_1!6462 Unit!8719) (_2!6462 (_ BitVec 8))) )
))
(declare-fun Unit!8730 () Unit!8719)

(declare-fun Unit!8731 () Unit!8719)

(assert (=> d!45066 (= (readByte!0 lt!217517) (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218272) #b00000000000000000000000000000000) (tuple2!12267 Unit!8730 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218274) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 lt!217517)) (bvadd (currentByte!6135 lt!217517) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218272)))))))) (tuple2!12267 Unit!8731 lt!218274))) (BitStream!5031 (buf!3299 lt!217517) (bvadd (currentByte!6135 lt!217517) #b00000000000000000000000000000001) (currentBit!6130 lt!217517))))))

(declare-fun b!139883 () Bool)

(declare-fun e!93173 () Bool)

(assert (=> b!139883 (= e!93174 e!93173)))

(declare-fun res!116632 () Bool)

(assert (=> b!139883 (=> (not res!116632) (not e!93173))))

(declare-fun lt!218273 () tuple2!12260)

(assert (=> b!139883 (= res!116632 (= (buf!3299 (_2!6456 lt!218273)) (buf!3299 lt!217517)))))

(declare-fun lt!218276 () (_ BitVec 8))

(declare-fun lt!218275 () (_ BitVec 8))

(declare-fun Unit!8732 () Unit!8719)

(declare-fun Unit!8733 () Unit!8719)

(assert (=> b!139883 (= lt!218273 (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218275) #b00000000000000000000000000000000) (tuple2!12267 Unit!8732 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218276) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 lt!217517)) (bvadd (currentByte!6135 lt!217517) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218275)))))))) (tuple2!12267 Unit!8733 lt!218276))) (BitStream!5031 (buf!3299 lt!217517) (bvadd (currentByte!6135 lt!217517) #b00000000000000000000000000000001) (currentBit!6130 lt!217517))))))

(assert (=> b!139883 (= lt!218276 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 lt!217517)) (currentByte!6135 lt!217517))) ((_ sign_extend 24) lt!218275))))))

(assert (=> b!139883 (= lt!218275 ((_ extract 7 0) (currentBit!6130 lt!217517)))))

(declare-fun lt!218271 () (_ BitVec 64))

(declare-fun lt!218277 () (_ BitVec 64))

(declare-fun b!139884 () Bool)

(assert (=> b!139884 (= e!93173 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6456 lt!218273))) (currentByte!6135 (_2!6456 lt!218273)) (currentBit!6130 (_2!6456 lt!218273))) (bvadd lt!218271 lt!218277)))))

(assert (=> b!139884 (or (not (= (bvand lt!218271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218277 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218271 lt!218277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139884 (= lt!218277 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!139884 (= lt!218271 (bitIndex!0 (size!2883 (buf!3299 lt!217517)) (currentByte!6135 lt!217517) (currentBit!6130 lt!217517)))))

(assert (= (and d!45066 res!116631) b!139883))

(assert (= (and b!139883 res!116632) b!139884))

(declare-fun m!215371 () Bool)

(assert (=> d!45066 m!215371))

(declare-fun m!215373 () Bool)

(assert (=> d!45066 m!215373))

(declare-fun m!215375 () Bool)

(assert (=> d!45066 m!215375))

(assert (=> b!139883 m!215375))

(assert (=> b!139883 m!215371))

(declare-fun m!215377 () Bool)

(assert (=> b!139884 m!215377))

(declare-fun m!215379 () Bool)

(assert (=> b!139884 m!215379))

(assert (=> d!44869 d!45066))

(declare-fun d!45068 () Bool)

(declare-fun res!116633 () Bool)

(declare-fun e!93175 () Bool)

(assert (=> d!45068 (=> (not res!116633) (not e!93175))))

(assert (=> d!45068 (= res!116633 (= (size!2883 (buf!3299 (_1!6453 lt!217653))) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(assert (=> d!45068 (= (isPrefixOf!0 (_1!6453 lt!217653) (_2!6455 lt!217523)) e!93175)))

(declare-fun b!139885 () Bool)

(declare-fun res!116634 () Bool)

(assert (=> b!139885 (=> (not res!116634) (not e!93175))))

(assert (=> b!139885 (= res!116634 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217653))) (currentByte!6135 (_1!6453 lt!217653)) (currentBit!6130 (_1!6453 lt!217653))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(declare-fun b!139886 () Bool)

(declare-fun e!93176 () Bool)

(assert (=> b!139886 (= e!93175 e!93176)))

(declare-fun res!116635 () Bool)

(assert (=> b!139886 (=> res!116635 e!93176)))

(assert (=> b!139886 (= res!116635 (= (size!2883 (buf!3299 (_1!6453 lt!217653))) #b00000000000000000000000000000000))))

(declare-fun b!139887 () Bool)

(assert (=> b!139887 (= e!93176 (arrayBitRangesEq!0 (buf!3299 (_1!6453 lt!217653)) (buf!3299 (_2!6455 lt!217523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217653))) (currentByte!6135 (_1!6453 lt!217653)) (currentBit!6130 (_1!6453 lt!217653)))))))

(assert (= (and d!45068 res!116633) b!139885))

(assert (= (and b!139885 res!116634) b!139886))

(assert (= (and b!139886 (not res!116635)) b!139887))

(declare-fun m!215381 () Bool)

(assert (=> b!139885 m!215381))

(assert (=> b!139885 m!214757))

(assert (=> b!139887 m!215381))

(assert (=> b!139887 m!215381))

(declare-fun m!215383 () Bool)

(assert (=> b!139887 m!215383))

(assert (=> b!139647 d!45068))

(declare-fun d!45070 () Bool)

(declare-fun res!116636 () Bool)

(declare-fun e!93177 () Bool)

(assert (=> d!45070 (=> res!116636 e!93177)))

(assert (=> d!45070 (= res!116636 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!45070 (= (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217531) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!93177)))

(declare-fun b!139888 () Bool)

(declare-fun e!93178 () Bool)

(assert (=> b!139888 (= e!93177 e!93178)))

(declare-fun res!116637 () Bool)

(assert (=> b!139888 (=> (not res!116637) (not e!93178))))

(assert (=> b!139888 (= res!116637 (= (select (arr!3578 (_2!6452 lt!217524)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3578 (_2!6452 lt!217531)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!139889 () Bool)

(assert (=> b!139889 (= e!93178 (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217531) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45070 (not res!116636)) b!139888))

(assert (= (and b!139888 res!116637) b!139889))

(declare-fun m!215385 () Bool)

(assert (=> b!139888 m!215385))

(declare-fun m!215387 () Bool)

(assert (=> b!139888 m!215387))

(declare-fun m!215389 () Bool)

(assert (=> b!139889 m!215389))

(assert (=> b!139657 d!45070))

(declare-fun d!45072 () Bool)

(assert (=> d!45072 (= (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217519))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217519)))) (bvsub (bvmul ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217519))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217519))))))))

(assert (=> d!44809 d!45072))

(declare-fun d!45074 () Bool)

(assert (=> d!45074 (= (invariant!0 (currentBit!6130 (_2!6455 lt!217519)) (currentByte!6135 (_2!6455 lt!217519)) (size!2883 (buf!3299 (_2!6455 lt!217519)))) (and (bvsge (currentBit!6130 (_2!6455 lt!217519)) #b00000000000000000000000000000000) (bvslt (currentBit!6130 (_2!6455 lt!217519)) #b00000000000000000000000000001000) (bvsge (currentByte!6135 (_2!6455 lt!217519)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6135 (_2!6455 lt!217519)) (size!2883 (buf!3299 (_2!6455 lt!217519)))) (and (= (currentBit!6130 (_2!6455 lt!217519)) #b00000000000000000000000000000000) (= (currentByte!6135 (_2!6455 lt!217519)) (size!2883 (buf!3299 (_2!6455 lt!217519))))))))))

(assert (=> d!44809 d!45074))

(declare-fun d!45076 () Bool)

(declare-fun e!93181 () Bool)

(assert (=> d!45076 e!93181))

(declare-fun res!116640 () Bool)

(assert (=> d!45076 (=> (not res!116640) (not e!93181))))

(declare-fun lt!218283 () (_ BitVec 64))

(declare-fun lt!218282 () BitStream!5030)

(assert (=> d!45076 (= res!116640 (= (bvadd lt!218283 (bvsub lt!217617 lt!217615)) (bitIndex!0 (size!2883 (buf!3299 lt!218282)) (currentByte!6135 lt!218282) (currentBit!6130 lt!218282))))))

(assert (=> d!45076 (or (not (= (bvand lt!218283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217617 lt!217615) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218283 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218283 (bvsub lt!217617 lt!217615)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45076 (= lt!218283 (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217614))) (currentByte!6135 (_2!6453 lt!217614)) (currentBit!6130 (_2!6453 lt!217614))))))

(declare-fun moveBitIndex!0 (BitStream!5030 (_ BitVec 64)) tuple2!12258)

(assert (=> d!45076 (= lt!218282 (_2!6455 (moveBitIndex!0 (_2!6453 lt!217614) (bvsub lt!217617 lt!217615))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!5030 (_ BitVec 64)) Bool)

(assert (=> d!45076 (moveBitIndexPrecond!0 (_2!6453 lt!217614) (bvsub lt!217617 lt!217615))))

(assert (=> d!45076 (= (withMovedBitIndex!0 (_2!6453 lt!217614) (bvsub lt!217617 lt!217615)) lt!218282)))

(declare-fun b!139892 () Bool)

(assert (=> b!139892 (= e!93181 (= (size!2883 (buf!3299 (_2!6453 lt!217614))) (size!2883 (buf!3299 lt!218282))))))

(assert (= (and d!45076 res!116640) b!139892))

(declare-fun m!215391 () Bool)

(assert (=> d!45076 m!215391))

(declare-fun m!215393 () Bool)

(assert (=> d!45076 m!215393))

(declare-fun m!215395 () Bool)

(assert (=> d!45076 m!215395))

(declare-fun m!215397 () Bool)

(assert (=> d!45076 m!215397))

(assert (=> b!139634 d!45076))

(assert (=> b!139634 d!44811))

(assert (=> b!139634 d!44829))

(declare-fun d!45078 () Bool)

(assert (=> d!45078 (= (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) (bvsub (bvmul ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))))))))

(assert (=> d!44863 d!45078))

(assert (=> d!44845 d!44841))

(declare-fun d!45080 () Bool)

(assert (=> d!45080 (isPrefixOf!0 lt!217671 (_2!6455 lt!217519))))

(declare-fun lt!218284 () Unit!8719)

(assert (=> d!45080 (= lt!218284 (choose!30 lt!217671 thiss!1634 (_2!6455 lt!217519)))))

(assert (=> d!45080 (isPrefixOf!0 lt!217671 thiss!1634)))

(assert (=> d!45080 (= (lemmaIsPrefixTransitive!0 lt!217671 thiss!1634 (_2!6455 lt!217519)) lt!218284)))

(declare-fun bs!11046 () Bool)

(assert (= bs!11046 d!45080))

(assert (=> bs!11046 m!214885))

(declare-fun m!215399 () Bool)

(assert (=> bs!11046 m!215399))

(declare-fun m!215401 () Bool)

(assert (=> bs!11046 m!215401))

(assert (=> d!44845 d!45080))

(declare-fun d!45082 () Bool)

(assert (=> d!45082 (isPrefixOf!0 lt!217671 lt!217671)))

(declare-fun lt!218287 () Unit!8719)

(declare-fun choose!11 (BitStream!5030) Unit!8719)

(assert (=> d!45082 (= lt!218287 (choose!11 lt!217671))))

(assert (=> d!45082 (= (lemmaIsPrefixRefl!0 lt!217671) lt!218287)))

(declare-fun bs!11048 () Bool)

(assert (= bs!11048 d!45082))

(assert (=> bs!11048 m!214883))

(declare-fun m!215403 () Bool)

(assert (=> bs!11048 m!215403))

(assert (=> d!44845 d!45082))

(declare-fun d!45084 () Bool)

(assert (=> d!45084 (isPrefixOf!0 (_2!6455 lt!217519) (_2!6455 lt!217519))))

(declare-fun lt!218288 () Unit!8719)

(assert (=> d!45084 (= lt!218288 (choose!11 (_2!6455 lt!217519)))))

(assert (=> d!45084 (= (lemmaIsPrefixRefl!0 (_2!6455 lt!217519)) lt!218288)))

(declare-fun bs!11049 () Bool)

(assert (= bs!11049 d!45084))

(assert (=> bs!11049 m!214855))

(declare-fun m!215405 () Bool)

(assert (=> bs!11049 m!215405))

(assert (=> d!44845 d!45084))

(declare-fun d!45086 () Bool)

(declare-fun res!116641 () Bool)

(declare-fun e!93182 () Bool)

(assert (=> d!45086 (=> (not res!116641) (not e!93182))))

(assert (=> d!45086 (= res!116641 (= (size!2883 (buf!3299 thiss!1634)) (size!2883 (buf!3299 thiss!1634))))))

(assert (=> d!45086 (= (isPrefixOf!0 thiss!1634 thiss!1634) e!93182)))

(declare-fun b!139893 () Bool)

(declare-fun res!116642 () Bool)

(assert (=> b!139893 (=> (not res!116642) (not e!93182))))

(assert (=> b!139893 (= res!116642 (bvsle (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(declare-fun b!139894 () Bool)

(declare-fun e!93183 () Bool)

(assert (=> b!139894 (= e!93182 e!93183)))

(declare-fun res!116643 () Bool)

(assert (=> b!139894 (=> res!116643 e!93183)))

(assert (=> b!139894 (= res!116643 (= (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139895 () Bool)

(assert (=> b!139895 (= e!93183 (arrayBitRangesEq!0 (buf!3299 thiss!1634) (buf!3299 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (= (and d!45086 res!116641) b!139893))

(assert (= (and b!139893 res!116642) b!139894))

(assert (= (and b!139894 (not res!116643)) b!139895))

(assert (=> b!139893 m!214759))

(assert (=> b!139893 m!214759))

(assert (=> b!139895 m!214759))

(assert (=> b!139895 m!214759))

(declare-fun m!215407 () Bool)

(assert (=> b!139895 m!215407))

(assert (=> d!44845 d!45086))

(declare-fun d!45088 () Bool)

(declare-fun res!116644 () Bool)

(declare-fun e!93184 () Bool)

(assert (=> d!45088 (=> (not res!116644) (not e!93184))))

(assert (=> d!45088 (= res!116644 (= (size!2883 (buf!3299 lt!217671)) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!45088 (= (isPrefixOf!0 lt!217671 (_2!6455 lt!217519)) e!93184)))

(declare-fun b!139896 () Bool)

(declare-fun res!116645 () Bool)

(assert (=> b!139896 (=> (not res!116645) (not e!93184))))

(assert (=> b!139896 (= res!116645 (bvsle (bitIndex!0 (size!2883 (buf!3299 lt!217671)) (currentByte!6135 lt!217671) (currentBit!6130 lt!217671)) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun b!139897 () Bool)

(declare-fun e!93185 () Bool)

(assert (=> b!139897 (= e!93184 e!93185)))

(declare-fun res!116646 () Bool)

(assert (=> b!139897 (=> res!116646 e!93185)))

(assert (=> b!139897 (= res!116646 (= (size!2883 (buf!3299 lt!217671)) #b00000000000000000000000000000000))))

(declare-fun b!139898 () Bool)

(assert (=> b!139898 (= e!93185 (arrayBitRangesEq!0 (buf!3299 lt!217671) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 lt!217671)) (currentByte!6135 lt!217671) (currentBit!6130 lt!217671))))))

(assert (= (and d!45088 res!116644) b!139896))

(assert (= (and b!139896 res!116645) b!139897))

(assert (= (and b!139897 (not res!116646)) b!139898))

(declare-fun m!215409 () Bool)

(assert (=> b!139896 m!215409))

(assert (=> b!139896 m!214755))

(assert (=> b!139898 m!215409))

(assert (=> b!139898 m!215409))

(declare-fun m!215411 () Bool)

(assert (=> b!139898 m!215411))

(assert (=> d!44845 d!45088))

(declare-fun d!45090 () Bool)

(assert (=> d!45090 (isPrefixOf!0 thiss!1634 thiss!1634)))

(declare-fun lt!218289 () Unit!8719)

(assert (=> d!45090 (= lt!218289 (choose!11 thiss!1634))))

(assert (=> d!45090 (= (lemmaIsPrefixRefl!0 thiss!1634) lt!218289)))

(declare-fun bs!11050 () Bool)

(assert (= bs!11050 d!45090))

(assert (=> bs!11050 m!214825))

(declare-fun m!215413 () Bool)

(assert (=> bs!11050 m!215413))

(assert (=> d!44845 d!45090))

(declare-fun d!45092 () Bool)

(assert (=> d!45092 (isPrefixOf!0 lt!217671 (_2!6455 lt!217519))))

(declare-fun lt!218290 () Unit!8719)

(assert (=> d!45092 (= lt!218290 (choose!30 lt!217671 (_2!6455 lt!217519) (_2!6455 lt!217519)))))

(assert (=> d!45092 (isPrefixOf!0 lt!217671 (_2!6455 lt!217519))))

(assert (=> d!45092 (= (lemmaIsPrefixTransitive!0 lt!217671 (_2!6455 lt!217519) (_2!6455 lt!217519)) lt!218290)))

(declare-fun bs!11051 () Bool)

(assert (= bs!11051 d!45092))

(assert (=> bs!11051 m!214885))

(declare-fun m!215415 () Bool)

(assert (=> bs!11051 m!215415))

(assert (=> bs!11051 m!214885))

(assert (=> d!44845 d!45092))

(declare-fun d!45094 () Bool)

(declare-fun res!116647 () Bool)

(declare-fun e!93186 () Bool)

(assert (=> d!45094 (=> (not res!116647) (not e!93186))))

(assert (=> d!45094 (= res!116647 (= (size!2883 (buf!3299 (_1!6453 lt!217674))) (size!2883 (buf!3299 (_2!6453 lt!217674)))))))

(assert (=> d!45094 (= (isPrefixOf!0 (_1!6453 lt!217674) (_2!6453 lt!217674)) e!93186)))

(declare-fun b!139899 () Bool)

(declare-fun res!116648 () Bool)

(assert (=> b!139899 (=> (not res!116648) (not e!93186))))

(assert (=> b!139899 (= res!116648 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217674))) (currentByte!6135 (_1!6453 lt!217674)) (currentBit!6130 (_1!6453 lt!217674))) (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217674))) (currentByte!6135 (_2!6453 lt!217674)) (currentBit!6130 (_2!6453 lt!217674)))))))

(declare-fun b!139900 () Bool)

(declare-fun e!93187 () Bool)

(assert (=> b!139900 (= e!93186 e!93187)))

(declare-fun res!116649 () Bool)

(assert (=> b!139900 (=> res!116649 e!93187)))

(assert (=> b!139900 (= res!116649 (= (size!2883 (buf!3299 (_1!6453 lt!217674))) #b00000000000000000000000000000000))))

(declare-fun b!139901 () Bool)

(assert (=> b!139901 (= e!93187 (arrayBitRangesEq!0 (buf!3299 (_1!6453 lt!217674)) (buf!3299 (_2!6453 lt!217674)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217674))) (currentByte!6135 (_1!6453 lt!217674)) (currentBit!6130 (_1!6453 lt!217674)))))))

(assert (= (and d!45094 res!116647) b!139899))

(assert (= (and b!139899 res!116648) b!139900))

(assert (= (and b!139900 (not res!116649)) b!139901))

(declare-fun m!215417 () Bool)

(assert (=> b!139899 m!215417))

(declare-fun m!215419 () Bool)

(assert (=> b!139899 m!215419))

(assert (=> b!139901 m!215417))

(assert (=> b!139901 m!215417))

(declare-fun m!215421 () Bool)

(assert (=> b!139901 m!215421))

(assert (=> d!44845 d!45094))

(declare-fun d!45096 () Bool)

(declare-fun res!116650 () Bool)

(declare-fun e!93188 () Bool)

(assert (=> d!45096 (=> (not res!116650) (not e!93188))))

(assert (=> d!45096 (= res!116650 (= (size!2883 (buf!3299 (_2!6455 lt!217519))) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!45096 (= (isPrefixOf!0 (_2!6455 lt!217519) (_2!6455 lt!217519)) e!93188)))

(declare-fun b!139902 () Bool)

(declare-fun res!116651 () Bool)

(assert (=> b!139902 (=> (not res!116651) (not e!93188))))

(assert (=> b!139902 (= res!116651 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun b!139903 () Bool)

(declare-fun e!93189 () Bool)

(assert (=> b!139903 (= e!93188 e!93189)))

(declare-fun res!116652 () Bool)

(assert (=> b!139903 (=> res!116652 e!93189)))

(assert (=> b!139903 (= res!116652 (= (size!2883 (buf!3299 (_2!6455 lt!217519))) #b00000000000000000000000000000000))))

(declare-fun b!139904 () Bool)

(assert (=> b!139904 (= e!93189 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217519)) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(assert (= (and d!45096 res!116650) b!139902))

(assert (= (and b!139902 res!116651) b!139903))

(assert (= (and b!139903 (not res!116652)) b!139904))

(assert (=> b!139902 m!214755))

(assert (=> b!139902 m!214755))

(assert (=> b!139904 m!214755))

(assert (=> b!139904 m!214755))

(declare-fun m!215423 () Bool)

(assert (=> b!139904 m!215423))

(assert (=> d!44845 d!45096))

(declare-fun d!45098 () Bool)

(declare-fun res!116653 () Bool)

(declare-fun e!93190 () Bool)

(assert (=> d!45098 (=> (not res!116653) (not e!93190))))

(assert (=> d!45098 (= res!116653 (= (size!2883 (buf!3299 lt!217671)) (size!2883 (buf!3299 lt!217671))))))

(assert (=> d!45098 (= (isPrefixOf!0 lt!217671 lt!217671) e!93190)))

(declare-fun b!139905 () Bool)

(declare-fun res!116654 () Bool)

(assert (=> b!139905 (=> (not res!116654) (not e!93190))))

(assert (=> b!139905 (= res!116654 (bvsle (bitIndex!0 (size!2883 (buf!3299 lt!217671)) (currentByte!6135 lt!217671) (currentBit!6130 lt!217671)) (bitIndex!0 (size!2883 (buf!3299 lt!217671)) (currentByte!6135 lt!217671) (currentBit!6130 lt!217671))))))

(declare-fun b!139906 () Bool)

(declare-fun e!93191 () Bool)

(assert (=> b!139906 (= e!93190 e!93191)))

(declare-fun res!116655 () Bool)

(assert (=> b!139906 (=> res!116655 e!93191)))

(assert (=> b!139906 (= res!116655 (= (size!2883 (buf!3299 lt!217671)) #b00000000000000000000000000000000))))

(declare-fun b!139907 () Bool)

(assert (=> b!139907 (= e!93191 (arrayBitRangesEq!0 (buf!3299 lt!217671) (buf!3299 lt!217671) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 lt!217671)) (currentByte!6135 lt!217671) (currentBit!6130 lt!217671))))))

(assert (= (and d!45098 res!116653) b!139905))

(assert (= (and b!139905 res!116654) b!139906))

(assert (= (and b!139906 (not res!116655)) b!139907))

(assert (=> b!139905 m!215409))

(assert (=> b!139905 m!215409))

(assert (=> b!139907 m!215409))

(assert (=> b!139907 m!215409))

(declare-fun m!215425 () Bool)

(assert (=> b!139907 m!215425))

(assert (=> d!44845 d!45098))

(assert (=> d!44890 d!44888))

(declare-fun d!45100 () Bool)

(assert (=> d!45100 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217521)))

(assert (=> d!45100 true))

(declare-fun _$6!298 () Unit!8719)

(assert (=> d!45100 (= (choose!9 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217521 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))) _$6!298)))

(declare-fun bs!11052 () Bool)

(assert (= bs!11052 d!45100))

(assert (=> bs!11052 m!214773))

(assert (=> d!44890 d!45100))

(declare-fun d!45102 () Bool)

(assert (=> d!45102 (= (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 thiss!1634)))))))

(assert (=> d!44851 d!45102))

(declare-fun d!45104 () Bool)

(assert (=> d!45104 (isPrefixOf!0 lt!217611 lt!217611)))

(declare-fun lt!218291 () Unit!8719)

(assert (=> d!45104 (= lt!218291 (choose!11 lt!217611))))

(assert (=> d!45104 (= (lemmaIsPrefixRefl!0 lt!217611) lt!218291)))

(declare-fun bs!11053 () Bool)

(assert (= bs!11053 d!45104))

(assert (=> bs!11053 m!214819))

(declare-fun m!215427 () Bool)

(assert (=> bs!11053 m!215427))

(assert (=> d!44827 d!45104))

(declare-fun d!45106 () Bool)

(declare-fun res!116656 () Bool)

(declare-fun e!93192 () Bool)

(assert (=> d!45106 (=> (not res!116656) (not e!93192))))

(assert (=> d!45106 (= res!116656 (= (size!2883 (buf!3299 lt!217611)) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(assert (=> d!45106 (= (isPrefixOf!0 lt!217611 (_2!6455 lt!217523)) e!93192)))

(declare-fun b!139908 () Bool)

(declare-fun res!116657 () Bool)

(assert (=> b!139908 (=> (not res!116657) (not e!93192))))

(assert (=> b!139908 (= res!116657 (bvsle (bitIndex!0 (size!2883 (buf!3299 lt!217611)) (currentByte!6135 lt!217611) (currentBit!6130 lt!217611)) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(declare-fun b!139909 () Bool)

(declare-fun e!93193 () Bool)

(assert (=> b!139909 (= e!93192 e!93193)))

(declare-fun res!116658 () Bool)

(assert (=> b!139909 (=> res!116658 e!93193)))

(assert (=> b!139909 (= res!116658 (= (size!2883 (buf!3299 lt!217611)) #b00000000000000000000000000000000))))

(declare-fun b!139910 () Bool)

(assert (=> b!139910 (= e!93193 (arrayBitRangesEq!0 (buf!3299 lt!217611) (buf!3299 (_2!6455 lt!217523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 lt!217611)) (currentByte!6135 lt!217611) (currentBit!6130 lt!217611))))))

(assert (= (and d!45106 res!116656) b!139908))

(assert (= (and b!139908 res!116657) b!139909))

(assert (= (and b!139909 (not res!116658)) b!139910))

(declare-fun m!215429 () Bool)

(assert (=> b!139908 m!215429))

(assert (=> b!139908 m!214757))

(assert (=> b!139910 m!215429))

(assert (=> b!139910 m!215429))

(declare-fun m!215431 () Bool)

(assert (=> b!139910 m!215431))

(assert (=> d!44827 d!45106))

(declare-fun d!45108 () Bool)

(declare-fun res!116659 () Bool)

(declare-fun e!93194 () Bool)

(assert (=> d!45108 (=> (not res!116659) (not e!93194))))

(assert (=> d!45108 (= res!116659 (= (size!2883 (buf!3299 (_1!6453 lt!217614))) (size!2883 (buf!3299 (_2!6453 lt!217614)))))))

(assert (=> d!45108 (= (isPrefixOf!0 (_1!6453 lt!217614) (_2!6453 lt!217614)) e!93194)))

(declare-fun b!139911 () Bool)

(declare-fun res!116660 () Bool)

(assert (=> b!139911 (=> (not res!116660) (not e!93194))))

(assert (=> b!139911 (= res!116660 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217614))) (currentByte!6135 (_1!6453 lt!217614)) (currentBit!6130 (_1!6453 lt!217614))) (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217614))) (currentByte!6135 (_2!6453 lt!217614)) (currentBit!6130 (_2!6453 lt!217614)))))))

(declare-fun b!139912 () Bool)

(declare-fun e!93195 () Bool)

(assert (=> b!139912 (= e!93194 e!93195)))

(declare-fun res!116661 () Bool)

(assert (=> b!139912 (=> res!116661 e!93195)))

(assert (=> b!139912 (= res!116661 (= (size!2883 (buf!3299 (_1!6453 lt!217614))) #b00000000000000000000000000000000))))

(declare-fun b!139913 () Bool)

(assert (=> b!139913 (= e!93195 (arrayBitRangesEq!0 (buf!3299 (_1!6453 lt!217614)) (buf!3299 (_2!6453 lt!217614)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217614))) (currentByte!6135 (_1!6453 lt!217614)) (currentBit!6130 (_1!6453 lt!217614)))))))

(assert (= (and d!45108 res!116659) b!139911))

(assert (= (and b!139911 res!116660) b!139912))

(assert (= (and b!139912 (not res!116661)) b!139913))

(declare-fun m!215433 () Bool)

(assert (=> b!139911 m!215433))

(assert (=> b!139911 m!215393))

(assert (=> b!139913 m!215433))

(assert (=> b!139913 m!215433))

(declare-fun m!215435 () Bool)

(assert (=> b!139913 m!215435))

(assert (=> d!44827 d!45108))

(declare-fun d!45110 () Bool)

(declare-fun res!116662 () Bool)

(declare-fun e!93196 () Bool)

(assert (=> d!45110 (=> (not res!116662) (not e!93196))))

(assert (=> d!45110 (= res!116662 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(assert (=> d!45110 (= (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217523)) e!93196)))

(declare-fun b!139914 () Bool)

(declare-fun res!116663 () Bool)

(assert (=> b!139914 (=> (not res!116663) (not e!93196))))

(assert (=> b!139914 (= res!116663 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(declare-fun b!139915 () Bool)

(declare-fun e!93197 () Bool)

(assert (=> b!139915 (= e!93196 e!93197)))

(declare-fun res!116664 () Bool)

(assert (=> b!139915 (=> res!116664 e!93197)))

(assert (=> b!139915 (= res!116664 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) #b00000000000000000000000000000000))))

(declare-fun b!139916 () Bool)

(assert (=> b!139916 (= e!93197 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (= (and d!45110 res!116662) b!139914))

(assert (= (and b!139914 res!116663) b!139915))

(assert (= (and b!139915 (not res!116664)) b!139916))

(assert (=> b!139914 m!214757))

(assert (=> b!139914 m!214757))

(assert (=> b!139916 m!214757))

(assert (=> b!139916 m!214757))

(declare-fun m!215437 () Bool)

(assert (=> b!139916 m!215437))

(assert (=> d!44827 d!45110))

(declare-fun d!45112 () Bool)

(assert (=> d!45112 (isPrefixOf!0 lt!217611 (_2!6455 lt!217523))))

(declare-fun lt!218292 () Unit!8719)

(assert (=> d!45112 (= lt!218292 (choose!30 lt!217611 thiss!1634 (_2!6455 lt!217523)))))

(assert (=> d!45112 (isPrefixOf!0 lt!217611 thiss!1634)))

(assert (=> d!45112 (= (lemmaIsPrefixTransitive!0 lt!217611 thiss!1634 (_2!6455 lt!217523)) lt!218292)))

(declare-fun bs!11054 () Bool)

(assert (= bs!11054 d!45112))

(assert (=> bs!11054 m!214821))

(declare-fun m!215439 () Bool)

(assert (=> bs!11054 m!215439))

(declare-fun m!215441 () Bool)

(assert (=> bs!11054 m!215441))

(assert (=> d!44827 d!45112))

(assert (=> d!44827 d!45086))

(assert (=> d!44827 d!44817))

(declare-fun d!45114 () Bool)

(declare-fun res!116665 () Bool)

(declare-fun e!93198 () Bool)

(assert (=> d!45114 (=> (not res!116665) (not e!93198))))

(assert (=> d!45114 (= res!116665 (= (size!2883 (buf!3299 lt!217611)) (size!2883 (buf!3299 lt!217611))))))

(assert (=> d!45114 (= (isPrefixOf!0 lt!217611 lt!217611) e!93198)))

(declare-fun b!139917 () Bool)

(declare-fun res!116666 () Bool)

(assert (=> b!139917 (=> (not res!116666) (not e!93198))))

(assert (=> b!139917 (= res!116666 (bvsle (bitIndex!0 (size!2883 (buf!3299 lt!217611)) (currentByte!6135 lt!217611) (currentBit!6130 lt!217611)) (bitIndex!0 (size!2883 (buf!3299 lt!217611)) (currentByte!6135 lt!217611) (currentBit!6130 lt!217611))))))

(declare-fun b!139918 () Bool)

(declare-fun e!93199 () Bool)

(assert (=> b!139918 (= e!93198 e!93199)))

(declare-fun res!116667 () Bool)

(assert (=> b!139918 (=> res!116667 e!93199)))

(assert (=> b!139918 (= res!116667 (= (size!2883 (buf!3299 lt!217611)) #b00000000000000000000000000000000))))

(declare-fun b!139919 () Bool)

(assert (=> b!139919 (= e!93199 (arrayBitRangesEq!0 (buf!3299 lt!217611) (buf!3299 lt!217611) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 lt!217611)) (currentByte!6135 lt!217611) (currentBit!6130 lt!217611))))))

(assert (= (and d!45114 res!116665) b!139917))

(assert (= (and b!139917 res!116666) b!139918))

(assert (= (and b!139918 (not res!116667)) b!139919))

(assert (=> b!139917 m!215429))

(assert (=> b!139917 m!215429))

(assert (=> b!139919 m!215429))

(assert (=> b!139919 m!215429))

(declare-fun m!215443 () Bool)

(assert (=> b!139919 m!215443))

(assert (=> d!44827 d!45114))

(assert (=> d!44827 d!45090))

(declare-fun d!45116 () Bool)

(assert (=> d!45116 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217523))))

(declare-fun lt!218293 () Unit!8719)

(assert (=> d!45116 (= lt!218293 (choose!11 (_2!6455 lt!217523)))))

(assert (=> d!45116 (= (lemmaIsPrefixRefl!0 (_2!6455 lt!217523)) lt!218293)))

(declare-fun bs!11055 () Bool)

(assert (= bs!11055 d!45116))

(assert (=> bs!11055 m!214817))

(declare-fun m!215445 () Bool)

(assert (=> bs!11055 m!215445))

(assert (=> d!44827 d!45116))

(declare-fun d!45118 () Bool)

(assert (=> d!45118 (isPrefixOf!0 lt!217611 (_2!6455 lt!217523))))

(declare-fun lt!218294 () Unit!8719)

(assert (=> d!45118 (= lt!218294 (choose!30 lt!217611 (_2!6455 lt!217523) (_2!6455 lt!217523)))))

(assert (=> d!45118 (isPrefixOf!0 lt!217611 (_2!6455 lt!217523))))

(assert (=> d!45118 (= (lemmaIsPrefixTransitive!0 lt!217611 (_2!6455 lt!217523) (_2!6455 lt!217523)) lt!218294)))

(declare-fun bs!11056 () Bool)

(assert (= bs!11056 d!45118))

(assert (=> bs!11056 m!214821))

(declare-fun m!215447 () Bool)

(assert (=> bs!11056 m!215447))

(assert (=> bs!11056 m!214821))

(assert (=> d!44827 d!45118))

(declare-fun b!139934 () Bool)

(declare-fun e!93212 () Bool)

(declare-fun call!1822 () Bool)

(assert (=> b!139934 (= e!93212 call!1822)))

(declare-fun b!139935 () Bool)

(declare-fun res!116679 () Bool)

(declare-fun lt!218303 () (_ BitVec 32))

(assert (=> b!139935 (= res!116679 (= lt!218303 #b00000000000000000000000000000000))))

(declare-fun e!93216 () Bool)

(assert (=> b!139935 (=> res!116679 e!93216)))

(declare-fun e!93217 () Bool)

(assert (=> b!139935 (= e!93217 e!93216)))

(declare-fun d!45120 () Bool)

(declare-fun res!116681 () Bool)

(declare-fun e!93213 () Bool)

(assert (=> d!45120 (=> res!116681 e!93213)))

(assert (=> d!45120 (= res!116681 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (=> d!45120 (= (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))) e!93213)))

(declare-fun bm!1819 () Bool)

(declare-fun lt!218302 () (_ BitVec 32))

(declare-datatypes ((tuple4!122 0))(
  ( (tuple4!123 (_1!6463 (_ BitVec 32)) (_2!6463 (_ BitVec 32)) (_3!329 (_ BitVec 32)) (_4!61 (_ BitVec 32))) )
))
(declare-fun lt!218301 () tuple4!122)

(declare-fun c!7777 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!1819 (= call!1822 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_3!329 lt!218301)) (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_3!329 lt!218301)) lt!218302 (ite c!7777 lt!218303 #b00000000000000000000000000001000)))))

(declare-fun b!139936 () Bool)

(assert (=> b!139936 (= e!93212 e!93217)))

(declare-fun res!116682 () Bool)

(assert (=> b!139936 (= res!116682 call!1822)))

(assert (=> b!139936 (=> (not res!116682) (not e!93217))))

(declare-fun b!139937 () Bool)

(declare-fun e!93215 () Bool)

(assert (=> b!139937 (= e!93215 e!93212)))

(assert (=> b!139937 (= c!7777 (= (_3!329 lt!218301) (_4!61 lt!218301)))))

(declare-fun b!139938 () Bool)

(assert (=> b!139938 (= e!93216 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_4!61 lt!218301)) (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_4!61 lt!218301)) #b00000000000000000000000000000000 lt!218303))))

(declare-fun e!93214 () Bool)

(declare-fun b!139939 () Bool)

(assert (=> b!139939 (= e!93214 (arrayRangesEq!247 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217519)) (_1!6463 lt!218301) (_2!6463 lt!218301)))))

(declare-fun b!139940 () Bool)

(assert (=> b!139940 (= e!93213 e!93215)))

(declare-fun res!116680 () Bool)

(assert (=> b!139940 (=> (not res!116680) (not e!93215))))

(assert (=> b!139940 (= res!116680 e!93214)))

(declare-fun res!116678 () Bool)

(assert (=> b!139940 (=> res!116678 e!93214)))

(assert (=> b!139940 (= res!116678 (bvsge (_1!6463 lt!218301) (_2!6463 lt!218301)))))

(assert (=> b!139940 (= lt!218303 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139940 (= lt!218302 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!122)

(assert (=> b!139940 (= lt!218301 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (= (and d!45120 (not res!116681)) b!139940))

(assert (= (and b!139940 (not res!116678)) b!139939))

(assert (= (and b!139940 res!116680) b!139937))

(assert (= (and b!139937 c!7777) b!139934))

(assert (= (and b!139937 (not c!7777)) b!139936))

(assert (= (and b!139936 res!116682) b!139935))

(assert (= (and b!139935 (not res!116679)) b!139938))

(assert (= (or b!139934 b!139936) bm!1819))

(declare-fun m!215449 () Bool)

(assert (=> bm!1819 m!215449))

(declare-fun m!215451 () Bool)

(assert (=> bm!1819 m!215451))

(assert (=> bm!1819 m!215449))

(assert (=> bm!1819 m!215451))

(declare-fun m!215453 () Bool)

(assert (=> bm!1819 m!215453))

(declare-fun m!215455 () Bool)

(assert (=> b!139938 m!215455))

(declare-fun m!215457 () Bool)

(assert (=> b!139938 m!215457))

(assert (=> b!139938 m!215455))

(assert (=> b!139938 m!215457))

(declare-fun m!215459 () Bool)

(assert (=> b!139938 m!215459))

(declare-fun m!215461 () Bool)

(assert (=> b!139939 m!215461))

(assert (=> b!139940 m!214757))

(declare-fun m!215463 () Bool)

(assert (=> b!139940 m!215463))

(assert (=> b!139605 d!45120))

(assert (=> b!139605 d!44811))

(assert (=> d!44867 d!44851))

(declare-fun d!45122 () Bool)

(assert (=> d!45122 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634)) (bvsub to!404 from!447))))

(assert (=> d!45122 true))

(declare-fun _$5!52 () Unit!8719)

(assert (=> d!45122 (= (choose!26 thiss!1634 (buf!3299 (_2!6455 lt!217519)) (bvsub to!404 from!447) (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) _$5!52)))

(declare-fun bs!11057 () Bool)

(assert (= bs!11057 d!45122))

(assert (=> bs!11057 m!214713))

(assert (=> d!44867 d!45122))

(declare-fun d!45124 () Bool)

(declare-fun res!116683 () Bool)

(declare-fun e!93218 () Bool)

(assert (=> d!45124 (=> (not res!116683) (not e!93218))))

(assert (=> d!45124 (= res!116683 (= (size!2883 (buf!3299 (_2!6453 lt!217653))) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!45124 (= (isPrefixOf!0 (_2!6453 lt!217653) (_2!6455 lt!217519)) e!93218)))

(declare-fun b!139941 () Bool)

(declare-fun res!116684 () Bool)

(assert (=> b!139941 (=> (not res!116684) (not e!93218))))

(assert (=> b!139941 (= res!116684 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217653))) (currentByte!6135 (_2!6453 lt!217653)) (currentBit!6130 (_2!6453 lt!217653))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun b!139942 () Bool)

(declare-fun e!93219 () Bool)

(assert (=> b!139942 (= e!93218 e!93219)))

(declare-fun res!116685 () Bool)

(assert (=> b!139942 (=> res!116685 e!93219)))

(assert (=> b!139942 (= res!116685 (= (size!2883 (buf!3299 (_2!6453 lt!217653))) #b00000000000000000000000000000000))))

(declare-fun b!139943 () Bool)

(assert (=> b!139943 (= e!93219 (arrayBitRangesEq!0 (buf!3299 (_2!6453 lt!217653)) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217653))) (currentByte!6135 (_2!6453 lt!217653)) (currentBit!6130 (_2!6453 lt!217653)))))))

(assert (= (and d!45124 res!116683) b!139941))

(assert (= (and b!139941 res!116684) b!139942))

(assert (= (and b!139942 (not res!116685)) b!139943))

(declare-fun m!215465 () Bool)

(assert (=> b!139941 m!215465))

(assert (=> b!139941 m!214755))

(assert (=> b!139943 m!215465))

(assert (=> b!139943 m!215465))

(declare-fun m!215467 () Bool)

(assert (=> b!139943 m!215467))

(assert (=> b!139645 d!45124))

(declare-fun d!45126 () Bool)

(declare-fun res!116686 () Bool)

(declare-fun e!93220 () Bool)

(assert (=> d!45126 (=> res!116686 e!93220)))

(assert (=> d!45126 (= res!116686 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!45126 (= (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217535) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!93220)))

(declare-fun b!139944 () Bool)

(declare-fun e!93221 () Bool)

(assert (=> b!139944 (= e!93220 e!93221)))

(declare-fun res!116687 () Bool)

(assert (=> b!139944 (=> (not res!116687) (not e!93221))))

(assert (=> b!139944 (= res!116687 (= (select (arr!3578 (_2!6452 lt!217524)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3578 (_2!6452 lt!217535)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!139945 () Bool)

(assert (=> b!139945 (= e!93221 (arrayRangesEq!247 (_2!6452 lt!217524) (_2!6452 lt!217535) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45126 (not res!116686)) b!139944))

(assert (= (and b!139944 res!116687) b!139945))

(assert (=> b!139944 m!215385))

(declare-fun m!215469 () Bool)

(assert (=> b!139944 m!215469))

(declare-fun m!215471 () Bool)

(assert (=> b!139945 m!215471))

(assert (=> b!139670 d!45126))

(declare-fun lt!218307 () (_ BitVec 8))

(declare-fun d!45128 () Bool)

(declare-fun lt!218305 () (_ BitVec 8))

(assert (=> d!45128 (= lt!218307 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))) (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))) ((_ sign_extend 24) lt!218305))))))

(assert (=> d!45128 (= lt!218305 ((_ extract 7 0) (currentBit!6130 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))))

(declare-fun e!93223 () Bool)

(assert (=> d!45128 e!93223))

(declare-fun res!116688 () Bool)

(assert (=> d!45128 (=> (not res!116688) (not e!93223))))

(assert (=> d!45128 (= res!116688 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))) ((_ sign_extend 32) (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))) ((_ sign_extend 32) (currentBit!6130 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8734 () Unit!8719)

(declare-fun Unit!8735 () Unit!8719)

(assert (=> d!45128 (= (readByte!0 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218305) #b00000000000000000000000000000000) (tuple2!12267 Unit!8734 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218307) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))) (bvadd (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218305)))))))) (tuple2!12267 Unit!8735 lt!218307))) (BitStream!5031 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) (bvadd (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6130 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))))

(declare-fun b!139946 () Bool)

(declare-fun e!93222 () Bool)

(assert (=> b!139946 (= e!93223 e!93222)))

(declare-fun res!116689 () Bool)

(assert (=> b!139946 (=> (not res!116689) (not e!93222))))

(declare-fun lt!218306 () tuple2!12260)

(assert (=> b!139946 (= res!116689 (= (buf!3299 (_2!6456 lt!218306)) (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))))

(declare-fun lt!218309 () (_ BitVec 8))

(declare-fun lt!218308 () (_ BitVec 8))

(declare-fun Unit!8736 () Unit!8719)

(declare-fun Unit!8737 () Unit!8719)

(assert (=> b!139946 (= lt!218306 (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218308) #b00000000000000000000000000000000) (tuple2!12267 Unit!8736 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218309) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))) (bvadd (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218308)))))))) (tuple2!12267 Unit!8737 lt!218309))) (BitStream!5031 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) (bvadd (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) #b00000000000000000000000000000001) (currentBit!6130 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))))

(assert (=> b!139946 (= lt!218309 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))) (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))) ((_ sign_extend 24) lt!218308))))))

(assert (=> b!139946 (= lt!218308 ((_ extract 7 0) (currentBit!6130 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))))

(declare-fun b!139947 () Bool)

(declare-fun lt!218310 () (_ BitVec 64))

(declare-fun lt!218304 () (_ BitVec 64))

(assert (=> b!139947 (= e!93222 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6456 lt!218306))) (currentByte!6135 (_2!6456 lt!218306)) (currentBit!6130 (_2!6456 lt!218306))) (bvadd lt!218304 lt!218310)))))

(assert (=> b!139947 (or (not (= (bvand lt!218304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218310 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218304 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218304 lt!218310) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139947 (= lt!218310 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!139947 (= lt!218304 (bitIndex!0 (size!2883 (buf!3299 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))) (currentByte!6135 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) (currentBit!6130 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))))

(assert (= (and d!45128 res!116688) b!139946))

(assert (= (and b!139946 res!116689) b!139947))

(declare-fun m!215473 () Bool)

(assert (=> d!45128 m!215473))

(declare-fun m!215475 () Bool)

(assert (=> d!45128 m!215475))

(declare-fun m!215477 () Bool)

(assert (=> d!45128 m!215477))

(assert (=> b!139946 m!215477))

(assert (=> b!139946 m!215473))

(declare-fun m!215479 () Bool)

(assert (=> b!139947 m!215479))

(declare-fun m!215481 () Bool)

(assert (=> b!139947 m!215481))

(assert (=> d!44843 d!45128))

(declare-fun d!45130 () Bool)

(declare-fun res!116690 () Bool)

(declare-fun e!93224 () Bool)

(assert (=> d!45130 (=> (not res!116690) (not e!93224))))

(assert (=> d!45130 (= res!116690 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) (size!2883 (buf!3299 (_2!6455 lt!217762)))))))

(assert (=> d!45130 (= (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217762)) e!93224)))

(declare-fun b!139948 () Bool)

(declare-fun res!116691 () Bool)

(assert (=> b!139948 (=> (not res!116691) (not e!93224))))

(assert (=> b!139948 (= res!116691 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217762))) (currentByte!6135 (_2!6455 lt!217762)) (currentBit!6130 (_2!6455 lt!217762)))))))

(declare-fun b!139949 () Bool)

(declare-fun e!93225 () Bool)

(assert (=> b!139949 (= e!93224 e!93225)))

(declare-fun res!116692 () Bool)

(assert (=> b!139949 (=> res!116692 e!93225)))

(assert (=> b!139949 (= res!116692 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) #b00000000000000000000000000000000))))

(declare-fun b!139950 () Bool)

(assert (=> b!139950 (= e!93225 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217762)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (= (and d!45130 res!116690) b!139948))

(assert (= (and b!139948 res!116691) b!139949))

(assert (= (and b!139949 (not res!116692)) b!139950))

(assert (=> b!139948 m!214757))

(assert (=> b!139948 m!214961))

(assert (=> b!139950 m!214757))

(assert (=> b!139950 m!214757))

(declare-fun m!215483 () Bool)

(assert (=> b!139950 m!215483))

(assert (=> b!139685 d!45130))

(declare-fun d!45132 () Bool)

(declare-fun lt!218311 () tuple2!12260)

(assert (=> d!45132 (= lt!218311 (readByte!0 (_1!6453 lt!217702)))))

(assert (=> d!45132 (= (readBytePure!0 (_1!6453 lt!217702)) (tuple2!12257 (_2!6456 lt!218311) (_1!6456 lt!218311)))))

(declare-fun bs!11058 () Bool)

(assert (= bs!11058 d!45132))

(declare-fun m!215485 () Bool)

(assert (=> bs!11058 m!215485))

(assert (=> b!139666 d!45132))

(declare-fun b!139951 () Bool)

(declare-fun e!93226 () Unit!8719)

(declare-fun Unit!8738 () Unit!8719)

(assert (=> b!139951 (= e!93226 Unit!8738)))

(declare-fun lt!218322 () (_ BitVec 64))

(declare-fun e!93227 () Bool)

(declare-fun lt!218319 () tuple2!12254)

(declare-fun b!139952 () Bool)

(declare-fun lt!218320 () (_ BitVec 64))

(assert (=> b!139952 (= e!93227 (= (_1!6453 lt!218319) (withMovedBitIndex!0 (_2!6453 lt!218319) (bvsub lt!218322 lt!218320))))))

(assert (=> b!139952 (or (= (bvand lt!218322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218320 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218322 lt!218320) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139952 (= lt!218320 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217700))) (currentByte!6135 (_2!6455 lt!217700)) (currentBit!6130 (_2!6455 lt!217700))))))

(assert (=> b!139952 (= lt!218322 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(declare-fun d!45134 () Bool)

(assert (=> d!45134 e!93227))

(declare-fun res!116695 () Bool)

(assert (=> d!45134 (=> (not res!116695) (not e!93227))))

(assert (=> d!45134 (= res!116695 (isPrefixOf!0 (_1!6453 lt!218319) (_2!6453 lt!218319)))))

(declare-fun lt!218316 () BitStream!5030)

(assert (=> d!45134 (= lt!218319 (tuple2!12255 lt!218316 (_2!6455 lt!217700)))))

(declare-fun lt!218318 () Unit!8719)

(declare-fun lt!218313 () Unit!8719)

(assert (=> d!45134 (= lt!218318 lt!218313)))

(assert (=> d!45134 (isPrefixOf!0 lt!218316 (_2!6455 lt!217700))))

(assert (=> d!45134 (= lt!218313 (lemmaIsPrefixTransitive!0 lt!218316 (_2!6455 lt!217700) (_2!6455 lt!217700)))))

(declare-fun lt!218312 () Unit!8719)

(declare-fun lt!218325 () Unit!8719)

(assert (=> d!45134 (= lt!218312 lt!218325)))

(assert (=> d!45134 (isPrefixOf!0 lt!218316 (_2!6455 lt!217700))))

(assert (=> d!45134 (= lt!218325 (lemmaIsPrefixTransitive!0 lt!218316 thiss!1634 (_2!6455 lt!217700)))))

(declare-fun lt!218331 () Unit!8719)

(assert (=> d!45134 (= lt!218331 e!93226)))

(declare-fun c!7778 () Bool)

(assert (=> d!45134 (= c!7778 (not (= (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!218329 () Unit!8719)

(declare-fun lt!218328 () Unit!8719)

(assert (=> d!45134 (= lt!218329 lt!218328)))

(assert (=> d!45134 (isPrefixOf!0 (_2!6455 lt!217700) (_2!6455 lt!217700))))

(assert (=> d!45134 (= lt!218328 (lemmaIsPrefixRefl!0 (_2!6455 lt!217700)))))

(declare-fun lt!218321 () Unit!8719)

(declare-fun lt!218330 () Unit!8719)

(assert (=> d!45134 (= lt!218321 lt!218330)))

(assert (=> d!45134 (= lt!218330 (lemmaIsPrefixRefl!0 (_2!6455 lt!217700)))))

(declare-fun lt!218314 () Unit!8719)

(declare-fun lt!218323 () Unit!8719)

(assert (=> d!45134 (= lt!218314 lt!218323)))

(assert (=> d!45134 (isPrefixOf!0 lt!218316 lt!218316)))

(assert (=> d!45134 (= lt!218323 (lemmaIsPrefixRefl!0 lt!218316))))

(declare-fun lt!218324 () Unit!8719)

(declare-fun lt!218315 () Unit!8719)

(assert (=> d!45134 (= lt!218324 lt!218315)))

(assert (=> d!45134 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45134 (= lt!218315 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45134 (= lt!218316 (BitStream!5031 (buf!3299 (_2!6455 lt!217700)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(assert (=> d!45134 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217700))))

(assert (=> d!45134 (= (reader!0 thiss!1634 (_2!6455 lt!217700)) lt!218319)))

(declare-fun b!139953 () Bool)

(declare-fun res!116693 () Bool)

(assert (=> b!139953 (=> (not res!116693) (not e!93227))))

(assert (=> b!139953 (= res!116693 (isPrefixOf!0 (_2!6453 lt!218319) (_2!6455 lt!217700)))))

(declare-fun b!139954 () Bool)

(declare-fun lt!218327 () Unit!8719)

(assert (=> b!139954 (= e!93226 lt!218327)))

(declare-fun lt!218326 () (_ BitVec 64))

(assert (=> b!139954 (= lt!218326 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218317 () (_ BitVec 64))

(assert (=> b!139954 (= lt!218317 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)))))

(assert (=> b!139954 (= lt!218327 (arrayBitRangesEqSymmetric!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217700)) lt!218326 lt!218317))))

(assert (=> b!139954 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217700)) (buf!3299 thiss!1634) lt!218326 lt!218317)))

(declare-fun b!139955 () Bool)

(declare-fun res!116694 () Bool)

(assert (=> b!139955 (=> (not res!116694) (not e!93227))))

(assert (=> b!139955 (= res!116694 (isPrefixOf!0 (_1!6453 lt!218319) thiss!1634))))

(assert (= (and d!45134 c!7778) b!139954))

(assert (= (and d!45134 (not c!7778)) b!139951))

(assert (= (and d!45134 res!116695) b!139955))

(assert (= (and b!139955 res!116694) b!139953))

(assert (= (and b!139953 res!116693) b!139952))

(declare-fun m!215487 () Bool)

(assert (=> b!139955 m!215487))

(declare-fun m!215489 () Bool)

(assert (=> b!139952 m!215489))

(assert (=> b!139952 m!214907))

(assert (=> b!139952 m!214759))

(assert (=> b!139954 m!214759))

(declare-fun m!215491 () Bool)

(assert (=> b!139954 m!215491))

(declare-fun m!215493 () Bool)

(assert (=> b!139954 m!215493))

(declare-fun m!215495 () Bool)

(assert (=> b!139953 m!215495))

(declare-fun m!215497 () Bool)

(assert (=> d!45134 m!215497))

(declare-fun m!215499 () Bool)

(assert (=> d!45134 m!215499))

(declare-fun m!215501 () Bool)

(assert (=> d!45134 m!215501))

(assert (=> d!45134 m!214815))

(declare-fun m!215503 () Bool)

(assert (=> d!45134 m!215503))

(declare-fun m!215505 () Bool)

(assert (=> d!45134 m!215505))

(declare-fun m!215507 () Bool)

(assert (=> d!45134 m!215507))

(assert (=> d!45134 m!214909))

(declare-fun m!215509 () Bool)

(assert (=> d!45134 m!215509))

(assert (=> d!45134 m!214825))

(declare-fun m!215511 () Bool)

(assert (=> d!45134 m!215511))

(assert (=> b!139666 d!45134))

(declare-fun d!45136 () Bool)

(declare-fun res!116696 () Bool)

(declare-fun e!93228 () Bool)

(assert (=> d!45136 (=> (not res!116696) (not e!93228))))

(assert (=> d!45136 (= res!116696 (= (size!2883 (buf!3299 (_2!6453 lt!217674))) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!45136 (= (isPrefixOf!0 (_2!6453 lt!217674) (_2!6455 lt!217519)) e!93228)))

(declare-fun b!139956 () Bool)

(declare-fun res!116697 () Bool)

(assert (=> b!139956 (=> (not res!116697) (not e!93228))))

(assert (=> b!139956 (= res!116697 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217674))) (currentByte!6135 (_2!6453 lt!217674)) (currentBit!6130 (_2!6453 lt!217674))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun b!139957 () Bool)

(declare-fun e!93229 () Bool)

(assert (=> b!139957 (= e!93228 e!93229)))

(declare-fun res!116698 () Bool)

(assert (=> b!139957 (=> res!116698 e!93229)))

(assert (=> b!139957 (= res!116698 (= (size!2883 (buf!3299 (_2!6453 lt!217674))) #b00000000000000000000000000000000))))

(declare-fun b!139958 () Bool)

(assert (=> b!139958 (= e!93229 (arrayBitRangesEq!0 (buf!3299 (_2!6453 lt!217674)) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217674))) (currentByte!6135 (_2!6453 lt!217674)) (currentBit!6130 (_2!6453 lt!217674)))))))

(assert (= (and d!45136 res!116696) b!139956))

(assert (= (and b!139956 res!116697) b!139957))

(assert (= (and b!139957 (not res!116698)) b!139958))

(assert (=> b!139956 m!215419))

(assert (=> b!139956 m!214755))

(assert (=> b!139958 m!215419))

(assert (=> b!139958 m!215419))

(declare-fun m!215513 () Bool)

(assert (=> b!139958 m!215513))

(assert (=> b!139653 d!45136))

(assert (=> d!44821 d!44831))

(declare-fun lt!218336 () tuple2!12256)

(declare-fun e!93237 () Bool)

(declare-fun lt!218337 () tuple2!12254)

(declare-fun b!139970 () Bool)

(assert (=> b!139970 (= e!93237 (and (= (_2!6454 lt!218336) (select (arr!3578 arr!237) from!447)) (= (_1!6454 lt!218336) (_2!6453 lt!218337))))))

(assert (=> b!139970 (= lt!218336 (readBytePure!0 (_1!6453 lt!218337)))))

(declare-fun _$37!29 () tuple2!12258)

(assert (=> b!139970 (= lt!218337 (reader!0 thiss!1634 (_2!6455 _$37!29)))))

(declare-fun d!45138 () Bool)

(assert (=> d!45138 e!93237))

(declare-fun res!116707 () Bool)

(assert (=> d!45138 (=> (not res!116707) (not e!93237))))

(assert (=> d!45138 (= res!116707 (= (size!2883 (buf!3299 thiss!1634)) (size!2883 (buf!3299 (_2!6455 _$37!29)))))))

(declare-fun e!93236 () Bool)

(assert (=> d!45138 (and (inv!12 (_2!6455 _$37!29)) e!93236)))

(assert (=> d!45138 (= (choose!6 thiss!1634 (select (arr!3578 arr!237) from!447)) _$37!29)))

(declare-fun b!139968 () Bool)

(declare-fun res!116706 () Bool)

(assert (=> b!139968 (=> (not res!116706) (not e!93237))))

(assert (=> b!139968 (= res!116706 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 _$37!29))) (currentByte!6135 (_2!6455 _$37!29)) (currentBit!6130 (_2!6455 _$37!29))) (bvadd (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!139967 () Bool)

(assert (=> b!139967 (= e!93236 (array_inv!2672 (buf!3299 (_2!6455 _$37!29))))))

(declare-fun b!139969 () Bool)

(declare-fun res!116705 () Bool)

(assert (=> b!139969 (=> (not res!116705) (not e!93237))))

(assert (=> b!139969 (= res!116705 (isPrefixOf!0 thiss!1634 (_2!6455 _$37!29)))))

(assert (= d!45138 b!139967))

(assert (= (and d!45138 res!116707) b!139968))

(assert (= (and b!139968 res!116706) b!139969))

(assert (= (and b!139969 res!116705) b!139970))

(declare-fun m!215515 () Bool)

(assert (=> d!45138 m!215515))

(declare-fun m!215517 () Bool)

(assert (=> b!139970 m!215517))

(declare-fun m!215519 () Bool)

(assert (=> b!139970 m!215519))

(declare-fun m!215521 () Bool)

(assert (=> b!139969 m!215521))

(declare-fun m!215523 () Bool)

(assert (=> b!139967 m!215523))

(declare-fun m!215525 () Bool)

(assert (=> b!139968 m!215525))

(assert (=> b!139968 m!214759))

(assert (=> d!44855 d!45138))

(declare-fun d!45140 () Bool)

(assert (=> d!45140 (= (validate_offset_byte!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!11059 () Bool)

(assert (= bs!11059 d!45140))

(assert (=> bs!11059 m!214795))

(assert (=> d!44855 d!45140))

(assert (=> d!44888 d!45078))

(assert (=> d!44880 d!44841))

(declare-fun d!45142 () Bool)

(assert (=> d!45142 (isPrefixOf!0 thiss!1634 (_2!6455 lt!217519))))

(assert (=> d!45142 true))

(declare-fun _$15!219 () Unit!8719)

(assert (=> d!45142 (= (choose!30 thiss!1634 (_2!6455 lt!217523) (_2!6455 lt!217519)) _$15!219)))

(declare-fun bs!11060 () Bool)

(assert (= bs!11060 d!45142))

(assert (=> bs!11060 m!214723))

(assert (=> d!44880 d!45142))

(assert (=> d!44880 d!44817))

(assert (=> d!44835 d!44869))

(declare-fun d!45144 () Bool)

(declare-fun e!93239 () Bool)

(assert (=> d!45144 e!93239))

(declare-fun res!116708 () Bool)

(assert (=> d!45144 (=> (not res!116708) (not e!93239))))

(declare-fun lt!218341 () (_ BitVec 64))

(declare-fun lt!218339 () (_ BitVec 64))

(declare-fun lt!218338 () (_ BitVec 64))

(assert (=> d!45144 (= res!116708 (= lt!218339 (bvsub lt!218338 lt!218341)))))

(assert (=> d!45144 (or (= (bvand lt!218338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218341 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218338 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218338 lt!218341) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45144 (= lt!218341 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217643)))) ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217643))) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217643)))))))

(declare-fun lt!218343 () (_ BitVec 64))

(declare-fun lt!218342 () (_ BitVec 64))

(assert (=> d!45144 (= lt!218338 (bvmul lt!218343 lt!218342))))

(assert (=> d!45144 (or (= lt!218343 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218342 (bvsdiv (bvmul lt!218343 lt!218342) lt!218343)))))

(assert (=> d!45144 (= lt!218342 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45144 (= lt!218343 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217643)))))))

(assert (=> d!45144 (= lt!218339 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217643))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217643)))))))

(assert (=> d!45144 (invariant!0 (currentBit!6130 (_1!6454 lt!217643)) (currentByte!6135 (_1!6454 lt!217643)) (size!2883 (buf!3299 (_1!6454 lt!217643))))))

(assert (=> d!45144 (= (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217643))) (currentByte!6135 (_1!6454 lt!217643)) (currentBit!6130 (_1!6454 lt!217643))) lt!218339)))

(declare-fun b!139971 () Bool)

(declare-fun res!116709 () Bool)

(assert (=> b!139971 (=> (not res!116709) (not e!93239))))

(assert (=> b!139971 (= res!116709 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218339))))

(declare-fun b!139972 () Bool)

(declare-fun lt!218340 () (_ BitVec 64))

(assert (=> b!139972 (= e!93239 (bvsle lt!218339 (bvmul lt!218340 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139972 (or (= lt!218340 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218340 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218340)))))

(assert (=> b!139972 (= lt!218340 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217643)))))))

(assert (= (and d!45144 res!116708) b!139971))

(assert (= (and b!139971 res!116709) b!139972))

(declare-fun m!215527 () Bool)

(assert (=> d!45144 m!215527))

(declare-fun m!215529 () Bool)

(assert (=> d!45144 m!215529))

(assert (=> d!44835 d!45144))

(declare-fun d!45146 () Bool)

(declare-fun lt!218344 () tuple2!12260)

(assert (=> d!45146 (= lt!218344 (readByte!0 lt!217644))))

(assert (=> d!45146 (= (readBytePure!0 lt!217644) (tuple2!12257 (_2!6456 lt!218344) (_1!6456 lt!218344)))))

(declare-fun bs!11061 () Bool)

(assert (= bs!11061 d!45146))

(declare-fun m!215531 () Bool)

(assert (=> bs!11061 m!215531))

(assert (=> d!44835 d!45146))

(declare-fun d!45148 () Bool)

(declare-fun e!93240 () Bool)

(assert (=> d!45148 e!93240))

(declare-fun res!116710 () Bool)

(assert (=> d!45148 (=> (not res!116710) (not e!93240))))

(declare-fun lt!218348 () (_ BitVec 64))

(declare-fun lt!218345 () (_ BitVec 64))

(declare-fun lt!218346 () (_ BitVec 64))

(assert (=> d!45148 (= res!116710 (= lt!218346 (bvsub lt!218345 lt!218348)))))

(assert (=> d!45148 (or (= (bvand lt!218345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218348 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218345 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218345 lt!218348) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45148 (= lt!218348 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217642)))) ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217642))) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217642)))))))

(declare-fun lt!218350 () (_ BitVec 64))

(declare-fun lt!218349 () (_ BitVec 64))

(assert (=> d!45148 (= lt!218345 (bvmul lt!218350 lt!218349))))

(assert (=> d!45148 (or (= lt!218350 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218349 (bvsdiv (bvmul lt!218350 lt!218349) lt!218350)))))

(assert (=> d!45148 (= lt!218349 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45148 (= lt!218350 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217642)))))))

(assert (=> d!45148 (= lt!218346 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217642))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217642)))))))

(assert (=> d!45148 (invariant!0 (currentBit!6130 (_1!6454 lt!217642)) (currentByte!6135 (_1!6454 lt!217642)) (size!2883 (buf!3299 (_1!6454 lt!217642))))))

(assert (=> d!45148 (= (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!217642))) (currentByte!6135 (_1!6454 lt!217642)) (currentBit!6130 (_1!6454 lt!217642))) lt!218346)))

(declare-fun b!139973 () Bool)

(declare-fun res!116711 () Bool)

(assert (=> b!139973 (=> (not res!116711) (not e!93240))))

(assert (=> b!139973 (= res!116711 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218346))))

(declare-fun b!139974 () Bool)

(declare-fun lt!218347 () (_ BitVec 64))

(assert (=> b!139974 (= e!93240 (bvsle lt!218346 (bvmul lt!218347 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139974 (or (= lt!218347 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218347 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218347)))))

(assert (=> b!139974 (= lt!218347 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217642)))))))

(assert (= (and d!45148 res!116710) b!139973))

(assert (= (and b!139973 res!116711) b!139974))

(declare-fun m!215533 () Bool)

(assert (=> d!45148 m!215533))

(declare-fun m!215535 () Bool)

(assert (=> d!45148 m!215535))

(assert (=> d!44835 d!45148))

(declare-fun d!45150 () Bool)

(declare-fun e!93243 () Bool)

(assert (=> d!45150 e!93243))

(declare-fun res!116714 () Bool)

(assert (=> d!45150 (=> (not res!116714) (not e!93243))))

(declare-fun lt!218356 () tuple2!12256)

(declare-fun lt!218355 () tuple2!12256)

(assert (=> d!45150 (= res!116714 (= (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!218356))) (currentByte!6135 (_1!6454 lt!218356)) (currentBit!6130 (_1!6454 lt!218356))) (bitIndex!0 (size!2883 (buf!3299 (_1!6454 lt!218355))) (currentByte!6135 (_1!6454 lt!218355)) (currentBit!6130 (_1!6454 lt!218355)))))))

(assert (=> d!45150 (= lt!218355 (readBytePure!0 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 lt!217517) (currentBit!6130 lt!217517))))))

(assert (=> d!45150 (= lt!218356 (readBytePure!0 lt!217517))))

(assert (=> d!45150 true))

(declare-fun _$8!72 () Unit!8719)

(assert (=> d!45150 (= (choose!14 lt!217517 (_2!6455 lt!217519) lt!217644 lt!217643 (tuple2!12257 (_1!6454 lt!217643) (_2!6454 lt!217643)) (_1!6454 lt!217643) (_2!6454 lt!217643) lt!217642 (tuple2!12257 (_1!6454 lt!217642) (_2!6454 lt!217642)) (_1!6454 lt!217642) (_2!6454 lt!217642)) _$8!72)))

(declare-fun b!139977 () Bool)

(assert (=> b!139977 (= e!93243 (= (_2!6454 lt!218356) (_2!6454 lt!218355)))))

(assert (= (and d!45150 res!116714) b!139977))

(declare-fun m!215537 () Bool)

(assert (=> d!45150 m!215537))

(declare-fun m!215539 () Bool)

(assert (=> d!45150 m!215539))

(declare-fun m!215541 () Bool)

(assert (=> d!45150 m!215541))

(assert (=> d!45150 m!214745))

(assert (=> d!44835 d!45150))

(declare-fun d!45152 () Bool)

(assert (=> d!45152 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) (bvsub (bvsub to!404 from!447) lt!217724)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) lt!217724)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11062 () Bool)

(assert (= bs!11062 d!45152))

(assert (=> bs!11062 m!214783))

(assert (=> b!139673 d!45152))

(declare-fun d!45154 () Bool)

(declare-fun res!116715 () Bool)

(declare-fun e!93244 () Bool)

(assert (=> d!45154 (=> res!116715 e!93244)))

(assert (=> d!45154 (= res!116715 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45154 (= (arrayRangesEq!247 arr!237 (_2!6452 lt!217768) #b00000000000000000000000000000000 to!404) e!93244)))

(declare-fun b!139978 () Bool)

(declare-fun e!93245 () Bool)

(assert (=> b!139978 (= e!93244 e!93245)))

(declare-fun res!116716 () Bool)

(assert (=> b!139978 (=> (not res!116716) (not e!93245))))

(assert (=> b!139978 (= res!116716 (= (select (arr!3578 arr!237) #b00000000000000000000000000000000) (select (arr!3578 (_2!6452 lt!217768)) #b00000000000000000000000000000000)))))

(declare-fun b!139979 () Bool)

(assert (=> b!139979 (= e!93245 (arrayRangesEq!247 arr!237 (_2!6452 lt!217768) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45154 (not res!116715)) b!139978))

(assert (= (and b!139978 res!116716) b!139979))

(assert (=> b!139978 m!214787))

(declare-fun m!215543 () Bool)

(assert (=> b!139978 m!215543))

(declare-fun m!215545 () Bool)

(assert (=> b!139979 m!215545))

(assert (=> b!139687 d!45154))

(declare-fun d!45156 () Bool)

(declare-fun res!116717 () Bool)

(declare-fun e!93246 () Bool)

(assert (=> d!45156 (=> (not res!116717) (not e!93246))))

(assert (=> d!45156 (= res!116717 (= (size!2883 (buf!3299 (_1!6453 lt!217674))) (size!2883 (buf!3299 thiss!1634))))))

(assert (=> d!45156 (= (isPrefixOf!0 (_1!6453 lt!217674) thiss!1634) e!93246)))

(declare-fun b!139980 () Bool)

(declare-fun res!116718 () Bool)

(assert (=> b!139980 (=> (not res!116718) (not e!93246))))

(assert (=> b!139980 (= res!116718 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217674))) (currentByte!6135 (_1!6453 lt!217674)) (currentBit!6130 (_1!6453 lt!217674))) (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(declare-fun b!139981 () Bool)

(declare-fun e!93247 () Bool)

(assert (=> b!139981 (= e!93246 e!93247)))

(declare-fun res!116719 () Bool)

(assert (=> b!139981 (=> res!116719 e!93247)))

(assert (=> b!139981 (= res!116719 (= (size!2883 (buf!3299 (_1!6453 lt!217674))) #b00000000000000000000000000000000))))

(declare-fun b!139982 () Bool)

(assert (=> b!139982 (= e!93247 (arrayBitRangesEq!0 (buf!3299 (_1!6453 lt!217674)) (buf!3299 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217674))) (currentByte!6135 (_1!6453 lt!217674)) (currentBit!6130 (_1!6453 lt!217674)))))))

(assert (= (and d!45156 res!116717) b!139980))

(assert (= (and b!139980 res!116718) b!139981))

(assert (= (and b!139981 (not res!116719)) b!139982))

(assert (=> b!139980 m!215417))

(assert (=> b!139980 m!214759))

(assert (=> b!139982 m!215417))

(assert (=> b!139982 m!215417))

(declare-fun m!215547 () Bool)

(assert (=> b!139982 m!215547))

(assert (=> b!139655 d!45156))

(declare-fun d!45158 () Bool)

(assert (=> d!45158 (= (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217526)))) ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217526))) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217526)))) (bvsub (bvmul ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217526)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217526))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217526))))))))

(assert (=> d!44884 d!45158))

(declare-fun d!45160 () Bool)

(assert (=> d!45160 (= (invariant!0 (currentBit!6130 (_1!6454 lt!217526)) (currentByte!6135 (_1!6454 lt!217526)) (size!2883 (buf!3299 (_1!6454 lt!217526)))) (and (bvsge (currentBit!6130 (_1!6454 lt!217526)) #b00000000000000000000000000000000) (bvslt (currentBit!6130 (_1!6454 lt!217526)) #b00000000000000000000000000001000) (bvsge (currentByte!6135 (_1!6454 lt!217526)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6135 (_1!6454 lt!217526)) (size!2883 (buf!3299 (_1!6454 lt!217526)))) (and (= (currentBit!6130 (_1!6454 lt!217526)) #b00000000000000000000000000000000) (= (currentByte!6135 (_1!6454 lt!217526)) (size!2883 (buf!3299 (_1!6454 lt!217526))))))))))

(assert (=> d!44884 d!45160))

(declare-fun d!45162 () Bool)

(assert (=> d!45162 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) (bvsub (bvsub to!404 from!447) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!45162 true))

(declare-fun _$7!64 () Unit!8719)

(assert (=> d!45162 (= (choose!57 thiss!1634 (_2!6455 lt!217523) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) _$7!64)))

(declare-fun bs!11063 () Bool)

(assert (= bs!11063 d!45162))

(declare-fun m!215549 () Bool)

(assert (=> bs!11063 m!215549))

(assert (=> d!44871 d!45162))

(assert (=> b!139636 d!44829))

(declare-fun d!45164 () Bool)

(assert (=> d!45164 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 thiss!1634) lt!217621 lt!217612)))

(declare-fun lt!218359 () Unit!8719)

(declare-fun choose!8 (array!6370 array!6370 (_ BitVec 64) (_ BitVec 64)) Unit!8719)

(assert (=> d!45164 (= lt!218359 (choose!8 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217523)) lt!217621 lt!217612))))

(assert (=> d!45164 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217621) (bvsle lt!217621 lt!217612))))

(assert (=> d!45164 (= (arrayBitRangesEqSymmetric!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217523)) lt!217621 lt!217612) lt!218359)))

(declare-fun bs!11064 () Bool)

(assert (= bs!11064 d!45164))

(assert (=> bs!11064 m!214805))

(declare-fun m!215551 () Bool)

(assert (=> bs!11064 m!215551))

(assert (=> b!139636 d!45164))

(declare-fun b!139983 () Bool)

(declare-fun e!93248 () Bool)

(declare-fun call!1823 () Bool)

(assert (=> b!139983 (= e!93248 call!1823)))

(declare-fun b!139984 () Bool)

(declare-fun res!116721 () Bool)

(declare-fun lt!218362 () (_ BitVec 32))

(assert (=> b!139984 (= res!116721 (= lt!218362 #b00000000000000000000000000000000))))

(declare-fun e!93252 () Bool)

(assert (=> b!139984 (=> res!116721 e!93252)))

(declare-fun e!93253 () Bool)

(assert (=> b!139984 (= e!93253 e!93252)))

(declare-fun d!45166 () Bool)

(declare-fun res!116723 () Bool)

(declare-fun e!93249 () Bool)

(assert (=> d!45166 (=> res!116723 e!93249)))

(assert (=> d!45166 (= res!116723 (bvsge lt!217621 lt!217612))))

(assert (=> d!45166 (= (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 thiss!1634) lt!217621 lt!217612) e!93249)))

(declare-fun c!7779 () Bool)

(declare-fun lt!218360 () tuple4!122)

(declare-fun lt!218361 () (_ BitVec 32))

(declare-fun bm!1820 () Bool)

(assert (=> bm!1820 (= call!1823 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_3!329 lt!218360)) (select (arr!3578 (buf!3299 thiss!1634)) (_3!329 lt!218360)) lt!218361 (ite c!7779 lt!218362 #b00000000000000000000000000001000)))))

(declare-fun b!139985 () Bool)

(assert (=> b!139985 (= e!93248 e!93253)))

(declare-fun res!116724 () Bool)

(assert (=> b!139985 (= res!116724 call!1823)))

(assert (=> b!139985 (=> (not res!116724) (not e!93253))))

(declare-fun b!139986 () Bool)

(declare-fun e!93251 () Bool)

(assert (=> b!139986 (= e!93251 e!93248)))

(assert (=> b!139986 (= c!7779 (= (_3!329 lt!218360) (_4!61 lt!218360)))))

(declare-fun b!139987 () Bool)

(assert (=> b!139987 (= e!93252 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_4!61 lt!218360)) (select (arr!3578 (buf!3299 thiss!1634)) (_4!61 lt!218360)) #b00000000000000000000000000000000 lt!218362))))

(declare-fun b!139988 () Bool)

(declare-fun e!93250 () Bool)

(assert (=> b!139988 (= e!93250 (arrayRangesEq!247 (buf!3299 (_2!6455 lt!217523)) (buf!3299 thiss!1634) (_1!6463 lt!218360) (_2!6463 lt!218360)))))

(declare-fun b!139989 () Bool)

(assert (=> b!139989 (= e!93249 e!93251)))

(declare-fun res!116722 () Bool)

(assert (=> b!139989 (=> (not res!116722) (not e!93251))))

(assert (=> b!139989 (= res!116722 e!93250)))

(declare-fun res!116720 () Bool)

(assert (=> b!139989 (=> res!116720 e!93250)))

(assert (=> b!139989 (= res!116720 (bvsge (_1!6463 lt!218360) (_2!6463 lt!218360)))))

(assert (=> b!139989 (= lt!218362 ((_ extract 31 0) (bvsrem lt!217612 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139989 (= lt!218361 ((_ extract 31 0) (bvsrem lt!217621 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139989 (= lt!218360 (arrayBitIndices!0 lt!217621 lt!217612))))

(assert (= (and d!45166 (not res!116723)) b!139989))

(assert (= (and b!139989 (not res!116720)) b!139988))

(assert (= (and b!139989 res!116722) b!139986))

(assert (= (and b!139986 c!7779) b!139983))

(assert (= (and b!139986 (not c!7779)) b!139985))

(assert (= (and b!139985 res!116724) b!139984))

(assert (= (and b!139984 (not res!116721)) b!139987))

(assert (= (or b!139983 b!139985) bm!1820))

(declare-fun m!215553 () Bool)

(assert (=> bm!1820 m!215553))

(declare-fun m!215555 () Bool)

(assert (=> bm!1820 m!215555))

(assert (=> bm!1820 m!215553))

(assert (=> bm!1820 m!215555))

(declare-fun m!215557 () Bool)

(assert (=> bm!1820 m!215557))

(declare-fun m!215559 () Bool)

(assert (=> b!139987 m!215559))

(declare-fun m!215561 () Bool)

(assert (=> b!139987 m!215561))

(assert (=> b!139987 m!215559))

(assert (=> b!139987 m!215561))

(declare-fun m!215563 () Bool)

(assert (=> b!139987 m!215563))

(declare-fun m!215565 () Bool)

(assert (=> b!139988 m!215565))

(declare-fun m!215567 () Bool)

(assert (=> b!139989 m!215567))

(assert (=> b!139636 d!45166))

(declare-fun d!45168 () Bool)

(declare-fun res!116725 () Bool)

(declare-fun e!93254 () Bool)

(assert (=> d!45168 (=> res!116725 e!93254)))

(assert (=> d!45168 (= res!116725 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (=> d!45168 (= (arrayRangesEq!247 arr!237 (_2!6452 lt!217525) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404) e!93254)))

(declare-fun b!139990 () Bool)

(declare-fun e!93255 () Bool)

(assert (=> b!139990 (= e!93254 e!93255)))

(declare-fun res!116726 () Bool)

(assert (=> b!139990 (=> (not res!116726) (not e!93255))))

(assert (=> b!139990 (= res!116726 (= (select (arr!3578 arr!237) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3578 (_2!6452 lt!217525)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!139991 () Bool)

(assert (=> b!139991 (= e!93255 (arrayRangesEq!247 arr!237 (_2!6452 lt!217525) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45168 (not res!116725)) b!139990))

(assert (= (and b!139990 res!116726) b!139991))

(declare-fun m!215569 () Bool)

(assert (=> b!139990 m!215569))

(declare-fun m!215571 () Bool)

(assert (=> b!139990 m!215571))

(declare-fun m!215573 () Bool)

(assert (=> b!139991 m!215573))

(assert (=> b!139619 d!45168))

(declare-fun b!140002 () Bool)

(declare-fun e!93266 () Bool)

(declare-fun e!93264 () Bool)

(assert (=> b!140002 (= e!93266 e!93264)))

(declare-fun res!116735 () Bool)

(assert (=> b!140002 (=> (not res!116735) (not e!93264))))

(declare-fun lt!218375 () tuple2!12254)

(declare-fun lt!218374 () tuple2!12252)

(assert (=> b!140002 (= res!116735 (and (= (size!2883 (_2!6452 lt!218374)) (size!2883 arr!237)) (= (_1!6452 lt!218374) (_2!6453 lt!218375))))))

(assert (=> b!140002 (= lt!218374 (readByteArrayLoopPure!0 (_1!6453 lt!218375) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!218377 () Unit!8719)

(declare-fun lt!218376 () Unit!8719)

(assert (=> b!140002 (= lt!218377 lt!218376)))

(declare-fun _$39!33 () tuple2!12258)

(declare-fun lt!218373 () (_ BitVec 64))

(assert (=> b!140002 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 _$39!33)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!218373)))

(assert (=> b!140002 (= lt!218376 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6455 lt!217523) (buf!3299 (_2!6455 _$39!33)) lt!218373))))

(assert (=> b!140002 (= lt!218373 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!140002 (= lt!218375 (reader!0 (_2!6455 lt!217523) (_2!6455 _$39!33)))))

(declare-fun d!45170 () Bool)

(assert (=> d!45170 e!93266))

(declare-fun res!116736 () Bool)

(assert (=> d!45170 (=> (not res!116736) (not e!93266))))

(assert (=> d!45170 (= res!116736 (= (size!2883 (buf!3299 (_2!6455 lt!217523))) (size!2883 (buf!3299 (_2!6455 _$39!33)))))))

(declare-fun e!93265 () Bool)

(assert (=> d!45170 (and (inv!12 (_2!6455 _$39!33)) e!93265)))

(assert (=> d!45170 (= (choose!64 (_2!6455 lt!217523) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) _$39!33)))

(declare-fun b!140003 () Bool)

(assert (=> b!140003 (= e!93265 (array_inv!2672 (buf!3299 (_2!6455 _$39!33))))))

(declare-fun b!140004 () Bool)

(declare-fun res!116738 () Bool)

(assert (=> b!140004 (=> (not res!116738) (not e!93266))))

(assert (=> b!140004 (= res!116738 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 _$39!33))) (currentByte!6135 (_2!6455 _$39!33)) (currentBit!6130 (_2!6455 _$39!33))) (bvadd (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!140005 () Bool)

(declare-fun res!116737 () Bool)

(assert (=> b!140005 (=> (not res!116737) (not e!93266))))

(assert (=> b!140005 (= res!116737 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 _$39!33)))))

(declare-fun b!140006 () Bool)

(assert (=> b!140006 (= e!93264 (arrayRangesEq!247 arr!237 (_2!6452 lt!218374) #b00000000000000000000000000000000 to!404))))

(assert (= d!45170 b!140003))

(assert (= (and d!45170 res!116736) b!140004))

(assert (= (and b!140004 res!116738) b!140005))

(assert (= (and b!140005 res!116737) b!140002))

(assert (= (and b!140002 res!116735) b!140006))

(declare-fun m!215575 () Bool)

(assert (=> b!140006 m!215575))

(declare-fun m!215577 () Bool)

(assert (=> b!140004 m!215577))

(assert (=> b!140004 m!214757))

(declare-fun m!215579 () Bool)

(assert (=> b!140005 m!215579))

(declare-fun m!215581 () Bool)

(assert (=> b!140002 m!215581))

(declare-fun m!215583 () Bool)

(assert (=> b!140002 m!215583))

(declare-fun m!215585 () Bool)

(assert (=> b!140002 m!215585))

(declare-fun m!215587 () Bool)

(assert (=> b!140002 m!215587))

(declare-fun m!215589 () Bool)

(assert (=> b!140003 m!215589))

(declare-fun m!215591 () Bool)

(assert (=> d!45170 m!215591))

(assert (=> d!44882 d!45170))

(declare-fun d!45172 () Bool)

(declare-fun lt!218381 () (_ BitVec 8))

(declare-fun lt!218379 () (_ BitVec 8))

(assert (=> d!45172 (= lt!218381 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217518))) (currentByte!6135 (_1!6453 lt!217518)))) ((_ sign_extend 24) lt!218379))))))

(assert (=> d!45172 (= lt!218379 ((_ extract 7 0) (currentBit!6130 (_1!6453 lt!217518))))))

(declare-fun e!93269 () Bool)

(assert (=> d!45172 e!93269))

(declare-fun res!116739 () Bool)

(assert (=> d!45172 (=> (not res!116739) (not e!93269))))

(assert (=> d!45172 (= res!116739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6453 lt!217518)))) ((_ sign_extend 32) (currentByte!6135 (_1!6453 lt!217518))) ((_ sign_extend 32) (currentBit!6130 (_1!6453 lt!217518))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8739 () Unit!8719)

(declare-fun Unit!8740 () Unit!8719)

(assert (=> d!45172 (= (readByte!0 (_1!6453 lt!217518)) (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218379) #b00000000000000000000000000000000) (tuple2!12267 Unit!8739 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218381) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217518))) (bvadd (currentByte!6135 (_1!6453 lt!217518)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218379)))))))) (tuple2!12267 Unit!8740 lt!218381))) (BitStream!5031 (buf!3299 (_1!6453 lt!217518)) (bvadd (currentByte!6135 (_1!6453 lt!217518)) #b00000000000000000000000000000001) (currentBit!6130 (_1!6453 lt!217518)))))))

(declare-fun b!140007 () Bool)

(declare-fun e!93268 () Bool)

(assert (=> b!140007 (= e!93269 e!93268)))

(declare-fun res!116740 () Bool)

(assert (=> b!140007 (=> (not res!116740) (not e!93268))))

(declare-fun lt!218380 () tuple2!12260)

(assert (=> b!140007 (= res!116740 (= (buf!3299 (_2!6456 lt!218380)) (buf!3299 (_1!6453 lt!217518))))))

(declare-fun lt!218382 () (_ BitVec 8))

(declare-fun lt!218383 () (_ BitVec 8))

(declare-fun Unit!8741 () Unit!8719)

(declare-fun Unit!8742 () Unit!8719)

(assert (=> b!140007 (= lt!218380 (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218382) #b00000000000000000000000000000000) (tuple2!12267 Unit!8741 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218383) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217518))) (bvadd (currentByte!6135 (_1!6453 lt!217518)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218382)))))))) (tuple2!12267 Unit!8742 lt!218383))) (BitStream!5031 (buf!3299 (_1!6453 lt!217518)) (bvadd (currentByte!6135 (_1!6453 lt!217518)) #b00000000000000000000000000000001) (currentBit!6130 (_1!6453 lt!217518)))))))

(assert (=> b!140007 (= lt!218383 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217518))) (currentByte!6135 (_1!6453 lt!217518)))) ((_ sign_extend 24) lt!218382))))))

(assert (=> b!140007 (= lt!218382 ((_ extract 7 0) (currentBit!6130 (_1!6453 lt!217518))))))

(declare-fun lt!218378 () (_ BitVec 64))

(declare-fun lt!218384 () (_ BitVec 64))

(declare-fun b!140008 () Bool)

(assert (=> b!140008 (= e!93268 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6456 lt!218380))) (currentByte!6135 (_2!6456 lt!218380)) (currentBit!6130 (_2!6456 lt!218380))) (bvadd lt!218378 lt!218384)))))

(assert (=> b!140008 (or (not (= (bvand lt!218378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218384 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218378 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218378 lt!218384) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140008 (= lt!218384 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!140008 (= lt!218378 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217518))) (currentByte!6135 (_1!6453 lt!217518)) (currentBit!6130 (_1!6453 lt!217518))))))

(assert (= (and d!45172 res!116739) b!140007))

(assert (= (and b!140007 res!116740) b!140008))

(declare-fun m!215593 () Bool)

(assert (=> d!45172 m!215593))

(declare-fun m!215595 () Bool)

(assert (=> d!45172 m!215595))

(declare-fun m!215597 () Bool)

(assert (=> d!45172 m!215597))

(assert (=> b!140007 m!215597))

(assert (=> b!140007 m!215593))

(declare-fun m!215599 () Bool)

(assert (=> b!140008 m!215599))

(declare-fun m!215601 () Bool)

(assert (=> b!140008 m!215601))

(assert (=> d!44825 d!45172))

(declare-fun d!45174 () Bool)

(declare-fun e!93270 () Bool)

(assert (=> d!45174 e!93270))

(declare-fun res!116741 () Bool)

(assert (=> d!45174 (=> (not res!116741) (not e!93270))))

(declare-fun lt!218388 () (_ BitVec 64))

(declare-fun lt!218385 () (_ BitVec 64))

(declare-fun lt!218386 () (_ BitVec 64))

(assert (=> d!45174 (= res!116741 (= lt!218386 (bvsub lt!218385 lt!218388)))))

(assert (=> d!45174 (or (= (bvand lt!218385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218388 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218385 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218385 lt!218388) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45174 (= lt!218388 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217700)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217700))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217700)))))))

(declare-fun lt!218390 () (_ BitVec 64))

(declare-fun lt!218389 () (_ BitVec 64))

(assert (=> d!45174 (= lt!218385 (bvmul lt!218390 lt!218389))))

(assert (=> d!45174 (or (= lt!218390 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218389 (bvsdiv (bvmul lt!218390 lt!218389) lt!218390)))))

(assert (=> d!45174 (= lt!218389 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45174 (= lt!218390 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217700)))))))

(assert (=> d!45174 (= lt!218386 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217700))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217700)))))))

(assert (=> d!45174 (invariant!0 (currentBit!6130 (_2!6455 lt!217700)) (currentByte!6135 (_2!6455 lt!217700)) (size!2883 (buf!3299 (_2!6455 lt!217700))))))

(assert (=> d!45174 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217700))) (currentByte!6135 (_2!6455 lt!217700)) (currentBit!6130 (_2!6455 lt!217700))) lt!218386)))

(declare-fun b!140009 () Bool)

(declare-fun res!116742 () Bool)

(assert (=> b!140009 (=> (not res!116742) (not e!93270))))

(assert (=> b!140009 (= res!116742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218386))))

(declare-fun b!140010 () Bool)

(declare-fun lt!218387 () (_ BitVec 64))

(assert (=> b!140010 (= e!93270 (bvsle lt!218386 (bvmul lt!218387 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140010 (or (= lt!218387 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218387 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218387)))))

(assert (=> b!140010 (= lt!218387 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217700)))))))

(assert (= (and d!45174 res!116741) b!140009))

(assert (= (and b!140009 res!116742) b!140010))

(declare-fun m!215603 () Bool)

(assert (=> d!45174 m!215603))

(declare-fun m!215605 () Bool)

(assert (=> d!45174 m!215605))

(assert (=> b!139664 d!45174))

(assert (=> b!139664 d!44829))

(declare-fun b!140021 () Bool)

(declare-fun res!116749 () Bool)

(declare-fun e!93277 () Bool)

(assert (=> b!140021 (=> (not res!116749) (not e!93277))))

(declare-fun lt!218484 () tuple3!530)

(assert (=> b!140021 (= res!116749 (and (= (buf!3299 (_1!6453 lt!217539)) (buf!3299 (_2!6457 lt!218484))) (= (size!2883 arr!237) (size!2883 (_3!326 lt!218484)))))))

(declare-fun lt!218475 () tuple3!530)

(declare-fun call!1832 () Bool)

(declare-fun c!7782 () Bool)

(declare-fun lt!218473 () (_ BitVec 32))

(declare-fun bm!1827 () Bool)

(assert (=> bm!1827 (= call!1832 (arrayRangesEq!247 arr!237 (ite c!7782 (_3!326 lt!218475) arr!237) (ite c!7782 lt!218473 #b00000000000000000000000000000000) (ite c!7782 (bvadd #b00000000000000000000000000000001 from!447) (size!2883 arr!237))))))

(declare-fun d!45176 () Bool)

(declare-fun e!93278 () Bool)

(assert (=> d!45176 e!93278))

(declare-fun res!116751 () Bool)

(assert (=> d!45176 (=> res!116751 e!93278)))

(assert (=> d!45176 (= res!116751 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!218466 () Bool)

(assert (=> d!45176 (= lt!218466 e!93277)))

(declare-fun res!116750 () Bool)

(assert (=> d!45176 (=> (not res!116750) (not e!93277))))

(declare-fun lt!218478 () (_ BitVec 64))

(declare-fun lt!218486 () (_ BitVec 64))

(assert (=> d!45176 (= res!116750 (= (bvadd lt!218478 lt!218486) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218484))) (currentByte!6135 (_2!6457 lt!218484)) (currentBit!6130 (_2!6457 lt!218484)))))))

(assert (=> d!45176 (or (not (= (bvand lt!218478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218486 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218478 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218478 lt!218486) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!218491 () (_ BitVec 64))

(assert (=> d!45176 (= lt!218486 (bvmul lt!218491 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!45176 (or (= lt!218491 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218491 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218491)))))

(assert (=> d!45176 (= lt!218491 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!45176 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!45176 (= lt!218478 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217539))) (currentByte!6135 (_1!6453 lt!217539)) (currentBit!6130 (_1!6453 lt!217539))))))

(declare-fun e!93279 () tuple3!530)

(assert (=> d!45176 (= lt!218484 e!93279)))

(assert (=> d!45176 (= c!7782 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45176 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2883 arr!237)))))

(assert (=> d!45176 (= (readByteArrayLoop!0 (_1!6453 lt!217539) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!218484)))

(declare-fun lt!218480 () array!6370)

(declare-fun bm!1828 () Bool)

(declare-fun lt!218496 () (_ BitVec 32))

(declare-fun lt!218472 () (_ BitVec 32))

(declare-fun call!1830 () Bool)

(declare-fun lt!218482 () array!6370)

(declare-fun lt!218477 () tuple2!12260)

(assert (=> bm!1828 (= call!1830 (arrayRangesEq!247 (ite c!7782 arr!237 lt!218480) (ite c!7782 (array!6371 (store (arr!3578 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218477)) (size!2883 arr!237)) lt!218482) (ite c!7782 #b00000000000000000000000000000000 lt!218472) (ite c!7782 (bvadd #b00000000000000000000000000000001 from!447) lt!218496)))))

(declare-fun b!140022 () Bool)

(declare-fun lt!218497 () Unit!8719)

(assert (=> b!140022 (= e!93279 (tuple3!531 lt!218497 (_2!6457 lt!218475) (_3!326 lt!218475)))))

(assert (=> b!140022 (= lt!218477 (readByte!0 (_1!6453 lt!217539)))))

(declare-fun lt!218488 () array!6370)

(assert (=> b!140022 (= lt!218488 (array!6371 (store (arr!3578 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218477)) (size!2883 arr!237)))))

(declare-fun lt!218468 () (_ BitVec 64))

(assert (=> b!140022 (= lt!218468 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!218481 () (_ BitVec 32))

(assert (=> b!140022 (= lt!218481 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!218464 () Unit!8719)

(assert (=> b!140022 (= lt!218464 (validateOffsetBytesFromBitIndexLemma!0 (_1!6453 lt!217539) (_2!6456 lt!218477) lt!218468 lt!218481))))

(assert (=> b!140022 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6456 lt!218477)))) ((_ sign_extend 32) (currentByte!6135 (_2!6456 lt!218477))) ((_ sign_extend 32) (currentBit!6130 (_2!6456 lt!218477))) (bvsub lt!218481 ((_ extract 31 0) (bvsdiv (bvadd lt!218468 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!218495 () Unit!8719)

(assert (=> b!140022 (= lt!218495 lt!218464)))

(assert (=> b!140022 (= lt!218475 (readByteArrayLoop!0 (_2!6456 lt!218477) lt!218488 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1831 () (_ BitVec 64))

(assert (=> b!140022 (= call!1831 (bvadd (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217539))) (currentByte!6135 (_1!6453 lt!217539)) (currentBit!6130 (_1!6453 lt!217539))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!218492 () Unit!8719)

(declare-fun Unit!8743 () Unit!8719)

(assert (=> b!140022 (= lt!218492 Unit!8743)))

(assert (=> b!140022 (= (bvadd call!1831 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218475))) (currentByte!6135 (_2!6457 lt!218475)) (currentBit!6130 (_2!6457 lt!218475))))))

(declare-fun lt!218469 () Unit!8719)

(declare-fun Unit!8744 () Unit!8719)

(assert (=> b!140022 (= lt!218469 Unit!8744)))

(assert (=> b!140022 (= (bvadd (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217539))) (currentByte!6135 (_1!6453 lt!217539)) (currentBit!6130 (_1!6453 lt!217539))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218475))) (currentByte!6135 (_2!6457 lt!218475)) (currentBit!6130 (_2!6457 lt!218475))))))

(declare-fun lt!218485 () Unit!8719)

(declare-fun Unit!8745 () Unit!8719)

(assert (=> b!140022 (= lt!218485 Unit!8745)))

(assert (=> b!140022 (and (= (buf!3299 (_1!6453 lt!217539)) (buf!3299 (_2!6457 lt!218475))) (= (size!2883 arr!237) (size!2883 (_3!326 lt!218475))))))

(declare-fun lt!218494 () Unit!8719)

(declare-fun Unit!8746 () Unit!8719)

(assert (=> b!140022 (= lt!218494 Unit!8746)))

(declare-fun lt!218471 () Unit!8719)

(declare-fun arrayUpdatedAtPrefixLemma!7 (array!6370 (_ BitVec 32) (_ BitVec 8)) Unit!8719)

(assert (=> b!140022 (= lt!218471 (arrayUpdatedAtPrefixLemma!7 arr!237 (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218477)))))

(assert (=> b!140022 call!1830))

(declare-fun lt!218476 () Unit!8719)

(assert (=> b!140022 (= lt!218476 lt!218471)))

(assert (=> b!140022 (= lt!218473 #b00000000000000000000000000000000)))

(declare-fun lt!218490 () Unit!8719)

(declare-fun arrayRangesEqTransitive!47 (array!6370 array!6370 array!6370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8719)

(assert (=> b!140022 (= lt!218490 (arrayRangesEqTransitive!47 arr!237 lt!218488 (_3!326 lt!218475) lt!218473 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140022 call!1832))

(declare-fun lt!218479 () Unit!8719)

(assert (=> b!140022 (= lt!218479 lt!218490)))

(assert (=> b!140022 (arrayRangesEq!247 arr!237 (_3!326 lt!218475) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!218470 () Unit!8719)

(declare-fun Unit!8747 () Unit!8719)

(assert (=> b!140022 (= lt!218470 Unit!8747)))

(declare-fun lt!218463 () Unit!8719)

(declare-fun arrayRangesEqImpliesEq!7 (array!6370 array!6370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8719)

(assert (=> b!140022 (= lt!218463 (arrayRangesEqImpliesEq!7 lt!218488 (_3!326 lt!218475) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140022 (= (select (store (arr!3578 arr!237) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218477)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3578 (_3!326 lt!218475)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!218465 () Unit!8719)

(assert (=> b!140022 (= lt!218465 lt!218463)))

(declare-fun lt!218474 () Bool)

(assert (=> b!140022 (= lt!218474 (= (select (arr!3578 (_3!326 lt!218475)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6456 lt!218477)))))

(declare-fun Unit!8748 () Unit!8719)

(assert (=> b!140022 (= lt!218497 Unit!8748)))

(assert (=> b!140022 lt!218474))

(declare-fun b!140023 () Bool)

(assert (=> b!140023 (= e!93277 (arrayRangesEq!247 arr!237 (_3!326 lt!218484) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!140024 () Bool)

(declare-fun lt!218493 () Unit!8719)

(assert (=> b!140024 (= e!93279 (tuple3!531 lt!218493 (_1!6453 lt!217539) arr!237))))

(assert (=> b!140024 (= call!1831 call!1831)))

(declare-fun lt!218467 () Unit!8719)

(declare-fun Unit!8749 () Unit!8719)

(assert (=> b!140024 (= lt!218467 Unit!8749)))

(declare-fun lt!218498 () Unit!8719)

(declare-fun arrayRangesEqReflexiveLemma!7 (array!6370) Unit!8719)

(assert (=> b!140024 (= lt!218498 (arrayRangesEqReflexiveLemma!7 arr!237))))

(assert (=> b!140024 call!1832))

(declare-fun lt!218489 () Unit!8719)

(assert (=> b!140024 (= lt!218489 lt!218498)))

(assert (=> b!140024 (= lt!218480 arr!237)))

(assert (=> b!140024 (= lt!218482 arr!237)))

(declare-fun lt!218483 () (_ BitVec 32))

(assert (=> b!140024 (= lt!218483 #b00000000000000000000000000000000)))

(declare-fun lt!218487 () (_ BitVec 32))

(assert (=> b!140024 (= lt!218487 (size!2883 arr!237))))

(assert (=> b!140024 (= lt!218472 #b00000000000000000000000000000000)))

(assert (=> b!140024 (= lt!218496 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun arrayRangesEqSlicedLemma!7 (array!6370 array!6370 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!8719)

(assert (=> b!140024 (= lt!218493 (arrayRangesEqSlicedLemma!7 lt!218480 lt!218482 lt!218483 lt!218487 lt!218472 lt!218496))))

(assert (=> b!140024 call!1830))

(declare-fun b!140025 () Bool)

(assert (=> b!140025 (= e!93278 (= (select (arr!3578 (_3!326 lt!218484)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6454 (readBytePure!0 (_1!6453 lt!217539)))))))

(assert (=> b!140025 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2883 (_3!326 lt!218484))))))

(declare-fun bm!1829 () Bool)

(assert (=> bm!1829 (= call!1831 (bitIndex!0 (ite c!7782 (size!2883 (buf!3299 (_2!6456 lt!218477))) (size!2883 (buf!3299 (_1!6453 lt!217539)))) (ite c!7782 (currentByte!6135 (_2!6456 lt!218477)) (currentByte!6135 (_1!6453 lt!217539))) (ite c!7782 (currentBit!6130 (_2!6456 lt!218477)) (currentBit!6130 (_1!6453 lt!217539)))))))

(assert (= (and d!45176 c!7782) b!140022))

(assert (= (and d!45176 (not c!7782)) b!140024))

(assert (= (or b!140022 b!140024) bm!1828))

(assert (= (or b!140022 b!140024) bm!1827))

(assert (= (or b!140022 b!140024) bm!1829))

(assert (= (and d!45176 res!116750) b!140021))

(assert (= (and b!140021 res!116749) b!140023))

(assert (= (and d!45176 (not res!116751)) b!140025))

(declare-fun m!215607 () Bool)

(assert (=> bm!1829 m!215607))

(declare-fun m!215609 () Bool)

(assert (=> bm!1827 m!215609))

(declare-fun m!215611 () Bool)

(assert (=> d!45176 m!215611))

(declare-fun m!215613 () Bool)

(assert (=> d!45176 m!215613))

(declare-fun m!215615 () Bool)

(assert (=> b!140022 m!215615))

(declare-fun m!215617 () Bool)

(assert (=> b!140022 m!215617))

(declare-fun m!215619 () Bool)

(assert (=> b!140022 m!215619))

(assert (=> b!140022 m!215613))

(declare-fun m!215621 () Bool)

(assert (=> b!140022 m!215621))

(declare-fun m!215623 () Bool)

(assert (=> b!140022 m!215623))

(declare-fun m!215625 () Bool)

(assert (=> b!140022 m!215625))

(declare-fun m!215627 () Bool)

(assert (=> b!140022 m!215627))

(declare-fun m!215629 () Bool)

(assert (=> b!140022 m!215629))

(declare-fun m!215631 () Bool)

(assert (=> b!140022 m!215631))

(declare-fun m!215633 () Bool)

(assert (=> b!140022 m!215633))

(declare-fun m!215635 () Bool)

(assert (=> b!140022 m!215635))

(declare-fun m!215637 () Bool)

(assert (=> b!140022 m!215637))

(assert (=> bm!1828 m!215637))

(declare-fun m!215639 () Bool)

(assert (=> bm!1828 m!215639))

(declare-fun m!215641 () Bool)

(assert (=> b!140024 m!215641))

(declare-fun m!215643 () Bool)

(assert (=> b!140024 m!215643))

(declare-fun m!215645 () Bool)

(assert (=> b!140023 m!215645))

(declare-fun m!215647 () Bool)

(assert (=> b!140025 m!215647))

(declare-fun m!215649 () Bool)

(assert (=> b!140025 m!215649))

(assert (=> d!44886 d!45176))

(declare-fun d!45178 () Bool)

(declare-fun e!93282 () Bool)

(assert (=> d!45178 e!93282))

(declare-fun res!116754 () Bool)

(assert (=> d!45178 (=> (not res!116754) (not e!93282))))

(declare-fun moveByteIndexPrecond!0 (BitStream!5030 (_ BitVec 32)) Bool)

(assert (=> d!45178 (= res!116754 (moveByteIndexPrecond!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))))

(declare-fun Unit!8750 () Unit!8719)

(assert (=> d!45178 (= (moveByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) (tuple2!12259 Unit!8750 (BitStream!5031 (buf!3299 (_1!6453 lt!217532)) (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001) (currentBit!6130 (_1!6453 lt!217532)))))))

(declare-fun b!140028 () Bool)

(assert (=> b!140028 (= e!93282 (and (or (not (= (bvand (currentByte!6135 (_1!6453 lt!217532)) #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000001 #b10000000000000000000000000000000))) (= (bvand (currentByte!6135 (_1!6453 lt!217532)) #b10000000000000000000000000000000) (bvand (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001) #b10000000000000000000000000000000))) (= (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001) (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001))))))

(assert (= (and d!45178 res!116754) b!140028))

(declare-fun m!215651 () Bool)

(assert (=> d!45178 m!215651))

(assert (=> d!44849 d!45178))

(assert (=> d!44878 d!44837))

(declare-fun d!45180 () Bool)

(assert (=> d!45180 (arrayRangesEq!247 (_2!6452 (readByteArrayLoopPure!0 (_1!6453 lt!217532) arr!237 from!447 to!404)) (_2!6452 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) (array!6371 (store (arr!3578 arr!237) from!447 (_2!6454 (readBytePure!0 (_1!6453 lt!217532)))) (size!2883 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404)) #b00000000000000000000000000000000 to!404)))

(assert (=> d!45180 true))

(declare-fun _$13!52 () Unit!8719)

(assert (=> d!45180 (= (choose!35 (_1!6453 lt!217532) arr!237 from!447 to!404 lt!217735 (_2!6452 lt!217735) lt!217736 lt!217737 (_2!6452 lt!217737)) _$13!52)))

(declare-fun bs!11066 () Bool)

(assert (= bs!11066 d!45180))

(assert (=> bs!11066 m!214941))

(assert (=> bs!11066 m!214699))

(declare-fun m!215653 () Bool)

(assert (=> bs!11066 m!215653))

(assert (=> bs!11066 m!214699))

(declare-fun m!215655 () Bool)

(assert (=> bs!11066 m!215655))

(assert (=> bs!11066 m!214693))

(assert (=> bs!11066 m!214743))

(assert (=> d!44878 d!45180))

(declare-fun d!45182 () Bool)

(declare-fun res!116755 () Bool)

(declare-fun e!93283 () Bool)

(assert (=> d!45182 (=> res!116755 e!93283)))

(assert (=> d!45182 (= res!116755 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45182 (= (arrayRangesEq!247 (_2!6452 lt!217735) (_2!6452 lt!217737) #b00000000000000000000000000000000 to!404) e!93283)))

(declare-fun b!140029 () Bool)

(declare-fun e!93284 () Bool)

(assert (=> b!140029 (= e!93283 e!93284)))

(declare-fun res!116756 () Bool)

(assert (=> b!140029 (=> (not res!116756) (not e!93284))))

(assert (=> b!140029 (= res!116756 (= (select (arr!3578 (_2!6452 lt!217735)) #b00000000000000000000000000000000) (select (arr!3578 (_2!6452 lt!217737)) #b00000000000000000000000000000000)))))

(declare-fun b!140030 () Bool)

(assert (=> b!140030 (= e!93284 (arrayRangesEq!247 (_2!6452 lt!217735) (_2!6452 lt!217737) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45182 (not res!116755)) b!140029))

(assert (= (and b!140029 res!116756) b!140030))

(declare-fun m!215657 () Bool)

(assert (=> b!140029 m!215657))

(declare-fun m!215659 () Bool)

(assert (=> b!140029 m!215659))

(declare-fun m!215661 () Bool)

(assert (=> b!140030 m!215661))

(assert (=> d!44878 d!45182))

(assert (=> d!44878 d!44874))

(assert (=> d!44878 d!44849))

(declare-fun lt!218499 () tuple3!530)

(declare-fun d!45184 () Bool)

(assert (=> d!45184 (= lt!218499 (readByteArrayLoop!0 lt!217736 (array!6371 (store (arr!3578 arr!237) from!447 (_2!6454 (readBytePure!0 (_1!6453 lt!217532)))) (size!2883 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!45184 (= (readByteArrayLoopPure!0 lt!217736 (array!6371 (store (arr!3578 arr!237) from!447 (_2!6454 (readBytePure!0 (_1!6453 lt!217532)))) (size!2883 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404) (tuple2!12253 (_2!6457 lt!218499) (_3!326 lt!218499)))))

(declare-fun bs!11067 () Bool)

(assert (= bs!11067 d!45184))

(declare-fun m!215663 () Bool)

(assert (=> bs!11067 m!215663))

(assert (=> d!44878 d!45184))

(assert (=> d!44853 d!44863))

(declare-fun d!45186 () Bool)

(assert (=> d!45186 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217519)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217534)))

(assert (=> d!45186 true))

(declare-fun _$5!53 () Unit!8719)

(assert (=> d!45186 (= (choose!26 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217519)) lt!217534 (BitStream!5031 (buf!3299 (_2!6455 lt!217519)) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))) _$5!53)))

(declare-fun bs!11068 () Bool)

(assert (= bs!11068 d!45186))

(assert (=> bs!11068 m!214709))

(assert (=> d!44853 d!45186))

(declare-fun b!140031 () Bool)

(declare-fun e!93285 () Bool)

(declare-fun call!1833 () Bool)

(assert (=> b!140031 (= e!93285 call!1833)))

(declare-fun b!140032 () Bool)

(declare-fun res!116758 () Bool)

(declare-fun lt!218502 () (_ BitVec 32))

(assert (=> b!140032 (= res!116758 (= lt!218502 #b00000000000000000000000000000000))))

(declare-fun e!93289 () Bool)

(assert (=> b!140032 (=> res!116758 e!93289)))

(declare-fun e!93290 () Bool)

(assert (=> b!140032 (= e!93290 e!93289)))

(declare-fun d!45188 () Bool)

(declare-fun res!116760 () Bool)

(declare-fun e!93286 () Bool)

(assert (=> d!45188 (=> res!116760 e!93286)))

(assert (=> d!45188 (= res!116760 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (=> d!45188 (= (arrayBitRangesEq!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) e!93286)))

(declare-fun c!7783 () Bool)

(declare-fun lt!218501 () (_ BitVec 32))

(declare-fun lt!218500 () tuple4!122)

(declare-fun bm!1830 () Bool)

(assert (=> bm!1830 (= call!1833 (byteRangesEq!0 (select (arr!3578 (buf!3299 thiss!1634)) (_3!329 lt!218500)) (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_3!329 lt!218500)) lt!218501 (ite c!7783 lt!218502 #b00000000000000000000000000001000)))))

(declare-fun b!140033 () Bool)

(assert (=> b!140033 (= e!93285 e!93290)))

(declare-fun res!116761 () Bool)

(assert (=> b!140033 (= res!116761 call!1833)))

(assert (=> b!140033 (=> (not res!116761) (not e!93290))))

(declare-fun b!140034 () Bool)

(declare-fun e!93288 () Bool)

(assert (=> b!140034 (= e!93288 e!93285)))

(assert (=> b!140034 (= c!7783 (= (_3!329 lt!218500) (_4!61 lt!218500)))))

(declare-fun b!140035 () Bool)

(assert (=> b!140035 (= e!93289 (byteRangesEq!0 (select (arr!3578 (buf!3299 thiss!1634)) (_4!61 lt!218500)) (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_4!61 lt!218500)) #b00000000000000000000000000000000 lt!218502))))

(declare-fun b!140036 () Bool)

(declare-fun e!93287 () Bool)

(assert (=> b!140036 (= e!93287 (arrayRangesEq!247 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217523)) (_1!6463 lt!218500) (_2!6463 lt!218500)))))

(declare-fun b!140037 () Bool)

(assert (=> b!140037 (= e!93286 e!93288)))

(declare-fun res!116759 () Bool)

(assert (=> b!140037 (=> (not res!116759) (not e!93288))))

(assert (=> b!140037 (= res!116759 e!93287)))

(declare-fun res!116757 () Bool)

(assert (=> b!140037 (=> res!116757 e!93287)))

(assert (=> b!140037 (= res!116757 (bvsge (_1!6463 lt!218500) (_2!6463 lt!218500)))))

(assert (=> b!140037 (= lt!218502 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140037 (= lt!218501 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140037 (= lt!218500 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (= (and d!45188 (not res!116760)) b!140037))

(assert (= (and b!140037 (not res!116757)) b!140036))

(assert (= (and b!140037 res!116759) b!140034))

(assert (= (and b!140034 c!7783) b!140031))

(assert (= (and b!140034 (not c!7783)) b!140033))

(assert (= (and b!140033 res!116761) b!140032))

(assert (= (and b!140032 (not res!116758)) b!140035))

(assert (= (or b!140031 b!140033) bm!1830))

(declare-fun m!215665 () Bool)

(assert (=> bm!1830 m!215665))

(declare-fun m!215667 () Bool)

(assert (=> bm!1830 m!215667))

(assert (=> bm!1830 m!215665))

(assert (=> bm!1830 m!215667))

(declare-fun m!215669 () Bool)

(assert (=> bm!1830 m!215669))

(declare-fun m!215671 () Bool)

(assert (=> b!140035 m!215671))

(declare-fun m!215673 () Bool)

(assert (=> b!140035 m!215673))

(assert (=> b!140035 m!215671))

(assert (=> b!140035 m!215673))

(declare-fun m!215675 () Bool)

(assert (=> b!140035 m!215675))

(declare-fun m!215677 () Bool)

(assert (=> b!140036 m!215677))

(assert (=> b!140037 m!214759))

(declare-fun m!215679 () Bool)

(assert (=> b!140037 m!215679))

(assert (=> b!139622 d!45188))

(assert (=> b!139622 d!44829))

(declare-fun b!140038 () Bool)

(declare-fun res!116762 () Bool)

(declare-fun e!93291 () Bool)

(assert (=> b!140038 (=> (not res!116762) (not e!93291))))

(declare-fun lt!218524 () tuple3!530)

(assert (=> b!140038 (= res!116762 (and (= (buf!3299 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)) (buf!3299 (_2!6457 lt!218524))) (= (size!2883 lt!217528) (size!2883 (_3!326 lt!218524)))))))

(declare-fun bm!1831 () Bool)

(declare-fun c!7784 () Bool)

(declare-fun lt!218513 () (_ BitVec 32))

(declare-fun call!1836 () Bool)

(declare-fun lt!218515 () tuple3!530)

(assert (=> bm!1831 (= call!1836 (arrayRangesEq!247 lt!217528 (ite c!7784 (_3!326 lt!218515) lt!217528) (ite c!7784 lt!218513 #b00000000000000000000000000000000) (ite c!7784 (bvadd #b00000000000000000000000000000001 from!447) (size!2883 lt!217528))))))

(declare-fun d!45190 () Bool)

(declare-fun e!93292 () Bool)

(assert (=> d!45190 e!93292))

(declare-fun res!116764 () Bool)

(assert (=> d!45190 (=> res!116764 e!93292)))

(assert (=> d!45190 (= res!116764 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!218506 () Bool)

(assert (=> d!45190 (= lt!218506 e!93291)))

(declare-fun res!116763 () Bool)

(assert (=> d!45190 (=> (not res!116763) (not e!93291))))

(declare-fun lt!218518 () (_ BitVec 64))

(declare-fun lt!218526 () (_ BitVec 64))

(assert (=> d!45190 (= res!116763 (= (bvadd lt!218518 lt!218526) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218524))) (currentByte!6135 (_2!6457 lt!218524)) (currentBit!6130 (_2!6457 lt!218524)))))))

(assert (=> d!45190 (or (not (= (bvand lt!218518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218526 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218518 lt!218526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!218531 () (_ BitVec 64))

(assert (=> d!45190 (= lt!218526 (bvmul lt!218531 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!45190 (or (= lt!218531 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218531 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218531)))))

(assert (=> d!45190 (= lt!218531 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!45190 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!45190 (= lt!218518 (bitIndex!0 (size!2883 (buf!3299 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))) (currentByte!6135 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)) (currentBit!6130 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))))))

(declare-fun e!93293 () tuple3!530)

(assert (=> d!45190 (= lt!218524 e!93293)))

(assert (=> d!45190 (= c!7784 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45190 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2883 lt!217528)))))

(assert (=> d!45190 (= (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!218524)))

(declare-fun bm!1832 () Bool)

(declare-fun lt!218520 () array!6370)

(declare-fun lt!218517 () tuple2!12260)

(declare-fun lt!218512 () (_ BitVec 32))

(declare-fun lt!218522 () array!6370)

(declare-fun lt!218536 () (_ BitVec 32))

(declare-fun call!1834 () Bool)

(assert (=> bm!1832 (= call!1834 (arrayRangesEq!247 (ite c!7784 lt!217528 lt!218520) (ite c!7784 (array!6371 (store (arr!3578 lt!217528) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218517)) (size!2883 lt!217528)) lt!218522) (ite c!7784 #b00000000000000000000000000000000 lt!218512) (ite c!7784 (bvadd #b00000000000000000000000000000001 from!447) lt!218536)))))

(declare-fun b!140039 () Bool)

(declare-fun lt!218537 () Unit!8719)

(assert (=> b!140039 (= e!93293 (tuple3!531 lt!218537 (_2!6457 lt!218515) (_3!326 lt!218515)))))

(assert (=> b!140039 (= lt!218517 (readByte!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)))))

(declare-fun lt!218528 () array!6370)

(assert (=> b!140039 (= lt!218528 (array!6371 (store (arr!3578 lt!217528) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218517)) (size!2883 lt!217528)))))

(declare-fun lt!218508 () (_ BitVec 64))

(assert (=> b!140039 (= lt!218508 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!218521 () (_ BitVec 32))

(assert (=> b!140039 (= lt!218521 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!218504 () Unit!8719)

(assert (=> b!140039 (= lt!218504 (validateOffsetBytesFromBitIndexLemma!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) (_2!6456 lt!218517) lt!218508 lt!218521))))

(assert (=> b!140039 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6456 lt!218517)))) ((_ sign_extend 32) (currentByte!6135 (_2!6456 lt!218517))) ((_ sign_extend 32) (currentBit!6130 (_2!6456 lt!218517))) (bvsub lt!218521 ((_ extract 31 0) (bvsdiv (bvadd lt!218508 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!218535 () Unit!8719)

(assert (=> b!140039 (= lt!218535 lt!218504)))

(assert (=> b!140039 (= lt!218515 (readByteArrayLoop!0 (_2!6456 lt!218517) lt!218528 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1835 () (_ BitVec 64))

(assert (=> b!140039 (= call!1835 (bvadd (bitIndex!0 (size!2883 (buf!3299 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))) (currentByte!6135 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)) (currentBit!6130 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!218532 () Unit!8719)

(declare-fun Unit!8751 () Unit!8719)

(assert (=> b!140039 (= lt!218532 Unit!8751)))

(assert (=> b!140039 (= (bvadd call!1835 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218515))) (currentByte!6135 (_2!6457 lt!218515)) (currentBit!6130 (_2!6457 lt!218515))))))

(declare-fun lt!218509 () Unit!8719)

(declare-fun Unit!8752 () Unit!8719)

(assert (=> b!140039 (= lt!218509 Unit!8752)))

(assert (=> b!140039 (= (bvadd (bitIndex!0 (size!2883 (buf!3299 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))) (currentByte!6135 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)) (currentBit!6130 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218515))) (currentByte!6135 (_2!6457 lt!218515)) (currentBit!6130 (_2!6457 lt!218515))))))

(declare-fun lt!218525 () Unit!8719)

(declare-fun Unit!8753 () Unit!8719)

(assert (=> b!140039 (= lt!218525 Unit!8753)))

(assert (=> b!140039 (and (= (buf!3299 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)) (buf!3299 (_2!6457 lt!218515))) (= (size!2883 lt!217528) (size!2883 (_3!326 lt!218515))))))

(declare-fun lt!218534 () Unit!8719)

(declare-fun Unit!8754 () Unit!8719)

(assert (=> b!140039 (= lt!218534 Unit!8754)))

(declare-fun lt!218511 () Unit!8719)

(assert (=> b!140039 (= lt!218511 (arrayUpdatedAtPrefixLemma!7 lt!217528 (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218517)))))

(assert (=> b!140039 call!1834))

(declare-fun lt!218516 () Unit!8719)

(assert (=> b!140039 (= lt!218516 lt!218511)))

(assert (=> b!140039 (= lt!218513 #b00000000000000000000000000000000)))

(declare-fun lt!218530 () Unit!8719)

(assert (=> b!140039 (= lt!218530 (arrayRangesEqTransitive!47 lt!217528 lt!218528 (_3!326 lt!218515) lt!218513 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140039 call!1836))

(declare-fun lt!218519 () Unit!8719)

(assert (=> b!140039 (= lt!218519 lt!218530)))

(assert (=> b!140039 (arrayRangesEq!247 lt!217528 (_3!326 lt!218515) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!218510 () Unit!8719)

(declare-fun Unit!8755 () Unit!8719)

(assert (=> b!140039 (= lt!218510 Unit!8755)))

(declare-fun lt!218503 () Unit!8719)

(assert (=> b!140039 (= lt!218503 (arrayRangesEqImpliesEq!7 lt!218528 (_3!326 lt!218515) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140039 (= (select (store (arr!3578 lt!217528) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218517)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3578 (_3!326 lt!218515)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!218505 () Unit!8719)

(assert (=> b!140039 (= lt!218505 lt!218503)))

(declare-fun lt!218514 () Bool)

(assert (=> b!140039 (= lt!218514 (= (select (arr!3578 (_3!326 lt!218515)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6456 lt!218517)))))

(declare-fun Unit!8756 () Unit!8719)

(assert (=> b!140039 (= lt!218537 Unit!8756)))

(assert (=> b!140039 lt!218514))

(declare-fun b!140040 () Bool)

(assert (=> b!140040 (= e!93291 (arrayRangesEq!247 lt!217528 (_3!326 lt!218524) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!218533 () Unit!8719)

(declare-fun b!140041 () Bool)

(assert (=> b!140041 (= e!93293 (tuple3!531 lt!218533 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001) lt!217528))))

(assert (=> b!140041 (= call!1835 call!1835)))

(declare-fun lt!218507 () Unit!8719)

(declare-fun Unit!8757 () Unit!8719)

(assert (=> b!140041 (= lt!218507 Unit!8757)))

(declare-fun lt!218538 () Unit!8719)

(assert (=> b!140041 (= lt!218538 (arrayRangesEqReflexiveLemma!7 lt!217528))))

(assert (=> b!140041 call!1836))

(declare-fun lt!218529 () Unit!8719)

(assert (=> b!140041 (= lt!218529 lt!218538)))

(assert (=> b!140041 (= lt!218520 lt!217528)))

(assert (=> b!140041 (= lt!218522 lt!217528)))

(declare-fun lt!218523 () (_ BitVec 32))

(assert (=> b!140041 (= lt!218523 #b00000000000000000000000000000000)))

(declare-fun lt!218527 () (_ BitVec 32))

(assert (=> b!140041 (= lt!218527 (size!2883 lt!217528))))

(assert (=> b!140041 (= lt!218512 #b00000000000000000000000000000000)))

(assert (=> b!140041 (= lt!218536 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!140041 (= lt!218533 (arrayRangesEqSlicedLemma!7 lt!218520 lt!218522 lt!218523 lt!218527 lt!218512 lt!218536))))

(assert (=> b!140041 call!1834))

(declare-fun b!140042 () Bool)

(assert (=> b!140042 (= e!93292 (= (select (arr!3578 (_3!326 lt!218524)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6454 (readBytePure!0 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)))))))

(assert (=> b!140042 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2883 (_3!326 lt!218524))))))

(declare-fun bm!1833 () Bool)

(assert (=> bm!1833 (= call!1835 (bitIndex!0 (ite c!7784 (size!2883 (buf!3299 (_2!6456 lt!218517))) (size!2883 (buf!3299 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)))) (ite c!7784 (currentByte!6135 (_2!6456 lt!218517)) (currentByte!6135 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001))) (ite c!7784 (currentBit!6130 (_2!6456 lt!218517)) (currentBit!6130 (withMovedByteIndex!0 (_1!6453 lt!217532) #b00000000000000000000000000000001)))))))

(assert (= (and d!45190 c!7784) b!140039))

(assert (= (and d!45190 (not c!7784)) b!140041))

(assert (= (or b!140039 b!140041) bm!1832))

(assert (= (or b!140039 b!140041) bm!1831))

(assert (= (or b!140039 b!140041) bm!1833))

(assert (= (and d!45190 res!116763) b!140038))

(assert (= (and b!140038 res!116762) b!140040))

(assert (= (and d!45190 (not res!116764)) b!140042))

(declare-fun m!215681 () Bool)

(assert (=> bm!1833 m!215681))

(declare-fun m!215683 () Bool)

(assert (=> bm!1831 m!215683))

(declare-fun m!215685 () Bool)

(assert (=> d!45190 m!215685))

(declare-fun m!215687 () Bool)

(assert (=> d!45190 m!215687))

(declare-fun m!215689 () Bool)

(assert (=> b!140039 m!215689))

(assert (=> b!140039 m!214699))

(declare-fun m!215691 () Bool)

(assert (=> b!140039 m!215691))

(declare-fun m!215693 () Bool)

(assert (=> b!140039 m!215693))

(assert (=> b!140039 m!215687))

(assert (=> b!140039 m!214699))

(declare-fun m!215695 () Bool)

(assert (=> b!140039 m!215695))

(declare-fun m!215697 () Bool)

(assert (=> b!140039 m!215697))

(declare-fun m!215699 () Bool)

(assert (=> b!140039 m!215699))

(declare-fun m!215701 () Bool)

(assert (=> b!140039 m!215701))

(declare-fun m!215703 () Bool)

(assert (=> b!140039 m!215703))

(declare-fun m!215705 () Bool)

(assert (=> b!140039 m!215705))

(declare-fun m!215707 () Bool)

(assert (=> b!140039 m!215707))

(declare-fun m!215709 () Bool)

(assert (=> b!140039 m!215709))

(declare-fun m!215711 () Bool)

(assert (=> b!140039 m!215711))

(assert (=> bm!1832 m!215711))

(declare-fun m!215713 () Bool)

(assert (=> bm!1832 m!215713))

(declare-fun m!215715 () Bool)

(assert (=> b!140041 m!215715))

(declare-fun m!215717 () Bool)

(assert (=> b!140041 m!215717))

(declare-fun m!215719 () Bool)

(assert (=> b!140040 m!215719))

(declare-fun m!215721 () Bool)

(assert (=> b!140042 m!215721))

(assert (=> b!140042 m!214699))

(declare-fun m!215723 () Bool)

(assert (=> b!140042 m!215723))

(assert (=> d!44859 d!45190))

(declare-fun d!45192 () Bool)

(assert (=> d!45192 (= (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217533)))) ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217533))) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217533)))) (bvsub (bvmul ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6454 lt!217533)))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_1!6454 lt!217533))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_1!6454 lt!217533))))))))

(assert (=> d!44857 d!45192))

(declare-fun d!45194 () Bool)

(assert (=> d!45194 (= (invariant!0 (currentBit!6130 (_1!6454 lt!217533)) (currentByte!6135 (_1!6454 lt!217533)) (size!2883 (buf!3299 (_1!6454 lt!217533)))) (and (bvsge (currentBit!6130 (_1!6454 lt!217533)) #b00000000000000000000000000000000) (bvslt (currentBit!6130 (_1!6454 lt!217533)) #b00000000000000000000000000001000) (bvsge (currentByte!6135 (_1!6454 lt!217533)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6135 (_1!6454 lt!217533)) (size!2883 (buf!3299 (_1!6454 lt!217533)))) (and (= (currentBit!6130 (_1!6454 lt!217533)) #b00000000000000000000000000000000) (= (currentByte!6135 (_1!6454 lt!217533)) (size!2883 (buf!3299 (_1!6454 lt!217533))))))))))

(assert (=> d!44857 d!45194))

(assert (=> d!44876 d!45062))

(declare-fun d!45196 () Bool)

(assert (=> d!45196 (= (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) ((_ sign_extend 32) (currentByte!6135 thiss!1634)) ((_ sign_extend 32) (currentBit!6130 thiss!1634))) (bvsub (bvmul ((_ sign_extend 32) (size!2883 (buf!3299 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 thiss!1634)))))))

(assert (=> d!44829 d!45196))

(assert (=> d!44829 d!44831))

(assert (=> d!44823 d!45196))

(assert (=> b!139646 d!44811))

(declare-fun d!45198 () Bool)

(assert (=> d!45198 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217519)) (buf!3299 (_2!6455 lt!217523)) lt!217660 lt!217651)))

(declare-fun lt!218539 () Unit!8719)

(assert (=> d!45198 (= lt!218539 (choose!8 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217519)) lt!217660 lt!217651))))

(assert (=> d!45198 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217660) (bvsle lt!217660 lt!217651))))

(assert (=> d!45198 (= (arrayBitRangesEqSymmetric!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217519)) lt!217660 lt!217651) lt!218539)))

(declare-fun bs!11069 () Bool)

(assert (= bs!11069 d!45198))

(assert (=> bs!11069 m!214845))

(declare-fun m!215725 () Bool)

(assert (=> bs!11069 m!215725))

(assert (=> b!139646 d!45198))

(declare-fun b!140043 () Bool)

(declare-fun e!93294 () Bool)

(declare-fun call!1837 () Bool)

(assert (=> b!140043 (= e!93294 call!1837)))

(declare-fun b!140044 () Bool)

(declare-fun res!116766 () Bool)

(declare-fun lt!218542 () (_ BitVec 32))

(assert (=> b!140044 (= res!116766 (= lt!218542 #b00000000000000000000000000000000))))

(declare-fun e!93298 () Bool)

(assert (=> b!140044 (=> res!116766 e!93298)))

(declare-fun e!93299 () Bool)

(assert (=> b!140044 (= e!93299 e!93298)))

(declare-fun d!45200 () Bool)

(declare-fun res!116768 () Bool)

(declare-fun e!93295 () Bool)

(assert (=> d!45200 (=> res!116768 e!93295)))

(assert (=> d!45200 (= res!116768 (bvsge lt!217660 lt!217651))))

(assert (=> d!45200 (= (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217519)) (buf!3299 (_2!6455 lt!217523)) lt!217660 lt!217651) e!93295)))

(declare-fun lt!218541 () (_ BitVec 32))

(declare-fun lt!218540 () tuple4!122)

(declare-fun c!7785 () Bool)

(declare-fun bm!1834 () Bool)

(assert (=> bm!1834 (= call!1837 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_3!329 lt!218540)) (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_3!329 lt!218540)) lt!218541 (ite c!7785 lt!218542 #b00000000000000000000000000001000)))))

(declare-fun b!140045 () Bool)

(assert (=> b!140045 (= e!93294 e!93299)))

(declare-fun res!116769 () Bool)

(assert (=> b!140045 (= res!116769 call!1837)))

(assert (=> b!140045 (=> (not res!116769) (not e!93299))))

(declare-fun b!140046 () Bool)

(declare-fun e!93297 () Bool)

(assert (=> b!140046 (= e!93297 e!93294)))

(assert (=> b!140046 (= c!7785 (= (_3!329 lt!218540) (_4!61 lt!218540)))))

(declare-fun b!140047 () Bool)

(assert (=> b!140047 (= e!93298 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_4!61 lt!218540)) (select (arr!3578 (buf!3299 (_2!6455 lt!217523))) (_4!61 lt!218540)) #b00000000000000000000000000000000 lt!218542))))

(declare-fun e!93296 () Bool)

(declare-fun b!140048 () Bool)

(assert (=> b!140048 (= e!93296 (arrayRangesEq!247 (buf!3299 (_2!6455 lt!217519)) (buf!3299 (_2!6455 lt!217523)) (_1!6463 lt!218540) (_2!6463 lt!218540)))))

(declare-fun b!140049 () Bool)

(assert (=> b!140049 (= e!93295 e!93297)))

(declare-fun res!116767 () Bool)

(assert (=> b!140049 (=> (not res!116767) (not e!93297))))

(assert (=> b!140049 (= res!116767 e!93296)))

(declare-fun res!116765 () Bool)

(assert (=> b!140049 (=> res!116765 e!93296)))

(assert (=> b!140049 (= res!116765 (bvsge (_1!6463 lt!218540) (_2!6463 lt!218540)))))

(assert (=> b!140049 (= lt!218542 ((_ extract 31 0) (bvsrem lt!217651 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140049 (= lt!218541 ((_ extract 31 0) (bvsrem lt!217660 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140049 (= lt!218540 (arrayBitIndices!0 lt!217660 lt!217651))))

(assert (= (and d!45200 (not res!116768)) b!140049))

(assert (= (and b!140049 (not res!116765)) b!140048))

(assert (= (and b!140049 res!116767) b!140046))

(assert (= (and b!140046 c!7785) b!140043))

(assert (= (and b!140046 (not c!7785)) b!140045))

(assert (= (and b!140045 res!116769) b!140044))

(assert (= (and b!140044 (not res!116766)) b!140047))

(assert (= (or b!140043 b!140045) bm!1834))

(declare-fun m!215727 () Bool)

(assert (=> bm!1834 m!215727))

(declare-fun m!215729 () Bool)

(assert (=> bm!1834 m!215729))

(assert (=> bm!1834 m!215727))

(assert (=> bm!1834 m!215729))

(declare-fun m!215731 () Bool)

(assert (=> bm!1834 m!215731))

(declare-fun m!215733 () Bool)

(assert (=> b!140047 m!215733))

(declare-fun m!215735 () Bool)

(assert (=> b!140047 m!215735))

(assert (=> b!140047 m!215733))

(assert (=> b!140047 m!215735))

(declare-fun m!215737 () Bool)

(assert (=> b!140047 m!215737))

(declare-fun m!215739 () Bool)

(assert (=> b!140048 m!215739))

(declare-fun m!215741 () Bool)

(assert (=> b!140049 m!215741))

(assert (=> b!139646 d!45200))

(assert (=> b!139620 d!44829))

(assert (=> b!139620 d!44811))

(declare-fun b!140050 () Bool)

(declare-fun res!116770 () Bool)

(declare-fun e!93300 () Bool)

(assert (=> b!140050 (=> (not res!116770) (not e!93300))))

(declare-fun lt!218564 () tuple3!530)

(assert (=> b!140050 (= res!116770 (and (= (buf!3299 (_1!6453 lt!217532)) (buf!3299 (_2!6457 lt!218564))) (= (size!2883 arr!237) (size!2883 (_3!326 lt!218564)))))))

(declare-fun lt!218553 () (_ BitVec 32))

(declare-fun lt!218555 () tuple3!530)

(declare-fun c!7786 () Bool)

(declare-fun bm!1835 () Bool)

(declare-fun call!1840 () Bool)

(assert (=> bm!1835 (= call!1840 (arrayRangesEq!247 arr!237 (ite c!7786 (_3!326 lt!218555) arr!237) (ite c!7786 lt!218553 #b00000000000000000000000000000000) (ite c!7786 from!447 (size!2883 arr!237))))))

(declare-fun d!45202 () Bool)

(declare-fun e!93301 () Bool)

(assert (=> d!45202 e!93301))

(declare-fun res!116772 () Bool)

(assert (=> d!45202 (=> res!116772 e!93301)))

(assert (=> d!45202 (= res!116772 (bvsge from!447 to!404))))

(declare-fun lt!218546 () Bool)

(assert (=> d!45202 (= lt!218546 e!93300)))

(declare-fun res!116771 () Bool)

(assert (=> d!45202 (=> (not res!116771) (not e!93300))))

(declare-fun lt!218558 () (_ BitVec 64))

(declare-fun lt!218566 () (_ BitVec 64))

(assert (=> d!45202 (= res!116771 (= (bvadd lt!218558 lt!218566) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218564))) (currentByte!6135 (_2!6457 lt!218564)) (currentBit!6130 (_2!6457 lt!218564)))))))

(assert (=> d!45202 (or (not (= (bvand lt!218558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218566 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218558 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218558 lt!218566) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!218571 () (_ BitVec 64))

(assert (=> d!45202 (= lt!218566 (bvmul lt!218571 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!45202 (or (= lt!218571 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218571 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218571)))))

(assert (=> d!45202 (= lt!218571 ((_ sign_extend 32) (bvsub to!404 from!447)))))

(assert (=> d!45202 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))

(assert (=> d!45202 (= lt!218558 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217532))) (currentByte!6135 (_1!6453 lt!217532)) (currentBit!6130 (_1!6453 lt!217532))))))

(declare-fun e!93302 () tuple3!530)

(assert (=> d!45202 (= lt!218564 e!93302)))

(assert (=> d!45202 (= c!7786 (bvslt from!447 to!404))))

(assert (=> d!45202 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2883 arr!237)))))

(assert (=> d!45202 (= (readByteArrayLoop!0 (_1!6453 lt!217532) arr!237 from!447 to!404) lt!218564)))

(declare-fun lt!218562 () array!6370)

(declare-fun lt!218576 () (_ BitVec 32))

(declare-fun lt!218560 () array!6370)

(declare-fun call!1838 () Bool)

(declare-fun lt!218557 () tuple2!12260)

(declare-fun lt!218552 () (_ BitVec 32))

(declare-fun bm!1836 () Bool)

(assert (=> bm!1836 (= call!1838 (arrayRangesEq!247 (ite c!7786 arr!237 lt!218560) (ite c!7786 (array!6371 (store (arr!3578 arr!237) from!447 (_1!6456 lt!218557)) (size!2883 arr!237)) lt!218562) (ite c!7786 #b00000000000000000000000000000000 lt!218552) (ite c!7786 from!447 lt!218576)))))

(declare-fun b!140051 () Bool)

(declare-fun lt!218577 () Unit!8719)

(assert (=> b!140051 (= e!93302 (tuple3!531 lt!218577 (_2!6457 lt!218555) (_3!326 lt!218555)))))

(assert (=> b!140051 (= lt!218557 (readByte!0 (_1!6453 lt!217532)))))

(declare-fun lt!218568 () array!6370)

(assert (=> b!140051 (= lt!218568 (array!6371 (store (arr!3578 arr!237) from!447 (_1!6456 lt!218557)) (size!2883 arr!237)))))

(declare-fun lt!218548 () (_ BitVec 64))

(assert (=> b!140051 (= lt!218548 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!218561 () (_ BitVec 32))

(assert (=> b!140051 (= lt!218561 (bvsub to!404 from!447))))

(declare-fun lt!218544 () Unit!8719)

(assert (=> b!140051 (= lt!218544 (validateOffsetBytesFromBitIndexLemma!0 (_1!6453 lt!217532) (_2!6456 lt!218557) lt!218548 lt!218561))))

(assert (=> b!140051 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6456 lt!218557)))) ((_ sign_extend 32) (currentByte!6135 (_2!6456 lt!218557))) ((_ sign_extend 32) (currentBit!6130 (_2!6456 lt!218557))) (bvsub lt!218561 ((_ extract 31 0) (bvsdiv (bvadd lt!218548 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!218575 () Unit!8719)

(assert (=> b!140051 (= lt!218575 lt!218544)))

(assert (=> b!140051 (= lt!218555 (readByteArrayLoop!0 (_2!6456 lt!218557) lt!218568 (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1839 () (_ BitVec 64))

(assert (=> b!140051 (= call!1839 (bvadd (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217532))) (currentByte!6135 (_1!6453 lt!217532)) (currentBit!6130 (_1!6453 lt!217532))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!218572 () Unit!8719)

(declare-fun Unit!8758 () Unit!8719)

(assert (=> b!140051 (= lt!218572 Unit!8758)))

(assert (=> b!140051 (= (bvadd call!1839 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218555))) (currentByte!6135 (_2!6457 lt!218555)) (currentBit!6130 (_2!6457 lt!218555))))))

(declare-fun lt!218549 () Unit!8719)

(declare-fun Unit!8759 () Unit!8719)

(assert (=> b!140051 (= lt!218549 Unit!8759)))

(assert (=> b!140051 (= (bvadd (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217532))) (currentByte!6135 (_1!6453 lt!217532)) (currentBit!6130 (_1!6453 lt!217532))) (bvmul ((_ sign_extend 32) (bvsub to!404 from!447)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218555))) (currentByte!6135 (_2!6457 lt!218555)) (currentBit!6130 (_2!6457 lt!218555))))))

(declare-fun lt!218565 () Unit!8719)

(declare-fun Unit!8760 () Unit!8719)

(assert (=> b!140051 (= lt!218565 Unit!8760)))

(assert (=> b!140051 (and (= (buf!3299 (_1!6453 lt!217532)) (buf!3299 (_2!6457 lt!218555))) (= (size!2883 arr!237) (size!2883 (_3!326 lt!218555))))))

(declare-fun lt!218574 () Unit!8719)

(declare-fun Unit!8761 () Unit!8719)

(assert (=> b!140051 (= lt!218574 Unit!8761)))

(declare-fun lt!218551 () Unit!8719)

(assert (=> b!140051 (= lt!218551 (arrayUpdatedAtPrefixLemma!7 arr!237 from!447 (_1!6456 lt!218557)))))

(assert (=> b!140051 call!1838))

(declare-fun lt!218556 () Unit!8719)

(assert (=> b!140051 (= lt!218556 lt!218551)))

(assert (=> b!140051 (= lt!218553 #b00000000000000000000000000000000)))

(declare-fun lt!218570 () Unit!8719)

(assert (=> b!140051 (= lt!218570 (arrayRangesEqTransitive!47 arr!237 lt!218568 (_3!326 lt!218555) lt!218553 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140051 call!1840))

(declare-fun lt!218559 () Unit!8719)

(assert (=> b!140051 (= lt!218559 lt!218570)))

(assert (=> b!140051 (arrayRangesEq!247 arr!237 (_3!326 lt!218555) #b00000000000000000000000000000000 from!447)))

(declare-fun lt!218550 () Unit!8719)

(declare-fun Unit!8762 () Unit!8719)

(assert (=> b!140051 (= lt!218550 Unit!8762)))

(declare-fun lt!218543 () Unit!8719)

(assert (=> b!140051 (= lt!218543 (arrayRangesEqImpliesEq!7 lt!218568 (_3!326 lt!218555) #b00000000000000000000000000000000 from!447 (bvadd from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140051 (= (select (store (arr!3578 arr!237) from!447 (_1!6456 lt!218557)) from!447) (select (arr!3578 (_3!326 lt!218555)) from!447))))

(declare-fun lt!218545 () Unit!8719)

(assert (=> b!140051 (= lt!218545 lt!218543)))

(declare-fun lt!218554 () Bool)

(assert (=> b!140051 (= lt!218554 (= (select (arr!3578 (_3!326 lt!218555)) from!447) (_1!6456 lt!218557)))))

(declare-fun Unit!8763 () Unit!8719)

(assert (=> b!140051 (= lt!218577 Unit!8763)))

(assert (=> b!140051 lt!218554))

(declare-fun b!140052 () Bool)

(assert (=> b!140052 (= e!93300 (arrayRangesEq!247 arr!237 (_3!326 lt!218564) #b00000000000000000000000000000000 from!447))))

(declare-fun lt!218573 () Unit!8719)

(declare-fun b!140053 () Bool)

(assert (=> b!140053 (= e!93302 (tuple3!531 lt!218573 (_1!6453 lt!217532) arr!237))))

(assert (=> b!140053 (= call!1839 call!1839)))

(declare-fun lt!218547 () Unit!8719)

(declare-fun Unit!8764 () Unit!8719)

(assert (=> b!140053 (= lt!218547 Unit!8764)))

(declare-fun lt!218578 () Unit!8719)

(assert (=> b!140053 (= lt!218578 (arrayRangesEqReflexiveLemma!7 arr!237))))

(assert (=> b!140053 call!1840))

(declare-fun lt!218569 () Unit!8719)

(assert (=> b!140053 (= lt!218569 lt!218578)))

(assert (=> b!140053 (= lt!218560 arr!237)))

(assert (=> b!140053 (= lt!218562 arr!237)))

(declare-fun lt!218563 () (_ BitVec 32))

(assert (=> b!140053 (= lt!218563 #b00000000000000000000000000000000)))

(declare-fun lt!218567 () (_ BitVec 32))

(assert (=> b!140053 (= lt!218567 (size!2883 arr!237))))

(assert (=> b!140053 (= lt!218552 #b00000000000000000000000000000000)))

(assert (=> b!140053 (= lt!218576 from!447)))

(assert (=> b!140053 (= lt!218573 (arrayRangesEqSlicedLemma!7 lt!218560 lt!218562 lt!218563 lt!218567 lt!218552 lt!218576))))

(assert (=> b!140053 call!1838))

(declare-fun b!140054 () Bool)

(assert (=> b!140054 (= e!93301 (= (select (arr!3578 (_3!326 lt!218564)) from!447) (_2!6454 (readBytePure!0 (_1!6453 lt!217532)))))))

(assert (=> b!140054 (and (bvsge from!447 #b00000000000000000000000000000000) (bvslt from!447 (size!2883 (_3!326 lt!218564))))))

(declare-fun bm!1837 () Bool)

(assert (=> bm!1837 (= call!1839 (bitIndex!0 (ite c!7786 (size!2883 (buf!3299 (_2!6456 lt!218557))) (size!2883 (buf!3299 (_1!6453 lt!217532)))) (ite c!7786 (currentByte!6135 (_2!6456 lt!218557)) (currentByte!6135 (_1!6453 lt!217532))) (ite c!7786 (currentBit!6130 (_2!6456 lt!218557)) (currentBit!6130 (_1!6453 lt!217532)))))))

(assert (= (and d!45202 c!7786) b!140051))

(assert (= (and d!45202 (not c!7786)) b!140053))

(assert (= (or b!140051 b!140053) bm!1836))

(assert (= (or b!140051 b!140053) bm!1835))

(assert (= (or b!140051 b!140053) bm!1837))

(assert (= (and d!45202 res!116771) b!140050))

(assert (= (and b!140050 res!116770) b!140052))

(assert (= (and d!45202 (not res!116772)) b!140054))

(declare-fun m!215743 () Bool)

(assert (=> bm!1837 m!215743))

(declare-fun m!215745 () Bool)

(assert (=> bm!1835 m!215745))

(declare-fun m!215747 () Bool)

(assert (=> d!45202 m!215747))

(declare-fun m!215749 () Bool)

(assert (=> d!45202 m!215749))

(declare-fun m!215751 () Bool)

(assert (=> b!140051 m!215751))

(declare-fun m!215753 () Bool)

(assert (=> b!140051 m!215753))

(declare-fun m!215755 () Bool)

(assert (=> b!140051 m!215755))

(assert (=> b!140051 m!215749))

(assert (=> b!140051 m!214837))

(declare-fun m!215757 () Bool)

(assert (=> b!140051 m!215757))

(declare-fun m!215759 () Bool)

(assert (=> b!140051 m!215759))

(declare-fun m!215761 () Bool)

(assert (=> b!140051 m!215761))

(declare-fun m!215763 () Bool)

(assert (=> b!140051 m!215763))

(declare-fun m!215765 () Bool)

(assert (=> b!140051 m!215765))

(declare-fun m!215767 () Bool)

(assert (=> b!140051 m!215767))

(declare-fun m!215769 () Bool)

(assert (=> b!140051 m!215769))

(declare-fun m!215771 () Bool)

(assert (=> b!140051 m!215771))

(assert (=> bm!1836 m!215771))

(declare-fun m!215773 () Bool)

(assert (=> bm!1836 m!215773))

(assert (=> b!140053 m!215641))

(declare-fun m!215775 () Bool)

(assert (=> b!140053 m!215775))

(declare-fun m!215777 () Bool)

(assert (=> b!140052 m!215777))

(declare-fun m!215779 () Bool)

(assert (=> b!140054 m!215779))

(assert (=> b!140054 m!214693))

(assert (=> d!44874 d!45202))

(declare-fun d!45204 () Bool)

(declare-fun e!93303 () Bool)

(assert (=> d!45204 e!93303))

(declare-fun res!116773 () Bool)

(assert (=> d!45204 (=> (not res!116773) (not e!93303))))

(declare-fun lt!218579 () BitStream!5030)

(declare-fun lt!218580 () (_ BitVec 64))

(assert (=> d!45204 (= res!116773 (= (bvadd lt!218580 (bvsub lt!217656 lt!217654)) (bitIndex!0 (size!2883 (buf!3299 lt!218579)) (currentByte!6135 lt!218579) (currentBit!6130 lt!218579))))))

(assert (=> d!45204 (or (not (= (bvand lt!218580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217656 lt!217654) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218580 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218580 (bvsub lt!217656 lt!217654)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45204 (= lt!218580 (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217653))) (currentByte!6135 (_2!6453 lt!217653)) (currentBit!6130 (_2!6453 lt!217653))))))

(assert (=> d!45204 (= lt!218579 (_2!6455 (moveBitIndex!0 (_2!6453 lt!217653) (bvsub lt!217656 lt!217654))))))

(assert (=> d!45204 (moveBitIndexPrecond!0 (_2!6453 lt!217653) (bvsub lt!217656 lt!217654))))

(assert (=> d!45204 (= (withMovedBitIndex!0 (_2!6453 lt!217653) (bvsub lt!217656 lt!217654)) lt!218579)))

(declare-fun b!140055 () Bool)

(assert (=> b!140055 (= e!93303 (= (size!2883 (buf!3299 (_2!6453 lt!217653))) (size!2883 (buf!3299 lt!218579))))))

(assert (= (and d!45204 res!116773) b!140055))

(declare-fun m!215781 () Bool)

(assert (=> d!45204 m!215781))

(assert (=> d!45204 m!215465))

(declare-fun m!215783 () Bool)

(assert (=> d!45204 m!215783))

(declare-fun m!215785 () Bool)

(assert (=> d!45204 m!215785))

(assert (=> b!139644 d!45204))

(assert (=> b!139644 d!44809))

(assert (=> b!139644 d!44811))

(assert (=> b!139654 d!44829))

(declare-fun d!45206 () Bool)

(assert (=> d!45206 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217519)) (buf!3299 thiss!1634) lt!217681 lt!217672)))

(declare-fun lt!218581 () Unit!8719)

(assert (=> d!45206 (= lt!218581 (choose!8 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217519)) lt!217681 lt!217672))))

(assert (=> d!45206 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!217681) (bvsle lt!217681 lt!217672))))

(assert (=> d!45206 (= (arrayBitRangesEqSymmetric!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217519)) lt!217681 lt!217672) lt!218581)))

(declare-fun bs!11070 () Bool)

(assert (= bs!11070 d!45206))

(assert (=> bs!11070 m!214875))

(declare-fun m!215787 () Bool)

(assert (=> bs!11070 m!215787))

(assert (=> b!139654 d!45206))

(declare-fun b!140056 () Bool)

(declare-fun e!93304 () Bool)

(declare-fun call!1841 () Bool)

(assert (=> b!140056 (= e!93304 call!1841)))

(declare-fun b!140057 () Bool)

(declare-fun res!116775 () Bool)

(declare-fun lt!218584 () (_ BitVec 32))

(assert (=> b!140057 (= res!116775 (= lt!218584 #b00000000000000000000000000000000))))

(declare-fun e!93308 () Bool)

(assert (=> b!140057 (=> res!116775 e!93308)))

(declare-fun e!93309 () Bool)

(assert (=> b!140057 (= e!93309 e!93308)))

(declare-fun d!45208 () Bool)

(declare-fun res!116777 () Bool)

(declare-fun e!93305 () Bool)

(assert (=> d!45208 (=> res!116777 e!93305)))

(assert (=> d!45208 (= res!116777 (bvsge lt!217681 lt!217672))))

(assert (=> d!45208 (= (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217519)) (buf!3299 thiss!1634) lt!217681 lt!217672) e!93305)))

(declare-fun c!7787 () Bool)

(declare-fun lt!218583 () (_ BitVec 32))

(declare-fun lt!218582 () tuple4!122)

(declare-fun bm!1838 () Bool)

(assert (=> bm!1838 (= call!1841 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_3!329 lt!218582)) (select (arr!3578 (buf!3299 thiss!1634)) (_3!329 lt!218582)) lt!218583 (ite c!7787 lt!218584 #b00000000000000000000000000001000)))))

(declare-fun b!140058 () Bool)

(assert (=> b!140058 (= e!93304 e!93309)))

(declare-fun res!116778 () Bool)

(assert (=> b!140058 (= res!116778 call!1841)))

(assert (=> b!140058 (=> (not res!116778) (not e!93309))))

(declare-fun b!140059 () Bool)

(declare-fun e!93307 () Bool)

(assert (=> b!140059 (= e!93307 e!93304)))

(assert (=> b!140059 (= c!7787 (= (_3!329 lt!218582) (_4!61 lt!218582)))))

(declare-fun b!140060 () Bool)

(assert (=> b!140060 (= e!93308 (byteRangesEq!0 (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_4!61 lt!218582)) (select (arr!3578 (buf!3299 thiss!1634)) (_4!61 lt!218582)) #b00000000000000000000000000000000 lt!218584))))

(declare-fun b!140061 () Bool)

(declare-fun e!93306 () Bool)

(assert (=> b!140061 (= e!93306 (arrayRangesEq!247 (buf!3299 (_2!6455 lt!217519)) (buf!3299 thiss!1634) (_1!6463 lt!218582) (_2!6463 lt!218582)))))

(declare-fun b!140062 () Bool)

(assert (=> b!140062 (= e!93305 e!93307)))

(declare-fun res!116776 () Bool)

(assert (=> b!140062 (=> (not res!116776) (not e!93307))))

(assert (=> b!140062 (= res!116776 e!93306)))

(declare-fun res!116774 () Bool)

(assert (=> b!140062 (=> res!116774 e!93306)))

(assert (=> b!140062 (= res!116774 (bvsge (_1!6463 lt!218582) (_2!6463 lt!218582)))))

(assert (=> b!140062 (= lt!218584 ((_ extract 31 0) (bvsrem lt!217672 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140062 (= lt!218583 ((_ extract 31 0) (bvsrem lt!217681 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140062 (= lt!218582 (arrayBitIndices!0 lt!217681 lt!217672))))

(assert (= (and d!45208 (not res!116777)) b!140062))

(assert (= (and b!140062 (not res!116774)) b!140061))

(assert (= (and b!140062 res!116776) b!140059))

(assert (= (and b!140059 c!7787) b!140056))

(assert (= (and b!140059 (not c!7787)) b!140058))

(assert (= (and b!140058 res!116778) b!140057))

(assert (= (and b!140057 (not res!116775)) b!140060))

(assert (= (or b!140056 b!140058) bm!1838))

(declare-fun m!215789 () Bool)

(assert (=> bm!1838 m!215789))

(declare-fun m!215791 () Bool)

(assert (=> bm!1838 m!215791))

(assert (=> bm!1838 m!215789))

(assert (=> bm!1838 m!215791))

(declare-fun m!215793 () Bool)

(assert (=> bm!1838 m!215793))

(declare-fun m!215795 () Bool)

(assert (=> b!140060 m!215795))

(declare-fun m!215797 () Bool)

(assert (=> b!140060 m!215797))

(assert (=> b!140060 m!215795))

(assert (=> b!140060 m!215797))

(declare-fun m!215799 () Bool)

(assert (=> b!140060 m!215799))

(declare-fun m!215801 () Bool)

(assert (=> b!140061 m!215801))

(declare-fun m!215803 () Bool)

(assert (=> b!140062 m!215803))

(assert (=> b!139654 d!45208))

(declare-fun d!45210 () Bool)

(declare-fun res!116779 () Bool)

(declare-fun e!93310 () Bool)

(assert (=> d!45210 (=> (not res!116779) (not e!93310))))

(assert (=> d!45210 (= res!116779 (= (size!2883 (buf!3299 lt!217650)) (size!2883 (buf!3299 (_2!6455 lt!217519)))))))

(assert (=> d!45210 (= (isPrefixOf!0 lt!217650 (_2!6455 lt!217519)) e!93310)))

(declare-fun b!140063 () Bool)

(declare-fun res!116780 () Bool)

(assert (=> b!140063 (=> (not res!116780) (not e!93310))))

(assert (=> b!140063 (= res!116780 (bvsle (bitIndex!0 (size!2883 (buf!3299 lt!217650)) (currentByte!6135 lt!217650) (currentBit!6130 lt!217650)) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217519))) (currentByte!6135 (_2!6455 lt!217519)) (currentBit!6130 (_2!6455 lt!217519)))))))

(declare-fun b!140064 () Bool)

(declare-fun e!93311 () Bool)

(assert (=> b!140064 (= e!93310 e!93311)))

(declare-fun res!116781 () Bool)

(assert (=> b!140064 (=> res!116781 e!93311)))

(assert (=> b!140064 (= res!116781 (= (size!2883 (buf!3299 lt!217650)) #b00000000000000000000000000000000))))

(declare-fun b!140065 () Bool)

(assert (=> b!140065 (= e!93311 (arrayBitRangesEq!0 (buf!3299 lt!217650) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 lt!217650)) (currentByte!6135 lt!217650) (currentBit!6130 lt!217650))))))

(assert (= (and d!45210 res!116779) b!140063))

(assert (= (and b!140063 res!116780) b!140064))

(assert (= (and b!140064 (not res!116781)) b!140065))

(declare-fun m!215805 () Bool)

(assert (=> b!140063 m!215805))

(assert (=> b!140063 m!214755))

(assert (=> b!140065 m!215805))

(assert (=> b!140065 m!215805))

(declare-fun m!215807 () Bool)

(assert (=> b!140065 m!215807))

(assert (=> d!44839 d!45210))

(assert (=> d!44839 d!44807))

(assert (=> d!44839 d!45116))

(declare-fun d!45212 () Bool)

(assert (=> d!45212 (isPrefixOf!0 lt!217650 lt!217650)))

(declare-fun lt!218585 () Unit!8719)

(assert (=> d!45212 (= lt!218585 (choose!11 lt!217650))))

(assert (=> d!45212 (= (lemmaIsPrefixRefl!0 lt!217650) lt!218585)))

(declare-fun bs!11071 () Bool)

(assert (= bs!11071 d!45212))

(assert (=> bs!11071 m!214857))

(declare-fun m!215809 () Bool)

(assert (=> bs!11071 m!215809))

(assert (=> d!44839 d!45212))

(declare-fun d!45214 () Bool)

(assert (=> d!45214 (isPrefixOf!0 lt!217650 (_2!6455 lt!217519))))

(declare-fun lt!218586 () Unit!8719)

(assert (=> d!45214 (= lt!218586 (choose!30 lt!217650 (_2!6455 lt!217523) (_2!6455 lt!217519)))))

(assert (=> d!45214 (isPrefixOf!0 lt!217650 (_2!6455 lt!217523))))

(assert (=> d!45214 (= (lemmaIsPrefixTransitive!0 lt!217650 (_2!6455 lt!217523) (_2!6455 lt!217519)) lt!218586)))

(declare-fun bs!11072 () Bool)

(assert (= bs!11072 d!45214))

(assert (=> bs!11072 m!214859))

(declare-fun m!215811 () Bool)

(assert (=> bs!11072 m!215811))

(declare-fun m!215813 () Bool)

(assert (=> bs!11072 m!215813))

(assert (=> d!44839 d!45214))

(declare-fun d!45216 () Bool)

(declare-fun res!116782 () Bool)

(declare-fun e!93312 () Bool)

(assert (=> d!45216 (=> (not res!116782) (not e!93312))))

(assert (=> d!45216 (= res!116782 (= (size!2883 (buf!3299 (_1!6453 lt!217653))) (size!2883 (buf!3299 (_2!6453 lt!217653)))))))

(assert (=> d!45216 (= (isPrefixOf!0 (_1!6453 lt!217653) (_2!6453 lt!217653)) e!93312)))

(declare-fun b!140066 () Bool)

(declare-fun res!116783 () Bool)

(assert (=> b!140066 (=> (not res!116783) (not e!93312))))

(assert (=> b!140066 (= res!116783 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217653))) (currentByte!6135 (_1!6453 lt!217653)) (currentBit!6130 (_1!6453 lt!217653))) (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217653))) (currentByte!6135 (_2!6453 lt!217653)) (currentBit!6130 (_2!6453 lt!217653)))))))

(declare-fun b!140067 () Bool)

(declare-fun e!93313 () Bool)

(assert (=> b!140067 (= e!93312 e!93313)))

(declare-fun res!116784 () Bool)

(assert (=> b!140067 (=> res!116784 e!93313)))

(assert (=> b!140067 (= res!116784 (= (size!2883 (buf!3299 (_1!6453 lt!217653))) #b00000000000000000000000000000000))))

(declare-fun b!140068 () Bool)

(assert (=> b!140068 (= e!93313 (arrayBitRangesEq!0 (buf!3299 (_1!6453 lt!217653)) (buf!3299 (_2!6453 lt!217653)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217653))) (currentByte!6135 (_1!6453 lt!217653)) (currentBit!6130 (_1!6453 lt!217653)))))))

(assert (= (and d!45216 res!116782) b!140066))

(assert (= (and b!140066 res!116783) b!140067))

(assert (= (and b!140067 (not res!116784)) b!140068))

(assert (=> b!140066 m!215381))

(assert (=> b!140066 m!215465))

(assert (=> b!140068 m!215381))

(assert (=> b!140068 m!215381))

(declare-fun m!215815 () Bool)

(assert (=> b!140068 m!215815))

(assert (=> d!44839 d!45216))

(assert (=> d!44839 d!45096))

(assert (=> d!44839 d!45110))

(assert (=> d!44839 d!45084))

(declare-fun d!45218 () Bool)

(assert (=> d!45218 (isPrefixOf!0 lt!217650 (_2!6455 lt!217519))))

(declare-fun lt!218587 () Unit!8719)

(assert (=> d!45218 (= lt!218587 (choose!30 lt!217650 (_2!6455 lt!217519) (_2!6455 lt!217519)))))

(assert (=> d!45218 (isPrefixOf!0 lt!217650 (_2!6455 lt!217519))))

(assert (=> d!45218 (= (lemmaIsPrefixTransitive!0 lt!217650 (_2!6455 lt!217519) (_2!6455 lt!217519)) lt!218587)))

(declare-fun bs!11073 () Bool)

(assert (= bs!11073 d!45218))

(assert (=> bs!11073 m!214859))

(declare-fun m!215817 () Bool)

(assert (=> bs!11073 m!215817))

(assert (=> bs!11073 m!214859))

(assert (=> d!44839 d!45218))

(declare-fun d!45220 () Bool)

(declare-fun res!116785 () Bool)

(declare-fun e!93314 () Bool)

(assert (=> d!45220 (=> (not res!116785) (not e!93314))))

(assert (=> d!45220 (= res!116785 (= (size!2883 (buf!3299 lt!217650)) (size!2883 (buf!3299 lt!217650))))))

(assert (=> d!45220 (= (isPrefixOf!0 lt!217650 lt!217650) e!93314)))

(declare-fun b!140069 () Bool)

(declare-fun res!116786 () Bool)

(assert (=> b!140069 (=> (not res!116786) (not e!93314))))

(assert (=> b!140069 (= res!116786 (bvsle (bitIndex!0 (size!2883 (buf!3299 lt!217650)) (currentByte!6135 lt!217650) (currentBit!6130 lt!217650)) (bitIndex!0 (size!2883 (buf!3299 lt!217650)) (currentByte!6135 lt!217650) (currentBit!6130 lt!217650))))))

(declare-fun b!140070 () Bool)

(declare-fun e!93315 () Bool)

(assert (=> b!140070 (= e!93314 e!93315)))

(declare-fun res!116787 () Bool)

(assert (=> b!140070 (=> res!116787 e!93315)))

(assert (=> b!140070 (= res!116787 (= (size!2883 (buf!3299 lt!217650)) #b00000000000000000000000000000000))))

(declare-fun b!140071 () Bool)

(assert (=> b!140071 (= e!93315 (arrayBitRangesEq!0 (buf!3299 lt!217650) (buf!3299 lt!217650) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 lt!217650)) (currentByte!6135 lt!217650) (currentBit!6130 lt!217650))))))

(assert (= (and d!45220 res!116785) b!140069))

(assert (= (and b!140069 res!116786) b!140070))

(assert (= (and b!140070 (not res!116787)) b!140071))

(assert (=> b!140069 m!215805))

(assert (=> b!140069 m!215805))

(assert (=> b!140071 m!215805))

(assert (=> b!140071 m!215805))

(declare-fun m!215819 () Bool)

(assert (=> b!140071 m!215819))

(assert (=> d!44839 d!45220))

(declare-fun d!45222 () Bool)

(declare-fun e!93316 () Bool)

(assert (=> d!45222 e!93316))

(declare-fun res!116788 () Bool)

(assert (=> d!45222 (=> (not res!116788) (not e!93316))))

(declare-fun lt!218589 () (_ BitVec 64))

(declare-fun lt!218588 () BitStream!5030)

(assert (=> d!45222 (= res!116788 (= (bvadd lt!218589 (bvsub lt!217677 lt!217675)) (bitIndex!0 (size!2883 (buf!3299 lt!218588)) (currentByte!6135 lt!218588) (currentBit!6130 lt!218588))))))

(assert (=> d!45222 (or (not (= (bvand lt!218589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!217677 lt!217675) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218589 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218589 (bvsub lt!217677 lt!217675)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45222 (= lt!218589 (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217674))) (currentByte!6135 (_2!6453 lt!217674)) (currentBit!6130 (_2!6453 lt!217674))))))

(assert (=> d!45222 (= lt!218588 (_2!6455 (moveBitIndex!0 (_2!6453 lt!217674) (bvsub lt!217677 lt!217675))))))

(assert (=> d!45222 (moveBitIndexPrecond!0 (_2!6453 lt!217674) (bvsub lt!217677 lt!217675))))

(assert (=> d!45222 (= (withMovedBitIndex!0 (_2!6453 lt!217674) (bvsub lt!217677 lt!217675)) lt!218588)))

(declare-fun b!140072 () Bool)

(assert (=> b!140072 (= e!93316 (= (size!2883 (buf!3299 (_2!6453 lt!217674))) (size!2883 (buf!3299 lt!218588))))))

(assert (= (and d!45222 res!116788) b!140072))

(declare-fun m!215821 () Bool)

(assert (=> d!45222 m!215821))

(assert (=> d!45222 m!215419))

(declare-fun m!215823 () Bool)

(assert (=> d!45222 m!215823))

(declare-fun m!215825 () Bool)

(assert (=> d!45222 m!215825))

(assert (=> b!139652 d!45222))

(assert (=> b!139652 d!44809))

(assert (=> b!139652 d!44829))

(declare-fun d!45224 () Bool)

(declare-fun res!116789 () Bool)

(declare-fun e!93317 () Bool)

(assert (=> d!45224 (=> (not res!116789) (not e!93317))))

(assert (=> d!45224 (= res!116789 (= (size!2883 (buf!3299 thiss!1634)) (size!2883 (buf!3299 (_2!6455 lt!217700)))))))

(assert (=> d!45224 (= (isPrefixOf!0 thiss!1634 (_2!6455 lt!217700)) e!93317)))

(declare-fun b!140073 () Bool)

(declare-fun res!116790 () Bool)

(assert (=> b!140073 (=> (not res!116790) (not e!93317))))

(assert (=> b!140073 (= res!116790 (bvsle (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217700))) (currentByte!6135 (_2!6455 lt!217700)) (currentBit!6130 (_2!6455 lt!217700)))))))

(declare-fun b!140074 () Bool)

(declare-fun e!93318 () Bool)

(assert (=> b!140074 (= e!93317 e!93318)))

(declare-fun res!116791 () Bool)

(assert (=> b!140074 (=> res!116791 e!93318)))

(assert (=> b!140074 (= res!116791 (= (size!2883 (buf!3299 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!140075 () Bool)

(assert (=> b!140075 (= e!93318 (arrayBitRangesEq!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217700)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (= (and d!45224 res!116789) b!140073))

(assert (= (and b!140073 res!116790) b!140074))

(assert (= (and b!140074 (not res!116791)) b!140075))

(assert (=> b!140073 m!214759))

(assert (=> b!140073 m!214907))

(assert (=> b!140075 m!214759))

(assert (=> b!140075 m!214759))

(declare-fun m!215827 () Bool)

(assert (=> b!140075 m!215827))

(assert (=> b!139665 d!45224))

(declare-fun d!45226 () Bool)

(declare-fun lt!218590 () tuple3!530)

(assert (=> d!45226 (= lt!218590 (readByteArrayLoop!0 (_1!6453 lt!217764) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45226 (= (readByteArrayLoopPure!0 (_1!6453 lt!217764) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12253 (_2!6457 lt!218590) (_3!326 lt!218590)))))

(declare-fun bs!11074 () Bool)

(assert (= bs!11074 d!45226))

(declare-fun m!215829 () Bool)

(assert (=> bs!11074 m!215829))

(assert (=> b!139684 d!45226))

(declare-fun d!45228 () Bool)

(assert (=> d!45228 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217762)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217761) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217762)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) lt!217761))))

(declare-fun bs!11075 () Bool)

(assert (= bs!11075 d!45228))

(declare-fun m!215831 () Bool)

(assert (=> bs!11075 m!215831))

(assert (=> b!139684 d!45228))

(declare-fun d!45230 () Bool)

(assert (=> d!45230 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217762)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217761)))

(declare-fun lt!218591 () Unit!8719)

(assert (=> d!45230 (= lt!218591 (choose!9 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217762)) lt!217761 (BitStream!5031 (buf!3299 (_2!6455 lt!217762)) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(assert (=> d!45230 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6455 lt!217523) (buf!3299 (_2!6455 lt!217762)) lt!217761) lt!218591)))

(declare-fun bs!11076 () Bool)

(assert (= bs!11076 d!45230))

(assert (=> bs!11076 m!214953))

(declare-fun m!215833 () Bool)

(assert (=> bs!11076 m!215833))

(assert (=> b!139684 d!45230))

(declare-fun b!140076 () Bool)

(declare-fun e!93319 () Unit!8719)

(declare-fun Unit!8765 () Unit!8719)

(assert (=> b!140076 (= e!93319 Unit!8765)))

(declare-fun lt!218599 () tuple2!12254)

(declare-fun lt!218602 () (_ BitVec 64))

(declare-fun b!140077 () Bool)

(declare-fun e!93320 () Bool)

(declare-fun lt!218600 () (_ BitVec 64))

(assert (=> b!140077 (= e!93320 (= (_1!6453 lt!218599) (withMovedBitIndex!0 (_2!6453 lt!218599) (bvsub lt!218602 lt!218600))))))

(assert (=> b!140077 (or (= (bvand lt!218602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218600 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218602 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218602 lt!218600) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140077 (= lt!218600 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217762))) (currentByte!6135 (_2!6455 lt!217762)) (currentBit!6130 (_2!6455 lt!217762))))))

(assert (=> b!140077 (= lt!218602 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(declare-fun d!45232 () Bool)

(assert (=> d!45232 e!93320))

(declare-fun res!116794 () Bool)

(assert (=> d!45232 (=> (not res!116794) (not e!93320))))

(assert (=> d!45232 (= res!116794 (isPrefixOf!0 (_1!6453 lt!218599) (_2!6453 lt!218599)))))

(declare-fun lt!218596 () BitStream!5030)

(assert (=> d!45232 (= lt!218599 (tuple2!12255 lt!218596 (_2!6455 lt!217762)))))

(declare-fun lt!218598 () Unit!8719)

(declare-fun lt!218593 () Unit!8719)

(assert (=> d!45232 (= lt!218598 lt!218593)))

(assert (=> d!45232 (isPrefixOf!0 lt!218596 (_2!6455 lt!217762))))

(assert (=> d!45232 (= lt!218593 (lemmaIsPrefixTransitive!0 lt!218596 (_2!6455 lt!217762) (_2!6455 lt!217762)))))

(declare-fun lt!218592 () Unit!8719)

(declare-fun lt!218605 () Unit!8719)

(assert (=> d!45232 (= lt!218592 lt!218605)))

(assert (=> d!45232 (isPrefixOf!0 lt!218596 (_2!6455 lt!217762))))

(assert (=> d!45232 (= lt!218605 (lemmaIsPrefixTransitive!0 lt!218596 (_2!6455 lt!217523) (_2!6455 lt!217762)))))

(declare-fun lt!218611 () Unit!8719)

(assert (=> d!45232 (= lt!218611 e!93319)))

(declare-fun c!7788 () Bool)

(assert (=> d!45232 (= c!7788 (not (= (size!2883 (buf!3299 (_2!6455 lt!217523))) #b00000000000000000000000000000000)))))

(declare-fun lt!218609 () Unit!8719)

(declare-fun lt!218608 () Unit!8719)

(assert (=> d!45232 (= lt!218609 lt!218608)))

(assert (=> d!45232 (isPrefixOf!0 (_2!6455 lt!217762) (_2!6455 lt!217762))))

(assert (=> d!45232 (= lt!218608 (lemmaIsPrefixRefl!0 (_2!6455 lt!217762)))))

(declare-fun lt!218601 () Unit!8719)

(declare-fun lt!218610 () Unit!8719)

(assert (=> d!45232 (= lt!218601 lt!218610)))

(assert (=> d!45232 (= lt!218610 (lemmaIsPrefixRefl!0 (_2!6455 lt!217762)))))

(declare-fun lt!218594 () Unit!8719)

(declare-fun lt!218603 () Unit!8719)

(assert (=> d!45232 (= lt!218594 lt!218603)))

(assert (=> d!45232 (isPrefixOf!0 lt!218596 lt!218596)))

(assert (=> d!45232 (= lt!218603 (lemmaIsPrefixRefl!0 lt!218596))))

(declare-fun lt!218604 () Unit!8719)

(declare-fun lt!218595 () Unit!8719)

(assert (=> d!45232 (= lt!218604 lt!218595)))

(assert (=> d!45232 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217523))))

(assert (=> d!45232 (= lt!218595 (lemmaIsPrefixRefl!0 (_2!6455 lt!217523)))))

(assert (=> d!45232 (= lt!218596 (BitStream!5031 (buf!3299 (_2!6455 lt!217762)) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(assert (=> d!45232 (isPrefixOf!0 (_2!6455 lt!217523) (_2!6455 lt!217762))))

(assert (=> d!45232 (= (reader!0 (_2!6455 lt!217523) (_2!6455 lt!217762)) lt!218599)))

(declare-fun b!140078 () Bool)

(declare-fun res!116792 () Bool)

(assert (=> b!140078 (=> (not res!116792) (not e!93320))))

(assert (=> b!140078 (= res!116792 (isPrefixOf!0 (_2!6453 lt!218599) (_2!6455 lt!217762)))))

(declare-fun b!140079 () Bool)

(declare-fun lt!218607 () Unit!8719)

(assert (=> b!140079 (= e!93319 lt!218607)))

(declare-fun lt!218606 () (_ BitVec 64))

(assert (=> b!140079 (= lt!218606 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218597 () (_ BitVec 64))

(assert (=> b!140079 (= lt!218597 (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523))))))

(assert (=> b!140079 (= lt!218607 (arrayBitRangesEqSymmetric!0 (buf!3299 (_2!6455 lt!217523)) (buf!3299 (_2!6455 lt!217762)) lt!218606 lt!218597))))

(assert (=> b!140079 (arrayBitRangesEq!0 (buf!3299 (_2!6455 lt!217762)) (buf!3299 (_2!6455 lt!217523)) lt!218606 lt!218597)))

(declare-fun b!140080 () Bool)

(declare-fun res!116793 () Bool)

(assert (=> b!140080 (=> (not res!116793) (not e!93320))))

(assert (=> b!140080 (= res!116793 (isPrefixOf!0 (_1!6453 lt!218599) (_2!6455 lt!217523)))))

(assert (= (and d!45232 c!7788) b!140079))

(assert (= (and d!45232 (not c!7788)) b!140076))

(assert (= (and d!45232 res!116794) b!140080))

(assert (= (and b!140080 res!116793) b!140078))

(assert (= (and b!140078 res!116792) b!140077))

(declare-fun m!215835 () Bool)

(assert (=> b!140080 m!215835))

(declare-fun m!215837 () Bool)

(assert (=> b!140077 m!215837))

(assert (=> b!140077 m!214961))

(assert (=> b!140077 m!214757))

(assert (=> b!140079 m!214757))

(declare-fun m!215839 () Bool)

(assert (=> b!140079 m!215839))

(declare-fun m!215841 () Bool)

(assert (=> b!140079 m!215841))

(declare-fun m!215843 () Bool)

(assert (=> b!140078 m!215843))

(declare-fun m!215845 () Bool)

(assert (=> d!45232 m!215845))

(declare-fun m!215847 () Bool)

(assert (=> d!45232 m!215847))

(declare-fun m!215849 () Bool)

(assert (=> d!45232 m!215849))

(assert (=> d!45232 m!214809))

(declare-fun m!215851 () Bool)

(assert (=> d!45232 m!215851))

(declare-fun m!215853 () Bool)

(assert (=> d!45232 m!215853))

(declare-fun m!215855 () Bool)

(assert (=> d!45232 m!215855))

(assert (=> d!45232 m!214959))

(declare-fun m!215857 () Bool)

(assert (=> d!45232 m!215857))

(assert (=> d!45232 m!214817))

(declare-fun m!215859 () Bool)

(assert (=> d!45232 m!215859))

(assert (=> b!139684 d!45232))

(declare-fun b!140081 () Bool)

(declare-fun e!93321 () Bool)

(declare-fun call!1842 () Bool)

(assert (=> b!140081 (= e!93321 call!1842)))

(declare-fun b!140082 () Bool)

(declare-fun res!116796 () Bool)

(declare-fun lt!218614 () (_ BitVec 32))

(assert (=> b!140082 (= res!116796 (= lt!218614 #b00000000000000000000000000000000))))

(declare-fun e!93325 () Bool)

(assert (=> b!140082 (=> res!116796 e!93325)))

(declare-fun e!93326 () Bool)

(assert (=> b!140082 (= e!93326 e!93325)))

(declare-fun d!45234 () Bool)

(declare-fun res!116798 () Bool)

(declare-fun e!93322 () Bool)

(assert (=> d!45234 (=> res!116798 e!93322)))

(assert (=> d!45234 (= res!116798 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (=> d!45234 (= (arrayBitRangesEq!0 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217519)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))) e!93322)))

(declare-fun c!7789 () Bool)

(declare-fun lt!218612 () tuple4!122)

(declare-fun bm!1839 () Bool)

(declare-fun lt!218613 () (_ BitVec 32))

(assert (=> bm!1839 (= call!1842 (byteRangesEq!0 (select (arr!3578 (buf!3299 thiss!1634)) (_3!329 lt!218612)) (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_3!329 lt!218612)) lt!218613 (ite c!7789 lt!218614 #b00000000000000000000000000001000)))))

(declare-fun b!140083 () Bool)

(assert (=> b!140083 (= e!93321 e!93326)))

(declare-fun res!116799 () Bool)

(assert (=> b!140083 (= res!116799 call!1842)))

(assert (=> b!140083 (=> (not res!116799) (not e!93326))))

(declare-fun b!140084 () Bool)

(declare-fun e!93324 () Bool)

(assert (=> b!140084 (= e!93324 e!93321)))

(assert (=> b!140084 (= c!7789 (= (_3!329 lt!218612) (_4!61 lt!218612)))))

(declare-fun b!140085 () Bool)

(assert (=> b!140085 (= e!93325 (byteRangesEq!0 (select (arr!3578 (buf!3299 thiss!1634)) (_4!61 lt!218612)) (select (arr!3578 (buf!3299 (_2!6455 lt!217519))) (_4!61 lt!218612)) #b00000000000000000000000000000000 lt!218614))))

(declare-fun b!140086 () Bool)

(declare-fun e!93323 () Bool)

(assert (=> b!140086 (= e!93323 (arrayRangesEq!247 (buf!3299 thiss!1634) (buf!3299 (_2!6455 lt!217519)) (_1!6463 lt!218612) (_2!6463 lt!218612)))))

(declare-fun b!140087 () Bool)

(assert (=> b!140087 (= e!93322 e!93324)))

(declare-fun res!116797 () Bool)

(assert (=> b!140087 (=> (not res!116797) (not e!93324))))

(assert (=> b!140087 (= res!116797 e!93323)))

(declare-fun res!116795 () Bool)

(assert (=> b!140087 (=> res!116795 e!93323)))

(assert (=> b!140087 (= res!116795 (bvsge (_1!6463 lt!218612) (_2!6463 lt!218612)))))

(assert (=> b!140087 (= lt!218614 ((_ extract 31 0) (bvsrem (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140087 (= lt!218613 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140087 (= lt!218612 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(assert (= (and d!45234 (not res!116798)) b!140087))

(assert (= (and b!140087 (not res!116795)) b!140086))

(assert (= (and b!140087 res!116797) b!140084))

(assert (= (and b!140084 c!7789) b!140081))

(assert (= (and b!140084 (not c!7789)) b!140083))

(assert (= (and b!140083 res!116799) b!140082))

(assert (= (and b!140082 (not res!116796)) b!140085))

(assert (= (or b!140081 b!140083) bm!1839))

(declare-fun m!215861 () Bool)

(assert (=> bm!1839 m!215861))

(declare-fun m!215863 () Bool)

(assert (=> bm!1839 m!215863))

(assert (=> bm!1839 m!215861))

(assert (=> bm!1839 m!215863))

(declare-fun m!215865 () Bool)

(assert (=> bm!1839 m!215865))

(declare-fun m!215867 () Bool)

(assert (=> b!140085 m!215867))

(declare-fun m!215869 () Bool)

(assert (=> b!140085 m!215869))

(assert (=> b!140085 m!215867))

(assert (=> b!140085 m!215869))

(declare-fun m!215871 () Bool)

(assert (=> b!140085 m!215871))

(declare-fun m!215873 () Bool)

(assert (=> b!140086 m!215873))

(assert (=> b!140087 m!214759))

(assert (=> b!140087 m!215679))

(assert (=> b!139650 d!45234))

(assert (=> b!139650 d!44829))

(assert (=> b!139603 d!44811))

(assert (=> b!139603 d!44809))

(declare-fun d!45236 () Bool)

(declare-fun e!93327 () Bool)

(assert (=> d!45236 e!93327))

(declare-fun res!116800 () Bool)

(assert (=> d!45236 (=> (not res!116800) (not e!93327))))

(declare-fun lt!218615 () (_ BitVec 64))

(declare-fun lt!218618 () (_ BitVec 64))

(declare-fun lt!218616 () (_ BitVec 64))

(assert (=> d!45236 (= res!116800 (= lt!218616 (bvsub lt!218615 lt!218618)))))

(assert (=> d!45236 (or (= (bvand lt!218615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218618 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218615 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218615 lt!218618) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45236 (= lt!218618 (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217762)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217762))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217762)))))))

(declare-fun lt!218620 () (_ BitVec 64))

(declare-fun lt!218619 () (_ BitVec 64))

(assert (=> d!45236 (= lt!218615 (bvmul lt!218620 lt!218619))))

(assert (=> d!45236 (or (= lt!218620 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218619 (bvsdiv (bvmul lt!218620 lt!218619) lt!218620)))))

(assert (=> d!45236 (= lt!218619 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45236 (= lt!218620 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217762)))))))

(assert (=> d!45236 (= lt!218616 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217762))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217762)))))))

(assert (=> d!45236 (invariant!0 (currentBit!6130 (_2!6455 lt!217762)) (currentByte!6135 (_2!6455 lt!217762)) (size!2883 (buf!3299 (_2!6455 lt!217762))))))

(assert (=> d!45236 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217762))) (currentByte!6135 (_2!6455 lt!217762)) (currentBit!6130 (_2!6455 lt!217762))) lt!218616)))

(declare-fun b!140088 () Bool)

(declare-fun res!116801 () Bool)

(assert (=> b!140088 (=> (not res!116801) (not e!93327))))

(assert (=> b!140088 (= res!116801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218616))))

(declare-fun b!140089 () Bool)

(declare-fun lt!218617 () (_ BitVec 64))

(assert (=> b!140089 (= e!93327 (bvsle lt!218616 (bvmul lt!218617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!140089 (or (= lt!218617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218617)))))

(assert (=> b!140089 (= lt!218617 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217762)))))))

(assert (= (and d!45236 res!116800) b!140088))

(assert (= (and b!140088 res!116801) b!140089))

(declare-fun m!215875 () Bool)

(assert (=> d!45236 m!215875))

(declare-fun m!215877 () Bool)

(assert (=> d!45236 m!215877))

(assert (=> b!139688 d!45236))

(assert (=> b!139688 d!44811))

(declare-fun d!45238 () Bool)

(assert (=> d!45238 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523))) lt!217761) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6455 lt!217523)))) ((_ sign_extend 32) (currentByte!6135 (_2!6455 lt!217523))) ((_ sign_extend 32) (currentBit!6130 (_2!6455 lt!217523)))) lt!217761))))

(declare-fun bs!11077 () Bool)

(assert (= bs!11077 d!45238))

(assert (=> bs!11077 m!214783))

(assert (=> b!139686 d!45238))

(assert (=> b!139648 d!44829))

(assert (=> b!139648 d!44809))

(declare-fun d!45240 () Bool)

(declare-fun res!116802 () Bool)

(declare-fun e!93328 () Bool)

(assert (=> d!45240 (=> (not res!116802) (not e!93328))))

(assert (=> d!45240 (= res!116802 (= (size!2883 (buf!3299 (_1!6453 lt!217614))) (size!2883 (buf!3299 thiss!1634))))))

(assert (=> d!45240 (= (isPrefixOf!0 (_1!6453 lt!217614) thiss!1634) e!93328)))

(declare-fun b!140090 () Bool)

(declare-fun res!116803 () Bool)

(assert (=> b!140090 (=> (not res!116803) (not e!93328))))

(assert (=> b!140090 (= res!116803 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217614))) (currentByte!6135 (_1!6453 lt!217614)) (currentBit!6130 (_1!6453 lt!217614))) (bitIndex!0 (size!2883 (buf!3299 thiss!1634)) (currentByte!6135 thiss!1634) (currentBit!6130 thiss!1634))))))

(declare-fun b!140091 () Bool)

(declare-fun e!93329 () Bool)

(assert (=> b!140091 (= e!93328 e!93329)))

(declare-fun res!116804 () Bool)

(assert (=> b!140091 (=> res!116804 e!93329)))

(assert (=> b!140091 (= res!116804 (= (size!2883 (buf!3299 (_1!6453 lt!217614))) #b00000000000000000000000000000000))))

(declare-fun b!140092 () Bool)

(assert (=> b!140092 (= e!93329 (arrayBitRangesEq!0 (buf!3299 (_1!6453 lt!217614)) (buf!3299 thiss!1634) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217614))) (currentByte!6135 (_1!6453 lt!217614)) (currentBit!6130 (_1!6453 lt!217614)))))))

(assert (= (and d!45240 res!116802) b!140090))

(assert (= (and b!140090 res!116803) b!140091))

(assert (= (and b!140091 (not res!116804)) b!140092))

(assert (=> b!140090 m!215433))

(assert (=> b!140090 m!214759))

(assert (=> b!140092 m!215433))

(assert (=> b!140092 m!215433))

(declare-fun m!215879 () Bool)

(assert (=> b!140092 m!215879))

(assert (=> b!139637 d!45240))

(declare-fun d!45242 () Bool)

(declare-fun lt!218624 () (_ BitVec 8))

(declare-fun lt!218622 () (_ BitVec 8))

(assert (=> d!45242 (= lt!218624 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217532))) (currentByte!6135 (_1!6453 lt!217532)))) ((_ sign_extend 24) lt!218622))))))

(assert (=> d!45242 (= lt!218622 ((_ extract 7 0) (currentBit!6130 (_1!6453 lt!217532))))))

(declare-fun e!93331 () Bool)

(assert (=> d!45242 e!93331))

(declare-fun res!116805 () Bool)

(assert (=> d!45242 (=> (not res!116805) (not e!93331))))

(assert (=> d!45242 (= res!116805 (validate_offset_bits!1 ((_ sign_extend 32) (size!2883 (buf!3299 (_1!6453 lt!217532)))) ((_ sign_extend 32) (currentByte!6135 (_1!6453 lt!217532))) ((_ sign_extend 32) (currentBit!6130 (_1!6453 lt!217532))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!8766 () Unit!8719)

(declare-fun Unit!8767 () Unit!8719)

(assert (=> d!45242 (= (readByte!0 (_1!6453 lt!217532)) (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218622) #b00000000000000000000000000000000) (tuple2!12267 Unit!8766 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218624) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217532))) (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218622)))))))) (tuple2!12267 Unit!8767 lt!218624))) (BitStream!5031 (buf!3299 (_1!6453 lt!217532)) (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001) (currentBit!6130 (_1!6453 lt!217532)))))))

(declare-fun b!140093 () Bool)

(declare-fun e!93330 () Bool)

(assert (=> b!140093 (= e!93331 e!93330)))

(declare-fun res!116806 () Bool)

(assert (=> b!140093 (=> (not res!116806) (not e!93330))))

(declare-fun lt!218623 () tuple2!12260)

(assert (=> b!140093 (= res!116806 (= (buf!3299 (_2!6456 lt!218623)) (buf!3299 (_1!6453 lt!217532))))))

(declare-fun lt!218625 () (_ BitVec 8))

(declare-fun lt!218626 () (_ BitVec 8))

(declare-fun Unit!8768 () Unit!8719)

(declare-fun Unit!8769 () Unit!8719)

(assert (=> b!140093 (= lt!218623 (tuple2!12261 (_2!6462 (ite (bvsgt ((_ sign_extend 24) lt!218625) #b00000000000000000000000000000000) (tuple2!12267 Unit!8768 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!218626) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217532))) (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!218625)))))))) (tuple2!12267 Unit!8769 lt!218626))) (BitStream!5031 (buf!3299 (_1!6453 lt!217532)) (bvadd (currentByte!6135 (_1!6453 lt!217532)) #b00000000000000000000000000000001) (currentBit!6130 (_1!6453 lt!217532)))))))

(assert (=> b!140093 (= lt!218626 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3578 (buf!3299 (_1!6453 lt!217532))) (currentByte!6135 (_1!6453 lt!217532)))) ((_ sign_extend 24) lt!218625))))))

(assert (=> b!140093 (= lt!218625 ((_ extract 7 0) (currentBit!6130 (_1!6453 lt!217532))))))

(declare-fun b!140094 () Bool)

(declare-fun lt!218621 () (_ BitVec 64))

(declare-fun lt!218627 () (_ BitVec 64))

(assert (=> b!140094 (= e!93330 (= (bitIndex!0 (size!2883 (buf!3299 (_2!6456 lt!218623))) (currentByte!6135 (_2!6456 lt!218623)) (currentBit!6130 (_2!6456 lt!218623))) (bvadd lt!218621 lt!218627)))))

(assert (=> b!140094 (or (not (= (bvand lt!218621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218627 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218621 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218621 lt!218627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!140094 (= lt!218627 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!140094 (= lt!218621 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217532))) (currentByte!6135 (_1!6453 lt!217532)) (currentBit!6130 (_1!6453 lt!217532))))))

(assert (= (and d!45242 res!116805) b!140093))

(assert (= (and b!140093 res!116806) b!140094))

(declare-fun m!215881 () Bool)

(assert (=> d!45242 m!215881))

(declare-fun m!215883 () Bool)

(assert (=> d!45242 m!215883))

(declare-fun m!215885 () Bool)

(assert (=> d!45242 m!215885))

(assert (=> b!140093 m!215885))

(assert (=> b!140093 m!215881))

(declare-fun m!215887 () Bool)

(assert (=> b!140094 m!215887))

(assert (=> b!140094 m!215749))

(assert (=> d!44837 d!45242))

(declare-fun d!45244 () Bool)

(declare-fun res!116807 () Bool)

(declare-fun e!93332 () Bool)

(assert (=> d!45244 (=> (not res!116807) (not e!93332))))

(assert (=> d!45244 (= res!116807 (= (size!2883 (buf!3299 (_2!6453 lt!217614))) (size!2883 (buf!3299 (_2!6455 lt!217523)))))))

(assert (=> d!45244 (= (isPrefixOf!0 (_2!6453 lt!217614) (_2!6455 lt!217523)) e!93332)))

(declare-fun b!140095 () Bool)

(declare-fun res!116808 () Bool)

(assert (=> b!140095 (=> (not res!116808) (not e!93332))))

(assert (=> b!140095 (= res!116808 (bvsle (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217614))) (currentByte!6135 (_2!6453 lt!217614)) (currentBit!6130 (_2!6453 lt!217614))) (bitIndex!0 (size!2883 (buf!3299 (_2!6455 lt!217523))) (currentByte!6135 (_2!6455 lt!217523)) (currentBit!6130 (_2!6455 lt!217523)))))))

(declare-fun b!140096 () Bool)

(declare-fun e!93333 () Bool)

(assert (=> b!140096 (= e!93332 e!93333)))

(declare-fun res!116809 () Bool)

(assert (=> b!140096 (=> res!116809 e!93333)))

(assert (=> b!140096 (= res!116809 (= (size!2883 (buf!3299 (_2!6453 lt!217614))) #b00000000000000000000000000000000))))

(declare-fun b!140097 () Bool)

(assert (=> b!140097 (= e!93333 (arrayBitRangesEq!0 (buf!3299 (_2!6453 lt!217614)) (buf!3299 (_2!6455 lt!217523)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2883 (buf!3299 (_2!6453 lt!217614))) (currentByte!6135 (_2!6453 lt!217614)) (currentBit!6130 (_2!6453 lt!217614)))))))

(assert (= (and d!45244 res!116807) b!140095))

(assert (= (and b!140095 res!116808) b!140096))

(assert (= (and b!140096 (not res!116809)) b!140097))

(assert (=> b!140095 m!215393))

(assert (=> b!140095 m!214757))

(assert (=> b!140097 m!215393))

(assert (=> b!140097 m!215393))

(declare-fun m!215889 () Bool)

(assert (=> b!140097 m!215889))

(assert (=> b!139635 d!45244))

(declare-fun b!140098 () Bool)

(declare-fun res!116810 () Bool)

(declare-fun e!93334 () Bool)

(assert (=> b!140098 (=> (not res!116810) (not e!93334))))

(declare-fun lt!218649 () tuple3!530)

(assert (=> b!140098 (= res!116810 (and (= (buf!3299 (_1!6453 lt!217522)) (buf!3299 (_2!6457 lt!218649))) (= (size!2883 lt!217528) (size!2883 (_3!326 lt!218649)))))))

(declare-fun call!1845 () Bool)

(declare-fun c!7790 () Bool)

(declare-fun bm!1840 () Bool)

(declare-fun lt!218638 () (_ BitVec 32))

(declare-fun lt!218640 () tuple3!530)

(assert (=> bm!1840 (= call!1845 (arrayRangesEq!247 lt!217528 (ite c!7790 (_3!326 lt!218640) lt!217528) (ite c!7790 lt!218638 #b00000000000000000000000000000000) (ite c!7790 (bvadd #b00000000000000000000000000000001 from!447) (size!2883 lt!217528))))))

(declare-fun d!45246 () Bool)

(declare-fun e!93335 () Bool)

(assert (=> d!45246 e!93335))

(declare-fun res!116812 () Bool)

(assert (=> d!45246 (=> res!116812 e!93335)))

(assert (=> d!45246 (= res!116812 (bvsge (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!218631 () Bool)

(assert (=> d!45246 (= lt!218631 e!93334)))

(declare-fun res!116811 () Bool)

(assert (=> d!45246 (=> (not res!116811) (not e!93334))))

(declare-fun lt!218643 () (_ BitVec 64))

(declare-fun lt!218651 () (_ BitVec 64))

(assert (=> d!45246 (= res!116811 (= (bvadd lt!218643 lt!218651) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218649))) (currentByte!6135 (_2!6457 lt!218649)) (currentBit!6130 (_2!6457 lt!218649)))))))

(assert (=> d!45246 (or (not (= (bvand lt!218643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218651 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218643 lt!218651) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!218656 () (_ BitVec 64))

(assert (=> d!45246 (= lt!218651 (bvmul lt!218656 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> d!45246 (or (= lt!218656 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218656 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218656)))))

(assert (=> d!45246 (= lt!218656 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> d!45246 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> d!45246 (= lt!218643 (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217522))) (currentByte!6135 (_1!6453 lt!217522)) (currentBit!6130 (_1!6453 lt!217522))))))

(declare-fun e!93336 () tuple3!530)

(assert (=> d!45246 (= lt!218649 e!93336)))

(assert (=> d!45246 (= c!7790 (bvslt (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45246 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2883 lt!217528)))))

(assert (=> d!45246 (= (readByteArrayLoop!0 (_1!6453 lt!217522) lt!217528 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!218649)))

(declare-fun call!1843 () Bool)

(declare-fun lt!218637 () (_ BitVec 32))

(declare-fun lt!218647 () array!6370)

(declare-fun lt!218661 () (_ BitVec 32))

(declare-fun lt!218642 () tuple2!12260)

(declare-fun bm!1841 () Bool)

(declare-fun lt!218645 () array!6370)

(assert (=> bm!1841 (= call!1843 (arrayRangesEq!247 (ite c!7790 lt!217528 lt!218645) (ite c!7790 (array!6371 (store (arr!3578 lt!217528) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218642)) (size!2883 lt!217528)) lt!218647) (ite c!7790 #b00000000000000000000000000000000 lt!218637) (ite c!7790 (bvadd #b00000000000000000000000000000001 from!447) lt!218661)))))

(declare-fun b!140099 () Bool)

(declare-fun lt!218662 () Unit!8719)

(assert (=> b!140099 (= e!93336 (tuple3!531 lt!218662 (_2!6457 lt!218640) (_3!326 lt!218640)))))

(assert (=> b!140099 (= lt!218642 (readByte!0 (_1!6453 lt!217522)))))

(declare-fun lt!218653 () array!6370)

(assert (=> b!140099 (= lt!218653 (array!6371 (store (arr!3578 lt!217528) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218642)) (size!2883 lt!217528)))))

(declare-fun lt!218633 () (_ BitVec 64))

(assert (=> b!140099 (= lt!218633 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!218646 () (_ BitVec 32))

(assert (=> b!140099 (= lt!218646 (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!218629 () Unit!8719)

(assert (=> b!140099 (= lt!218629 (validateOffsetBytesFromBitIndexLemma!0 (_1!6453 lt!217522) (_2!6456 lt!218642) lt!218633 lt!218646))))

(assert (=> b!140099 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2883 (buf!3299 (_2!6456 lt!218642)))) ((_ sign_extend 32) (currentByte!6135 (_2!6456 lt!218642))) ((_ sign_extend 32) (currentBit!6130 (_2!6456 lt!218642))) (bvsub lt!218646 ((_ extract 31 0) (bvsdiv (bvadd lt!218633 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!218660 () Unit!8719)

(assert (=> b!140099 (= lt!218660 lt!218629)))

(assert (=> b!140099 (= lt!218640 (readByteArrayLoop!0 (_2!6456 lt!218642) lt!218653 (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001) to!404))))

(declare-fun call!1844 () (_ BitVec 64))

(assert (=> b!140099 (= call!1844 (bvadd (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217522))) (currentByte!6135 (_1!6453 lt!217522)) (currentBit!6130 (_1!6453 lt!217522))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun lt!218657 () Unit!8719)

(declare-fun Unit!8770 () Unit!8719)

(assert (=> b!140099 (= lt!218657 Unit!8770)))

(assert (=> b!140099 (= (bvadd call!1844 (bvmul ((_ sign_extend 32) (bvsub (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218640))) (currentByte!6135 (_2!6457 lt!218640)) (currentBit!6130 (_2!6457 lt!218640))))))

(declare-fun lt!218634 () Unit!8719)

(declare-fun Unit!8771 () Unit!8719)

(assert (=> b!140099 (= lt!218634 Unit!8771)))

(assert (=> b!140099 (= (bvadd (bitIndex!0 (size!2883 (buf!3299 (_1!6453 lt!217522))) (currentByte!6135 (_1!6453 lt!217522)) (currentBit!6130 (_1!6453 lt!217522))) (bvmul ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))) #b0000000000000000000000000000000000000000000000000000000000001000)) (bitIndex!0 (size!2883 (buf!3299 (_2!6457 lt!218640))) (currentByte!6135 (_2!6457 lt!218640)) (currentBit!6130 (_2!6457 lt!218640))))))

(declare-fun lt!218650 () Unit!8719)

(declare-fun Unit!8772 () Unit!8719)

(assert (=> b!140099 (= lt!218650 Unit!8772)))

(assert (=> b!140099 (and (= (buf!3299 (_1!6453 lt!217522)) (buf!3299 (_2!6457 lt!218640))) (= (size!2883 lt!217528) (size!2883 (_3!326 lt!218640))))))

(declare-fun lt!218659 () Unit!8719)

(declare-fun Unit!8773 () Unit!8719)

(assert (=> b!140099 (= lt!218659 Unit!8773)))

(declare-fun lt!218636 () Unit!8719)

(assert (=> b!140099 (= lt!218636 (arrayUpdatedAtPrefixLemma!7 lt!217528 (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218642)))))

(assert (=> b!140099 call!1843))

(declare-fun lt!218641 () Unit!8719)

(assert (=> b!140099 (= lt!218641 lt!218636)))

(assert (=> b!140099 (= lt!218638 #b00000000000000000000000000000000)))

(declare-fun lt!218655 () Unit!8719)

(assert (=> b!140099 (= lt!218655 (arrayRangesEqTransitive!47 lt!217528 lt!218653 (_3!326 lt!218640) lt!218638 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140099 call!1845))

(declare-fun lt!218644 () Unit!8719)

(assert (=> b!140099 (= lt!218644 lt!218655)))

(assert (=> b!140099 (arrayRangesEq!247 lt!217528 (_3!326 lt!218640) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447))))

(declare-fun lt!218635 () Unit!8719)

(declare-fun Unit!8774 () Unit!8719)

(assert (=> b!140099 (= lt!218635 Unit!8774)))

(declare-fun lt!218628 () Unit!8719)

(assert (=> b!140099 (= lt!218628 (arrayRangesEqImpliesEq!7 lt!218653 (_3!326 lt!218640) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447) (bvadd #b00000000000000000000000000000001 from!447 #b00000000000000000000000000000001)))))

(assert (=> b!140099 (= (select (store (arr!3578 lt!217528) (bvadd #b00000000000000000000000000000001 from!447) (_1!6456 lt!218642)) (bvadd #b00000000000000000000000000000001 from!447)) (select (arr!3578 (_3!326 lt!218640)) (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun lt!218630 () Unit!8719)

(assert (=> b!140099 (= lt!218630 lt!218628)))

(declare-fun lt!218639 () Bool)

(assert (=> b!140099 (= lt!218639 (= (select (arr!3578 (_3!326 lt!218640)) (bvadd #b00000000000000000000000000000001 from!447)) (_1!6456 lt!218642)))))

(declare-fun Unit!8775 () Unit!8719)

(assert (=> b!140099 (= lt!218662 Unit!8775)))

(assert (=> b!140099 lt!218639))

(declare-fun b!140100 () Bool)

(assert (=> b!140100 (= e!93334 (arrayRangesEq!247 lt!217528 (_3!326 lt!218649) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)))))

(declare-fun b!140101 () Bool)

(declare-fun lt!218658 () Unit!8719)

(assert (=> b!140101 (= e!93336 (tuple3!531 lt!218658 (_1!6453 lt!217522) lt!217528))))

(assert (=> b!140101 (= call!1844 call!1844)))

(declare-fun lt!218632 () Unit!8719)

(declare-fun Unit!8776 () Unit!8719)

(assert (=> b!140101 (= lt!218632 Unit!8776)))

(declare-fun lt!218663 () Unit!8719)

(assert (=> b!140101 (= lt!218663 (arrayRangesEqReflexiveLemma!7 lt!217528))))

(assert (=> b!140101 call!1845))

(declare-fun lt!218654 () Unit!8719)

(assert (=> b!140101 (= lt!218654 lt!218663)))

(assert (=> b!140101 (= lt!218645 lt!217528)))

(assert (=> b!140101 (= lt!218647 lt!217528)))

(declare-fun lt!218648 () (_ BitVec 32))

(assert (=> b!140101 (= lt!218648 #b00000000000000000000000000000000)))

(declare-fun lt!218652 () (_ BitVec 32))

(assert (=> b!140101 (= lt!218652 (size!2883 lt!217528))))

(assert (=> b!140101 (= lt!218637 #b00000000000000000000000000000000)))

(assert (=> b!140101 (= lt!218661 (bvadd #b00000000000000000000000000000001 from!447))))

(assert (=> b!140101 (= lt!218658 (arrayRangesEqSlicedLemma!7 lt!218645 lt!218647 lt!218648 lt!218652 lt!218637 lt!218661))))

(assert (=> b!140101 call!1843))

(declare-fun b!140102 () Bool)

(assert (=> b!140102 (= e!93335 (= (select (arr!3578 (_3!326 lt!218649)) (bvadd #b00000000000000000000000000000001 from!447)) (_2!6454 (readBytePure!0 (_1!6453 lt!217522)))))))

(assert (=> b!140102 (and (bvsge (bvadd #b00000000000000000000000000000001 from!447) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!447) (size!2883 (_3!326 lt!218649))))))

(declare-fun bm!1842 () Bool)

(assert (=> bm!1842 (= call!1844 (bitIndex!0 (ite c!7790 (size!2883 (buf!3299 (_2!6456 lt!218642))) (size!2883 (buf!3299 (_1!6453 lt!217522)))) (ite c!7790 (currentByte!6135 (_2!6456 lt!218642)) (currentByte!6135 (_1!6453 lt!217522))) (ite c!7790 (currentBit!6130 (_2!6456 lt!218642)) (currentBit!6130 (_1!6453 lt!217522)))))))

(assert (= (and d!45246 c!7790) b!140099))

(assert (= (and d!45246 (not c!7790)) b!140101))

(assert (= (or b!140099 b!140101) bm!1841))

(assert (= (or b!140099 b!140101) bm!1840))

(assert (= (or b!140099 b!140101) bm!1842))

(assert (= (and d!45246 res!116811) b!140098))

(assert (= (and b!140098 res!116810) b!140100))

(assert (= (and d!45246 (not res!116812)) b!140102))

(declare-fun m!215891 () Bool)

(assert (=> bm!1842 m!215891))

(declare-fun m!215893 () Bool)

(assert (=> bm!1840 m!215893))

(declare-fun m!215895 () Bool)

(assert (=> d!45246 m!215895))

(declare-fun m!215897 () Bool)

(assert (=> d!45246 m!215897))

(declare-fun m!215899 () Bool)

(assert (=> b!140099 m!215899))

(declare-fun m!215901 () Bool)

(assert (=> b!140099 m!215901))

(declare-fun m!215903 () Bool)

(assert (=> b!140099 m!215903))

(assert (=> b!140099 m!215897))

(declare-fun m!215905 () Bool)

(assert (=> b!140099 m!215905))

(declare-fun m!215907 () Bool)

(assert (=> b!140099 m!215907))

(declare-fun m!215909 () Bool)

(assert (=> b!140099 m!215909))

(declare-fun m!215911 () Bool)

(assert (=> b!140099 m!215911))

(declare-fun m!215913 () Bool)

(assert (=> b!140099 m!215913))

(declare-fun m!215915 () Bool)

(assert (=> b!140099 m!215915))

(declare-fun m!215917 () Bool)

(assert (=> b!140099 m!215917))

(declare-fun m!215919 () Bool)

(assert (=> b!140099 m!215919))

(declare-fun m!215921 () Bool)

(assert (=> b!140099 m!215921))

(assert (=> bm!1841 m!215921))

(declare-fun m!215923 () Bool)

(assert (=> bm!1841 m!215923))

(assert (=> b!140101 m!215715))

(declare-fun m!215925 () Bool)

(assert (=> b!140101 m!215925))

(declare-fun m!215927 () Bool)

(assert (=> b!140100 m!215927))

(declare-fun m!215929 () Bool)

(assert (=> b!140102 m!215929))

(declare-fun m!215931 () Bool)

(assert (=> b!140102 m!215931))

(assert (=> d!44865 d!45246))

(push 1)

(assert (not b!139902))

(assert (not b!140037))

(assert (not d!45116))

(assert (not d!45186))

(assert (not d!45180))

(assert (not d!45138))

(assert (not b!139940))

(assert (not b!140052))

(assert (not d!45184))

(assert (not b!140039))

(assert (not b!139945))

(assert (not bm!1831))

(assert (not b!139887))

(assert (not b!139988))

(assert (not b!139905))

(assert (not bm!1841))

(assert (not b!139885))

(assert (not b!140065))

(assert (not bm!1820))

(assert (not b!139910))

(assert (not d!45174))

(assert (not bm!1829))

(assert (not b!139901))

(assert (not b!139968))

(assert (not b!140068))

(assert (not b!140006))

(assert (not bm!1840))

(assert (not b!140095))

(assert (not d!45148))

(assert (not d!45212))

(assert (not b!139914))

(assert (not d!45146))

(assert (not d!45178))

(assert (not b!139955))

(assert (not d!45142))

(assert (not d!45164))

(assert (not bm!1832))

(assert (not b!140078))

(assert (not b!140051))

(assert (not d!45236))

(assert (not d!45100))

(assert (not b!139919))

(assert (not b!140048))

(assert (not b!139913))

(assert (not b!140003))

(assert (not b!139987))

(assert (not d!45150))

(assert (not b!140063))

(assert (not d!45122))

(assert (not d!45082))

(assert (not d!45144))

(assert (not b!139899))

(assert (not b!140077))

(assert (not b!139982))

(assert (not b!140097))

(assert (not bm!1836))

(assert (not b!140086))

(assert (not d!45090))

(assert (not d!45222))

(assert (not b!140030))

(assert (not d!45118))

(assert (not d!45218))

(assert (not b!140005))

(assert (not d!45190))

(assert (not d!45112))

(assert (not b!139948))

(assert (not bm!1819))

(assert (not d!45104))

(assert (not b!140062))

(assert (not b!140094))

(assert (not d!45076))

(assert (not b!140025))

(assert (not d!45128))

(assert (not b!140087))

(assert (not b!139970))

(assert (not b!139917))

(assert (not b!139980))

(assert (not b!140061))

(assert (not bm!1830))

(assert (not b!140053))

(assert (not d!45084))

(assert (not d!45066))

(assert (not d!45140))

(assert (not b!140035))

(assert (not d!45204))

(assert (not b!139947))

(assert (not b!140071))

(assert (not b!140024))

(assert (not b!140042))

(assert (not b!140047))

(assert (not b!139952))

(assert (not bm!1833))

(assert (not b!139893))

(assert (not b!140066))

(assert (not b!139898))

(assert (not b!140069))

(assert (not d!45152))

(assert (not bm!1837))

(assert (not b!139941))

(assert (not d!45170))

(assert (not d!45228))

(assert (not d!45134))

(assert (not b!139953))

(assert (not bm!1842))

(assert (not b!139950))

(assert (not b!140008))

(assert (not b!139979))

(assert (not b!139896))

(assert (not b!140100))

(assert (not b!139938))

(assert (not d!45246))

(assert (not b!140102))

(assert (not b!140090))

(assert (not d!45232))

(assert (not b!139991))

(assert (not bm!1834))

(assert (not d!45206))

(assert (not b!139884))

(assert (not b!139956))

(assert (not d!45242))

(assert (not bm!1839))

(assert (not d!45198))

(assert (not b!140085))

(assert (not bm!1835))

(assert (not d!45172))

(assert (not b!140075))

(assert (not d!45202))

(assert (not b!139889))

(assert (not b!139904))

(assert (not b!139958))

(assert (not b!140099))

(assert (not b!139989))

(assert (not d!45132))

(assert (not b!140023))

(assert (not b!140080))

(assert (not b!140092))

(assert (not b!139916))

(assert (not b!140049))

(assert (not b!140073))

(assert (not b!139943))

(assert (not b!139908))

(assert (not b!140041))

(assert (not b!139907))

(assert (not b!139939))

(assert (not d!45238))

(assert (not b!140022))

(assert (not d!45092))

(assert (not b!140004))

(assert (not b!140002))

(assert (not b!140060))

(assert (not b!139954))

(assert (not bm!1828))

(assert (not d!45176))

(assert (not bm!1827))

(assert (not d!45226))

(assert (not d!45162))

(assert (not b!139969))

(assert (not b!140040))

(assert (not b!140101))

(assert (not b!139967))

(assert (not d!45230))

(assert (not b!140079))

(assert (not b!139895))

(assert (not b!140054))

(assert (not b!139911))

(assert (not b!140036))

(assert (not bm!1838))

(assert (not d!45080))

(assert (not d!45214))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

