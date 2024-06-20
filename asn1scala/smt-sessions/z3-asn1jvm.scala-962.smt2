; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27124 () Bool)

(assert start!27124)

(declare-fun res!116323 () Bool)

(declare-fun e!92966 () Bool)

(assert (=> start!27124 (=> (not res!116323) (not e!92966))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6368 0))(
  ( (array!6369 (arr!3577 (Array (_ BitVec 32) (_ BitVec 8))) (size!2882 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6368)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27124 (= res!116323 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2882 arr!237))))))

(assert (=> start!27124 e!92966))

(assert (=> start!27124 true))

(declare-fun array_inv!2671 (array!6368) Bool)

(assert (=> start!27124 (array_inv!2671 arr!237)))

(declare-datatypes ((BitStream!5028 0))(
  ( (BitStream!5029 (buf!3298 array!6368) (currentByte!6134 (_ BitVec 32)) (currentBit!6129 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5028)

(declare-fun e!92969 () Bool)

(declare-fun inv!12 (BitStream!5028) Bool)

(assert (=> start!27124 (and (inv!12 thiss!1634) e!92969)))

(declare-fun b!139541 () Bool)

(declare-fun res!116329 () Bool)

(declare-fun e!92973 () Bool)

(assert (=> b!139541 (=> (not res!116329) (not e!92973))))

(declare-datatypes ((Unit!8717 0))(
  ( (Unit!8718) )
))
(declare-datatypes ((tuple2!12244 0))(
  ( (tuple2!12245 (_1!6448 Unit!8717) (_2!6448 BitStream!5028)) )
))
(declare-fun lt!217457 () tuple2!12244)

(declare-fun lt!217462 () tuple2!12244)

(declare-fun isPrefixOf!0 (BitStream!5028 BitStream!5028) Bool)

(assert (=> b!139541 (= res!116329 (isPrefixOf!0 (_2!6448 lt!217457) (_2!6448 lt!217462)))))

(declare-fun e!92967 () Bool)

(declare-fun b!139542 () Bool)

(declare-datatypes ((tuple2!12246 0))(
  ( (tuple2!12247 (_1!6449 BitStream!5028) (_2!6449 array!6368)) )
))
(declare-fun lt!217441 () tuple2!12246)

(declare-fun arrayRangesEq!246 (array!6368 array!6368 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139542 (= e!92967 (not (arrayRangesEq!246 arr!237 (_2!6449 lt!217441) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!139543 () Bool)

(declare-fun res!116332 () Bool)

(assert (=> b!139543 (=> (not res!116332) (not e!92966))))

(assert (=> b!139543 (= res!116332 (bvslt from!447 to!404))))

(declare-fun b!139544 () Bool)

(assert (=> b!139544 (= e!92973 (not e!92967))))

(declare-fun res!116325 () Bool)

(assert (=> b!139544 (=> res!116325 e!92967)))

(declare-datatypes ((tuple2!12248 0))(
  ( (tuple2!12249 (_1!6450 BitStream!5028) (_2!6450 BitStream!5028)) )
))
(declare-fun lt!217452 () tuple2!12248)

(assert (=> b!139544 (= res!116325 (or (not (= (size!2882 (_2!6449 lt!217441)) (size!2882 arr!237))) (not (= (_1!6449 lt!217441) (_2!6450 lt!217452)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5028 array!6368 (_ BitVec 32) (_ BitVec 32)) tuple2!12246)

(assert (=> b!139544 (= lt!217441 (readByteArrayLoopPure!0 (_1!6450 lt!217452) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!217444 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139544 (validate_offset_bits!1 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217444)))

(declare-fun lt!217445 () Unit!8717)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5028 array!6368 (_ BitVec 64)) Unit!8717)

(assert (=> b!139544 (= lt!217445 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6448 lt!217457) (buf!3298 (_2!6448 lt!217462)) lt!217444))))

(declare-fun reader!0 (BitStream!5028 BitStream!5028) tuple2!12248)

(assert (=> b!139544 (= lt!217452 (reader!0 (_2!6448 lt!217457) (_2!6448 lt!217462)))))

(declare-fun b!139545 () Bool)

(declare-fun res!116333 () Bool)

(assert (=> b!139545 (=> (not res!116333) (not e!92966))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!139545 (= res!116333 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 thiss!1634))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!139546 () Bool)

(declare-fun res!116322 () Bool)

(assert (=> b!139546 (=> (not res!116322) (not e!92966))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!139546 (= res!116322 (invariant!0 (currentBit!6129 thiss!1634) (currentByte!6134 thiss!1634) (size!2882 (buf!3298 thiss!1634))))))

(declare-fun b!139547 () Bool)

(assert (=> b!139547 (= e!92969 (array_inv!2671 (buf!3298 thiss!1634)))))

(declare-fun b!139548 () Bool)

(declare-fun e!92972 () Bool)

(assert (=> b!139548 (= e!92972 e!92973)))

(declare-fun res!116330 () Bool)

(assert (=> b!139548 (=> (not res!116330) (not e!92973))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!139548 (= res!116330 (= (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217462))) (currentByte!6134 (_2!6448 lt!217462)) (currentBit!6129 (_2!6448 lt!217462))) (bvadd (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!217444))))))

(assert (=> b!139548 (= lt!217444 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun lt!217463 () tuple2!12246)

(declare-fun b!139549 () Bool)

(declare-fun lt!217447 () tuple2!12246)

(assert (=> b!139549 (= e!92966 (not (arrayRangesEq!246 (_2!6449 lt!217447) (_2!6449 lt!217463) #b00000000000000000000000000000000 to!404)))))

(declare-fun lt!217454 () tuple2!12246)

(assert (=> b!139549 (arrayRangesEq!246 (_2!6449 lt!217447) (_2!6449 lt!217454) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!217464 () Unit!8717)

(declare-fun lt!217449 () tuple2!12248)

(declare-fun readByteArrayLoopArrayPrefixLemma!0 (BitStream!5028 array!6368 (_ BitVec 32) (_ BitVec 32)) Unit!8717)

(assert (=> b!139549 (= lt!217464 (readByteArrayLoopArrayPrefixLemma!0 (_1!6450 lt!217449) arr!237 from!447 to!404))))

(declare-fun lt!217448 () array!6368)

(declare-fun withMovedByteIndex!0 (BitStream!5028 (_ BitVec 32)) BitStream!5028)

(assert (=> b!139549 (= lt!217454 (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6450 lt!217449) #b00000000000000000000000000000001) lt!217448 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!217443 () tuple2!12248)

(assert (=> b!139549 (= lt!217463 (readByteArrayLoopPure!0 (_1!6450 lt!217443) lt!217448 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-datatypes ((tuple2!12250 0))(
  ( (tuple2!12251 (_1!6451 BitStream!5028) (_2!6451 (_ BitVec 8))) )
))
(declare-fun lt!217455 () tuple2!12250)

(assert (=> b!139549 (= lt!217448 (array!6369 (store (arr!3577 arr!237) from!447 (_2!6451 lt!217455)) (size!2882 arr!237)))))

(declare-fun lt!217453 () (_ BitVec 32))

(assert (=> b!139549 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217453)))

(declare-fun lt!217446 () Unit!8717)

(declare-fun validateOffsetBytesContentIrrelevancyLemma!0 (BitStream!5028 array!6368 (_ BitVec 32)) Unit!8717)

(assert (=> b!139549 (= lt!217446 (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6448 lt!217457) (buf!3298 (_2!6448 lt!217462)) lt!217453))))

(assert (=> b!139549 (= (_1!6449 lt!217447) (_2!6450 lt!217449))))

(assert (=> b!139549 (= lt!217447 (readByteArrayLoopPure!0 (_1!6450 lt!217449) arr!237 from!447 to!404))))

(assert (=> b!139549 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!217461 () Unit!8717)

(assert (=> b!139549 (= lt!217461 (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3298 (_2!6448 lt!217462)) (bvsub to!404 from!447)))))

(assert (=> b!139549 (= (_2!6451 lt!217455) (select (arr!3577 arr!237) from!447))))

(declare-fun readBytePure!0 (BitStream!5028) tuple2!12250)

(assert (=> b!139549 (= lt!217455 (readBytePure!0 (_1!6450 lt!217449)))))

(assert (=> b!139549 (= lt!217443 (reader!0 (_2!6448 lt!217457) (_2!6448 lt!217462)))))

(assert (=> b!139549 (= lt!217449 (reader!0 thiss!1634 (_2!6448 lt!217462)))))

(declare-fun e!92971 () Bool)

(assert (=> b!139549 e!92971))

(declare-fun res!116326 () Bool)

(assert (=> b!139549 (=> (not res!116326) (not e!92971))))

(declare-fun lt!217460 () tuple2!12250)

(declare-fun lt!217456 () tuple2!12250)

(assert (=> b!139549 (= res!116326 (= (bitIndex!0 (size!2882 (buf!3298 (_1!6451 lt!217460))) (currentByte!6134 (_1!6451 lt!217460)) (currentBit!6129 (_1!6451 lt!217460))) (bitIndex!0 (size!2882 (buf!3298 (_1!6451 lt!217456))) (currentByte!6134 (_1!6451 lt!217456)) (currentBit!6129 (_1!6451 lt!217456)))))))

(declare-fun lt!217451 () Unit!8717)

(declare-fun lt!217440 () BitStream!5028)

(declare-fun readBytePrefixLemma!0 (BitStream!5028 BitStream!5028) Unit!8717)

(assert (=> b!139549 (= lt!217451 (readBytePrefixLemma!0 lt!217440 (_2!6448 lt!217462)))))

(assert (=> b!139549 (= lt!217456 (readBytePure!0 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634))))))

(assert (=> b!139549 (= lt!217460 (readBytePure!0 lt!217440))))

(assert (=> b!139549 (= lt!217440 (BitStream!5029 (buf!3298 (_2!6448 lt!217457)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(declare-fun e!92965 () Bool)

(assert (=> b!139549 e!92965))

(declare-fun res!116331 () Bool)

(assert (=> b!139549 (=> (not res!116331) (not e!92965))))

(assert (=> b!139549 (= res!116331 (isPrefixOf!0 thiss!1634 (_2!6448 lt!217462)))))

(declare-fun lt!217459 () Unit!8717)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5028 BitStream!5028 BitStream!5028) Unit!8717)

(assert (=> b!139549 (= lt!217459 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6448 lt!217457) (_2!6448 lt!217462)))))

(assert (=> b!139549 e!92972))

(declare-fun res!116327 () Bool)

(assert (=> b!139549 (=> (not res!116327) (not e!92972))))

(assert (=> b!139549 (= res!116327 (= (size!2882 (buf!3298 (_2!6448 lt!217457))) (size!2882 (buf!3298 (_2!6448 lt!217462)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5028 array!6368 (_ BitVec 32) (_ BitVec 32)) tuple2!12244)

(assert (=> b!139549 (= lt!217462 (appendByteArrayLoop!0 (_2!6448 lt!217457) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> b!139549 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217453)))

(assert (=> b!139549 (= lt!217453 (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!217442 () Unit!8717)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5028 BitStream!5028 (_ BitVec 64) (_ BitVec 32)) Unit!8717)

(assert (=> b!139549 (= lt!217442 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6448 lt!217457) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!92970 () Bool)

(assert (=> b!139549 e!92970))

(declare-fun res!116328 () Bool)

(assert (=> b!139549 (=> (not res!116328) (not e!92970))))

(assert (=> b!139549 (= res!116328 (= (size!2882 (buf!3298 thiss!1634)) (size!2882 (buf!3298 (_2!6448 lt!217457)))))))

(declare-fun appendByte!0 (BitStream!5028 (_ BitVec 8)) tuple2!12244)

(assert (=> b!139549 (= lt!217457 (appendByte!0 thiss!1634 (select (arr!3577 arr!237) from!447)))))

(declare-fun b!139550 () Bool)

(assert (=> b!139550 (= e!92965 (invariant!0 (currentBit!6129 thiss!1634) (currentByte!6134 thiss!1634) (size!2882 (buf!3298 (_2!6448 lt!217457)))))))

(declare-fun lt!217450 () tuple2!12248)

(declare-fun lt!217458 () tuple2!12250)

(declare-fun b!139551 () Bool)

(assert (=> b!139551 (= e!92970 (and (= (_2!6451 lt!217458) (select (arr!3577 arr!237) from!447)) (= (_1!6451 lt!217458) (_2!6450 lt!217450))))))

(assert (=> b!139551 (= lt!217458 (readBytePure!0 (_1!6450 lt!217450)))))

(assert (=> b!139551 (= lt!217450 (reader!0 thiss!1634 (_2!6448 lt!217457)))))

(declare-fun b!139552 () Bool)

(declare-fun res!116334 () Bool)

(assert (=> b!139552 (=> (not res!116334) (not e!92970))))

(assert (=> b!139552 (= res!116334 (= (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))))

(declare-fun b!139553 () Bool)

(assert (=> b!139553 (= e!92971 (= (_2!6451 lt!217460) (_2!6451 lt!217456)))))

(declare-fun b!139554 () Bool)

(declare-fun res!116324 () Bool)

(assert (=> b!139554 (=> (not res!116324) (not e!92970))))

(assert (=> b!139554 (= res!116324 (isPrefixOf!0 thiss!1634 (_2!6448 lt!217457)))))

(assert (= (and start!27124 res!116323) b!139545))

(assert (= (and b!139545 res!116333) b!139543))

(assert (= (and b!139543 res!116332) b!139546))

(assert (= (and b!139546 res!116322) b!139549))

(assert (= (and b!139549 res!116328) b!139552))

(assert (= (and b!139552 res!116334) b!139554))

(assert (= (and b!139554 res!116324) b!139551))

(assert (= (and b!139549 res!116327) b!139548))

(assert (= (and b!139548 res!116330) b!139541))

(assert (= (and b!139541 res!116329) b!139544))

(assert (= (and b!139544 (not res!116325)) b!139542))

(assert (= (and b!139549 res!116331) b!139550))

(assert (= (and b!139549 res!116326) b!139553))

(assert (= start!27124 b!139547))

(declare-fun m!214601 () Bool)

(assert (=> b!139552 m!214601))

(declare-fun m!214603 () Bool)

(assert (=> b!139552 m!214603))

(declare-fun m!214605 () Bool)

(assert (=> b!139541 m!214605))

(declare-fun m!214607 () Bool)

(assert (=> b!139549 m!214607))

(declare-fun m!214609 () Bool)

(assert (=> b!139549 m!214609))

(declare-fun m!214611 () Bool)

(assert (=> b!139549 m!214611))

(declare-fun m!214613 () Bool)

(assert (=> b!139549 m!214613))

(declare-fun m!214615 () Bool)

(assert (=> b!139549 m!214615))

(declare-fun m!214617 () Bool)

(assert (=> b!139549 m!214617))

(declare-fun m!214619 () Bool)

(assert (=> b!139549 m!214619))

(declare-fun m!214621 () Bool)

(assert (=> b!139549 m!214621))

(declare-fun m!214623 () Bool)

(assert (=> b!139549 m!214623))

(declare-fun m!214625 () Bool)

(assert (=> b!139549 m!214625))

(declare-fun m!214627 () Bool)

(assert (=> b!139549 m!214627))

(declare-fun m!214629 () Bool)

(assert (=> b!139549 m!214629))

(declare-fun m!214631 () Bool)

(assert (=> b!139549 m!214631))

(declare-fun m!214633 () Bool)

(assert (=> b!139549 m!214633))

(declare-fun m!214635 () Bool)

(assert (=> b!139549 m!214635))

(declare-fun m!214637 () Bool)

(assert (=> b!139549 m!214637))

(declare-fun m!214639 () Bool)

(assert (=> b!139549 m!214639))

(declare-fun m!214641 () Bool)

(assert (=> b!139549 m!214641))

(declare-fun m!214643 () Bool)

(assert (=> b!139549 m!214643))

(declare-fun m!214645 () Bool)

(assert (=> b!139549 m!214645))

(declare-fun m!214647 () Bool)

(assert (=> b!139549 m!214647))

(declare-fun m!214649 () Bool)

(assert (=> b!139549 m!214649))

(declare-fun m!214651 () Bool)

(assert (=> b!139549 m!214651))

(declare-fun m!214653 () Bool)

(assert (=> b!139549 m!214653))

(declare-fun m!214655 () Bool)

(assert (=> b!139549 m!214655))

(declare-fun m!214657 () Bool)

(assert (=> b!139549 m!214657))

(assert (=> b!139549 m!214607))

(declare-fun m!214659 () Bool)

(assert (=> b!139549 m!214659))

(assert (=> b!139549 m!214623))

(declare-fun m!214661 () Bool)

(assert (=> b!139554 m!214661))

(declare-fun m!214663 () Bool)

(assert (=> b!139542 m!214663))

(declare-fun m!214665 () Bool)

(assert (=> b!139545 m!214665))

(assert (=> b!139551 m!214623))

(declare-fun m!214667 () Bool)

(assert (=> b!139551 m!214667))

(declare-fun m!214669 () Bool)

(assert (=> b!139551 m!214669))

(declare-fun m!214671 () Bool)

(assert (=> b!139547 m!214671))

(declare-fun m!214673 () Bool)

(assert (=> b!139544 m!214673))

(declare-fun m!214675 () Bool)

(assert (=> b!139544 m!214675))

(declare-fun m!214677 () Bool)

(assert (=> b!139544 m!214677))

(assert (=> b!139544 m!214629))

(declare-fun m!214679 () Bool)

(assert (=> b!139548 m!214679))

(assert (=> b!139548 m!214601))

(declare-fun m!214681 () Bool)

(assert (=> b!139546 m!214681))

(declare-fun m!214683 () Bool)

(assert (=> start!27124 m!214683))

(declare-fun m!214685 () Bool)

(assert (=> start!27124 m!214685))

(declare-fun m!214687 () Bool)

(assert (=> b!139550 m!214687))

(check-sat (not b!139544) (not b!139546) (not b!139548) (not b!139542) (not b!139551) (not b!139547) (not b!139545) (not start!27124) (not b!139549) (not b!139552) (not b!139550) (not b!139541) (not b!139554))
(check-sat)
(get-model)

(declare-fun d!44977 () Bool)

(declare-fun res!116549 () Bool)

(declare-fun e!93118 () Bool)

(assert (=> d!44977 (=> (not res!116549) (not e!93118))))

(assert (=> d!44977 (= res!116549 (= (size!2882 (buf!3298 thiss!1634)) (size!2882 (buf!3298 (_2!6448 lt!217457)))))))

(assert (=> d!44977 (= (isPrefixOf!0 thiss!1634 (_2!6448 lt!217457)) e!93118)))

(declare-fun b!139791 () Bool)

(declare-fun res!116548 () Bool)

(assert (=> b!139791 (=> (not res!116548) (not e!93118))))

(assert (=> b!139791 (= res!116548 (bvsle (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)) (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457)))))))

(declare-fun b!139792 () Bool)

(declare-fun e!93119 () Bool)

(assert (=> b!139792 (= e!93118 e!93119)))

(declare-fun res!116550 () Bool)

(assert (=> b!139792 (=> res!116550 e!93119)))

(assert (=> b!139792 (= res!116550 (= (size!2882 (buf!3298 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139793 () Bool)

(declare-fun arrayBitRangesEq!0 (array!6368 array!6368 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!139793 (= e!93119 (arrayBitRangesEq!0 (buf!3298 thiss!1634) (buf!3298 (_2!6448 lt!217457)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634))))))

(assert (= (and d!44977 res!116549) b!139791))

(assert (= (and b!139791 res!116548) b!139792))

(assert (= (and b!139792 (not res!116550)) b!139793))

(assert (=> b!139791 m!214603))

(assert (=> b!139791 m!214601))

(assert (=> b!139793 m!214603))

(assert (=> b!139793 m!214603))

(declare-fun m!215173 () Bool)

(assert (=> b!139793 m!215173))

(assert (=> b!139554 d!44977))

(declare-fun d!44979 () Bool)

(declare-fun res!116555 () Bool)

(declare-fun e!93124 () Bool)

(assert (=> d!44979 (=> res!116555 e!93124)))

(assert (=> d!44979 (= res!116555 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!44979 (= (arrayRangesEq!246 arr!237 (_2!6449 lt!217441) #b00000000000000000000000000000000 to!404) e!93124)))

(declare-fun b!139798 () Bool)

(declare-fun e!93125 () Bool)

(assert (=> b!139798 (= e!93124 e!93125)))

(declare-fun res!116556 () Bool)

(assert (=> b!139798 (=> (not res!116556) (not e!93125))))

(assert (=> b!139798 (= res!116556 (= (select (arr!3577 arr!237) #b00000000000000000000000000000000) (select (arr!3577 (_2!6449 lt!217441)) #b00000000000000000000000000000000)))))

(declare-fun b!139799 () Bool)

(assert (=> b!139799 (= e!93125 (arrayRangesEq!246 arr!237 (_2!6449 lt!217441) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!44979 (not res!116555)) b!139798))

(assert (= (and b!139798 res!116556) b!139799))

(declare-fun m!215175 () Bool)

(assert (=> b!139798 m!215175))

(declare-fun m!215177 () Bool)

(assert (=> b!139798 m!215177))

(declare-fun m!215179 () Bool)

(assert (=> b!139799 m!215179))

(assert (=> b!139542 d!44979))

(declare-fun d!44981 () Bool)

(declare-fun e!93128 () Bool)

(assert (=> d!44981 e!93128))

(declare-fun res!116561 () Bool)

(assert (=> d!44981 (=> (not res!116561) (not e!93128))))

(declare-fun lt!218035 () (_ BitVec 64))

(declare-fun lt!218032 () (_ BitVec 64))

(declare-fun lt!218031 () (_ BitVec 64))

(assert (=> d!44981 (= res!116561 (= lt!218032 (bvsub lt!218035 lt!218031)))))

(assert (=> d!44981 (or (= (bvand lt!218035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218031 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218035 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218035 lt!218031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!44981 (= lt!218031 (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457)))))))

(declare-fun lt!218033 () (_ BitVec 64))

(declare-fun lt!218030 () (_ BitVec 64))

(assert (=> d!44981 (= lt!218035 (bvmul lt!218033 lt!218030))))

(assert (=> d!44981 (or (= lt!218033 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218030 (bvsdiv (bvmul lt!218033 lt!218030) lt!218033)))))

(assert (=> d!44981 (= lt!218030 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44981 (= lt!218033 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))))))

(assert (=> d!44981 (= lt!218032 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457)))))))

(assert (=> d!44981 (invariant!0 (currentBit!6129 (_2!6448 lt!217457)) (currentByte!6134 (_2!6448 lt!217457)) (size!2882 (buf!3298 (_2!6448 lt!217457))))))

(assert (=> d!44981 (= (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))) lt!218032)))

(declare-fun b!139804 () Bool)

(declare-fun res!116562 () Bool)

(assert (=> b!139804 (=> (not res!116562) (not e!93128))))

(assert (=> b!139804 (= res!116562 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218032))))

(declare-fun b!139805 () Bool)

(declare-fun lt!218034 () (_ BitVec 64))

(assert (=> b!139805 (= e!93128 (bvsle lt!218032 (bvmul lt!218034 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139805 (or (= lt!218034 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218034 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218034)))))

(assert (=> b!139805 (= lt!218034 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))))))

(assert (= (and d!44981 res!116561) b!139804))

(assert (= (and b!139804 res!116562) b!139805))

(declare-fun m!215181 () Bool)

(assert (=> d!44981 m!215181))

(declare-fun m!215183 () Bool)

(assert (=> d!44981 m!215183))

(assert (=> b!139552 d!44981))

(declare-fun d!44983 () Bool)

(declare-fun e!93129 () Bool)

(assert (=> d!44983 e!93129))

(declare-fun res!116563 () Bool)

(assert (=> d!44983 (=> (not res!116563) (not e!93129))))

(declare-fun lt!218038 () (_ BitVec 64))

(declare-fun lt!218037 () (_ BitVec 64))

(declare-fun lt!218041 () (_ BitVec 64))

(assert (=> d!44983 (= res!116563 (= lt!218038 (bvsub lt!218041 lt!218037)))))

(assert (=> d!44983 (or (= (bvand lt!218041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218041 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218041 lt!218037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!44983 (= lt!218037 (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 thiss!1634))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634))))))

(declare-fun lt!218039 () (_ BitVec 64))

(declare-fun lt!218036 () (_ BitVec 64))

(assert (=> d!44983 (= lt!218041 (bvmul lt!218039 lt!218036))))

(assert (=> d!44983 (or (= lt!218039 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218036 (bvsdiv (bvmul lt!218039 lt!218036) lt!218039)))))

(assert (=> d!44983 (= lt!218036 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!44983 (= lt!218039 ((_ sign_extend 32) (size!2882 (buf!3298 thiss!1634))))))

(assert (=> d!44983 (= lt!218038 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6134 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6129 thiss!1634))))))

(assert (=> d!44983 (invariant!0 (currentBit!6129 thiss!1634) (currentByte!6134 thiss!1634) (size!2882 (buf!3298 thiss!1634)))))

(assert (=> d!44983 (= (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)) lt!218038)))

(declare-fun b!139806 () Bool)

(declare-fun res!116564 () Bool)

(assert (=> b!139806 (=> (not res!116564) (not e!93129))))

(assert (=> b!139806 (= res!116564 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218038))))

(declare-fun b!139807 () Bool)

(declare-fun lt!218040 () (_ BitVec 64))

(assert (=> b!139807 (= e!93129 (bvsle lt!218038 (bvmul lt!218040 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139807 (or (= lt!218040 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218040 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218040)))))

(assert (=> b!139807 (= lt!218040 ((_ sign_extend 32) (size!2882 (buf!3298 thiss!1634))))))

(assert (= (and d!44983 res!116563) b!139806))

(assert (= (and b!139806 res!116564) b!139807))

(declare-fun m!215185 () Bool)

(assert (=> d!44983 m!215185))

(assert (=> d!44983 m!214681))

(assert (=> b!139552 d!44983))

(declare-fun d!44985 () Bool)

(assert (=> d!44985 (= (invariant!0 (currentBit!6129 thiss!1634) (currentByte!6134 thiss!1634) (size!2882 (buf!3298 thiss!1634))) (and (bvsge (currentBit!6129 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6129 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6134 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6134 thiss!1634) (size!2882 (buf!3298 thiss!1634))) (and (= (currentBit!6129 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6134 thiss!1634) (size!2882 (buf!3298 thiss!1634)))))))))

(assert (=> b!139546 d!44985))

(declare-fun d!44987 () Bool)

(assert (=> d!44987 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 thiss!1634))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 thiss!1634))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11025 () Bool)

(assert (= bs!11025 d!44987))

(assert (=> bs!11025 m!215185))

(assert (=> b!139545 d!44987))

(declare-fun d!44989 () Bool)

(declare-datatypes ((tuple3!534 0))(
  ( (tuple3!535 (_1!6460 Unit!8717) (_2!6460 BitStream!5028) (_3!328 array!6368)) )
))
(declare-fun lt!218044 () tuple3!534)

(declare-fun readByteArrayLoop!0 (BitStream!5028 array!6368 (_ BitVec 32) (_ BitVec 32)) tuple3!534)

(assert (=> d!44989 (= lt!218044 (readByteArrayLoop!0 (_1!6450 lt!217452) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!44989 (= (readByteArrayLoopPure!0 (_1!6450 lt!217452) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12247 (_2!6460 lt!218044) (_3!328 lt!218044)))))

(declare-fun bs!11026 () Bool)

(assert (= bs!11026 d!44989))

(declare-fun m!215187 () Bool)

(assert (=> bs!11026 m!215187))

(assert (=> b!139544 d!44989))

(declare-fun d!44991 () Bool)

(assert (=> d!44991 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217444) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457)))) lt!217444))))

(declare-fun bs!11027 () Bool)

(assert (= bs!11027 d!44991))

(declare-fun m!215189 () Bool)

(assert (=> bs!11027 m!215189))

(assert (=> b!139544 d!44991))

(declare-fun d!44993 () Bool)

(assert (=> d!44993 (validate_offset_bits!1 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217444)))

(declare-fun lt!218047 () Unit!8717)

(declare-fun choose!9 (BitStream!5028 array!6368 (_ BitVec 64) BitStream!5028) Unit!8717)

(assert (=> d!44993 (= lt!218047 (choose!9 (_2!6448 lt!217457) (buf!3298 (_2!6448 lt!217462)) lt!217444 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457)))))))

(assert (=> d!44993 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6448 lt!217457) (buf!3298 (_2!6448 lt!217462)) lt!217444) lt!218047)))

(declare-fun bs!11028 () Bool)

(assert (= bs!11028 d!44993))

(assert (=> bs!11028 m!214675))

(declare-fun m!215191 () Bool)

(assert (=> bs!11028 m!215191))

(assert (=> b!139544 d!44993))

(declare-fun b!139818 () Bool)

(declare-fun res!116571 () Bool)

(declare-fun e!93135 () Bool)

(assert (=> b!139818 (=> (not res!116571) (not e!93135))))

(declare-fun lt!218098 () tuple2!12248)

(assert (=> b!139818 (= res!116571 (isPrefixOf!0 (_2!6450 lt!218098) (_2!6448 lt!217462)))))

(declare-fun b!139819 () Bool)

(declare-fun res!116573 () Bool)

(assert (=> b!139819 (=> (not res!116573) (not e!93135))))

(assert (=> b!139819 (= res!116573 (isPrefixOf!0 (_1!6450 lt!218098) (_2!6448 lt!217457)))))

(declare-fun b!139820 () Bool)

(declare-fun lt!218095 () (_ BitVec 64))

(declare-fun lt!218100 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5028 (_ BitVec 64)) BitStream!5028)

(assert (=> b!139820 (= e!93135 (= (_1!6450 lt!218098) (withMovedBitIndex!0 (_2!6450 lt!218098) (bvsub lt!218100 lt!218095))))))

(assert (=> b!139820 (or (= (bvand lt!218100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218100 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218100 lt!218095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139820 (= lt!218095 (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217462))) (currentByte!6134 (_2!6448 lt!217462)) (currentBit!6129 (_2!6448 lt!217462))))))

(assert (=> b!139820 (= lt!218100 (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))))))

(declare-fun b!139821 () Bool)

(declare-fun e!93134 () Unit!8717)

(declare-fun lt!218089 () Unit!8717)

(assert (=> b!139821 (= e!93134 lt!218089)))

(declare-fun lt!218094 () (_ BitVec 64))

(assert (=> b!139821 (= lt!218094 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218103 () (_ BitVec 64))

(assert (=> b!139821 (= lt!218103 (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6368 array!6368 (_ BitVec 64) (_ BitVec 64)) Unit!8717)

(assert (=> b!139821 (= lt!218089 (arrayBitRangesEqSymmetric!0 (buf!3298 (_2!6448 lt!217457)) (buf!3298 (_2!6448 lt!217462)) lt!218094 lt!218103))))

(assert (=> b!139821 (arrayBitRangesEq!0 (buf!3298 (_2!6448 lt!217462)) (buf!3298 (_2!6448 lt!217457)) lt!218094 lt!218103)))

(declare-fun d!44995 () Bool)

(assert (=> d!44995 e!93135))

(declare-fun res!116572 () Bool)

(assert (=> d!44995 (=> (not res!116572) (not e!93135))))

(assert (=> d!44995 (= res!116572 (isPrefixOf!0 (_1!6450 lt!218098) (_2!6450 lt!218098)))))

(declare-fun lt!218106 () BitStream!5028)

(assert (=> d!44995 (= lt!218098 (tuple2!12249 lt!218106 (_2!6448 lt!217462)))))

(declare-fun lt!218093 () Unit!8717)

(declare-fun lt!218101 () Unit!8717)

(assert (=> d!44995 (= lt!218093 lt!218101)))

(assert (=> d!44995 (isPrefixOf!0 lt!218106 (_2!6448 lt!217462))))

(assert (=> d!44995 (= lt!218101 (lemmaIsPrefixTransitive!0 lt!218106 (_2!6448 lt!217462) (_2!6448 lt!217462)))))

(declare-fun lt!218090 () Unit!8717)

(declare-fun lt!218104 () Unit!8717)

(assert (=> d!44995 (= lt!218090 lt!218104)))

(assert (=> d!44995 (isPrefixOf!0 lt!218106 (_2!6448 lt!217462))))

(assert (=> d!44995 (= lt!218104 (lemmaIsPrefixTransitive!0 lt!218106 (_2!6448 lt!217457) (_2!6448 lt!217462)))))

(declare-fun lt!218092 () Unit!8717)

(assert (=> d!44995 (= lt!218092 e!93134)))

(declare-fun c!7772 () Bool)

(assert (=> d!44995 (= c!7772 (not (= (size!2882 (buf!3298 (_2!6448 lt!217457))) #b00000000000000000000000000000000)))))

(declare-fun lt!218097 () Unit!8717)

(declare-fun lt!218091 () Unit!8717)

(assert (=> d!44995 (= lt!218097 lt!218091)))

(assert (=> d!44995 (isPrefixOf!0 (_2!6448 lt!217462) (_2!6448 lt!217462))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5028) Unit!8717)

(assert (=> d!44995 (= lt!218091 (lemmaIsPrefixRefl!0 (_2!6448 lt!217462)))))

(declare-fun lt!218105 () Unit!8717)

(declare-fun lt!218099 () Unit!8717)

(assert (=> d!44995 (= lt!218105 lt!218099)))

(assert (=> d!44995 (= lt!218099 (lemmaIsPrefixRefl!0 (_2!6448 lt!217462)))))

(declare-fun lt!218107 () Unit!8717)

(declare-fun lt!218102 () Unit!8717)

(assert (=> d!44995 (= lt!218107 lt!218102)))

(assert (=> d!44995 (isPrefixOf!0 lt!218106 lt!218106)))

(assert (=> d!44995 (= lt!218102 (lemmaIsPrefixRefl!0 lt!218106))))

(declare-fun lt!218088 () Unit!8717)

(declare-fun lt!218096 () Unit!8717)

(assert (=> d!44995 (= lt!218088 lt!218096)))

(assert (=> d!44995 (isPrefixOf!0 (_2!6448 lt!217457) (_2!6448 lt!217457))))

(assert (=> d!44995 (= lt!218096 (lemmaIsPrefixRefl!0 (_2!6448 lt!217457)))))

(assert (=> d!44995 (= lt!218106 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))))))

(assert (=> d!44995 (isPrefixOf!0 (_2!6448 lt!217457) (_2!6448 lt!217462))))

(assert (=> d!44995 (= (reader!0 (_2!6448 lt!217457) (_2!6448 lt!217462)) lt!218098)))

(declare-fun b!139822 () Bool)

(declare-fun Unit!8727 () Unit!8717)

(assert (=> b!139822 (= e!93134 Unit!8727)))

(assert (= (and d!44995 c!7772) b!139821))

(assert (= (and d!44995 (not c!7772)) b!139822))

(assert (= (and d!44995 res!116572) b!139819))

(assert (= (and b!139819 res!116573) b!139818))

(assert (= (and b!139818 res!116571) b!139820))

(declare-fun m!215193 () Bool)

(assert (=> b!139819 m!215193))

(declare-fun m!215195 () Bool)

(assert (=> b!139818 m!215195))

(declare-fun m!215197 () Bool)

(assert (=> d!44995 m!215197))

(declare-fun m!215199 () Bool)

(assert (=> d!44995 m!215199))

(assert (=> d!44995 m!214605))

(declare-fun m!215201 () Bool)

(assert (=> d!44995 m!215201))

(declare-fun m!215203 () Bool)

(assert (=> d!44995 m!215203))

(declare-fun m!215205 () Bool)

(assert (=> d!44995 m!215205))

(declare-fun m!215207 () Bool)

(assert (=> d!44995 m!215207))

(declare-fun m!215209 () Bool)

(assert (=> d!44995 m!215209))

(declare-fun m!215211 () Bool)

(assert (=> d!44995 m!215211))

(declare-fun m!215213 () Bool)

(assert (=> d!44995 m!215213))

(declare-fun m!215215 () Bool)

(assert (=> d!44995 m!215215))

(assert (=> b!139821 m!214601))

(declare-fun m!215217 () Bool)

(assert (=> b!139821 m!215217))

(declare-fun m!215219 () Bool)

(assert (=> b!139821 m!215219))

(declare-fun m!215221 () Bool)

(assert (=> b!139820 m!215221))

(assert (=> b!139820 m!214679))

(assert (=> b!139820 m!214601))

(assert (=> b!139544 d!44995))

(declare-fun d!44997 () Bool)

(declare-datatypes ((tuple2!12264 0))(
  ( (tuple2!12265 (_1!6461 (_ BitVec 8)) (_2!6461 BitStream!5028)) )
))
(declare-fun lt!218110 () tuple2!12264)

(declare-fun readByte!0 (BitStream!5028) tuple2!12264)

(assert (=> d!44997 (= lt!218110 (readByte!0 lt!217440))))

(assert (=> d!44997 (= (readBytePure!0 lt!217440) (tuple2!12251 (_2!6461 lt!218110) (_1!6461 lt!218110)))))

(declare-fun bs!11029 () Bool)

(assert (= bs!11029 d!44997))

(declare-fun m!215223 () Bool)

(assert (=> bs!11029 m!215223))

(assert (=> b!139549 d!44997))

(declare-fun d!44999 () Bool)

(assert (=> d!44999 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217453)))

(declare-fun lt!218113 () Unit!8717)

(declare-fun choose!26 (BitStream!5028 array!6368 (_ BitVec 32) BitStream!5028) Unit!8717)

(assert (=> d!44999 (= lt!218113 (choose!26 (_2!6448 lt!217457) (buf!3298 (_2!6448 lt!217462)) lt!217453 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457)))))))

(assert (=> d!44999 (= (validateOffsetBytesContentIrrelevancyLemma!0 (_2!6448 lt!217457) (buf!3298 (_2!6448 lt!217462)) lt!217453) lt!218113)))

(declare-fun bs!11030 () Bool)

(assert (= bs!11030 d!44999))

(assert (=> bs!11030 m!214647))

(declare-fun m!215225 () Bool)

(assert (=> bs!11030 m!215225))

(assert (=> b!139549 d!44999))

(declare-fun d!45001 () Bool)

(declare-fun lt!218114 () tuple2!12264)

(assert (=> d!45001 (= lt!218114 (readByte!0 (_1!6450 lt!217449)))))

(assert (=> d!45001 (= (readBytePure!0 (_1!6450 lt!217449)) (tuple2!12251 (_2!6461 lt!218114) (_1!6461 lt!218114)))))

(declare-fun bs!11031 () Bool)

(assert (= bs!11031 d!45001))

(declare-fun m!215227 () Bool)

(assert (=> bs!11031 m!215227))

(assert (=> b!139549 d!45001))

(declare-fun d!45003 () Bool)

(declare-fun res!116574 () Bool)

(declare-fun e!93136 () Bool)

(assert (=> d!45003 (=> res!116574 e!93136)))

(assert (=> d!45003 (= res!116574 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45003 (= (arrayRangesEq!246 (_2!6449 lt!217447) (_2!6449 lt!217454) #b00000000000000000000000000000000 to!404) e!93136)))

(declare-fun b!139823 () Bool)

(declare-fun e!93137 () Bool)

(assert (=> b!139823 (= e!93136 e!93137)))

(declare-fun res!116575 () Bool)

(assert (=> b!139823 (=> (not res!116575) (not e!93137))))

(assert (=> b!139823 (= res!116575 (= (select (arr!3577 (_2!6449 lt!217447)) #b00000000000000000000000000000000) (select (arr!3577 (_2!6449 lt!217454)) #b00000000000000000000000000000000)))))

(declare-fun b!139824 () Bool)

(assert (=> b!139824 (= e!93137 (arrayRangesEq!246 (_2!6449 lt!217447) (_2!6449 lt!217454) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45003 (not res!116574)) b!139823))

(assert (= (and b!139823 res!116575) b!139824))

(declare-fun m!215229 () Bool)

(assert (=> b!139823 m!215229))

(declare-fun m!215231 () Bool)

(assert (=> b!139823 m!215231))

(declare-fun m!215233 () Bool)

(assert (=> b!139824 m!215233))

(assert (=> b!139549 d!45003))

(declare-fun d!45005 () Bool)

(assert (=> d!45005 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11032 () Bool)

(assert (= bs!11032 d!45005))

(declare-fun m!215235 () Bool)

(assert (=> bs!11032 m!215235))

(assert (=> b!139549 d!45005))

(declare-fun d!45007 () Bool)

(declare-fun lt!218115 () tuple2!12264)

(assert (=> d!45007 (= lt!218115 (readByte!0 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634))))))

(assert (=> d!45007 (= (readBytePure!0 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634))) (tuple2!12251 (_2!6461 lt!218115) (_1!6461 lt!218115)))))

(declare-fun bs!11033 () Bool)

(assert (= bs!11033 d!45007))

(declare-fun m!215237 () Bool)

(assert (=> bs!11033 m!215237))

(assert (=> b!139549 d!45007))

(declare-fun d!45009 () Bool)

(assert (=> d!45009 (isPrefixOf!0 thiss!1634 (_2!6448 lt!217462))))

(declare-fun lt!218118 () Unit!8717)

(declare-fun choose!30 (BitStream!5028 BitStream!5028 BitStream!5028) Unit!8717)

(assert (=> d!45009 (= lt!218118 (choose!30 thiss!1634 (_2!6448 lt!217457) (_2!6448 lt!217462)))))

(assert (=> d!45009 (isPrefixOf!0 thiss!1634 (_2!6448 lt!217457))))

(assert (=> d!45009 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6448 lt!217457) (_2!6448 lt!217462)) lt!218118)))

(declare-fun bs!11034 () Bool)

(assert (= bs!11034 d!45009))

(assert (=> bs!11034 m!214617))

(declare-fun m!215239 () Bool)

(assert (=> bs!11034 m!215239))

(assert (=> bs!11034 m!214661))

(assert (=> b!139549 d!45009))

(declare-fun d!45011 () Bool)

(declare-fun moveByteIndex!0 (BitStream!5028 (_ BitVec 32)) tuple2!12244)

(assert (=> d!45011 (= (withMovedByteIndex!0 (_1!6450 lt!217449) #b00000000000000000000000000000001) (_2!6448 (moveByteIndex!0 (_1!6450 lt!217449) #b00000000000000000000000000000001)))))

(declare-fun bs!11035 () Bool)

(assert (= bs!11035 d!45011))

(declare-fun m!215241 () Bool)

(assert (=> bs!11035 m!215241))

(assert (=> b!139549 d!45011))

(declare-fun d!45013 () Bool)

(declare-fun res!116576 () Bool)

(declare-fun e!93138 () Bool)

(assert (=> d!45013 (=> res!116576 e!93138)))

(assert (=> d!45013 (= res!116576 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45013 (= (arrayRangesEq!246 (_2!6449 lt!217447) (_2!6449 lt!217463) #b00000000000000000000000000000000 to!404) e!93138)))

(declare-fun b!139825 () Bool)

(declare-fun e!93139 () Bool)

(assert (=> b!139825 (= e!93138 e!93139)))

(declare-fun res!116577 () Bool)

(assert (=> b!139825 (=> (not res!116577) (not e!93139))))

(assert (=> b!139825 (= res!116577 (= (select (arr!3577 (_2!6449 lt!217447)) #b00000000000000000000000000000000) (select (arr!3577 (_2!6449 lt!217463)) #b00000000000000000000000000000000)))))

(declare-fun b!139826 () Bool)

(assert (=> b!139826 (= e!93139 (arrayRangesEq!246 (_2!6449 lt!217447) (_2!6449 lt!217463) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45013 (not res!116576)) b!139825))

(assert (= (and b!139825 res!116577) b!139826))

(assert (=> b!139825 m!215229))

(declare-fun m!215243 () Bool)

(assert (=> b!139825 m!215243))

(declare-fun m!215245 () Bool)

(assert (=> b!139826 m!215245))

(assert (=> b!139549 d!45013))

(declare-fun lt!218119 () tuple3!534)

(declare-fun d!45015 () Bool)

(assert (=> d!45015 (= lt!218119 (readByteArrayLoop!0 (_1!6450 lt!217443) lt!217448 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45015 (= (readByteArrayLoopPure!0 (_1!6450 lt!217443) lt!217448 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12247 (_2!6460 lt!218119) (_3!328 lt!218119)))))

(declare-fun bs!11036 () Bool)

(assert (= bs!11036 d!45015))

(declare-fun m!215247 () Bool)

(assert (=> bs!11036 m!215247))

(assert (=> b!139549 d!45015))

(declare-fun d!45017 () Bool)

(declare-fun res!116579 () Bool)

(declare-fun e!93140 () Bool)

(assert (=> d!45017 (=> (not res!116579) (not e!93140))))

(assert (=> d!45017 (= res!116579 (= (size!2882 (buf!3298 thiss!1634)) (size!2882 (buf!3298 (_2!6448 lt!217462)))))))

(assert (=> d!45017 (= (isPrefixOf!0 thiss!1634 (_2!6448 lt!217462)) e!93140)))

(declare-fun b!139827 () Bool)

(declare-fun res!116578 () Bool)

(assert (=> b!139827 (=> (not res!116578) (not e!93140))))

(assert (=> b!139827 (= res!116578 (bvsle (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)) (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217462))) (currentByte!6134 (_2!6448 lt!217462)) (currentBit!6129 (_2!6448 lt!217462)))))))

(declare-fun b!139828 () Bool)

(declare-fun e!93141 () Bool)

(assert (=> b!139828 (= e!93140 e!93141)))

(declare-fun res!116580 () Bool)

(assert (=> b!139828 (=> res!116580 e!93141)))

(assert (=> b!139828 (= res!116580 (= (size!2882 (buf!3298 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!139829 () Bool)

(assert (=> b!139829 (= e!93141 (arrayBitRangesEq!0 (buf!3298 thiss!1634) (buf!3298 (_2!6448 lt!217462)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634))))))

(assert (= (and d!45017 res!116579) b!139827))

(assert (= (and b!139827 res!116578) b!139828))

(assert (= (and b!139828 (not res!116580)) b!139829))

(assert (=> b!139827 m!214603))

(assert (=> b!139827 m!214679))

(assert (=> b!139829 m!214603))

(assert (=> b!139829 m!214603))

(declare-fun m!215249 () Bool)

(assert (=> b!139829 m!215249))

(assert (=> b!139549 d!45017))

(declare-fun d!45019 () Bool)

(declare-fun e!93144 () Bool)

(assert (=> d!45019 e!93144))

(declare-fun res!116583 () Bool)

(assert (=> d!45019 (=> (not res!116583) (not e!93144))))

(assert (=> d!45019 (= res!116583 (and (or (let ((rhs!3169 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3169 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3169) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45020 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45020 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45020 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3168 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3168 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3168) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!218127 () Unit!8717)

(declare-fun choose!57 (BitStream!5028 BitStream!5028 (_ BitVec 64) (_ BitVec 32)) Unit!8717)

(assert (=> d!45019 (= lt!218127 (choose!57 thiss!1634 (_2!6448 lt!217457) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45019 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6448 lt!217457) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!218127)))

(declare-fun lt!218126 () (_ BitVec 32))

(declare-fun b!139832 () Bool)

(assert (=> b!139832 (= e!93144 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) (bvsub (bvsub to!404 from!447) lt!218126)))))

(assert (=> b!139832 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!218126 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!218126) #b10000000000000000000000000000000)))))

(declare-fun lt!218128 () (_ BitVec 64))

(assert (=> b!139832 (= lt!218126 ((_ extract 31 0) lt!218128))))

(assert (=> b!139832 (and (bvslt lt!218128 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!218128 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!139832 (= lt!218128 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45019 res!116583) b!139832))

(declare-fun m!215251 () Bool)

(assert (=> d!45019 m!215251))

(declare-fun m!215253 () Bool)

(assert (=> b!139832 m!215253))

(assert (=> b!139549 d!45019))

(declare-fun d!45022 () Bool)

(declare-fun lt!218137 () tuple2!12246)

(declare-fun lt!218139 () tuple2!12246)

(assert (=> d!45022 (arrayRangesEq!246 (_2!6449 lt!218137) (_2!6449 lt!218139) #b00000000000000000000000000000000 to!404)))

(declare-fun lt!218138 () BitStream!5028)

(declare-fun lt!218140 () Unit!8717)

(declare-fun choose!35 (BitStream!5028 array!6368 (_ BitVec 32) (_ BitVec 32) tuple2!12246 array!6368 BitStream!5028 tuple2!12246 array!6368) Unit!8717)

(assert (=> d!45022 (= lt!218140 (choose!35 (_1!6450 lt!217449) arr!237 from!447 to!404 lt!218137 (_2!6449 lt!218137) lt!218138 lt!218139 (_2!6449 lt!218139)))))

(assert (=> d!45022 (= lt!218139 (readByteArrayLoopPure!0 lt!218138 (array!6369 (store (arr!3577 arr!237) from!447 (_2!6451 (readBytePure!0 (_1!6450 lt!217449)))) (size!2882 arr!237)) (bvadd from!447 #b00000000000000000000000000000001) to!404))))

(assert (=> d!45022 (= lt!218138 (withMovedByteIndex!0 (_1!6450 lt!217449) #b00000000000000000000000000000001))))

(assert (=> d!45022 (= lt!218137 (readByteArrayLoopPure!0 (_1!6450 lt!217449) arr!237 from!447 to!404))))

(assert (=> d!45022 (= (readByteArrayLoopArrayPrefixLemma!0 (_1!6450 lt!217449) arr!237 from!447 to!404) lt!218140)))

(declare-fun bs!11038 () Bool)

(assert (= bs!11038 d!45022))

(assert (=> bs!11038 m!214607))

(declare-fun m!215255 () Bool)

(assert (=> bs!11038 m!215255))

(assert (=> bs!11038 m!214639))

(declare-fun m!215257 () Bool)

(assert (=> bs!11038 m!215257))

(declare-fun m!215259 () Bool)

(assert (=> bs!11038 m!215259))

(assert (=> bs!11038 m!214609))

(declare-fun m!215261 () Bool)

(assert (=> bs!11038 m!215261))

(assert (=> b!139549 d!45022))

(declare-fun b!139843 () Bool)

(declare-fun e!93153 () Bool)

(declare-fun e!93152 () Bool)

(assert (=> b!139843 (= e!93153 e!93152)))

(declare-fun res!116597 () Bool)

(assert (=> b!139843 (=> (not res!116597) (not e!93152))))

(declare-fun lt!218163 () tuple2!12248)

(declare-fun lt!218160 () tuple2!12246)

(assert (=> b!139843 (= res!116597 (and (= (size!2882 (_2!6449 lt!218160)) (size!2882 arr!237)) (= (_1!6449 lt!218160) (_2!6450 lt!218163))))))

(assert (=> b!139843 (= lt!218160 (readByteArrayLoopPure!0 (_1!6450 lt!218163) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!218161 () Unit!8717)

(declare-fun lt!218164 () Unit!8717)

(assert (=> b!139843 (= lt!218161 lt!218164)))

(declare-fun lt!218159 () tuple2!12244)

(declare-fun lt!218167 () (_ BitVec 64))

(assert (=> b!139843 (validate_offset_bits!1 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!218159)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!218167)))

(assert (=> b!139843 (= lt!218164 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6448 lt!217457) (buf!3298 (_2!6448 lt!218159)) lt!218167))))

(declare-fun e!93151 () Bool)

(assert (=> b!139843 e!93151))

(declare-fun res!116595 () Bool)

(assert (=> b!139843 (=> (not res!116595) (not e!93151))))

(assert (=> b!139843 (= res!116595 (and (= (size!2882 (buf!3298 (_2!6448 lt!217457))) (size!2882 (buf!3298 (_2!6448 lt!218159)))) (bvsge lt!218167 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139843 (= lt!218167 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!139843 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!139843 (= lt!218163 (reader!0 (_2!6448 lt!217457) (_2!6448 lt!218159)))))

(declare-fun b!139844 () Bool)

(assert (=> b!139844 (= e!93152 (arrayRangesEq!246 arr!237 (_2!6449 lt!218160) #b00000000000000000000000000000000 to!404))))

(declare-fun b!139845 () Bool)

(assert (=> b!139845 (= e!93151 (validate_offset_bits!1 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!218167))))

(declare-fun d!45024 () Bool)

(assert (=> d!45024 e!93153))

(declare-fun res!116598 () Bool)

(assert (=> d!45024 (=> (not res!116598) (not e!93153))))

(assert (=> d!45024 (= res!116598 (= (size!2882 (buf!3298 (_2!6448 lt!217457))) (size!2882 (buf!3298 (_2!6448 lt!218159)))))))

(declare-fun choose!64 (BitStream!5028 array!6368 (_ BitVec 32) (_ BitVec 32)) tuple2!12244)

(assert (=> d!45024 (= lt!218159 (choose!64 (_2!6448 lt!217457) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45024 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2882 arr!237)))))

(assert (=> d!45024 (= (appendByteArrayLoop!0 (_2!6448 lt!217457) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!218159)))

(declare-fun b!139846 () Bool)

(declare-fun res!116594 () Bool)

(assert (=> b!139846 (=> (not res!116594) (not e!93153))))

(assert (=> b!139846 (= res!116594 (isPrefixOf!0 (_2!6448 lt!217457) (_2!6448 lt!218159)))))

(declare-fun b!139847 () Bool)

(declare-fun res!116596 () Bool)

(assert (=> b!139847 (=> (not res!116596) (not e!93153))))

(declare-fun lt!218166 () (_ BitVec 64))

(declare-fun lt!218165 () (_ BitVec 64))

(assert (=> b!139847 (= res!116596 (= (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!218159))) (currentByte!6134 (_2!6448 lt!218159)) (currentBit!6129 (_2!6448 lt!218159))) (bvadd lt!218166 lt!218165)))))

(assert (=> b!139847 (or (not (= (bvand lt!218166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218165 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218166 lt!218165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!218162 () (_ BitVec 64))

(assert (=> b!139847 (= lt!218165 (bvmul lt!218162 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!139847 (or (= lt!218162 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218162 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218162)))))

(assert (=> b!139847 (= lt!218162 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!139847 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!139847 (= lt!218166 (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))))))

(assert (= (and d!45024 res!116598) b!139847))

(assert (= (and b!139847 res!116596) b!139846))

(assert (= (and b!139846 res!116594) b!139843))

(assert (= (and b!139843 res!116595) b!139845))

(assert (= (and b!139843 res!116597) b!139844))

(declare-fun m!215263 () Bool)

(assert (=> b!139846 m!215263))

(declare-fun m!215265 () Bool)

(assert (=> d!45024 m!215265))

(declare-fun m!215267 () Bool)

(assert (=> b!139843 m!215267))

(declare-fun m!215269 () Bool)

(assert (=> b!139843 m!215269))

(declare-fun m!215271 () Bool)

(assert (=> b!139843 m!215271))

(declare-fun m!215273 () Bool)

(assert (=> b!139843 m!215273))

(declare-fun m!215275 () Bool)

(assert (=> b!139844 m!215275))

(declare-fun m!215277 () Bool)

(assert (=> b!139845 m!215277))

(declare-fun m!215279 () Bool)

(assert (=> b!139847 m!215279))

(assert (=> b!139847 m!214601))

(assert (=> b!139549 d!45024))

(declare-fun d!45026 () Bool)

(assert (=> d!45026 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217453) (bvsle ((_ sign_extend 32) lt!217453) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11039 () Bool)

(assert (= bs!11039 d!45026))

(assert (=> bs!11039 m!215189))

(assert (=> b!139549 d!45026))

(declare-fun d!45028 () Bool)

(declare-fun e!93156 () Bool)

(assert (=> d!45028 e!93156))

(declare-fun res!116601 () Bool)

(assert (=> d!45028 (=> (not res!116601) (not e!93156))))

(declare-fun lt!218177 () tuple2!12250)

(declare-fun lt!218179 () tuple2!12250)

(assert (=> d!45028 (= res!116601 (= (bitIndex!0 (size!2882 (buf!3298 (_1!6451 lt!218177))) (currentByte!6134 (_1!6451 lt!218177)) (currentBit!6129 (_1!6451 lt!218177))) (bitIndex!0 (size!2882 (buf!3298 (_1!6451 lt!218179))) (currentByte!6134 (_1!6451 lt!218179)) (currentBit!6129 (_1!6451 lt!218179)))))))

(declare-fun lt!218178 () Unit!8717)

(declare-fun lt!218176 () BitStream!5028)

(declare-fun choose!14 (BitStream!5028 BitStream!5028 BitStream!5028 tuple2!12250 tuple2!12250 BitStream!5028 (_ BitVec 8) tuple2!12250 tuple2!12250 BitStream!5028 (_ BitVec 8)) Unit!8717)

(assert (=> d!45028 (= lt!218178 (choose!14 lt!217440 (_2!6448 lt!217462) lt!218176 lt!218177 (tuple2!12251 (_1!6451 lt!218177) (_2!6451 lt!218177)) (_1!6451 lt!218177) (_2!6451 lt!218177) lt!218179 (tuple2!12251 (_1!6451 lt!218179) (_2!6451 lt!218179)) (_1!6451 lt!218179) (_2!6451 lt!218179)))))

(assert (=> d!45028 (= lt!218179 (readBytePure!0 lt!218176))))

(assert (=> d!45028 (= lt!218177 (readBytePure!0 lt!217440))))

(assert (=> d!45028 (= lt!218176 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 lt!217440) (currentBit!6129 lt!217440)))))

(assert (=> d!45028 (= (readBytePrefixLemma!0 lt!217440 (_2!6448 lt!217462)) lt!218178)))

(declare-fun b!139850 () Bool)

(assert (=> b!139850 (= e!93156 (= (_2!6451 lt!218177) (_2!6451 lt!218179)))))

(assert (= (and d!45028 res!116601) b!139850))

(assert (=> d!45028 m!214637))

(declare-fun m!215281 () Bool)

(assert (=> d!45028 m!215281))

(declare-fun m!215283 () Bool)

(assert (=> d!45028 m!215283))

(declare-fun m!215285 () Bool)

(assert (=> d!45028 m!215285))

(declare-fun m!215287 () Bool)

(assert (=> d!45028 m!215287))

(assert (=> b!139549 d!45028))

(declare-fun d!45030 () Bool)

(assert (=> d!45030 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457))) lt!217453) (bvsle ((_ sign_extend 32) lt!217453) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217457)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217457))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217457)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11040 () Bool)

(assert (= bs!11040 d!45030))

(assert (=> bs!11040 m!215181))

(assert (=> b!139549 d!45030))

(declare-fun b!139851 () Bool)

(declare-fun res!116602 () Bool)

(declare-fun e!93158 () Bool)

(assert (=> b!139851 (=> (not res!116602) (not e!93158))))

(declare-fun lt!218190 () tuple2!12248)

(assert (=> b!139851 (= res!116602 (isPrefixOf!0 (_2!6450 lt!218190) (_2!6448 lt!217462)))))

(declare-fun b!139852 () Bool)

(declare-fun res!116604 () Bool)

(assert (=> b!139852 (=> (not res!116604) (not e!93158))))

(assert (=> b!139852 (= res!116604 (isPrefixOf!0 (_1!6450 lt!218190) thiss!1634))))

(declare-fun lt!218192 () (_ BitVec 64))

(declare-fun b!139853 () Bool)

(declare-fun lt!218187 () (_ BitVec 64))

(assert (=> b!139853 (= e!93158 (= (_1!6450 lt!218190) (withMovedBitIndex!0 (_2!6450 lt!218190) (bvsub lt!218192 lt!218187))))))

(assert (=> b!139853 (or (= (bvand lt!218192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218187 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218192 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218192 lt!218187) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139853 (= lt!218187 (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217462))) (currentByte!6134 (_2!6448 lt!217462)) (currentBit!6129 (_2!6448 lt!217462))))))

(assert (=> b!139853 (= lt!218192 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(declare-fun b!139854 () Bool)

(declare-fun e!93157 () Unit!8717)

(declare-fun lt!218181 () Unit!8717)

(assert (=> b!139854 (= e!93157 lt!218181)))

(declare-fun lt!218186 () (_ BitVec 64))

(assert (=> b!139854 (= lt!218186 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218195 () (_ BitVec 64))

(assert (=> b!139854 (= lt!218195 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(assert (=> b!139854 (= lt!218181 (arrayBitRangesEqSymmetric!0 (buf!3298 thiss!1634) (buf!3298 (_2!6448 lt!217462)) lt!218186 lt!218195))))

(assert (=> b!139854 (arrayBitRangesEq!0 (buf!3298 (_2!6448 lt!217462)) (buf!3298 thiss!1634) lt!218186 lt!218195)))

(declare-fun d!45032 () Bool)

(assert (=> d!45032 e!93158))

(declare-fun res!116603 () Bool)

(assert (=> d!45032 (=> (not res!116603) (not e!93158))))

(assert (=> d!45032 (= res!116603 (isPrefixOf!0 (_1!6450 lt!218190) (_2!6450 lt!218190)))))

(declare-fun lt!218198 () BitStream!5028)

(assert (=> d!45032 (= lt!218190 (tuple2!12249 lt!218198 (_2!6448 lt!217462)))))

(declare-fun lt!218185 () Unit!8717)

(declare-fun lt!218193 () Unit!8717)

(assert (=> d!45032 (= lt!218185 lt!218193)))

(assert (=> d!45032 (isPrefixOf!0 lt!218198 (_2!6448 lt!217462))))

(assert (=> d!45032 (= lt!218193 (lemmaIsPrefixTransitive!0 lt!218198 (_2!6448 lt!217462) (_2!6448 lt!217462)))))

(declare-fun lt!218182 () Unit!8717)

(declare-fun lt!218196 () Unit!8717)

(assert (=> d!45032 (= lt!218182 lt!218196)))

(assert (=> d!45032 (isPrefixOf!0 lt!218198 (_2!6448 lt!217462))))

(assert (=> d!45032 (= lt!218196 (lemmaIsPrefixTransitive!0 lt!218198 thiss!1634 (_2!6448 lt!217462)))))

(declare-fun lt!218184 () Unit!8717)

(assert (=> d!45032 (= lt!218184 e!93157)))

(declare-fun c!7773 () Bool)

(assert (=> d!45032 (= c!7773 (not (= (size!2882 (buf!3298 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!218189 () Unit!8717)

(declare-fun lt!218183 () Unit!8717)

(assert (=> d!45032 (= lt!218189 lt!218183)))

(assert (=> d!45032 (isPrefixOf!0 (_2!6448 lt!217462) (_2!6448 lt!217462))))

(assert (=> d!45032 (= lt!218183 (lemmaIsPrefixRefl!0 (_2!6448 lt!217462)))))

(declare-fun lt!218197 () Unit!8717)

(declare-fun lt!218191 () Unit!8717)

(assert (=> d!45032 (= lt!218197 lt!218191)))

(assert (=> d!45032 (= lt!218191 (lemmaIsPrefixRefl!0 (_2!6448 lt!217462)))))

(declare-fun lt!218199 () Unit!8717)

(declare-fun lt!218194 () Unit!8717)

(assert (=> d!45032 (= lt!218199 lt!218194)))

(assert (=> d!45032 (isPrefixOf!0 lt!218198 lt!218198)))

(assert (=> d!45032 (= lt!218194 (lemmaIsPrefixRefl!0 lt!218198))))

(declare-fun lt!218180 () Unit!8717)

(declare-fun lt!218188 () Unit!8717)

(assert (=> d!45032 (= lt!218180 lt!218188)))

(assert (=> d!45032 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45032 (= lt!218188 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45032 (= lt!218198 (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(assert (=> d!45032 (isPrefixOf!0 thiss!1634 (_2!6448 lt!217462))))

(assert (=> d!45032 (= (reader!0 thiss!1634 (_2!6448 lt!217462)) lt!218190)))

(declare-fun b!139855 () Bool)

(declare-fun Unit!8728 () Unit!8717)

(assert (=> b!139855 (= e!93157 Unit!8728)))

(assert (= (and d!45032 c!7773) b!139854))

(assert (= (and d!45032 (not c!7773)) b!139855))

(assert (= (and d!45032 res!116603) b!139852))

(assert (= (and b!139852 res!116604) b!139851))

(assert (= (and b!139851 res!116602) b!139853))

(declare-fun m!215289 () Bool)

(assert (=> b!139852 m!215289))

(declare-fun m!215291 () Bool)

(assert (=> b!139851 m!215291))

(declare-fun m!215293 () Bool)

(assert (=> d!45032 m!215293))

(declare-fun m!215295 () Bool)

(assert (=> d!45032 m!215295))

(assert (=> d!45032 m!214617))

(assert (=> d!45032 m!215201))

(declare-fun m!215297 () Bool)

(assert (=> d!45032 m!215297))

(declare-fun m!215299 () Bool)

(assert (=> d!45032 m!215299))

(declare-fun m!215301 () Bool)

(assert (=> d!45032 m!215301))

(declare-fun m!215303 () Bool)

(assert (=> d!45032 m!215303))

(assert (=> d!45032 m!215211))

(declare-fun m!215305 () Bool)

(assert (=> d!45032 m!215305))

(declare-fun m!215307 () Bool)

(assert (=> d!45032 m!215307))

(assert (=> b!139854 m!214603))

(declare-fun m!215309 () Bool)

(assert (=> b!139854 m!215309))

(declare-fun m!215311 () Bool)

(assert (=> b!139854 m!215311))

(declare-fun m!215313 () Bool)

(assert (=> b!139853 m!215313))

(assert (=> b!139853 m!214679))

(assert (=> b!139853 m!214603))

(assert (=> b!139549 d!45032))

(declare-fun d!45034 () Bool)

(declare-fun e!93159 () Bool)

(assert (=> d!45034 e!93159))

(declare-fun res!116605 () Bool)

(assert (=> d!45034 (=> (not res!116605) (not e!93159))))

(declare-fun lt!218201 () (_ BitVec 64))

(declare-fun lt!218205 () (_ BitVec 64))

(declare-fun lt!218202 () (_ BitVec 64))

(assert (=> d!45034 (= res!116605 (= lt!218202 (bvsub lt!218205 lt!218201)))))

(assert (=> d!45034 (or (= (bvand lt!218205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218205 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218205 lt!218201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45034 (= lt!218201 (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_1!6451 lt!217460)))) ((_ sign_extend 32) (currentByte!6134 (_1!6451 lt!217460))) ((_ sign_extend 32) (currentBit!6129 (_1!6451 lt!217460)))))))

(declare-fun lt!218203 () (_ BitVec 64))

(declare-fun lt!218200 () (_ BitVec 64))

(assert (=> d!45034 (= lt!218205 (bvmul lt!218203 lt!218200))))

(assert (=> d!45034 (or (= lt!218203 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218200 (bvsdiv (bvmul lt!218203 lt!218200) lt!218203)))))

(assert (=> d!45034 (= lt!218200 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45034 (= lt!218203 ((_ sign_extend 32) (size!2882 (buf!3298 (_1!6451 lt!217460)))))))

(assert (=> d!45034 (= lt!218202 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6134 (_1!6451 lt!217460))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6129 (_1!6451 lt!217460)))))))

(assert (=> d!45034 (invariant!0 (currentBit!6129 (_1!6451 lt!217460)) (currentByte!6134 (_1!6451 lt!217460)) (size!2882 (buf!3298 (_1!6451 lt!217460))))))

(assert (=> d!45034 (= (bitIndex!0 (size!2882 (buf!3298 (_1!6451 lt!217460))) (currentByte!6134 (_1!6451 lt!217460)) (currentBit!6129 (_1!6451 lt!217460))) lt!218202)))

(declare-fun b!139856 () Bool)

(declare-fun res!116606 () Bool)

(assert (=> b!139856 (=> (not res!116606) (not e!93159))))

(assert (=> b!139856 (= res!116606 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218202))))

(declare-fun b!139857 () Bool)

(declare-fun lt!218204 () (_ BitVec 64))

(assert (=> b!139857 (= e!93159 (bvsle lt!218202 (bvmul lt!218204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139857 (or (= lt!218204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218204)))))

(assert (=> b!139857 (= lt!218204 ((_ sign_extend 32) (size!2882 (buf!3298 (_1!6451 lt!217460)))))))

(assert (= (and d!45034 res!116605) b!139856))

(assert (= (and b!139856 res!116606) b!139857))

(declare-fun m!215315 () Bool)

(assert (=> d!45034 m!215315))

(declare-fun m!215317 () Bool)

(assert (=> d!45034 m!215317))

(assert (=> b!139549 d!45034))

(declare-fun d!45036 () Bool)

(declare-fun e!93160 () Bool)

(assert (=> d!45036 e!93160))

(declare-fun res!116607 () Bool)

(assert (=> d!45036 (=> (not res!116607) (not e!93160))))

(declare-fun lt!218208 () (_ BitVec 64))

(declare-fun lt!218207 () (_ BitVec 64))

(declare-fun lt!218211 () (_ BitVec 64))

(assert (=> d!45036 (= res!116607 (= lt!218208 (bvsub lt!218211 lt!218207)))))

(assert (=> d!45036 (or (= (bvand lt!218211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218207 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218211 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218211 lt!218207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45036 (= lt!218207 (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_1!6451 lt!217456)))) ((_ sign_extend 32) (currentByte!6134 (_1!6451 lt!217456))) ((_ sign_extend 32) (currentBit!6129 (_1!6451 lt!217456)))))))

(declare-fun lt!218209 () (_ BitVec 64))

(declare-fun lt!218206 () (_ BitVec 64))

(assert (=> d!45036 (= lt!218211 (bvmul lt!218209 lt!218206))))

(assert (=> d!45036 (or (= lt!218209 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218206 (bvsdiv (bvmul lt!218209 lt!218206) lt!218209)))))

(assert (=> d!45036 (= lt!218206 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45036 (= lt!218209 ((_ sign_extend 32) (size!2882 (buf!3298 (_1!6451 lt!217456)))))))

(assert (=> d!45036 (= lt!218208 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6134 (_1!6451 lt!217456))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6129 (_1!6451 lt!217456)))))))

(assert (=> d!45036 (invariant!0 (currentBit!6129 (_1!6451 lt!217456)) (currentByte!6134 (_1!6451 lt!217456)) (size!2882 (buf!3298 (_1!6451 lt!217456))))))

(assert (=> d!45036 (= (bitIndex!0 (size!2882 (buf!3298 (_1!6451 lt!217456))) (currentByte!6134 (_1!6451 lt!217456)) (currentBit!6129 (_1!6451 lt!217456))) lt!218208)))

(declare-fun b!139858 () Bool)

(declare-fun res!116608 () Bool)

(assert (=> b!139858 (=> (not res!116608) (not e!93160))))

(assert (=> b!139858 (= res!116608 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218208))))

(declare-fun b!139859 () Bool)

(declare-fun lt!218210 () (_ BitVec 64))

(assert (=> b!139859 (= e!93160 (bvsle lt!218208 (bvmul lt!218210 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139859 (or (= lt!218210 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218210 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218210)))))

(assert (=> b!139859 (= lt!218210 ((_ sign_extend 32) (size!2882 (buf!3298 (_1!6451 lt!217456)))))))

(assert (= (and d!45036 res!116607) b!139858))

(assert (= (and b!139858 res!116608) b!139859))

(declare-fun m!215319 () Bool)

(assert (=> d!45036 m!215319))

(declare-fun m!215321 () Bool)

(assert (=> d!45036 m!215321))

(assert (=> b!139549 d!45036))

(declare-fun lt!218212 () tuple3!534)

(declare-fun d!45038 () Bool)

(assert (=> d!45038 (= lt!218212 (readByteArrayLoop!0 (_1!6450 lt!217449) arr!237 from!447 to!404))))

(assert (=> d!45038 (= (readByteArrayLoopPure!0 (_1!6450 lt!217449) arr!237 from!447 to!404) (tuple2!12247 (_2!6460 lt!218212) (_3!328 lt!218212)))))

(declare-fun bs!11041 () Bool)

(assert (= bs!11041 d!45038))

(declare-fun m!215323 () Bool)

(assert (=> bs!11041 m!215323))

(assert (=> b!139549 d!45038))

(declare-fun d!45040 () Bool)

(declare-fun e!93163 () Bool)

(assert (=> d!45040 e!93163))

(declare-fun res!116615 () Bool)

(assert (=> d!45040 (=> (not res!116615) (not e!93163))))

(declare-fun lt!218227 () tuple2!12244)

(assert (=> d!45040 (= res!116615 (= (size!2882 (buf!3298 thiss!1634)) (size!2882 (buf!3298 (_2!6448 lt!218227)))))))

(declare-fun choose!6 (BitStream!5028 (_ BitVec 8)) tuple2!12244)

(assert (=> d!45040 (= lt!218227 (choose!6 thiss!1634 (select (arr!3577 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45040 (validate_offset_byte!0 ((_ sign_extend 32) (size!2882 (buf!3298 thiss!1634))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634)))))

(assert (=> d!45040 (= (appendByte!0 thiss!1634 (select (arr!3577 arr!237) from!447)) lt!218227)))

(declare-fun b!139866 () Bool)

(declare-fun res!116616 () Bool)

(assert (=> b!139866 (=> (not res!116616) (not e!93163))))

(declare-fun lt!218226 () (_ BitVec 64))

(declare-fun lt!218223 () (_ BitVec 64))

(assert (=> b!139866 (= res!116616 (= (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!218227))) (currentByte!6134 (_2!6448 lt!218227)) (currentBit!6129 (_2!6448 lt!218227))) (bvadd lt!218223 lt!218226)))))

(assert (=> b!139866 (or (not (= (bvand lt!218223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218226 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!218223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!218223 lt!218226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139866 (= lt!218226 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!139866 (= lt!218223 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(declare-fun b!139867 () Bool)

(declare-fun res!116617 () Bool)

(assert (=> b!139867 (=> (not res!116617) (not e!93163))))

(assert (=> b!139867 (= res!116617 (isPrefixOf!0 thiss!1634 (_2!6448 lt!218227)))))

(declare-fun b!139868 () Bool)

(declare-fun lt!218224 () tuple2!12250)

(declare-fun lt!218225 () tuple2!12248)

(assert (=> b!139868 (= e!93163 (and (= (_2!6451 lt!218224) (select (arr!3577 arr!237) from!447)) (= (_1!6451 lt!218224) (_2!6450 lt!218225))))))

(assert (=> b!139868 (= lt!218224 (readBytePure!0 (_1!6450 lt!218225)))))

(assert (=> b!139868 (= lt!218225 (reader!0 thiss!1634 (_2!6448 lt!218227)))))

(assert (= (and d!45040 res!116615) b!139866))

(assert (= (and b!139866 res!116616) b!139867))

(assert (= (and b!139867 res!116617) b!139868))

(assert (=> d!45040 m!214623))

(declare-fun m!215325 () Bool)

(assert (=> d!45040 m!215325))

(declare-fun m!215327 () Bool)

(assert (=> d!45040 m!215327))

(declare-fun m!215329 () Bool)

(assert (=> b!139866 m!215329))

(assert (=> b!139866 m!214603))

(declare-fun m!215331 () Bool)

(assert (=> b!139867 m!215331))

(declare-fun m!215333 () Bool)

(assert (=> b!139868 m!215333))

(declare-fun m!215335 () Bool)

(assert (=> b!139868 m!215335))

(assert (=> b!139549 d!45040))

(declare-fun d!45042 () Bool)

(declare-fun lt!218228 () tuple3!534)

(assert (=> d!45042 (= lt!218228 (readByteArrayLoop!0 (withMovedByteIndex!0 (_1!6450 lt!217449) #b00000000000000000000000000000001) lt!217448 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45042 (= (readByteArrayLoopPure!0 (withMovedByteIndex!0 (_1!6450 lt!217449) #b00000000000000000000000000000001) lt!217448 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12247 (_2!6460 lt!218228) (_3!328 lt!218228)))))

(declare-fun bs!11042 () Bool)

(assert (= bs!11042 d!45042))

(assert (=> bs!11042 m!214607))

(declare-fun m!215337 () Bool)

(assert (=> bs!11042 m!215337))

(assert (=> b!139549 d!45042))

(declare-fun d!45044 () Bool)

(assert (=> d!45044 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 thiss!1634)) ((_ sign_extend 32) (currentBit!6129 thiss!1634)) (bvsub to!404 from!447))))

(declare-fun lt!218229 () Unit!8717)

(assert (=> d!45044 (= lt!218229 (choose!26 thiss!1634 (buf!3298 (_2!6448 lt!217462)) (bvsub to!404 from!447) (BitStream!5029 (buf!3298 (_2!6448 lt!217462)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634))))))

(assert (=> d!45044 (= (validateOffsetBytesContentIrrelevancyLemma!0 thiss!1634 (buf!3298 (_2!6448 lt!217462)) (bvsub to!404 from!447)) lt!218229)))

(declare-fun bs!11043 () Bool)

(assert (= bs!11043 d!45044))

(assert (=> bs!11043 m!214645))

(declare-fun m!215339 () Bool)

(assert (=> bs!11043 m!215339))

(assert (=> b!139549 d!45044))

(assert (=> b!139549 d!44995))

(declare-fun d!45046 () Bool)

(assert (=> d!45046 (= (array_inv!2671 arr!237) (bvsge (size!2882 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27124 d!45046))

(declare-fun d!45048 () Bool)

(assert (=> d!45048 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6129 thiss!1634) (currentByte!6134 thiss!1634) (size!2882 (buf!3298 thiss!1634))))))

(declare-fun bs!11044 () Bool)

(assert (= bs!11044 d!45048))

(assert (=> bs!11044 m!214681))

(assert (=> start!27124 d!45048))

(declare-fun d!45050 () Bool)

(declare-fun e!93164 () Bool)

(assert (=> d!45050 e!93164))

(declare-fun res!116618 () Bool)

(assert (=> d!45050 (=> (not res!116618) (not e!93164))))

(declare-fun lt!218232 () (_ BitVec 64))

(declare-fun lt!218235 () (_ BitVec 64))

(declare-fun lt!218231 () (_ BitVec 64))

(assert (=> d!45050 (= res!116618 (= lt!218232 (bvsub lt!218235 lt!218231)))))

(assert (=> d!45050 (or (= (bvand lt!218235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218231 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218235 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218235 lt!218231) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45050 (= lt!218231 (remainingBits!0 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))) ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217462))) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217462)))))))

(declare-fun lt!218233 () (_ BitVec 64))

(declare-fun lt!218230 () (_ BitVec 64))

(assert (=> d!45050 (= lt!218235 (bvmul lt!218233 lt!218230))))

(assert (=> d!45050 (or (= lt!218233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!218230 (bvsdiv (bvmul lt!218233 lt!218230) lt!218233)))))

(assert (=> d!45050 (= lt!218230 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45050 (= lt!218233 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))))))

(assert (=> d!45050 (= lt!218232 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6134 (_2!6448 lt!217462))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6129 (_2!6448 lt!217462)))))))

(assert (=> d!45050 (invariant!0 (currentBit!6129 (_2!6448 lt!217462)) (currentByte!6134 (_2!6448 lt!217462)) (size!2882 (buf!3298 (_2!6448 lt!217462))))))

(assert (=> d!45050 (= (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217462))) (currentByte!6134 (_2!6448 lt!217462)) (currentBit!6129 (_2!6448 lt!217462))) lt!218232)))

(declare-fun b!139869 () Bool)

(declare-fun res!116619 () Bool)

(assert (=> b!139869 (=> (not res!116619) (not e!93164))))

(assert (=> b!139869 (= res!116619 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!218232))))

(declare-fun b!139870 () Bool)

(declare-fun lt!218234 () (_ BitVec 64))

(assert (=> b!139870 (= e!93164 (bvsle lt!218232 (bvmul lt!218234 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!139870 (or (= lt!218234 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!218234 #b0000000000000000000000000000000000000000000000000000000000001000) lt!218234)))))

(assert (=> b!139870 (= lt!218234 ((_ sign_extend 32) (size!2882 (buf!3298 (_2!6448 lt!217462)))))))

(assert (= (and d!45050 res!116618) b!139869))

(assert (= (and b!139869 res!116619) b!139870))

(declare-fun m!215341 () Bool)

(assert (=> d!45050 m!215341))

(declare-fun m!215343 () Bool)

(assert (=> d!45050 m!215343))

(assert (=> b!139548 d!45050))

(assert (=> b!139548 d!44981))

(declare-fun d!45052 () Bool)

(assert (=> d!45052 (= (array_inv!2671 (buf!3298 thiss!1634)) (bvsge (size!2882 (buf!3298 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!139547 d!45052))

(declare-fun d!45054 () Bool)

(declare-fun res!116621 () Bool)

(declare-fun e!93165 () Bool)

(assert (=> d!45054 (=> (not res!116621) (not e!93165))))

(assert (=> d!45054 (= res!116621 (= (size!2882 (buf!3298 (_2!6448 lt!217457))) (size!2882 (buf!3298 (_2!6448 lt!217462)))))))

(assert (=> d!45054 (= (isPrefixOf!0 (_2!6448 lt!217457) (_2!6448 lt!217462)) e!93165)))

(declare-fun b!139871 () Bool)

(declare-fun res!116620 () Bool)

(assert (=> b!139871 (=> (not res!116620) (not e!93165))))

(assert (=> b!139871 (= res!116620 (bvsle (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))) (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217462))) (currentByte!6134 (_2!6448 lt!217462)) (currentBit!6129 (_2!6448 lt!217462)))))))

(declare-fun b!139872 () Bool)

(declare-fun e!93166 () Bool)

(assert (=> b!139872 (= e!93165 e!93166)))

(declare-fun res!116622 () Bool)

(assert (=> b!139872 (=> res!116622 e!93166)))

(assert (=> b!139872 (= res!116622 (= (size!2882 (buf!3298 (_2!6448 lt!217457))) #b00000000000000000000000000000000))))

(declare-fun b!139873 () Bool)

(assert (=> b!139873 (= e!93166 (arrayBitRangesEq!0 (buf!3298 (_2!6448 lt!217457)) (buf!3298 (_2!6448 lt!217462)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457)))))))

(assert (= (and d!45054 res!116621) b!139871))

(assert (= (and b!139871 res!116620) b!139872))

(assert (= (and b!139872 (not res!116622)) b!139873))

(assert (=> b!139871 m!214601))

(assert (=> b!139871 m!214679))

(assert (=> b!139873 m!214601))

(assert (=> b!139873 m!214601))

(declare-fun m!215345 () Bool)

(assert (=> b!139873 m!215345))

(assert (=> b!139541 d!45054))

(declare-fun d!45056 () Bool)

(declare-fun lt!218236 () tuple2!12264)

(assert (=> d!45056 (= lt!218236 (readByte!0 (_1!6450 lt!217450)))))

(assert (=> d!45056 (= (readBytePure!0 (_1!6450 lt!217450)) (tuple2!12251 (_2!6461 lt!218236) (_1!6461 lt!218236)))))

(declare-fun bs!11045 () Bool)

(assert (= bs!11045 d!45056))

(declare-fun m!215347 () Bool)

(assert (=> bs!11045 m!215347))

(assert (=> b!139551 d!45056))

(declare-fun b!139874 () Bool)

(declare-fun res!116623 () Bool)

(declare-fun e!93168 () Bool)

(assert (=> b!139874 (=> (not res!116623) (not e!93168))))

(declare-fun lt!218247 () tuple2!12248)

(assert (=> b!139874 (= res!116623 (isPrefixOf!0 (_2!6450 lt!218247) (_2!6448 lt!217457)))))

(declare-fun b!139875 () Bool)

(declare-fun res!116625 () Bool)

(assert (=> b!139875 (=> (not res!116625) (not e!93168))))

(assert (=> b!139875 (= res!116625 (isPrefixOf!0 (_1!6450 lt!218247) thiss!1634))))

(declare-fun lt!218249 () (_ BitVec 64))

(declare-fun lt!218244 () (_ BitVec 64))

(declare-fun b!139876 () Bool)

(assert (=> b!139876 (= e!93168 (= (_1!6450 lt!218247) (withMovedBitIndex!0 (_2!6450 lt!218247) (bvsub lt!218249 lt!218244))))))

(assert (=> b!139876 (or (= (bvand lt!218249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!218244 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!218249 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!218249 lt!218244) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!139876 (= lt!218244 (bitIndex!0 (size!2882 (buf!3298 (_2!6448 lt!217457))) (currentByte!6134 (_2!6448 lt!217457)) (currentBit!6129 (_2!6448 lt!217457))))))

(assert (=> b!139876 (= lt!218249 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(declare-fun b!139877 () Bool)

(declare-fun e!93167 () Unit!8717)

(declare-fun lt!218238 () Unit!8717)

(assert (=> b!139877 (= e!93167 lt!218238)))

(declare-fun lt!218243 () (_ BitVec 64))

(assert (=> b!139877 (= lt!218243 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!218252 () (_ BitVec 64))

(assert (=> b!139877 (= lt!218252 (bitIndex!0 (size!2882 (buf!3298 thiss!1634)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(assert (=> b!139877 (= lt!218238 (arrayBitRangesEqSymmetric!0 (buf!3298 thiss!1634) (buf!3298 (_2!6448 lt!217457)) lt!218243 lt!218252))))

(assert (=> b!139877 (arrayBitRangesEq!0 (buf!3298 (_2!6448 lt!217457)) (buf!3298 thiss!1634) lt!218243 lt!218252)))

(declare-fun d!45058 () Bool)

(assert (=> d!45058 e!93168))

(declare-fun res!116624 () Bool)

(assert (=> d!45058 (=> (not res!116624) (not e!93168))))

(assert (=> d!45058 (= res!116624 (isPrefixOf!0 (_1!6450 lt!218247) (_2!6450 lt!218247)))))

(declare-fun lt!218255 () BitStream!5028)

(assert (=> d!45058 (= lt!218247 (tuple2!12249 lt!218255 (_2!6448 lt!217457)))))

(declare-fun lt!218242 () Unit!8717)

(declare-fun lt!218250 () Unit!8717)

(assert (=> d!45058 (= lt!218242 lt!218250)))

(assert (=> d!45058 (isPrefixOf!0 lt!218255 (_2!6448 lt!217457))))

(assert (=> d!45058 (= lt!218250 (lemmaIsPrefixTransitive!0 lt!218255 (_2!6448 lt!217457) (_2!6448 lt!217457)))))

(declare-fun lt!218239 () Unit!8717)

(declare-fun lt!218253 () Unit!8717)

(assert (=> d!45058 (= lt!218239 lt!218253)))

(assert (=> d!45058 (isPrefixOf!0 lt!218255 (_2!6448 lt!217457))))

(assert (=> d!45058 (= lt!218253 (lemmaIsPrefixTransitive!0 lt!218255 thiss!1634 (_2!6448 lt!217457)))))

(declare-fun lt!218241 () Unit!8717)

(assert (=> d!45058 (= lt!218241 e!93167)))

(declare-fun c!7774 () Bool)

(assert (=> d!45058 (= c!7774 (not (= (size!2882 (buf!3298 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!218246 () Unit!8717)

(declare-fun lt!218240 () Unit!8717)

(assert (=> d!45058 (= lt!218246 lt!218240)))

(assert (=> d!45058 (isPrefixOf!0 (_2!6448 lt!217457) (_2!6448 lt!217457))))

(assert (=> d!45058 (= lt!218240 (lemmaIsPrefixRefl!0 (_2!6448 lt!217457)))))

(declare-fun lt!218254 () Unit!8717)

(declare-fun lt!218248 () Unit!8717)

(assert (=> d!45058 (= lt!218254 lt!218248)))

(assert (=> d!45058 (= lt!218248 (lemmaIsPrefixRefl!0 (_2!6448 lt!217457)))))

(declare-fun lt!218256 () Unit!8717)

(declare-fun lt!218251 () Unit!8717)

(assert (=> d!45058 (= lt!218256 lt!218251)))

(assert (=> d!45058 (isPrefixOf!0 lt!218255 lt!218255)))

(assert (=> d!45058 (= lt!218251 (lemmaIsPrefixRefl!0 lt!218255))))

(declare-fun lt!218237 () Unit!8717)

(declare-fun lt!218245 () Unit!8717)

(assert (=> d!45058 (= lt!218237 lt!218245)))

(assert (=> d!45058 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45058 (= lt!218245 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45058 (= lt!218255 (BitStream!5029 (buf!3298 (_2!6448 lt!217457)) (currentByte!6134 thiss!1634) (currentBit!6129 thiss!1634)))))

(assert (=> d!45058 (isPrefixOf!0 thiss!1634 (_2!6448 lt!217457))))

(assert (=> d!45058 (= (reader!0 thiss!1634 (_2!6448 lt!217457)) lt!218247)))

(declare-fun b!139878 () Bool)

(declare-fun Unit!8729 () Unit!8717)

(assert (=> b!139878 (= e!93167 Unit!8729)))

(assert (= (and d!45058 c!7774) b!139877))

(assert (= (and d!45058 (not c!7774)) b!139878))

(assert (= (and d!45058 res!116624) b!139875))

(assert (= (and b!139875 res!116625) b!139874))

(assert (= (and b!139874 res!116623) b!139876))

(declare-fun m!215349 () Bool)

(assert (=> b!139875 m!215349))

(declare-fun m!215351 () Bool)

(assert (=> b!139874 m!215351))

(assert (=> d!45058 m!215293))

(declare-fun m!215353 () Bool)

(assert (=> d!45058 m!215353))

(assert (=> d!45058 m!214661))

(assert (=> d!45058 m!215215))

(declare-fun m!215355 () Bool)

(assert (=> d!45058 m!215355))

(declare-fun m!215357 () Bool)

(assert (=> d!45058 m!215357))

(declare-fun m!215359 () Bool)

(assert (=> d!45058 m!215359))

(declare-fun m!215361 () Bool)

(assert (=> d!45058 m!215361))

(assert (=> d!45058 m!215197))

(declare-fun m!215363 () Bool)

(assert (=> d!45058 m!215363))

(assert (=> d!45058 m!215307))

(assert (=> b!139877 m!214603))

(declare-fun m!215365 () Bool)

(assert (=> b!139877 m!215365))

(declare-fun m!215367 () Bool)

(assert (=> b!139877 m!215367))

(declare-fun m!215369 () Bool)

(assert (=> b!139876 m!215369))

(assert (=> b!139876 m!214601))

(assert (=> b!139876 m!214603))

(assert (=> b!139551 d!45058))

(declare-fun d!45060 () Bool)

(assert (=> d!45060 (= (invariant!0 (currentBit!6129 thiss!1634) (currentByte!6134 thiss!1634) (size!2882 (buf!3298 (_2!6448 lt!217457)))) (and (bvsge (currentBit!6129 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6129 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6134 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6134 thiss!1634) (size!2882 (buf!3298 (_2!6448 lt!217457)))) (and (= (currentBit!6129 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6134 thiss!1634) (size!2882 (buf!3298 (_2!6448 lt!217457))))))))))

(assert (=> b!139550 d!45060))

(check-sat (not b!139829) (not d!44997) (not b!139843) (not d!45038) (not d!44989) (not d!44993) (not d!45019) (not d!45011) (not b!139868) (not d!45044) (not b!139851) (not d!45028) (not b!139845) (not b!139832) (not d!45058) (not b!139877) (not d!45015) (not d!45009) (not b!139847) (not d!44991) (not d!45034) (not b!139871) (not d!44999) (not b!139818) (not b!139854) (not b!139873) (not b!139791) (not b!139867) (not d!45005) (not b!139846) (not d!45007) (not b!139820) (not b!139799) (not d!45056) (not d!44983) (not b!139866) (not d!44995) (not b!139853) (not b!139875) (not d!45042) (not d!45036) (not b!139824) (not b!139827) (not b!139852) (not b!139821) (not b!139844) (not d!45040) (not d!45048) (not d!45001) (not b!139793) (not d!45032) (not b!139826) (not d!45050) (not d!44987) (not d!44981) (not d!45026) (not d!45030) (not b!139876) (not d!45022) (not b!139819) (not d!45024) (not b!139874))
(check-sat)
