; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21586 () Bool)

(assert start!21586)

(declare-fun b!108540 () Bool)

(declare-fun res!89485 () Bool)

(declare-fun e!71026 () Bool)

(assert (=> b!108540 (=> (not res!89485) (not e!71026))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108540 (= res!89485 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!108541 () Bool)

(declare-fun e!71036 () Bool)

(declare-fun e!71030 () Bool)

(assert (=> b!108541 (= e!71036 e!71030)))

(declare-fun res!89477 () Bool)

(assert (=> b!108541 (=> (not res!89477) (not e!71030))))

(declare-fun lt!163610 () Bool)

(declare-datatypes ((array!4949 0))(
  ( (array!4950 (arr!2844 (Array (_ BitVec 32) (_ BitVec 8))) (size!2251 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3976 0))(
  ( (BitStream!3977 (buf!2642 array!4949) (currentByte!5178 (_ BitVec 32)) (currentBit!5173 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!8940 0))(
  ( (tuple2!8941 (_1!4727 BitStream!3976) (_2!4727 Bool)) )
))
(declare-fun lt!163626 () tuple2!8940)

(declare-datatypes ((Unit!6643 0))(
  ( (Unit!6644) )
))
(declare-datatypes ((tuple2!8942 0))(
  ( (tuple2!8943 (_1!4728 Unit!6643) (_2!4728 BitStream!3976)) )
))
(declare-fun lt!163603 () tuple2!8942)

(assert (=> b!108541 (= res!89477 (and (= (_2!4727 lt!163626) lt!163610) (= (_1!4727 lt!163626) (_2!4728 lt!163603))))))

(declare-fun thiss!1305 () BitStream!3976)

(declare-fun readBitPure!0 (BitStream!3976) tuple2!8940)

(declare-fun readerFrom!0 (BitStream!3976 (_ BitVec 32) (_ BitVec 32)) BitStream!3976)

(assert (=> b!108541 (= lt!163626 (readBitPure!0 (readerFrom!0 (_2!4728 lt!163603) (currentBit!5173 thiss!1305) (currentByte!5178 thiss!1305))))))

(declare-fun b!108542 () Bool)

(declare-fun lt!163624 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!108542 (= e!71030 (= (bitIndex!0 (size!2251 (buf!2642 (_1!4727 lt!163626))) (currentByte!5178 (_1!4727 lt!163626)) (currentBit!5173 (_1!4727 lt!163626))) lt!163624))))

(declare-datatypes ((tuple2!8944 0))(
  ( (tuple2!8945 (_1!4729 BitStream!3976) (_2!4729 BitStream!3976)) )
))
(declare-fun lt!163620 () tuple2!8944)

(declare-fun lt!163618 () tuple2!8944)

(declare-fun lt!163628 () (_ BitVec 64))

(declare-datatypes ((tuple2!8946 0))(
  ( (tuple2!8947 (_1!4730 BitStream!3976) (_2!4730 (_ BitVec 64))) )
))
(declare-fun lt!163607 () tuple2!8946)

(declare-fun lt!163617 () (_ BitVec 64))

(declare-fun lt!163616 () tuple2!8946)

(declare-fun e!71035 () Bool)

(declare-fun b!108543 () Bool)

(declare-fun lt!163601 () BitStream!3976)

(assert (=> b!108543 (= e!71035 (and (= lt!163628 (bvsub lt!163617 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!4729 lt!163620) lt!163601)) (and (= (_2!4730 lt!163616) (_2!4730 lt!163607)) (= (_1!4730 lt!163616) (_2!4729 lt!163618))))))))

(declare-fun b!108544 () Bool)

(declare-fun e!71031 () Bool)

(assert (=> b!108544 (= e!71031 true)))

(assert (=> b!108544 e!71035))

(declare-fun res!89475 () Bool)

(assert (=> b!108544 (=> (not res!89475) (not e!71035))))

(declare-fun lt!163622 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3976 (_ BitVec 64)) BitStream!3976)

(assert (=> b!108544 (= res!89475 (= (_1!4729 lt!163620) (withMovedBitIndex!0 (_2!4729 lt!163620) (bvsub lt!163617 lt!163622))))))

(assert (=> b!108544 (= lt!163617 (bitIndex!0 (size!2251 (buf!2642 (_2!4728 lt!163603))) (currentByte!5178 (_2!4728 lt!163603)) (currentBit!5173 (_2!4728 lt!163603))))))

(assert (=> b!108544 (= (_1!4729 lt!163618) (withMovedBitIndex!0 (_2!4729 lt!163618) (bvsub lt!163628 lt!163622)))))

(declare-fun lt!163604 () tuple2!8942)

(assert (=> b!108544 (= lt!163622 (bitIndex!0 (size!2251 (buf!2642 (_2!4728 lt!163604))) (currentByte!5178 (_2!4728 lt!163604)) (currentBit!5173 (_2!4728 lt!163604))))))

(assert (=> b!108544 (= lt!163628 (bitIndex!0 (size!2251 (buf!2642 thiss!1305)) (currentByte!5178 thiss!1305) (currentBit!5173 thiss!1305)))))

(declare-fun lt!163627 () tuple2!8946)

(assert (=> b!108544 (and (= (_2!4730 lt!163616) (_2!4730 lt!163627)) (= (_1!4730 lt!163616) (_1!4730 lt!163627)))))

(declare-fun lt!163615 () (_ BitVec 64))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!163605 () Unit!6643)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6643)

