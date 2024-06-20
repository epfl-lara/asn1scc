; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40422 () Bool)

(assert start!40422)

(declare-fun b!185629 () Bool)

(declare-fun res!154521 () Bool)

(declare-fun e!128506 () Bool)

(assert (=> b!185629 (=> (not res!154521) (not e!128506))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!185629 (= res!154521 (not (= i!590 nBits!348)))))

(declare-fun b!185630 () Bool)

(declare-fun res!154506 () Bool)

(assert (=> b!185630 (=> (not res!154506) (not e!128506))))

(declare-datatypes ((array!9809 0))(
  ( (array!9810 (arr!5256 (Array (_ BitVec 32) (_ BitVec 8))) (size!4326 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7760 0))(
  ( (BitStream!7761 (buf!4786 array!9809) (currentByte!9030 (_ BitVec 32)) (currentBit!9025 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7760)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!185630 (= res!154506 (invariant!0 (currentBit!9025 thiss!1204) (currentByte!9030 thiss!1204) (size!4326 (buf!4786 thiss!1204))))))

(declare-fun b!185631 () Bool)

(declare-fun e!128507 () Bool)

(declare-fun e!128511 () Bool)

(assert (=> b!185631 (= e!128507 e!128511)))

(declare-fun res!154508 () Bool)

(assert (=> b!185631 (=> (not res!154508) (not e!128511))))

(declare-fun lt!286306 () (_ BitVec 64))

(declare-fun lt!286291 () (_ BitVec 64))

(assert (=> b!185631 (= res!154508 (= lt!286306 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286291)))))

(declare-datatypes ((Unit!13282 0))(
  ( (Unit!13283) )
))
(declare-datatypes ((tuple2!16064 0))(
  ( (tuple2!16065 (_1!8677 Unit!13282) (_2!8677 BitStream!7760)) )
))
(declare-fun lt!286293 () tuple2!16064)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185631 (= lt!286306 (bitIndex!0 (size!4326 (buf!4786 (_2!8677 lt!286293))) (currentByte!9030 (_2!8677 lt!286293)) (currentBit!9025 (_2!8677 lt!286293))))))

(assert (=> b!185631 (= lt!286291 (bitIndex!0 (size!4326 (buf!4786 thiss!1204)) (currentByte!9030 thiss!1204) (currentBit!9025 thiss!1204)))))

(declare-fun b!185632 () Bool)

(declare-fun e!128512 () Bool)

(declare-datatypes ((tuple2!16066 0))(
  ( (tuple2!16067 (_1!8678 BitStream!7760) (_2!8678 Bool)) )
))
(declare-fun lt!286295 () tuple2!16066)

(assert (=> b!185632 (= e!128512 (= (bitIndex!0 (size!4326 (buf!4786 (_1!8678 lt!286295))) (currentByte!9030 (_1!8678 lt!286295)) (currentBit!9025 (_1!8678 lt!286295))) lt!286306))))

(declare-fun b!185633 () Bool)

(declare-fun res!154513 () Bool)

(declare-fun e!128515 () Bool)

(assert (=> b!185633 (=> res!154513 e!128515)))

(declare-fun lt!286284 () tuple2!16064)

(declare-fun isPrefixOf!0 (BitStream!7760 BitStream!7760) Bool)

(assert (=> b!185633 (= res!154513 (not (isPrefixOf!0 (_2!8677 lt!286293) (_2!8677 lt!286284))))))

(declare-fun b!185634 () Bool)

(declare-fun e!128513 () Bool)

(assert (=> b!185634 (= e!128513 e!128515)))

(declare-fun res!154517 () Bool)

(assert (=> b!185634 (=> res!154517 e!128515)))

(declare-fun lt!286286 () (_ BitVec 64))

(declare-fun lt!286285 () (_ BitVec 64))

(assert (=> b!185634 (= res!154517 (not (= lt!286285 (bvsub (bvsub (bvadd lt!286286 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!185634 (= lt!286285 (bitIndex!0 (size!4326 (buf!4786 (_2!8677 lt!286284))) (currentByte!9030 (_2!8677 lt!286284)) (currentBit!9025 (_2!8677 lt!286284))))))

(assert (=> b!185634 (isPrefixOf!0 thiss!1204 (_2!8677 lt!286284))))

(declare-fun lt!286301 () Unit!13282)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7760 BitStream!7760 BitStream!7760) Unit!13282)

(assert (=> b!185634 (= lt!286301 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!8677 lt!286293) (_2!8677 lt!286284)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7760 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16064)

(assert (=> b!185634 (= lt!286284 (appendBitsLSBFirstLoopTR!0 (_2!8677 lt!286293) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!185635 () Bool)

(declare-fun e!128508 () Bool)

(declare-fun array_inv!4067 (array!9809) Bool)

(assert (=> b!185635 (= e!128508 (array_inv!4067 (buf!4786 thiss!1204)))))

(declare-fun lt!286294 () (_ BitVec 64))

(declare-fun b!185636 () Bool)

(declare-fun e!128514 () Bool)

(declare-datatypes ((tuple2!16068 0))(
  ( (tuple2!16069 (_1!8679 BitStream!7760) (_2!8679 BitStream!7760)) )
))
(declare-fun lt!286298 () tuple2!16068)

(declare-fun withMovedBitIndex!0 (BitStream!7760 (_ BitVec 64)) BitStream!7760)

(assert (=> b!185636 (= e!128514 (= (_1!8679 lt!286298) (withMovedBitIndex!0 (_2!8679 lt!286298) (bvsub lt!286294 lt!286285))))))

(declare-fun b!185637 () Bool)

(declare-fun res!154509 () Bool)

(assert (=> b!185637 (=> res!154509 e!128515)))

(assert (=> b!185637 (= res!154509 (not (isPrefixOf!0 thiss!1204 (_2!8677 lt!286293))))))

(declare-fun b!185638 () Bool)

(declare-fun e!128503 () Bool)

(assert (=> b!185638 (= e!128503 true)))

(assert (=> b!185638 e!128514))

(declare-fun res!154515 () Bool)

(assert (=> b!185638 (=> (not res!154515) (not e!128514))))

(declare-datatypes ((tuple2!16070 0))(
  ( (tuple2!16071 (_1!8680 BitStream!7760) (_2!8680 (_ BitVec 64))) )
))
(declare-fun lt!286305 () tuple2!16070)

(declare-fun lt!286287 () tuple2!16070)

(assert (=> b!185638 (= res!154515 (and (= (_2!8680 lt!286305) (_2!8680 lt!286287)) (= (_1!8680 lt!286305) (_1!8680 lt!286287))))))

(declare-fun lt!286296 () Unit!13282)

(declare-fun lt!286292 () (_ BitVec 64))

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13282)

(assert (=> b!185638 (= lt!286296 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!8679 lt!286298) nBits!348 i!590 lt!286292))))

(declare-fun lt!286289 () (_ BitVec 64))

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7760 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16070)

(assert (=> b!185638 (= lt!286287 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!8679 lt!286298) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286289))))

(declare-fun b!185639 () Bool)

(declare-fun e!128504 () Bool)

(assert (=> b!185639 (= e!128504 e!128506)))

(declare-fun res!154512 () Bool)

(assert (=> b!185639 (=> (not res!154512) (not e!128506))))

(declare-fun lt!286300 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!185639 (= res!154512 (validate_offset_bits!1 ((_ sign_extend 32) (size!4326 (buf!4786 thiss!1204))) ((_ sign_extend 32) (currentByte!9030 thiss!1204)) ((_ sign_extend 32) (currentBit!9025 thiss!1204)) lt!286300))))

(assert (=> b!185639 (= lt!286300 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!185640 () Bool)

(declare-fun e!128510 () Bool)

(declare-fun lt!286283 () tuple2!16066)

(declare-fun lt!286297 () tuple2!16066)

(assert (=> b!185640 (= e!128510 (= (_2!8678 lt!286283) (_2!8678 lt!286297)))))

(declare-fun b!185641 () Bool)

(declare-fun e!128505 () Bool)

(assert (=> b!185641 (= e!128505 (invariant!0 (currentBit!9025 thiss!1204) (currentByte!9030 thiss!1204) (size!4326 (buf!4786 (_2!8677 lt!286284)))))))

(declare-fun b!185642 () Bool)

(declare-fun res!154518 () Bool)

(assert (=> b!185642 (=> res!154518 e!128515)))

(assert (=> b!185642 (= res!154518 (not (invariant!0 (currentBit!9025 (_2!8677 lt!286284)) (currentByte!9030 (_2!8677 lt!286284)) (size!4326 (buf!4786 (_2!8677 lt!286284))))))))

(declare-fun b!185643 () Bool)

(declare-fun res!154505 () Bool)

(assert (=> b!185643 (=> res!154505 e!128515)))

(assert (=> b!185643 (= res!154505 (or (not (= (size!4326 (buf!4786 (_2!8677 lt!286284))) (size!4326 (buf!4786 thiss!1204)))) (not (= lt!286285 (bvsub (bvadd lt!286294 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))))

(declare-fun b!185644 () Bool)

(declare-fun res!154520 () Bool)

(assert (=> b!185644 (=> (not res!154520) (not e!128511))))

(assert (=> b!185644 (= res!154520 (isPrefixOf!0 thiss!1204 (_2!8677 lt!286293)))))

(declare-fun res!154504 () Bool)

(assert (=> start!40422 (=> (not res!154504) (not e!128504))))

(assert (=> start!40422 (= res!154504 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!40422 e!128504))

(assert (=> start!40422 true))

(declare-fun inv!12 (BitStream!7760) Bool)

(assert (=> start!40422 (and (inv!12 thiss!1204) e!128508)))

(declare-fun b!185645 () Bool)

(assert (=> b!185645 (= e!128515 e!128503)))

(declare-fun res!154519 () Bool)

(assert (=> b!185645 (=> res!154519 e!128503)))

(declare-fun lt!286303 () tuple2!16068)

(assert (=> b!185645 (= res!154519 (not (= (_1!8680 (readNBitsLSBFirstsLoopPure!0 (_1!8679 lt!286303) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!286289)) (_2!8679 lt!286303))))))

(declare-fun lt!286280 () (_ BitVec 64))

(assert (=> b!185645 (validate_offset_bits!1 ((_ sign_extend 32) (size!4326 (buf!4786 (_2!8677 lt!286284)))) ((_ sign_extend 32) (currentByte!9030 (_2!8677 lt!286293))) ((_ sign_extend 32) (currentBit!9025 (_2!8677 lt!286293))) lt!286280)))

(declare-fun lt!286288 () Unit!13282)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7760 array!9809 (_ BitVec 64)) Unit!13282)

(assert (=> b!185645 (= lt!286288 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!8677 lt!286293) (buf!4786 (_2!8677 lt!286284)) lt!286280))))

(assert (=> b!185645 (= lt!286280 ((_ sign_extend 32) (bvsub (bvsub nBits!348 i!590) #b00000000000000000000000000000001)))))

(declare-fun lt!286299 () (_ BitVec 64))

(declare-fun lt!286282 () tuple2!16066)

(assert (=> b!185645 (= lt!286289 (bvor lt!286292 (ite (_2!8678 lt!286282) lt!286299 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185645 (= lt!286305 (readNBitsLSBFirstsLoopPure!0 (_1!8679 lt!286298) nBits!348 i!590 lt!286292))))

(assert (=> b!185645 (validate_offset_bits!1 ((_ sign_extend 32) (size!4326 (buf!4786 (_2!8677 lt!286284)))) ((_ sign_extend 32) (currentByte!9030 thiss!1204)) ((_ sign_extend 32) (currentBit!9025 thiss!1204)) lt!286300)))

(declare-fun lt!286290 () Unit!13282)

(assert (=> b!185645 (= lt!286290 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4786 (_2!8677 lt!286284)) lt!286300))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!185645 (= lt!286292 (bvand v!189 (onesLSBLong!0 i!590)))))

(declare-fun lt!286302 () Bool)

(assert (=> b!185645 (= (_2!8678 lt!286282) lt!286302)))

(declare-fun readBitPure!0 (BitStream!7760) tuple2!16066)

(assert (=> b!185645 (= lt!286282 (readBitPure!0 (_1!8679 lt!286298)))))

(declare-fun reader!0 (BitStream!7760 BitStream!7760) tuple2!16068)

(assert (=> b!185645 (= lt!286303 (reader!0 (_2!8677 lt!286293) (_2!8677 lt!286284)))))

(assert (=> b!185645 (= lt!286298 (reader!0 thiss!1204 (_2!8677 lt!286284)))))

(assert (=> b!185645 e!128510))

(declare-fun res!154507 () Bool)

(assert (=> b!185645 (=> (not res!154507) (not e!128510))))

(assert (=> b!185645 (= res!154507 (= (bitIndex!0 (size!4326 (buf!4786 (_1!8678 lt!286283))) (currentByte!9030 (_1!8678 lt!286283)) (currentBit!9025 (_1!8678 lt!286283))) (bitIndex!0 (size!4326 (buf!4786 (_1!8678 lt!286297))) (currentByte!9030 (_1!8678 lt!286297)) (currentBit!9025 (_1!8678 lt!286297)))))))

(declare-fun lt!286281 () Unit!13282)

(declare-fun lt!286304 () BitStream!7760)

(declare-fun readBitPrefixLemma!0 (BitStream!7760 BitStream!7760) Unit!13282)

(assert (=> b!185645 (= lt!286281 (readBitPrefixLemma!0 lt!286304 (_2!8677 lt!286284)))))

(assert (=> b!185645 (= lt!286297 (readBitPure!0 (BitStream!7761 (buf!4786 (_2!8677 lt!286284)) (currentByte!9030 thiss!1204) (currentBit!9025 thiss!1204))))))

(assert (=> b!185645 (= lt!286283 (readBitPure!0 lt!286304))))

(assert (=> b!185645 e!128505))

(declare-fun res!154516 () Bool)

(assert (=> b!185645 (=> (not res!154516) (not e!128505))))

(assert (=> b!185645 (= res!154516 (invariant!0 (currentBit!9025 thiss!1204) (currentByte!9030 thiss!1204) (size!4326 (buf!4786 (_2!8677 lt!286293)))))))

(assert (=> b!185645 (= lt!286304 (BitStream!7761 (buf!4786 (_2!8677 lt!286293)) (currentByte!9030 thiss!1204) (currentBit!9025 thiss!1204)))))

(declare-fun b!185646 () Bool)

(assert (=> b!185646 (= e!128506 (not e!128513))))

(declare-fun res!154510 () Bool)

(assert (=> b!185646 (=> res!154510 e!128513)))

(assert (=> b!185646 (= res!154510 (not (= lt!286286 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!286294))))))

(assert (=> b!185646 (= lt!286286 (bitIndex!0 (size!4326 (buf!4786 (_2!8677 lt!286293))) (currentByte!9030 (_2!8677 lt!286293)) (currentBit!9025 (_2!8677 lt!286293))))))

(assert (=> b!185646 (= lt!286294 (bitIndex!0 (size!4326 (buf!4786 thiss!1204)) (currentByte!9030 thiss!1204) (currentBit!9025 thiss!1204)))))

(assert (=> b!185646 e!128507))

(declare-fun res!154514 () Bool)

(assert (=> b!185646 (=> (not res!154514) (not e!128507))))

(assert (=> b!185646 (= res!154514 (= (size!4326 (buf!4786 thiss!1204)) (size!4326 (buf!4786 (_2!8677 lt!286293)))))))

(declare-fun appendBit!0 (BitStream!7760 Bool) tuple2!16064)

(assert (=> b!185646 (= lt!286293 (appendBit!0 thiss!1204 lt!286302))))

(assert (=> b!185646 (= lt!286302 (not (= (bvand v!189 lt!286299) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!185646 (= lt!286299 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590)))))

(declare-fun b!185647 () Bool)

(assert (=> b!185647 (= e!128511 e!128512)))

(declare-fun res!154511 () Bool)

(assert (=> b!185647 (=> (not res!154511) (not e!128512))))

(assert (=> b!185647 (= res!154511 (and (= (_2!8678 lt!286295) lt!286302) (= (_1!8678 lt!286295) (_2!8677 lt!286293))))))

(declare-fun readerFrom!0 (BitStream!7760 (_ BitVec 32) (_ BitVec 32)) BitStream!7760)

(assert (=> b!185647 (= lt!286295 (readBitPure!0 (readerFrom!0 (_2!8677 lt!286293) (currentBit!9025 thiss!1204) (currentByte!9030 thiss!1204))))))

(assert (= (and start!40422 res!154504) b!185639))

(assert (= (and b!185639 res!154512) b!185630))

(assert (= (and b!185630 res!154506) b!185629))

(assert (= (and b!185629 res!154521) b!185646))

(assert (= (and b!185646 res!154514) b!185631))

(assert (= (and b!185631 res!154508) b!185644))

(assert (= (and b!185644 res!154520) b!185647))

(assert (= (and b!185647 res!154511) b!185632))

(assert (= (and b!185646 (not res!154510)) b!185634))

(assert (= (and b!185634 (not res!154517)) b!185642))

(assert (= (and b!185642 (not res!154518)) b!185643))

(assert (= (and b!185643 (not res!154505)) b!185633))

(assert (= (and b!185633 (not res!154513)) b!185637))

(assert (= (and b!185637 (not res!154509)) b!185645))

(assert (= (and b!185645 res!154516) b!185641))

(assert (= (and b!185645 res!154507) b!185640))

(assert (= (and b!185645 (not res!154519)) b!185638))

(assert (= (and b!185638 res!154515) b!185636))

(assert (= start!40422 b!185635))

(declare-fun m!288531 () Bool)

(assert (=> b!185637 m!288531))

(declare-fun m!288533 () Bool)

(assert (=> b!185647 m!288533))

(assert (=> b!185647 m!288533))

(declare-fun m!288535 () Bool)

(assert (=> b!185647 m!288535))

(declare-fun m!288537 () Bool)

(assert (=> b!185635 m!288537))

(declare-fun m!288539 () Bool)

(assert (=> b!185631 m!288539))

(declare-fun m!288541 () Bool)

(assert (=> b!185631 m!288541))

(declare-fun m!288543 () Bool)

(assert (=> b!185630 m!288543))

(declare-fun m!288545 () Bool)

(assert (=> start!40422 m!288545))

(declare-fun m!288547 () Bool)

(assert (=> b!185633 m!288547))

(assert (=> b!185646 m!288539))

(assert (=> b!185646 m!288541))

(declare-fun m!288549 () Bool)

(assert (=> b!185646 m!288549))

(declare-fun m!288551 () Bool)

(assert (=> b!185645 m!288551))

(declare-fun m!288553 () Bool)

(assert (=> b!185645 m!288553))

(declare-fun m!288555 () Bool)

(assert (=> b!185645 m!288555))

(declare-fun m!288557 () Bool)

(assert (=> b!185645 m!288557))

(declare-fun m!288559 () Bool)

(assert (=> b!185645 m!288559))

(declare-fun m!288561 () Bool)

(assert (=> b!185645 m!288561))

(declare-fun m!288563 () Bool)

(assert (=> b!185645 m!288563))

(declare-fun m!288565 () Bool)

(assert (=> b!185645 m!288565))

(declare-fun m!288567 () Bool)

(assert (=> b!185645 m!288567))

(declare-fun m!288569 () Bool)

(assert (=> b!185645 m!288569))

(declare-fun m!288571 () Bool)

(assert (=> b!185645 m!288571))

(declare-fun m!288573 () Bool)

(assert (=> b!185645 m!288573))

(declare-fun m!288575 () Bool)

(assert (=> b!185645 m!288575))

(declare-fun m!288577 () Bool)

(assert (=> b!185645 m!288577))

(declare-fun m!288579 () Bool)

(assert (=> b!185645 m!288579))

(declare-fun m!288581 () Bool)

(assert (=> b!185645 m!288581))

(declare-fun m!288583 () Bool)

(assert (=> b!185642 m!288583))

(declare-fun m!288585 () Bool)

(assert (=> b!185636 m!288585))

(declare-fun m!288587 () Bool)

(assert (=> b!185632 m!288587))

(assert (=> b!185644 m!288531))

(declare-fun m!288589 () Bool)

(assert (=> b!185641 m!288589))

(declare-fun m!288591 () Bool)

(assert (=> b!185639 m!288591))

(declare-fun m!288593 () Bool)

(assert (=> b!185634 m!288593))

(declare-fun m!288595 () Bool)

(assert (=> b!185634 m!288595))

(declare-fun m!288597 () Bool)

(assert (=> b!185634 m!288597))

(declare-fun m!288599 () Bool)

(assert (=> b!185634 m!288599))

(declare-fun m!288601 () Bool)

(assert (=> b!185638 m!288601))

(declare-fun m!288603 () Bool)

(assert (=> b!185638 m!288603))

(assert (=> b!185638 m!288603))

(declare-fun m!288605 () Bool)

(assert (=> b!185638 m!288605))

(push 1)

(assert (not b!185637))

(assert (not b!185644))

(assert (not b!185647))

(assert (not start!40422))

(assert (not b!185639))

(assert (not b!185642))

(assert (not b!185641))

(assert (not b!185635))

(assert (not b!185632))

(assert (not b!185638))

(assert (not b!185631))

(assert (not b!185633))

(assert (not b!185630))

(assert (not b!185645))

(assert (not b!185636))

(assert (not b!185646))

(assert (not b!185634))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

