; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53410 () Bool)

(assert start!53410)

(declare-fun b!247972 () Bool)

(declare-fun res!207528 () Bool)

(declare-fun e!171803 () Bool)

(assert (=> b!247972 (=> (not res!207528) (not e!171803))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!247972 (= res!207528 (bvslt from!289 nBits!297))))

(declare-fun b!247973 () Bool)

(declare-fun res!207534 () Bool)

(declare-fun e!171805 () Bool)

(assert (=> b!247973 (=> (not res!207534) (not e!171805))))

(declare-datatypes ((array!13535 0))(
  ( (array!13536 (arr!6921 (Array (_ BitVec 32) (_ BitVec 8))) (size!5934 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10790 0))(
  ( (BitStream!10791 (buf!6421 array!13535) (currentByte!11837 (_ BitVec 32)) (currentBit!11832 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10790)

(declare-datatypes ((Unit!17989 0))(
  ( (Unit!17990) )
))
(declare-datatypes ((tuple2!21264 0))(
  ( (tuple2!21265 (_1!11554 Unit!17989) (_2!11554 BitStream!10790)) )
))
(declare-fun lt!386481 () tuple2!21264)

(declare-fun isPrefixOf!0 (BitStream!10790 BitStream!10790) Bool)

(assert (=> b!247973 (= res!207534 (isPrefixOf!0 thiss!1005 (_2!11554 lt!386481)))))

(declare-fun b!247974 () Bool)

(declare-fun e!171812 () Bool)

(declare-datatypes ((tuple2!21266 0))(
  ( (tuple2!21267 (_1!11555 BitStream!10790) (_2!11555 Bool)) )
))
(declare-fun lt!386472 () tuple2!21266)

(declare-fun lt!386461 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247974 (= e!171812 (= (bitIndex!0 (size!5934 (buf!6421 (_1!11555 lt!386472))) (currentByte!11837 (_1!11555 lt!386472)) (currentBit!11832 (_1!11555 lt!386472))) lt!386461))))

(declare-fun b!247975 () Bool)

(declare-fun e!171807 () Bool)

(declare-fun array_inv!5675 (array!13535) Bool)

(assert (=> b!247975 (= e!171807 (array_inv!5675 (buf!6421 thiss!1005)))))

(declare-fun b!247976 () Bool)

(declare-fun res!207533 () Bool)

(declare-fun e!171811 () Bool)

(assert (=> b!247976 (=> (not res!207533) (not e!171811))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247976 (= res!207533 (invariant!0 (currentBit!11832 thiss!1005) (currentByte!11837 thiss!1005) (size!5934 (buf!6421 (_2!11554 lt!386481)))))))

(declare-fun b!247977 () Bool)

(declare-fun e!171810 () Bool)

(declare-fun e!171808 () Bool)

(assert (=> b!247977 (= e!171810 e!171808)))

(declare-fun res!207526 () Bool)

(assert (=> b!247977 (=> (not res!207526) (not e!171808))))

(declare-fun lt!386465 () tuple2!21264)

(declare-fun lt!386469 () (_ BitVec 64))

(assert (=> b!247977 (= res!207526 (= (bitIndex!0 (size!5934 (buf!6421 (_2!11554 lt!386465))) (currentByte!11837 (_2!11554 lt!386465)) (currentBit!11832 (_2!11554 lt!386465))) (bvadd (bitIndex!0 (size!5934 (buf!6421 (_2!11554 lt!386481))) (currentByte!11837 (_2!11554 lt!386481)) (currentBit!11832 (_2!11554 lt!386481))) lt!386469)))))

(assert (=> b!247977 (= lt!386469 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!247978 () Bool)

(declare-fun res!207532 () Bool)

(assert (=> b!247978 (=> (not res!207532) (not e!171808))))

(assert (=> b!247978 (= res!207532 (isPrefixOf!0 (_2!11554 lt!386481) (_2!11554 lt!386465)))))

(declare-datatypes ((tuple2!21268 0))(
  ( (tuple2!21269 (_1!11556 BitStream!10790) (_2!11556 BitStream!10790)) )
))
(declare-fun lt!386468 () tuple2!21268)

(declare-fun b!247979 () Bool)

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10790 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21266)

(assert (=> b!247979 (= e!171803 (not (= (_1!11555 (checkBitsLoopPure!0 (_1!11556 lt!386468) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11556 lt!386468))))))

(declare-fun lt!386470 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247979 (validate_offset_bits!1 ((_ sign_extend 32) (size!5934 (buf!6421 (_2!11554 lt!386465)))) ((_ sign_extend 32) (currentByte!11837 (_2!11554 lt!386481))) ((_ sign_extend 32) (currentBit!11832 (_2!11554 lt!386481))) lt!386470)))

(declare-fun lt!386475 () Unit!17989)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10790 array!13535 (_ BitVec 64)) Unit!17989)

(assert (=> b!247979 (= lt!386475 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11554 lt!386481) (buf!6421 (_2!11554 lt!386465)) lt!386470))))

(declare-fun lt!386480 () tuple2!21266)

(declare-fun lt!386466 () tuple2!21268)

(assert (=> b!247979 (= lt!386480 (checkBitsLoopPure!0 (_1!11556 lt!386466) nBits!297 bit!26 from!289))))

(assert (=> b!247979 (validate_offset_bits!1 ((_ sign_extend 32) (size!5934 (buf!6421 (_2!11554 lt!386465)))) ((_ sign_extend 32) (currentByte!11837 thiss!1005)) ((_ sign_extend 32) (currentBit!11832 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386474 () Unit!17989)

(assert (=> b!247979 (= lt!386474 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6421 (_2!11554 lt!386465)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10790) tuple2!21266)

(assert (=> b!247979 (= (_2!11555 (readBitPure!0 (_1!11556 lt!386466))) bit!26)))

(declare-fun reader!0 (BitStream!10790 BitStream!10790) tuple2!21268)

(assert (=> b!247979 (= lt!386468 (reader!0 (_2!11554 lt!386481) (_2!11554 lt!386465)))))

(assert (=> b!247979 (= lt!386466 (reader!0 thiss!1005 (_2!11554 lt!386465)))))

(declare-fun e!171804 () Bool)

(assert (=> b!247979 e!171804))

(declare-fun res!207527 () Bool)

(assert (=> b!247979 (=> (not res!207527) (not e!171804))))

(declare-fun lt!386473 () tuple2!21266)

(declare-fun lt!386463 () tuple2!21266)

(assert (=> b!247979 (= res!207527 (= (bitIndex!0 (size!5934 (buf!6421 (_1!11555 lt!386473))) (currentByte!11837 (_1!11555 lt!386473)) (currentBit!11832 (_1!11555 lt!386473))) (bitIndex!0 (size!5934 (buf!6421 (_1!11555 lt!386463))) (currentByte!11837 (_1!11555 lt!386463)) (currentBit!11832 (_1!11555 lt!386463)))))))

(declare-fun lt!386479 () Unit!17989)

(declare-fun lt!386477 () BitStream!10790)

(declare-fun readBitPrefixLemma!0 (BitStream!10790 BitStream!10790) Unit!17989)

(assert (=> b!247979 (= lt!386479 (readBitPrefixLemma!0 lt!386477 (_2!11554 lt!386465)))))

(assert (=> b!247979 (= lt!386463 (readBitPure!0 (BitStream!10791 (buf!6421 (_2!11554 lt!386465)) (currentByte!11837 thiss!1005) (currentBit!11832 thiss!1005))))))

(assert (=> b!247979 (= lt!386473 (readBitPure!0 lt!386477))))

(assert (=> b!247979 (= lt!386477 (BitStream!10791 (buf!6421 (_2!11554 lt!386481)) (currentByte!11837 thiss!1005) (currentBit!11832 thiss!1005)))))

(assert (=> b!247979 e!171811))

(declare-fun res!207525 () Bool)

(assert (=> b!247979 (=> (not res!207525) (not e!171811))))

(assert (=> b!247979 (= res!207525 (isPrefixOf!0 thiss!1005 (_2!11554 lt!386465)))))

(declare-fun lt!386467 () Unit!17989)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10790 BitStream!10790 BitStream!10790) Unit!17989)

(assert (=> b!247979 (= lt!386467 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11554 lt!386481) (_2!11554 lt!386465)))))

(assert (=> b!247979 e!171810))

(declare-fun res!207529 () Bool)

(assert (=> b!247979 (=> (not res!207529) (not e!171810))))

(assert (=> b!247979 (= res!207529 (= (size!5934 (buf!6421 (_2!11554 lt!386481))) (size!5934 (buf!6421 (_2!11554 lt!386465)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10790 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21264)

(assert (=> b!247979 (= lt!386465 (appendNBitsLoop!0 (_2!11554 lt!386481) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247979 (validate_offset_bits!1 ((_ sign_extend 32) (size!5934 (buf!6421 (_2!11554 lt!386481)))) ((_ sign_extend 32) (currentByte!11837 (_2!11554 lt!386481))) ((_ sign_extend 32) (currentBit!11832 (_2!11554 lt!386481))) lt!386470)))

(assert (=> b!247979 (= lt!386470 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!386478 () Unit!17989)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10790 BitStream!10790 (_ BitVec 64) (_ BitVec 64)) Unit!17989)

(assert (=> b!247979 (= lt!386478 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11554 lt!386481) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!171806 () Bool)

(assert (=> b!247979 e!171806))

(declare-fun res!207530 () Bool)

(assert (=> b!247979 (=> (not res!207530) (not e!171806))))

(assert (=> b!247979 (= res!207530 (= (size!5934 (buf!6421 thiss!1005)) (size!5934 (buf!6421 (_2!11554 lt!386481)))))))

(declare-fun appendBit!0 (BitStream!10790 Bool) tuple2!21264)

(assert (=> b!247979 (= lt!386481 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!247980 () Bool)

(assert (=> b!247980 (= e!171805 e!171812)))

(declare-fun res!207537 () Bool)

(assert (=> b!247980 (=> (not res!207537) (not e!171812))))

(assert (=> b!247980 (= res!207537 (and (= (_2!11555 lt!386472) bit!26) (= (_1!11555 lt!386472) (_2!11554 lt!386481))))))

(declare-fun readerFrom!0 (BitStream!10790 (_ BitVec 32) (_ BitVec 32)) BitStream!10790)

(assert (=> b!247980 (= lt!386472 (readBitPure!0 (readerFrom!0 (_2!11554 lt!386481) (currentBit!11832 thiss!1005) (currentByte!11837 thiss!1005))))))

(declare-fun res!207536 () Bool)

(assert (=> start!53410 (=> (not res!207536) (not e!171803))))

(assert (=> start!53410 (= res!207536 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53410 e!171803))

(assert (=> start!53410 true))

(declare-fun inv!12 (BitStream!10790) Bool)

(assert (=> start!53410 (and (inv!12 thiss!1005) e!171807)))

(declare-fun b!247981 () Bool)

(assert (=> b!247981 (= e!171806 e!171805)))

(declare-fun res!207535 () Bool)

(assert (=> b!247981 (=> (not res!207535) (not e!171805))))

(declare-fun lt!386464 () (_ BitVec 64))

(assert (=> b!247981 (= res!207535 (= lt!386461 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!386464)))))

(assert (=> b!247981 (= lt!386461 (bitIndex!0 (size!5934 (buf!6421 (_2!11554 lt!386481))) (currentByte!11837 (_2!11554 lt!386481)) (currentBit!11832 (_2!11554 lt!386481))))))

(assert (=> b!247981 (= lt!386464 (bitIndex!0 (size!5934 (buf!6421 thiss!1005)) (currentByte!11837 thiss!1005) (currentBit!11832 thiss!1005)))))

(declare-fun b!247982 () Bool)

(assert (=> b!247982 (= e!171804 (= (_2!11555 lt!386473) (_2!11555 lt!386463)))))

(declare-fun b!247983 () Bool)

(declare-fun lt!386471 () tuple2!21266)

(declare-fun lt!386462 () tuple2!21268)

(assert (=> b!247983 (= e!171808 (not (or (not (_2!11555 lt!386471)) (not (= (_1!11555 lt!386471) (_2!11556 lt!386462))))))))

(assert (=> b!247983 (= lt!386471 (checkBitsLoopPure!0 (_1!11556 lt!386462) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247983 (validate_offset_bits!1 ((_ sign_extend 32) (size!5934 (buf!6421 (_2!11554 lt!386465)))) ((_ sign_extend 32) (currentByte!11837 (_2!11554 lt!386481))) ((_ sign_extend 32) (currentBit!11832 (_2!11554 lt!386481))) lt!386469)))

(declare-fun lt!386476 () Unit!17989)

(assert (=> b!247983 (= lt!386476 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11554 lt!386481) (buf!6421 (_2!11554 lt!386465)) lt!386469))))

(assert (=> b!247983 (= lt!386462 (reader!0 (_2!11554 lt!386481) (_2!11554 lt!386465)))))

(declare-fun b!247984 () Bool)

(declare-fun res!207531 () Bool)

(assert (=> b!247984 (=> (not res!207531) (not e!171803))))

(assert (=> b!247984 (= res!207531 (validate_offset_bits!1 ((_ sign_extend 32) (size!5934 (buf!6421 thiss!1005))) ((_ sign_extend 32) (currentByte!11837 thiss!1005)) ((_ sign_extend 32) (currentBit!11832 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247985 () Bool)

(assert (=> b!247985 (= e!171811 (invariant!0 (currentBit!11832 thiss!1005) (currentByte!11837 thiss!1005) (size!5934 (buf!6421 (_2!11554 lt!386465)))))))

(assert (= (and start!53410 res!207536) b!247984))

(assert (= (and b!247984 res!207531) b!247972))

(assert (= (and b!247972 res!207528) b!247979))

(assert (= (and b!247979 res!207530) b!247981))

(assert (= (and b!247981 res!207535) b!247973))

(assert (= (and b!247973 res!207534) b!247980))

(assert (= (and b!247980 res!207537) b!247974))

(assert (= (and b!247979 res!207529) b!247977))

(assert (= (and b!247977 res!207526) b!247978))

(assert (= (and b!247978 res!207532) b!247983))

(assert (= (and b!247979 res!207525) b!247976))

(assert (= (and b!247976 res!207533) b!247985))

(assert (= (and b!247979 res!207527) b!247982))

(assert (= start!53410 b!247975))

(declare-fun m!373683 () Bool)

(assert (=> b!247973 m!373683))

(declare-fun m!373685 () Bool)

(assert (=> b!247978 m!373685))

(declare-fun m!373687 () Bool)

(assert (=> b!247980 m!373687))

(assert (=> b!247980 m!373687))

(declare-fun m!373689 () Bool)

(assert (=> b!247980 m!373689))

(declare-fun m!373691 () Bool)

(assert (=> b!247983 m!373691))

(declare-fun m!373693 () Bool)

(assert (=> b!247983 m!373693))

(declare-fun m!373695 () Bool)

(assert (=> b!247983 m!373695))

(declare-fun m!373697 () Bool)

(assert (=> b!247983 m!373697))

(declare-fun m!373699 () Bool)

(assert (=> start!53410 m!373699))

(declare-fun m!373701 () Bool)

(assert (=> b!247985 m!373701))

(declare-fun m!373703 () Bool)

(assert (=> b!247976 m!373703))

(declare-fun m!373705 () Bool)

(assert (=> b!247981 m!373705))

(declare-fun m!373707 () Bool)

(assert (=> b!247981 m!373707))

(declare-fun m!373709 () Bool)

(assert (=> b!247984 m!373709))

(declare-fun m!373711 () Bool)

(assert (=> b!247975 m!373711))

(declare-fun m!373713 () Bool)

(assert (=> b!247979 m!373713))

(declare-fun m!373715 () Bool)

(assert (=> b!247979 m!373715))

(declare-fun m!373717 () Bool)

(assert (=> b!247979 m!373717))

(declare-fun m!373719 () Bool)

(assert (=> b!247979 m!373719))

(declare-fun m!373721 () Bool)

(assert (=> b!247979 m!373721))

(declare-fun m!373723 () Bool)

(assert (=> b!247979 m!373723))

(assert (=> b!247979 m!373697))

(declare-fun m!373725 () Bool)

(assert (=> b!247979 m!373725))

(declare-fun m!373727 () Bool)

(assert (=> b!247979 m!373727))

(declare-fun m!373729 () Bool)

(assert (=> b!247979 m!373729))

(declare-fun m!373731 () Bool)

(assert (=> b!247979 m!373731))

(declare-fun m!373733 () Bool)

(assert (=> b!247979 m!373733))

(declare-fun m!373735 () Bool)

(assert (=> b!247979 m!373735))

(declare-fun m!373737 () Bool)

(assert (=> b!247979 m!373737))

(declare-fun m!373739 () Bool)

(assert (=> b!247979 m!373739))

(declare-fun m!373741 () Bool)

(assert (=> b!247979 m!373741))

(declare-fun m!373743 () Bool)

(assert (=> b!247979 m!373743))

(declare-fun m!373745 () Bool)

(assert (=> b!247979 m!373745))

(declare-fun m!373747 () Bool)

(assert (=> b!247979 m!373747))

(declare-fun m!373749 () Bool)

(assert (=> b!247979 m!373749))

(declare-fun m!373751 () Bool)

(assert (=> b!247977 m!373751))

(assert (=> b!247977 m!373705))

(declare-fun m!373753 () Bool)

(assert (=> b!247974 m!373753))

(push 1)

(assert (not b!247976))

(assert (not b!247981))

(assert (not b!247983))

(assert (not b!247978))

(assert (not b!247974))

(assert (not b!247985))

(assert (not b!247984))

(assert (not b!247973))

(assert (not b!247977))

(assert (not b!247980))

(assert (not b!247979))

(assert (not start!53410))

(assert (not b!247975))

(check-sat)

(pop 1)

(push 1)

(check-sat)