(assert (=> b!108544 (= lt!163605 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4729 lt!163618) nBits!396 i!615 lt!163615))))

(declare-fun lt!163612 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8946)

(assert (=> b!108544 (= lt!163627 (readNLeastSignificantBitsLoopPure!0 lt!163601 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163612))))

(assert (=> b!108544 (= lt!163601 (withMovedBitIndex!0 (_1!4729 lt!163618) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!108545 () Bool)

(declare-fun e!71027 () Bool)

(declare-fun lt!163625 () tuple2!8940)

(declare-fun lt!163600 () tuple2!8940)

(assert (=> b!108545 (= e!71027 (= (_2!4727 lt!163625) (_2!4727 lt!163600)))))

(declare-fun b!108546 () Bool)

(declare-fun res!89480 () Bool)

(assert (=> b!108546 (=> (not res!89480) (not e!71026))))

(assert (=> b!108546 (= res!89480 (bvslt i!615 nBits!396))))

(declare-fun b!108547 () Bool)

(declare-fun res!89478 () Bool)

(assert (=> b!108547 (=> (not res!89478) (not e!71036))))

(declare-fun isPrefixOf!0 (BitStream!3976 BitStream!3976) Bool)

(assert (=> b!108547 (= res!89478 (isPrefixOf!0 thiss!1305 (_2!4728 lt!163603)))))

(declare-fun b!108548 () Bool)

(declare-fun e!71034 () Bool)

(declare-fun array_inv!2053 (array!4949) Bool)

(assert (=> b!108548 (= e!71034 (array_inv!2053 (buf!2642 thiss!1305)))))

(declare-fun res!89474 () Bool)

(declare-fun e!71032 () Bool)

(assert (=> start!21586 (=> (not res!89474) (not e!71032))))

(assert (=> start!21586 (= res!89474 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21586 e!71032))

(assert (=> start!21586 true))

(declare-fun inv!12 (BitStream!3976) Bool)

(assert (=> start!21586 (and (inv!12 thiss!1305) e!71034)))

(declare-fun b!108549 () Bool)

(declare-fun e!71028 () Bool)

(assert (=> b!108549 (= e!71028 e!71036)))

(declare-fun res!89473 () Bool)

(assert (=> b!108549 (=> (not res!89473) (not e!71036))))

(declare-fun lt!163608 () (_ BitVec 64))

(assert (=> b!108549 (= res!89473 (= lt!163624 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!163608)))))

(assert (=> b!108549 (= lt!163624 (bitIndex!0 (size!2251 (buf!2642 (_2!4728 lt!163603))) (currentByte!5178 (_2!4728 lt!163603)) (currentBit!5173 (_2!4728 lt!163603))))))

(assert (=> b!108549 (= lt!163608 (bitIndex!0 (size!2251 (buf!2642 thiss!1305)) (currentByte!5178 thiss!1305) (currentBit!5173 thiss!1305)))))

(declare-fun b!108550 () Bool)

(assert (=> b!108550 (= e!71026 (not e!71031))))

(declare-fun res!89482 () Bool)

(assert (=> b!108550 (=> res!89482 e!71031)))

(assert (=> b!108550 (= res!89482 (not (= (_1!4730 lt!163607) (_2!4729 lt!163620))))))

(assert (=> b!108550 (= lt!163607 (readNLeastSignificantBitsLoopPure!0 (_1!4729 lt!163620) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!163612))))

(declare-fun lt!163621 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!108550 (validate_offset_bits!1 ((_ sign_extend 32) (size!2251 (buf!2642 (_2!4728 lt!163604)))) ((_ sign_extend 32) (currentByte!5178 (_2!4728 lt!163603))) ((_ sign_extend 32) (currentBit!5173 (_2!4728 lt!163603))) lt!163621)))

(declare-fun lt!163611 () Unit!6643)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3976 array!4949 (_ BitVec 64)) Unit!6643)

(assert (=> b!108550 (= lt!163611 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4728 lt!163603) (buf!2642 (_2!4728 lt!163604)) lt!163621))))

(assert (=> b!108550 (= lt!163621 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!163613 () (_ BitVec 64))

(declare-fun lt!163623 () tuple2!8940)

(assert (=> b!108550 (= lt!163612 (bvor lt!163615 (ite (_2!4727 lt!163623) lt!163613 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108550 (= lt!163616 (readNLeastSignificantBitsLoopPure!0 (_1!4729 lt!163618) nBits!396 i!615 lt!163615))))

(declare-fun lt!163619 () (_ BitVec 64))

(assert (=> b!108550 (validate_offset_bits!1 ((_ sign_extend 32) (size!2251 (buf!2642 (_2!4728 lt!163604)))) ((_ sign_extend 32) (currentByte!5178 thiss!1305)) ((_ sign_extend 32) (currentBit!5173 thiss!1305)) lt!163619)))

(declare-fun lt!163614 () Unit!6643)

(assert (=> b!108550 (= lt!163614 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2642 (_2!4728 lt!163604)) lt!163619))))

(assert (=> b!108550 (= lt!163615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!108550 (= (_2!4727 lt!163623) lt!163610)))

(assert (=> b!108550 (= lt!163623 (readBitPure!0 (_1!4729 lt!163618)))))

(declare-fun reader!0 (BitStream!3976 BitStream!3976) tuple2!8944)

(assert (=> b!108550 (= lt!163620 (reader!0 (_2!4728 lt!163603) (_2!4728 lt!163604)))))

(assert (=> b!108550 (= lt!163618 (reader!0 thiss!1305 (_2!4728 lt!163604)))))

(assert (=> b!108550 e!71027))

(declare-fun res!89481 () Bool)

(assert (=> b!108550 (=> (not res!89481) (not e!71027))))

(assert (=> b!108550 (= res!89481 (= (bitIndex!0 (size!2251 (buf!2642 (_1!4727 lt!163625))) (currentByte!5178 (_1!4727 lt!163625)) (currentBit!5173 (_1!4727 lt!163625))) (bitIndex!0 (size!2251 (buf!2642 (_1!4727 lt!163600))) (currentByte!5178 (_1!4727 lt!163600)) (currentBit!5173 (_1!4727 lt!163600)))))))

(declare-fun lt!163602 () Unit!6643)

(declare-fun lt!163606 () BitStream!3976)

(declare-fun readBitPrefixLemma!0 (BitStream!3976 BitStream!3976) Unit!6643)

(assert (=> b!108550 (= lt!163602 (readBitPrefixLemma!0 lt!163606 (_2!4728 lt!163604)))))

(assert (=> b!108550 (= lt!163600 (readBitPure!0 (BitStream!3977 (buf!2642 (_2!4728 lt!163604)) (currentByte!5178 thiss!1305) (currentBit!5173 thiss!1305))))))

(assert (=> b!108550 (= lt!163625 (readBitPure!0 lt!163606))))

(assert (=> b!108550 (= lt!163606 (BitStream!3977 (buf!2642 (_2!4728 lt!163603)) (currentByte!5178 thiss!1305) (currentBit!5173 thiss!1305)))))

(declare-fun e!71033 () Bool)

(assert (=> b!108550 e!71033))

(declare-fun res!89479 () Bool)

(assert (=> b!108550 (=> (not res!89479) (not e!71033))))

(assert (=> b!108550 (= res!89479 (isPrefixOf!0 thiss!1305 (_2!4728 lt!163604)))))

(declare-fun lt!163609 () Unit!6643)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3976 BitStream!3976 BitStream!3976) Unit!6643)

(assert (=> b!108550 (= lt!163609 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4728 lt!163603) (_2!4728 lt!163604)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3976 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8942)

(assert (=> b!108550 (= lt!163604 (appendNLeastSignificantBitsLoop!0 (_2!4728 lt!163603) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!108550 e!71028))

(declare-fun res!89476 () Bool)

(assert (=> b!108550 (=> (not res!89476) (not e!71028))))

(assert (=> b!108550 (= res!89476 (= (size!2251 (buf!2642 thiss!1305)) (size!2251 (buf!2642 (_2!4728 lt!163603)))))))

(declare-fun appendBit!0 (BitStream!3976 Bool) tuple2!8942)

(assert (=> b!108550 (= lt!163603 (appendBit!0 thiss!1305 lt!163610))))

(assert (=> b!108550 (= lt!163610 (not (= (bvand v!199 lt!163613) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!108550 (= lt!163613 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!108551 () Bool)

(declare-fun res!89483 () Bool)

(assert (=> b!108551 (=> (not res!89483) (not e!71033))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!108551 (= res!89483 (invariant!0 (currentBit!5173 thiss!1305) (currentByte!5178 thiss!1305) (size!2251 (buf!2642 (_2!4728 lt!163603)))))))

(declare-fun b!108552 () Bool)

(assert (=> b!108552 (= e!71033 (invariant!0 (currentBit!5173 thiss!1305) (currentByte!5178 thiss!1305) (size!2251 (buf!2642 (_2!4728 lt!163604)))))))

(declare-fun b!108553 () Bool)

(assert (=> b!108553 (= e!71032 e!71026)))

(declare-fun res!89484 () Bool)

(assert (=> b!108553 (=> (not res!89484) (not e!71026))))

(assert (=> b!108553 (= res!89484 (validate_offset_bits!1 ((_ sign_extend 32) (size!2251 (buf!2642 thiss!1305))) ((_ sign_extend 32) (currentByte!5178 thiss!1305)) ((_ sign_extend 32) (currentBit!5173 thiss!1305)) lt!163619))))

(assert (=> b!108553 (= lt!163619 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(assert (= (and start!21586 res!89474) b!108553))

(assert (= (and b!108553 res!89484) b!108540))

(assert (= (and b!108540 res!89485) b!108546))

(assert (= (and b!108546 res!89480) b!108550))

(assert (= (and b!108550 res!89476) b!108549))

(assert (= (and b!108549 res!89473) b!108547))

(assert (= (and b!108547 res!89478) b!108541))

(assert (= (and b!108541 res!89477) b!108542))

(assert (= (and b!108550 res!89479) b!108551))

(assert (= (and b!108551 res!89483) b!108552))

(assert (= (and b!108550 res!89481) b!108545))

(assert (= (and b!108550 (not res!89482)) b!108544))

(assert (= (and b!108544 res!89475) b!108543))

(assert (= start!21586 b!108548))

(declare-fun m!160877 () Bool)

(assert (=> b!108540 m!160877))

(declare-fun m!160879 () Bool)

(assert (=> b!108544 m!160879))

(declare-fun m!160881 () Bool)

(assert (=> b!108544 m!160881))

(declare-fun m!160883 () Bool)

(assert (=> b!108544 m!160883))

(declare-fun m!160885 () Bool)

(assert (=> b!108544 m!160885))

(declare-fun m!160887 () Bool)

(assert (=> b!108544 m!160887))

(declare-fun m!160889 () Bool)

(assert (=> b!108544 m!160889))

(declare-fun m!160891 () Bool)

(assert (=> b!108544 m!160891))

(declare-fun m!160893 () Bool)

(assert (=> b!108544 m!160893))

(declare-fun m!160895 () Bool)

(assert (=> b!108552 m!160895))

(declare-fun m!160897 () Bool)

(assert (=> b!108547 m!160897))

(declare-fun m!160899 () Bool)

(assert (=> b!108548 m!160899))

(declare-fun m!160901 () Bool)

(assert (=> b!108550 m!160901))

(declare-fun m!160903 () Bool)

(assert (=> b!108550 m!160903))

(declare-fun m!160905 () Bool)

(assert (=> b!108550 m!160905))

(declare-fun m!160907 () Bool)

(assert (=> b!108550 m!160907))

(declare-fun m!160909 () Bool)

(assert (=> b!108550 m!160909))

(declare-fun m!160911 () Bool)

(assert (=> b!108550 m!160911))

(declare-fun m!160913 () Bool)

(assert (=> b!108550 m!160913))

(declare-fun m!160915 () Bool)

(assert (=> b!108550 m!160915))

(declare-fun m!160917 () Bool)

(assert (=> b!108550 m!160917))

(declare-fun m!160919 () Bool)

(assert (=> b!108550 m!160919))

(declare-fun m!160921 () Bool)

(assert (=> b!108550 m!160921))

(declare-fun m!160923 () Bool)

(assert (=> b!108550 m!160923))

(declare-fun m!160925 () Bool)

(assert (=> b!108550 m!160925))

(declare-fun m!160927 () Bool)

(assert (=> b!108550 m!160927))

(declare-fun m!160929 () Bool)

(assert (=> b!108550 m!160929))

(declare-fun m!160931 () Bool)

(assert (=> b!108550 m!160931))

(declare-fun m!160933 () Bool)

(assert (=> b!108550 m!160933))

(declare-fun m!160935 () Bool)

(assert (=> b!108550 m!160935))

(declare-fun m!160937 () Bool)

(assert (=> b!108550 m!160937))

(declare-fun m!160939 () Bool)

(assert (=> b!108553 m!160939))

(declare-fun m!160941 () Bool)

(assert (=> b!108551 m!160941))

(declare-fun m!160943 () Bool)

(assert (=> b!108541 m!160943))

(assert (=> b!108541 m!160943))

(declare-fun m!160945 () Bool)

(assert (=> b!108541 m!160945))

(declare-fun m!160947 () Bool)

(assert (=> b!108542 m!160947))

(assert (=> b!108549 m!160887))

(assert (=> b!108549 m!160883))

(declare-fun m!160949 () Bool)

(assert (=> start!21586 m!160949))

(push 1)

