; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2268 () Bool)

(assert start!2268)

(declare-fun b!10695 () Bool)

(declare-fun res!10643 () Bool)

(declare-fun e!6572 () Bool)

(assert (=> b!10695 (=> (not res!10643) (not e!6572))))

(declare-datatypes ((array!640 0))(
  ( (array!641 (arr!693 (Array (_ BitVec 32) (_ BitVec 8))) (size!276 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!518 0))(
  ( (BitStream!519 (buf!618 array!640) (currentByte!1684 (_ BitVec 32)) (currentBit!1679 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!518)

(declare-datatypes ((Unit!924 0))(
  ( (Unit!925) )
))
(declare-datatypes ((tuple2!1318 0))(
  ( (tuple2!1319 (_1!702 Unit!924) (_2!702 BitStream!518)) )
))
(declare-fun lt!16725 () tuple2!1318)

(declare-fun isPrefixOf!0 (BitStream!518 BitStream!518) Bool)

(assert (=> b!10695 (= res!10643 (isPrefixOf!0 thiss!1486 (_2!702 lt!16725)))))

(declare-fun b!10696 () Bool)

(declare-fun e!6575 () Bool)

(assert (=> b!10696 (= e!6575 e!6572)))

(declare-fun res!10642 () Bool)

(assert (=> b!10696 (=> (not res!10642) (not e!6572))))

(declare-fun lt!16723 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10696 (= res!10642 (= (bitIndex!0 (size!276 (buf!618 (_2!702 lt!16725))) (currentByte!1684 (_2!702 lt!16725)) (currentBit!1679 (_2!702 lt!16725))) lt!16723))))

(declare-fun lt!16722 () (_ BitVec 64))

(declare-fun nBits!460 () (_ BitVec 64))

(assert (=> b!10696 (= lt!16723 (bvadd lt!16722 nBits!460))))

(assert (=> b!10696 (= lt!16722 (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)))))

(declare-fun b!10697 () Bool)

(declare-fun res!10638 () Bool)

(declare-fun e!6569 () Bool)

(assert (=> b!10697 (=> (not res!10638) (not e!6569))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10697 (= res!10638 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 thiss!1486))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) nBits!460))))

(declare-fun b!10698 () Bool)

(declare-fun e!6574 () Bool)

(declare-fun array_inv!268 (array!640) Bool)

(assert (=> b!10698 (= e!6574 (array_inv!268 (buf!618 thiss!1486)))))

(declare-fun b!10699 () Bool)

(declare-fun res!10639 () Bool)

(assert (=> b!10699 (=> (not res!10639) (not e!6575))))

(assert (=> b!10699 (= res!10639 (= (size!276 (buf!618 thiss!1486)) (size!276 (buf!618 (_2!702 lt!16725)))))))

(declare-fun b!10700 () Bool)

(assert (=> b!10700 (= e!6569 e!6575)))

(declare-fun res!10641 () Bool)

(assert (=> b!10700 (=> (not res!10641) (not e!6575))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10700 (= res!10641 (invariant!0 (currentBit!1679 (_2!702 lt!16725)) (currentByte!1684 (_2!702 lt!16725)) (size!276 (buf!618 (_2!702 lt!16725)))))))

(declare-fun srcBuffer!6 () array!640)

(declare-fun from!367 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!518 array!640 (_ BitVec 64) (_ BitVec 64)) tuple2!1318)

(assert (=> b!10700 (= lt!16725 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!10637 () Bool)

(assert (=> start!2268 (=> (not res!10637) (not e!6569))))

(assert (=> start!2268 (= res!10637 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!276 srcBuffer!6))))))))

(assert (=> start!2268 e!6569))

(assert (=> start!2268 true))

(assert (=> start!2268 (array_inv!268 srcBuffer!6)))

(declare-fun inv!12 (BitStream!518) Bool)

(assert (=> start!2268 (and (inv!12 thiss!1486) e!6574)))

(declare-fun b!10701 () Bool)

(declare-fun e!6573 () Bool)

(declare-fun e!6571 () Bool)

(assert (=> b!10701 (= e!6573 e!6571)))

(declare-fun res!10644 () Bool)

(assert (=> b!10701 (=> res!10644 e!6571)))

(declare-datatypes ((tuple2!1320 0))(
  ( (tuple2!1321 (_1!703 array!640) (_2!703 BitStream!518)) )
))
(declare-fun lt!16729 () tuple2!1320)

(declare-fun checkByteArrayBitContent!0 (BitStream!518 array!640 array!640 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10701 (= res!10644 (not (checkByteArrayBitContent!0 (_2!702 lt!16725) srcBuffer!6 (_1!703 lt!16729) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!16727 () Unit!924)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!518 array!640 array!640 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!924)

(assert (=> b!10701 (= lt!16727 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!702 lt!16725) srcBuffer!6 (_1!703 lt!16729) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(declare-fun b!10702 () Bool)

(assert (=> b!10702 (= e!6572 (not e!6573))))

(declare-fun res!10645 () Bool)

(assert (=> b!10702 (=> res!10645 e!6573)))

(declare-datatypes ((List!155 0))(
  ( (Nil!152) (Cons!151 (h!270 Bool) (t!905 List!155)) )
))
(declare-fun lt!16728 () List!155)

(declare-fun byteArrayBitContentToList!0 (BitStream!518 array!640 (_ BitVec 64) (_ BitVec 64)) List!155)

(assert (=> b!10702 (= res!10645 (not (= (byteArrayBitContentToList!0 (_2!702 lt!16725) (_1!703 lt!16729) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!16728)))))

(declare-datatypes ((tuple2!1322 0))(
  ( (tuple2!1323 (_1!704 BitStream!518) (_2!704 BitStream!518)) )
))
(declare-fun lt!16726 () tuple2!1322)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!518 BitStream!518 (_ BitVec 64)) List!155)

(assert (=> b!10702 (= lt!16728 (bitStreamReadBitsIntoList!0 (_2!702 lt!16725) (_1!704 lt!16726) nBits!460))))

(declare-fun readBits!0 (BitStream!518 (_ BitVec 64)) tuple2!1320)

(assert (=> b!10702 (= lt!16729 (readBits!0 (_1!704 lt!16726) nBits!460))))

(assert (=> b!10702 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!16725)))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) nBits!460)))

(declare-fun lt!16730 () Unit!924)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!518 array!640 (_ BitVec 64)) Unit!924)

(assert (=> b!10702 (= lt!16730 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!618 (_2!702 lt!16725)) nBits!460))))

(declare-fun reader!0 (BitStream!518 BitStream!518) tuple2!1322)

(assert (=> b!10702 (= lt!16726 (reader!0 thiss!1486 (_2!702 lt!16725)))))

(declare-fun b!10703 () Bool)

(declare-fun res!10640 () Bool)

(assert (=> b!10703 (=> res!10640 e!6573)))

(assert (=> b!10703 (= res!10640 (not (= lt!16728 (byteArrayBitContentToList!0 (_2!702 lt!16725) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!10704 () Bool)

(declare-fun lt!16724 () (_ BitVec 64))

(assert (=> b!10704 (= e!6571 (or (not (= lt!16724 (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!16724 (bvand lt!16723 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!10704 (= lt!16724 (bvand lt!16722 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!2268 res!10637) b!10697))

(assert (= (and b!10697 res!10638) b!10700))

(assert (= (and b!10700 res!10641) b!10699))

(assert (= (and b!10699 res!10639) b!10696))

(assert (= (and b!10696 res!10642) b!10695))

(assert (= (and b!10695 res!10643) b!10702))

(assert (= (and b!10702 (not res!10645)) b!10703))

(assert (= (and b!10703 (not res!10640)) b!10701))

(assert (= (and b!10701 (not res!10644)) b!10704))

(assert (= start!2268 b!10698))

(declare-fun m!15605 () Bool)

(assert (=> b!10700 m!15605))

(declare-fun m!15607 () Bool)

(assert (=> b!10700 m!15607))

(declare-fun m!15609 () Bool)

(assert (=> b!10697 m!15609))

(declare-fun m!15611 () Bool)

(assert (=> start!2268 m!15611))

(declare-fun m!15613 () Bool)

(assert (=> start!2268 m!15613))

(declare-fun m!15615 () Bool)

(assert (=> b!10696 m!15615))

(declare-fun m!15617 () Bool)

(assert (=> b!10696 m!15617))

(declare-fun m!15619 () Bool)

(assert (=> b!10702 m!15619))

(declare-fun m!15621 () Bool)

(assert (=> b!10702 m!15621))

(declare-fun m!15623 () Bool)

(assert (=> b!10702 m!15623))

(declare-fun m!15625 () Bool)

(assert (=> b!10702 m!15625))

(declare-fun m!15627 () Bool)

(assert (=> b!10702 m!15627))

(declare-fun m!15629 () Bool)

(assert (=> b!10702 m!15629))

(declare-fun m!15631 () Bool)

(assert (=> b!10701 m!15631))

(declare-fun m!15633 () Bool)

(assert (=> b!10701 m!15633))

(declare-fun m!15635 () Bool)

(assert (=> b!10703 m!15635))

(declare-fun m!15637 () Bool)

(assert (=> b!10698 m!15637))

(declare-fun m!15639 () Bool)

(assert (=> b!10695 m!15639))

(push 1)

(assert (not b!10703))

(assert (not start!2268))

(assert (not b!10701))

(assert (not b!10698))

(assert (not b!10697))

(assert (not b!10695))

(assert (not b!10700))

(assert (not b!10696))

(assert (not b!10702))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3352 () Bool)

(declare-fun res!10650 () Bool)

(declare-fun e!6580 () Bool)

(assert (=> d!3352 (=> res!10650 e!6580)))

(assert (=> d!3352 (= res!10650 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3352 (= (checkByteArrayBitContent!0 (_2!702 lt!16725) srcBuffer!6 (_1!703 lt!16729) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6580)))

(declare-fun b!10709 () Bool)

(declare-fun e!6581 () Bool)

(assert (=> b!10709 (= e!6580 e!6581)))

(declare-fun res!10651 () Bool)

(assert (=> b!10709 (=> (not res!10651) (not e!6581))))

(assert (=> b!10709 (= res!10651 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!693 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!693 (_1!703 lt!16729)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!10710 () Bool)

(assert (=> b!10710 (= e!6581 (checkByteArrayBitContent!0 (_2!702 lt!16725) srcBuffer!6 (_1!703 lt!16729) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3352 (not res!10650)) b!10709))

(assert (= (and b!10709 res!10651) b!10710))

(declare-fun m!15641 () Bool)

(assert (=> b!10709 m!15641))

(declare-fun m!15643 () Bool)

(assert (=> b!10709 m!15643))

(declare-fun m!15645 () Bool)

(assert (=> b!10709 m!15645))

(declare-fun m!15647 () Bool)

(assert (=> b!10709 m!15647))

(declare-fun m!15649 () Bool)

(assert (=> b!10710 m!15649))

(assert (=> b!10701 d!3352))

(declare-fun d!3354 () Bool)

(assert (=> d!3354 (checkByteArrayBitContent!0 (_2!702 lt!16725) srcBuffer!6 (_1!703 lt!16729) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!16733 () Unit!924)

(declare-fun choose!65 (BitStream!518 array!640 array!640 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!924)

(assert (=> d!3354 (= lt!16733 (choose!65 (_2!702 lt!16725) srcBuffer!6 (_1!703 lt!16729) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3354 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3354 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!702 lt!16725) srcBuffer!6 (_1!703 lt!16729) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!16733)))

(declare-fun bs!998 () Bool)

(assert (= bs!998 d!3354))

(assert (=> bs!998 m!15631))

(declare-fun m!15651 () Bool)

(assert (=> bs!998 m!15651))

(assert (=> b!10701 d!3354))

(declare-fun d!3356 () Bool)

(declare-fun e!6584 () Bool)

(assert (=> d!3356 e!6584))

(declare-fun res!10656 () Bool)

(assert (=> d!3356 (=> (not res!10656) (not e!6584))))

(declare-fun lt!16751 () (_ BitVec 64))

(declare-fun lt!16746 () (_ BitVec 64))

(declare-fun lt!16750 () (_ BitVec 64))

(assert (=> d!3356 (= res!10656 (= lt!16750 (bvsub lt!16746 lt!16751)))))

(assert (=> d!3356 (or (= (bvand lt!16746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16751 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16746 lt!16751) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3356 (= lt!16751 (remainingBits!0 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!16725)))) ((_ sign_extend 32) (currentByte!1684 (_2!702 lt!16725))) ((_ sign_extend 32) (currentBit!1679 (_2!702 lt!16725)))))))

(declare-fun lt!16748 () (_ BitVec 64))

(declare-fun lt!16747 () (_ BitVec 64))

(assert (=> d!3356 (= lt!16746 (bvmul lt!16748 lt!16747))))

(assert (=> d!3356 (or (= lt!16748 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!16747 (bvsdiv (bvmul lt!16748 lt!16747) lt!16748)))))

(assert (=> d!3356 (= lt!16747 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3356 (= lt!16748 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!16725)))))))

(assert (=> d!3356 (= lt!16750 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1684 (_2!702 lt!16725))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1679 (_2!702 lt!16725)))))))

(assert (=> d!3356 (invariant!0 (currentBit!1679 (_2!702 lt!16725)) (currentByte!1684 (_2!702 lt!16725)) (size!276 (buf!618 (_2!702 lt!16725))))))

(assert (=> d!3356 (= (bitIndex!0 (size!276 (buf!618 (_2!702 lt!16725))) (currentByte!1684 (_2!702 lt!16725)) (currentBit!1679 (_2!702 lt!16725))) lt!16750)))

(declare-fun b!10715 () Bool)

(declare-fun res!10657 () Bool)

(assert (=> b!10715 (=> (not res!10657) (not e!6584))))

(assert (=> b!10715 (= res!10657 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!16750))))

(declare-fun b!10716 () Bool)

(declare-fun lt!16749 () (_ BitVec 64))

(assert (=> b!10716 (= e!6584 (bvsle lt!16750 (bvmul lt!16749 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10716 (or (= lt!16749 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!16749 #b0000000000000000000000000000000000000000000000000000000000001000) lt!16749)))))

(assert (=> b!10716 (= lt!16749 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!16725)))))))

(assert (= (and d!3356 res!10656) b!10715))

(assert (= (and b!10715 res!10657) b!10716))

(declare-fun m!15653 () Bool)

(assert (=> d!3356 m!15653))

(assert (=> d!3356 m!15605))

(assert (=> b!10696 d!3356))

(declare-fun d!3358 () Bool)

(declare-fun e!6585 () Bool)

(assert (=> d!3358 e!6585))

(declare-fun res!10658 () Bool)

(assert (=> d!3358 (=> (not res!10658) (not e!6585))))

(declare-fun lt!16756 () (_ BitVec 64))

(declare-fun lt!16752 () (_ BitVec 64))

(declare-fun lt!16757 () (_ BitVec 64))

(assert (=> d!3358 (= res!10658 (= lt!16756 (bvsub lt!16752 lt!16757)))))

(assert (=> d!3358 (or (= (bvand lt!16752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!16757 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!16752 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!16752 lt!16757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3358 (= lt!16757 (remainingBits!0 ((_ sign_extend 32) (size!276 (buf!618 thiss!1486))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486))))))

(declare-fun lt!16754 () (_ BitVec 64))

(declare-fun lt!16753 () (_ BitVec 64))

(assert (=> d!3358 (= lt!16752 (bvmul lt!16754 lt!16753))))

(assert (=> d!3358 (or (= lt!16754 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!16753 (bvsdiv (bvmul lt!16754 lt!16753) lt!16754)))))

(assert (=> d!3358 (= lt!16753 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3358 (= lt!16754 ((_ sign_extend 32) (size!276 (buf!618 thiss!1486))))))

(assert (=> d!3358 (= lt!16756 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1684 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1679 thiss!1486))))))

(assert (=> d!3358 (invariant!0 (currentBit!1679 thiss!1486) (currentByte!1684 thiss!1486) (size!276 (buf!618 thiss!1486)))))

(assert (=> d!3358 (= (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)) lt!16756)))

(declare-fun b!10717 () Bool)

(declare-fun res!10659 () Bool)

(assert (=> b!10717 (=> (not res!10659) (not e!6585))))

(assert (=> b!10717 (= res!10659 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!16756))))

(declare-fun b!10718 () Bool)

(declare-fun lt!16755 () (_ BitVec 64))

(assert (=> b!10718 (= e!6585 (bvsle lt!16756 (bvmul lt!16755 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10718 (or (= lt!16755 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!16755 #b0000000000000000000000000000000000000000000000000000000000001000) lt!16755)))))

(assert (=> b!10718 (= lt!16755 ((_ sign_extend 32) (size!276 (buf!618 thiss!1486))))))

(assert (= (and d!3358 res!10658) b!10717))

(assert (= (and b!10717 res!10659) b!10718))

(declare-fun m!15655 () Bool)

(assert (=> d!3358 m!15655))

(declare-fun m!15657 () Bool)

(assert (=> d!3358 m!15657))

(assert (=> b!10696 d!3358))

(declare-fun d!3360 () Bool)

(declare-fun res!10666 () Bool)

(declare-fun e!6590 () Bool)

(assert (=> d!3360 (=> (not res!10666) (not e!6590))))

(assert (=> d!3360 (= res!10666 (= (size!276 (buf!618 thiss!1486)) (size!276 (buf!618 (_2!702 lt!16725)))))))

(assert (=> d!3360 (= (isPrefixOf!0 thiss!1486 (_2!702 lt!16725)) e!6590)))

(declare-fun b!10725 () Bool)

(declare-fun res!10668 () Bool)

(assert (=> b!10725 (=> (not res!10668) (not e!6590))))

(assert (=> b!10725 (= res!10668 (bvsle (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)) (bitIndex!0 (size!276 (buf!618 (_2!702 lt!16725))) (currentByte!1684 (_2!702 lt!16725)) (currentBit!1679 (_2!702 lt!16725)))))))

(declare-fun b!10726 () Bool)

(declare-fun e!6591 () Bool)

(assert (=> b!10726 (= e!6590 e!6591)))

(declare-fun res!10667 () Bool)

(assert (=> b!10726 (=> res!10667 e!6591)))

(assert (=> b!10726 (= res!10667 (= (size!276 (buf!618 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!10727 () Bool)

(declare-fun arrayBitRangesEq!0 (array!640 array!640 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10727 (= e!6591 (arrayBitRangesEq!0 (buf!618 thiss!1486) (buf!618 (_2!702 lt!16725)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486))))))

(assert (= (and d!3360 res!10666) b!10725))

(assert (= (and b!10725 res!10668) b!10726))

(assert (= (and b!10726 (not res!10667)) b!10727))

(assert (=> b!10725 m!15617))

(assert (=> b!10725 m!15615))

(assert (=> b!10727 m!15617))

(assert (=> b!10727 m!15617))

(declare-fun m!15659 () Bool)

(assert (=> b!10727 m!15659))

(assert (=> b!10695 d!3360))

(declare-fun d!3362 () Bool)

(assert (=> d!3362 (= (invariant!0 (currentBit!1679 (_2!702 lt!16725)) (currentByte!1684 (_2!702 lt!16725)) (size!276 (buf!618 (_2!702 lt!16725)))) (and (bvsge (currentBit!1679 (_2!702 lt!16725)) #b00000000000000000000000000000000) (bvslt (currentBit!1679 (_2!702 lt!16725)) #b00000000000000000000000000001000) (bvsge (currentByte!1684 (_2!702 lt!16725)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1684 (_2!702 lt!16725)) (size!276 (buf!618 (_2!702 lt!16725)))) (and (= (currentBit!1679 (_2!702 lt!16725)) #b00000000000000000000000000000000) (= (currentByte!1684 (_2!702 lt!16725)) (size!276 (buf!618 (_2!702 lt!16725))))))))))

(assert (=> b!10700 d!3362))

(declare-fun lt!17172 () tuple2!1318)

(declare-fun call!206 () tuple2!1322)

(declare-fun lt!17147 () tuple2!1318)

(declare-fun bm!203 () Bool)

(declare-fun c!731 () Bool)

(assert (=> bm!203 (= call!206 (reader!0 (ite c!731 (_2!702 lt!17147) thiss!1486) (ite c!731 (_2!702 lt!17172) thiss!1486)))))

(declare-fun b!10821 () Bool)

(declare-fun res!10741 () Bool)

(declare-fun e!6637 () Bool)

(assert (=> b!10821 (=> (not res!10741) (not e!6637))))

(declare-fun lt!17163 () tuple2!1318)

(assert (=> b!10821 (= res!10741 (isPrefixOf!0 thiss!1486 (_2!702 lt!17163)))))

(declare-fun b!10822 () Bool)

(declare-fun res!10744 () Bool)

(assert (=> b!10822 (=> (not res!10744) (not e!6637))))

(assert (=> b!10822 (= res!10744 (= (size!276 (buf!618 (_2!702 lt!17163))) (size!276 (buf!618 thiss!1486))))))

(declare-fun b!10823 () Bool)

(declare-fun e!6635 () tuple2!1318)

(declare-fun Unit!940 () Unit!924)

(assert (=> b!10823 (= e!6635 (tuple2!1319 Unit!940 thiss!1486))))

(assert (=> b!10823 (= (size!276 (buf!618 thiss!1486)) (size!276 (buf!618 thiss!1486)))))

(declare-fun lt!17143 () Unit!924)

(declare-fun Unit!941 () Unit!924)

(assert (=> b!10823 (= lt!17143 Unit!941)))

(assert (=> b!10823 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!703 (readBits!0 (_1!704 call!206) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17160 () tuple2!1322)

(declare-fun b!10824 () Bool)

(assert (=> b!10824 (= e!6637 (= (bitStreamReadBitsIntoList!0 (_2!702 lt!17163) (_1!704 lt!17160) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!702 lt!17163) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10824 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10824 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!17176 () Unit!924)

(declare-fun lt!17177 () Unit!924)

(assert (=> b!10824 (= lt!17176 lt!17177)))

(declare-fun lt!17180 () (_ BitVec 64))

(assert (=> b!10824 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!17163)))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) lt!17180)))

(assert (=> b!10824 (= lt!17177 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!618 (_2!702 lt!17163)) lt!17180))))

(declare-fun e!6636 () Bool)

(assert (=> b!10824 e!6636))

(declare-fun res!10743 () Bool)

(assert (=> b!10824 (=> (not res!10743) (not e!6636))))

(assert (=> b!10824 (= res!10743 (and (= (size!276 (buf!618 thiss!1486)) (size!276 (buf!618 (_2!702 lt!17163)))) (bvsge lt!17180 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10824 (= lt!17180 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10824 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10824 (= lt!17160 (reader!0 thiss!1486 (_2!702 lt!17163)))))

(declare-fun b!10825 () Bool)

(declare-fun Unit!942 () Unit!924)

(assert (=> b!10825 (= e!6635 (tuple2!1319 Unit!942 (_2!702 lt!17172)))))

(declare-fun appendBitFromByte!0 (BitStream!518 (_ BitVec 8) (_ BitVec 32)) tuple2!1318)

(assert (=> b!10825 (= lt!17147 (appendBitFromByte!0 thiss!1486 (select (arr!693 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!17159 () (_ BitVec 64))

(assert (=> b!10825 (= lt!17159 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17173 () (_ BitVec 64))

(assert (=> b!10825 (= lt!17173 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17144 () Unit!924)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!518 BitStream!518 (_ BitVec 64) (_ BitVec 64)) Unit!924)

(assert (=> b!10825 (= lt!17144 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!702 lt!17147) lt!17159 lt!17173))))

(assert (=> b!10825 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!17147)))) ((_ sign_extend 32) (currentByte!1684 (_2!702 lt!17147))) ((_ sign_extend 32) (currentBit!1679 (_2!702 lt!17147))) (bvsub lt!17159 lt!17173))))

(declare-fun lt!17142 () Unit!924)

(assert (=> b!10825 (= lt!17142 lt!17144)))

(declare-fun lt!17164 () tuple2!1322)

(assert (=> b!10825 (= lt!17164 (reader!0 thiss!1486 (_2!702 lt!17147)))))

(declare-fun lt!17154 () (_ BitVec 64))

(assert (=> b!10825 (= lt!17154 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17171 () Unit!924)

(assert (=> b!10825 (= lt!17171 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!618 (_2!702 lt!17147)) lt!17154))))

(assert (=> b!10825 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!17147)))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) lt!17154)))

(declare-fun lt!17146 () Unit!924)

(assert (=> b!10825 (= lt!17146 lt!17171)))

(declare-fun head!61 (List!155) Bool)

(assert (=> b!10825 (= (head!61 (byteArrayBitContentToList!0 (_2!702 lt!17147) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!61 (bitStreamReadBitsIntoList!0 (_2!702 lt!17147) (_1!704 lt!17164) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17148 () Unit!924)

(declare-fun Unit!943 () Unit!924)

(assert (=> b!10825 (= lt!17148 Unit!943)))

(assert (=> b!10825 (= lt!17172 (appendBitsMSBFirstLoop!0 (_2!702 lt!17147) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!17175 () Unit!924)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!518 BitStream!518 BitStream!518) Unit!924)

(assert (=> b!10825 (= lt!17175 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!702 lt!17147) (_2!702 lt!17172)))))

(assert (=> b!10825 (isPrefixOf!0 thiss!1486 (_2!702 lt!17172))))

(declare-fun lt!17155 () Unit!924)

(assert (=> b!10825 (= lt!17155 lt!17175)))

(assert (=> b!10825 (= (size!276 (buf!618 (_2!702 lt!17172))) (size!276 (buf!618 thiss!1486)))))

(declare-fun lt!17165 () Unit!924)

(declare-fun Unit!944 () Unit!924)

(assert (=> b!10825 (= lt!17165 Unit!944)))

(assert (=> b!10825 (= (bitIndex!0 (size!276 (buf!618 (_2!702 lt!17172))) (currentByte!1684 (_2!702 lt!17172)) (currentBit!1679 (_2!702 lt!17172))) (bvsub (bvadd (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!17157 () Unit!924)

(declare-fun Unit!945 () Unit!924)

(assert (=> b!10825 (= lt!17157 Unit!945)))

(assert (=> b!10825 (= (bitIndex!0 (size!276 (buf!618 (_2!702 lt!17172))) (currentByte!1684 (_2!702 lt!17172)) (currentBit!1679 (_2!702 lt!17172))) (bvsub (bvsub (bvadd (bitIndex!0 (size!276 (buf!618 (_2!702 lt!17147))) (currentByte!1684 (_2!702 lt!17147)) (currentBit!1679 (_2!702 lt!17147))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!17170 () Unit!924)

(declare-fun Unit!946 () Unit!924)

(assert (=> b!10825 (= lt!17170 Unit!946)))

(declare-fun lt!17167 () tuple2!1322)

(assert (=> b!10825 (= lt!17167 (reader!0 thiss!1486 (_2!702 lt!17172)))))

(declare-fun lt!17156 () (_ BitVec 64))

(assert (=> b!10825 (= lt!17156 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17149 () Unit!924)

(assert (=> b!10825 (= lt!17149 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!618 (_2!702 lt!17172)) lt!17156))))

(assert (=> b!10825 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!17172)))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) lt!17156)))

(declare-fun lt!17140 () Unit!924)

(assert (=> b!10825 (= lt!17140 lt!17149)))

(declare-fun lt!17153 () tuple2!1322)

(assert (=> b!10825 (= lt!17153 call!206)))

(declare-fun lt!17137 () (_ BitVec 64))

(assert (=> b!10825 (= lt!17137 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!17179 () Unit!924)

(assert (=> b!10825 (= lt!17179 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!702 lt!17147) (buf!618 (_2!702 lt!17172)) lt!17137))))

(assert (=> b!10825 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!17172)))) ((_ sign_extend 32) (currentByte!1684 (_2!702 lt!17147))) ((_ sign_extend 32) (currentBit!1679 (_2!702 lt!17147))) lt!17137)))

(declare-fun lt!17158 () Unit!924)

(assert (=> b!10825 (= lt!17158 lt!17179)))

(declare-fun lt!17151 () List!155)

(assert (=> b!10825 (= lt!17151 (byteArrayBitContentToList!0 (_2!702 lt!17172) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!17152 () List!155)

(assert (=> b!10825 (= lt!17152 (byteArrayBitContentToList!0 (_2!702 lt!17172) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17138 () List!155)

(assert (=> b!10825 (= lt!17138 (bitStreamReadBitsIntoList!0 (_2!702 lt!17172) (_1!704 lt!17167) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!17174 () List!155)

(assert (=> b!10825 (= lt!17174 (bitStreamReadBitsIntoList!0 (_2!702 lt!17172) (_1!704 lt!17153) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17166 () (_ BitVec 64))

(assert (=> b!10825 (= lt!17166 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17139 () Unit!924)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!518 BitStream!518 BitStream!518 BitStream!518 (_ BitVec 64) List!155) Unit!924)

(assert (=> b!10825 (= lt!17139 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!702 lt!17172) (_2!702 lt!17172) (_1!704 lt!17167) (_1!704 lt!17153) lt!17166 lt!17138))))

(declare-fun tail!69 (List!155) List!155)

(assert (=> b!10825 (= (bitStreamReadBitsIntoList!0 (_2!702 lt!17172) (_1!704 lt!17153) (bvsub lt!17166 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!69 lt!17138))))

(declare-fun lt!17168 () Unit!924)

(assert (=> b!10825 (= lt!17168 lt!17139)))

(declare-fun lt!17178 () Unit!924)

(declare-fun lt!17162 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!640 array!640 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!924)

(assert (=> b!10825 (= lt!17178 (arrayBitRangesEqImpliesEq!0 (buf!618 (_2!702 lt!17147)) (buf!618 (_2!702 lt!17172)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!17162 (bitIndex!0 (size!276 (buf!618 (_2!702 lt!17147))) (currentByte!1684 (_2!702 lt!17147)) (currentBit!1679 (_2!702 lt!17147)))))))

(declare-fun bitAt!0 (array!640 (_ BitVec 64)) Bool)

(assert (=> b!10825 (= (bitAt!0 (buf!618 (_2!702 lt!17147)) lt!17162) (bitAt!0 (buf!618 (_2!702 lt!17172)) lt!17162))))

(declare-fun lt!17169 () Unit!924)

(assert (=> b!10825 (= lt!17169 lt!17178)))

(declare-fun b!10826 () Bool)

(assert (=> b!10826 (= e!6636 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 thiss!1486))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) lt!17180))))

(declare-fun d!3364 () Bool)

(assert (=> d!3364 e!6637))

(declare-fun res!10745 () Bool)

(assert (=> d!3364 (=> (not res!10745) (not e!6637))))

(declare-fun lt!17145 () (_ BitVec 64))

(assert (=> d!3364 (= res!10745 (= (bitIndex!0 (size!276 (buf!618 (_2!702 lt!17163))) (currentByte!1684 (_2!702 lt!17163)) (currentBit!1679 (_2!702 lt!17163))) (bvsub lt!17145 from!367)))))

(assert (=> d!3364 (or (= (bvand lt!17145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17145 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!17161 () (_ BitVec 64))

(assert (=> d!3364 (= lt!17145 (bvadd lt!17161 from!367 nBits!460))))

(assert (=> d!3364 (or (not (= (bvand lt!17161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!17161 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!17161 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3364 (= lt!17161 (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)))))

(assert (=> d!3364 (= lt!17163 e!6635)))

(assert (=> d!3364 (= c!731 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!17141 () Unit!924)

(declare-fun lt!17150 () Unit!924)

(assert (=> d!3364 (= lt!17141 lt!17150)))

(assert (=> d!3364 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!518) Unit!924)

(assert (=> d!3364 (= lt!17150 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3364 (= lt!17162 (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)))))

(assert (=> d!3364 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3364 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!17163)))

(declare-fun b!10827 () Bool)

(declare-fun res!10740 () Bool)

(assert (=> b!10827 (=> (not res!10740) (not e!6637))))

(assert (=> b!10827 (= res!10740 (invariant!0 (currentBit!1679 (_2!702 lt!17163)) (currentByte!1684 (_2!702 lt!17163)) (size!276 (buf!618 (_2!702 lt!17163)))))))

(declare-fun b!10828 () Bool)

(declare-fun res!10742 () Bool)

(assert (=> b!10828 (=> (not res!10742) (not e!6637))))

(assert (=> b!10828 (= res!10742 (= (size!276 (buf!618 thiss!1486)) (size!276 (buf!618 (_2!702 lt!17163)))))))

(assert (= (and d!3364 c!731) b!10825))

(assert (= (and d!3364 (not c!731)) b!10823))

(assert (= (or b!10825 b!10823) bm!203))

(assert (= (and d!3364 res!10745) b!10827))

(assert (= (and b!10827 res!10740) b!10828))

(assert (= (and b!10828 res!10742) b!10821))

(assert (= (and b!10821 res!10741) b!10822))

(assert (= (and b!10822 res!10744) b!10824))

(assert (= (and b!10824 res!10743) b!10826))

(assert (=> b!10825 m!15617))

(assert (=> b!10825 m!15641))

(declare-fun m!15869 () Bool)

(assert (=> b!10825 m!15869))

(declare-fun m!15871 () Bool)

(assert (=> b!10825 m!15871))

(declare-fun m!15873 () Bool)

(assert (=> b!10825 m!15873))

(declare-fun m!15875 () Bool)

(assert (=> b!10825 m!15875))

(declare-fun m!15877 () Bool)

(assert (=> b!10825 m!15877))

(declare-fun m!15879 () Bool)

(assert (=> b!10825 m!15879))

(declare-fun m!15881 () Bool)

(assert (=> b!10825 m!15881))

(assert (=> b!10825 m!15641))

(declare-fun m!15885 () Bool)

(assert (=> b!10825 m!15885))

(assert (=> b!10825 m!15869))

(declare-fun m!15887 () Bool)

(assert (=> b!10825 m!15887))

(declare-fun m!15889 () Bool)

(assert (=> b!10825 m!15889))

(declare-fun m!15891 () Bool)

(assert (=> b!10825 m!15891))

(assert (=> b!10825 m!15871))

(declare-fun m!15893 () Bool)

(assert (=> b!10825 m!15893))

(declare-fun m!15895 () Bool)

(assert (=> b!10825 m!15895))

(declare-fun m!15897 () Bool)

(assert (=> b!10825 m!15897))

(declare-fun m!15899 () Bool)

(assert (=> b!10825 m!15899))

(declare-fun m!15901 () Bool)

(assert (=> b!10825 m!15901))

(declare-fun m!15903 () Bool)

(assert (=> b!10825 m!15903))

(declare-fun m!15905 () Bool)

(assert (=> b!10825 m!15905))

(declare-fun m!15907 () Bool)

(assert (=> b!10825 m!15907))

(declare-fun m!15909 () Bool)

(assert (=> b!10825 m!15909))

(declare-fun m!15911 () Bool)

(assert (=> b!10825 m!15911))

(declare-fun m!15915 () Bool)

(assert (=> b!10825 m!15915))

(declare-fun m!15919 () Bool)

(assert (=> b!10825 m!15919))

(declare-fun m!15921 () Bool)

(assert (=> b!10825 m!15921))

(declare-fun m!15923 () Bool)

(assert (=> b!10825 m!15923))

(declare-fun m!15925 () Bool)

(assert (=> b!10825 m!15925))

(declare-fun m!15927 () Bool)

(assert (=> b!10825 m!15927))

(assert (=> b!10825 m!15889))

(declare-fun m!15929 () Bool)

(assert (=> b!10825 m!15929))

(declare-fun m!15931 () Bool)

(assert (=> b!10825 m!15931))

(declare-fun m!15933 () Bool)

(assert (=> b!10825 m!15933))

(declare-fun m!15935 () Bool)

(assert (=> b!10821 m!15935))

(declare-fun m!15937 () Bool)

(assert (=> b!10823 m!15937))

(declare-fun m!15939 () Bool)

(assert (=> b!10823 m!15939))

(declare-fun m!15941 () Bool)

(assert (=> b!10827 m!15941))

(declare-fun m!15943 () Bool)

(assert (=> b!10826 m!15943))

(declare-fun m!15945 () Bool)

(assert (=> d!3364 m!15945))

(assert (=> d!3364 m!15617))

(declare-fun m!15947 () Bool)

(assert (=> d!3364 m!15947))

(declare-fun m!15949 () Bool)

(assert (=> d!3364 m!15949))

(declare-fun m!15951 () Bool)

(assert (=> b!10824 m!15951))

(declare-fun m!15953 () Bool)

(assert (=> b!10824 m!15953))

(declare-fun m!15955 () Bool)

(assert (=> b!10824 m!15955))

(declare-fun m!15957 () Bool)

(assert (=> b!10824 m!15957))

(declare-fun m!15959 () Bool)

(assert (=> b!10824 m!15959))

(declare-fun m!15961 () Bool)

(assert (=> bm!203 m!15961))

(assert (=> b!10700 d!3364))

(declare-fun d!3398 () Bool)

(declare-fun c!735 () Bool)

(assert (=> d!3398 (= c!735 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6645 () List!155)

(assert (=> d!3398 (= (byteArrayBitContentToList!0 (_2!702 lt!16725) srcBuffer!6 from!367 nBits!460) e!6645)))

(declare-fun b!10843 () Bool)

(assert (=> b!10843 (= e!6645 Nil!152)))

(declare-fun b!10844 () Bool)

(assert (=> b!10844 (= e!6645 (Cons!151 (not (= (bvand ((_ sign_extend 24) (select (arr!693 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!702 lt!16725) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3398 c!735) b!10843))

(assert (= (and d!3398 (not c!735)) b!10844))

(assert (=> b!10844 m!15641))

(assert (=> b!10844 m!15643))

(declare-fun m!15965 () Bool)

(assert (=> b!10844 m!15965))

(assert (=> b!10703 d!3398))

(declare-fun d!3402 () Bool)

(assert (=> d!3402 (= (array_inv!268 (buf!618 thiss!1486)) (bvsge (size!276 (buf!618 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!10698 d!3402))

(declare-fun d!3404 () Bool)

(assert (=> d!3404 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 thiss!1486))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!276 (buf!618 thiss!1486))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486))) nBits!460))))

(declare-fun bs!1003 () Bool)

(assert (= bs!1003 d!3404))

(assert (=> bs!1003 m!15655))

(assert (=> b!10697 d!3404))

(declare-fun d!3406 () Bool)

(assert (=> d!3406 (= (array_inv!268 srcBuffer!6) (bvsge (size!276 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2268 d!3406))

(declare-fun d!3408 () Bool)

(assert (=> d!3408 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1679 thiss!1486) (currentByte!1684 thiss!1486) (size!276 (buf!618 thiss!1486))))))

(declare-fun bs!1004 () Bool)

(assert (= bs!1004 d!3408))

(assert (=> bs!1004 m!15657))

(assert (=> start!2268 d!3408))

(declare-fun d!3410 () Bool)

(declare-fun c!736 () Bool)

(assert (=> d!3410 (= c!736 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6646 () List!155)

(assert (=> d!3410 (= (byteArrayBitContentToList!0 (_2!702 lt!16725) (_1!703 lt!16729) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6646)))

(declare-fun b!10845 () Bool)

(assert (=> b!10845 (= e!6646 Nil!152)))

(declare-fun b!10846 () Bool)

(assert (=> b!10846 (= e!6646 (Cons!151 (not (= (bvand ((_ sign_extend 24) (select (arr!693 (_1!703 lt!16729)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!702 lt!16725) (_1!703 lt!16729) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3410 c!736) b!10845))

(assert (= (and d!3410 (not c!736)) b!10846))

(assert (=> b!10846 m!15645))

(assert (=> b!10846 m!15647))

(declare-fun m!15967 () Bool)

(assert (=> b!10846 m!15967))

(assert (=> b!10702 d!3410))

(declare-fun d!3412 () Bool)

(declare-fun e!6660 () Bool)

(assert (=> d!3412 e!6660))

(declare-fun res!10775 () Bool)

(assert (=> d!3412 (=> (not res!10775) (not e!6660))))

(declare-fun lt!17286 () tuple2!1322)

(assert (=> d!3412 (= res!10775 (isPrefixOf!0 (_1!704 lt!17286) (_2!704 lt!17286)))))

(declare-fun lt!17287 () BitStream!518)

(assert (=> d!3412 (= lt!17286 (tuple2!1323 lt!17287 (_2!702 lt!16725)))))

(declare-fun lt!17299 () Unit!924)

(declare-fun lt!17284 () Unit!924)

(assert (=> d!3412 (= lt!17299 lt!17284)))

(assert (=> d!3412 (isPrefixOf!0 lt!17287 (_2!702 lt!16725))))

(assert (=> d!3412 (= lt!17284 (lemmaIsPrefixTransitive!0 lt!17287 (_2!702 lt!16725) (_2!702 lt!16725)))))

(declare-fun lt!17291 () Unit!924)

(declare-fun lt!17297 () Unit!924)

(assert (=> d!3412 (= lt!17291 lt!17297)))

(assert (=> d!3412 (isPrefixOf!0 lt!17287 (_2!702 lt!16725))))

(assert (=> d!3412 (= lt!17297 (lemmaIsPrefixTransitive!0 lt!17287 thiss!1486 (_2!702 lt!16725)))))

(declare-fun lt!17303 () Unit!924)

(declare-fun e!6661 () Unit!924)

(assert (=> d!3412 (= lt!17303 e!6661)))

(declare-fun c!745 () Bool)

(assert (=> d!3412 (= c!745 (not (= (size!276 (buf!618 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!17289 () Unit!924)

(declare-fun lt!17295 () Unit!924)

(assert (=> d!3412 (= lt!17289 lt!17295)))

(assert (=> d!3412 (isPrefixOf!0 (_2!702 lt!16725) (_2!702 lt!16725))))

(assert (=> d!3412 (= lt!17295 (lemmaIsPrefixRefl!0 (_2!702 lt!16725)))))

(declare-fun lt!17292 () Unit!924)

(declare-fun lt!17296 () Unit!924)

(assert (=> d!3412 (= lt!17292 lt!17296)))

(assert (=> d!3412 (= lt!17296 (lemmaIsPrefixRefl!0 (_2!702 lt!16725)))))

(declare-fun lt!17293 () Unit!924)

(declare-fun lt!17285 () Unit!924)

(assert (=> d!3412 (= lt!17293 lt!17285)))

(assert (=> d!3412 (isPrefixOf!0 lt!17287 lt!17287)))

(assert (=> d!3412 (= lt!17285 (lemmaIsPrefixRefl!0 lt!17287))))

(declare-fun lt!17300 () Unit!924)

(declare-fun lt!17302 () Unit!924)

(assert (=> d!3412 (= lt!17300 lt!17302)))

(assert (=> d!3412 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3412 (= lt!17302 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3412 (= lt!17287 (BitStream!519 (buf!618 (_2!702 lt!16725)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)))))

(assert (=> d!3412 (isPrefixOf!0 thiss!1486 (_2!702 lt!16725))))

(assert (=> d!3412 (= (reader!0 thiss!1486 (_2!702 lt!16725)) lt!17286)))

(declare-fun b!10884 () Bool)

(declare-fun Unit!949 () Unit!924)

(assert (=> b!10884 (= e!6661 Unit!949)))

(declare-fun lt!17290 () (_ BitVec 64))

(declare-fun lt!17294 () (_ BitVec 64))

(declare-fun b!10885 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!518 (_ BitVec 64)) BitStream!518)

(assert (=> b!10885 (= e!6660 (= (_1!704 lt!17286) (withMovedBitIndex!0 (_2!704 lt!17286) (bvsub lt!17294 lt!17290))))))

(assert (=> b!10885 (or (= (bvand lt!17294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17290 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17294 lt!17290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10885 (= lt!17290 (bitIndex!0 (size!276 (buf!618 (_2!702 lt!16725))) (currentByte!1684 (_2!702 lt!16725)) (currentBit!1679 (_2!702 lt!16725))))))

(assert (=> b!10885 (= lt!17294 (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)))))

(declare-fun b!10886 () Bool)

(declare-fun res!10776 () Bool)

(assert (=> b!10886 (=> (not res!10776) (not e!6660))))

(assert (=> b!10886 (= res!10776 (isPrefixOf!0 (_1!704 lt!17286) thiss!1486))))

(declare-fun b!10887 () Bool)

(declare-fun res!10777 () Bool)

(assert (=> b!10887 (=> (not res!10777) (not e!6660))))

(assert (=> b!10887 (= res!10777 (isPrefixOf!0 (_2!704 lt!17286) (_2!702 lt!16725)))))

(declare-fun b!10888 () Bool)

(declare-fun lt!17301 () Unit!924)

(assert (=> b!10888 (= e!6661 lt!17301)))

(declare-fun lt!17298 () (_ BitVec 64))

(assert (=> b!10888 (= lt!17298 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!17288 () (_ BitVec 64))

(assert (=> b!10888 (= lt!17288 (bitIndex!0 (size!276 (buf!618 thiss!1486)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!640 array!640 (_ BitVec 64) (_ BitVec 64)) Unit!924)

(assert (=> b!10888 (= lt!17301 (arrayBitRangesEqSymmetric!0 (buf!618 thiss!1486) (buf!618 (_2!702 lt!16725)) lt!17298 lt!17288))))

(assert (=> b!10888 (arrayBitRangesEq!0 (buf!618 (_2!702 lt!16725)) (buf!618 thiss!1486) lt!17298 lt!17288)))

(assert (= (and d!3412 c!745) b!10888))

(assert (= (and d!3412 (not c!745)) b!10884))

(assert (= (and d!3412 res!10775) b!10886))

(assert (= (and b!10886 res!10776) b!10887))

(assert (= (and b!10887 res!10777) b!10885))

(declare-fun m!15991 () Bool)

(assert (=> b!10885 m!15991))

(assert (=> b!10885 m!15615))

(assert (=> b!10885 m!15617))

(declare-fun m!15993 () Bool)

(assert (=> d!3412 m!15993))

(declare-fun m!15995 () Bool)

(assert (=> d!3412 m!15995))

(declare-fun m!15997 () Bool)

(assert (=> d!3412 m!15997))

(declare-fun m!15999 () Bool)

(assert (=> d!3412 m!15999))

(assert (=> d!3412 m!15949))

(assert (=> d!3412 m!15639))

(declare-fun m!16001 () Bool)

(assert (=> d!3412 m!16001))

(declare-fun m!16003 () Bool)

(assert (=> d!3412 m!16003))

(declare-fun m!16005 () Bool)

(assert (=> d!3412 m!16005))

(assert (=> d!3412 m!15947))

(declare-fun m!16007 () Bool)

(assert (=> d!3412 m!16007))

(declare-fun m!16009 () Bool)

(assert (=> b!10887 m!16009))

(assert (=> b!10888 m!15617))

(declare-fun m!16011 () Bool)

(assert (=> b!10888 m!16011))

(declare-fun m!16013 () Bool)

(assert (=> b!10888 m!16013))

(declare-fun m!16015 () Bool)

(assert (=> b!10886 m!16015))

(assert (=> b!10702 d!3412))

(declare-fun b!10951 () Bool)

(declare-fun res!10818 () Bool)

(declare-fun e!6683 () Bool)

(assert (=> b!10951 (=> (not res!10818) (not e!6683))))

(declare-fun lt!17461 () tuple2!1320)

(assert (=> b!10951 (= res!10818 (invariant!0 (currentBit!1679 (_2!703 lt!17461)) (currentByte!1684 (_2!703 lt!17461)) (size!276 (buf!618 (_2!703 lt!17461)))))))

(declare-fun b!10952 () Bool)

(declare-fun res!10820 () Bool)

(assert (=> b!10952 (=> (not res!10820) (not e!6683))))

(declare-fun lt!17459 () (_ BitVec 64))

(assert (=> b!10952 (= res!10820 (= (size!276 (_1!703 lt!17461)) ((_ extract 31 0) lt!17459)))))

(assert (=> b!10952 (and (bvslt lt!17459 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!17459 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!17465 () (_ BitVec 64))

(declare-fun lt!17458 () (_ BitVec 64))

(assert (=> b!10952 (= lt!17459 (bvsdiv lt!17465 lt!17458))))

(assert (=> b!10952 (and (not (= lt!17458 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!17465 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!17458 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!10952 (= lt!17458 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!17462 () (_ BitVec 64))

(declare-fun lt!17464 () (_ BitVec 64))

(assert (=> b!10952 (= lt!17465 (bvsub lt!17462 lt!17464))))

(assert (=> b!10952 (or (= (bvand lt!17462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17464 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17462 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17462 lt!17464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10952 (= lt!17464 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17466 () (_ BitVec 64))

(assert (=> b!10952 (= lt!17462 (bvadd nBits!460 lt!17466))))

(assert (=> b!10952 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17466 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!17466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10952 (= lt!17466 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!10953 () Bool)

(declare-fun res!10822 () Bool)

(assert (=> b!10953 (=> (not res!10822) (not e!6683))))

(declare-fun lt!17463 () (_ BitVec 64))

(assert (=> b!10953 (= res!10822 (= (bvadd lt!17463 nBits!460) (bitIndex!0 (size!276 (buf!618 (_2!703 lt!17461))) (currentByte!1684 (_2!703 lt!17461)) (currentBit!1679 (_2!703 lt!17461)))))))

(assert (=> b!10953 (or (not (= (bvand lt!17463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!17463 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!17463 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10953 (= lt!17463 (bitIndex!0 (size!276 (buf!618 (_1!704 lt!16726))) (currentByte!1684 (_1!704 lt!16726)) (currentBit!1679 (_1!704 lt!16726))))))

(declare-fun d!3420 () Bool)

(assert (=> d!3420 e!6683))

(declare-fun res!10819 () Bool)

(assert (=> d!3420 (=> (not res!10819) (not e!6683))))

(assert (=> d!3420 (= res!10819 (= (buf!618 (_2!703 lt!17461)) (buf!618 (_1!704 lt!16726))))))

(declare-datatypes ((tuple3!84 0))(
  ( (tuple3!85 (_1!711 Unit!924) (_2!711 BitStream!518) (_3!45 array!640)) )
))
(declare-fun lt!17460 () tuple3!84)

(assert (=> d!3420 (= lt!17461 (tuple2!1321 (_3!45 lt!17460) (_2!711 lt!17460)))))

(declare-fun readBitsLoop!0 (BitStream!518 (_ BitVec 64) array!640 (_ BitVec 64) (_ BitVec 64)) tuple3!84)

(assert (=> d!3420 (= lt!17460 (readBitsLoop!0 (_1!704 lt!16726) nBits!460 (array!641 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3420 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3420 (= (readBits!0 (_1!704 lt!16726) nBits!460) lt!17461)))

(declare-fun b!10954 () Bool)

(assert (=> b!10954 (= e!6683 (= (byteArrayBitContentToList!0 (_2!703 lt!17461) (_1!703 lt!17461) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!703 lt!17461) (_1!704 lt!16726) nBits!460)))))

(declare-fun b!10955 () Bool)

(declare-fun res!10821 () Bool)

(assert (=> b!10955 (=> (not res!10821) (not e!6683))))

(assert (=> b!10955 (= res!10821 (bvsle (currentByte!1684 (_1!704 lt!16726)) (currentByte!1684 (_2!703 lt!17461))))))

(assert (= (and d!3420 res!10819) b!10953))

(assert (= (and b!10953 res!10822) b!10951))

(assert (= (and b!10951 res!10818) b!10952))

(assert (= (and b!10952 res!10820) b!10955))

(assert (= (and b!10955 res!10821) b!10954))

(declare-fun m!16065 () Bool)

(assert (=> b!10951 m!16065))

(declare-fun m!16067 () Bool)

(assert (=> b!10953 m!16067))

(declare-fun m!16069 () Bool)

(assert (=> b!10953 m!16069))

(declare-fun m!16071 () Bool)

(assert (=> d!3420 m!16071))

(declare-fun m!16073 () Bool)

(assert (=> b!10954 m!16073))

(declare-fun m!16075 () Bool)

(assert (=> b!10954 m!16075))

(assert (=> b!10702 d!3420))

(declare-fun d!3430 () Bool)

(assert (=> d!3430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!16725)))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!16725)))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486))) nBits!460))))

(declare-fun bs!1007 () Bool)

(assert (= bs!1007 d!3430))

(declare-fun m!16083 () Bool)

(assert (=> bs!1007 m!16083))

(assert (=> b!10702 d!3430))

(declare-fun d!3432 () Bool)

(assert (=> d!3432 (validate_offset_bits!1 ((_ sign_extend 32) (size!276 (buf!618 (_2!702 lt!16725)))) ((_ sign_extend 32) (currentByte!1684 thiss!1486)) ((_ sign_extend 32) (currentBit!1679 thiss!1486)) nBits!460)))

(declare-fun lt!17489 () Unit!924)

(declare-fun choose!9 (BitStream!518 array!640 (_ BitVec 64) BitStream!518) Unit!924)

(assert (=> d!3432 (= lt!17489 (choose!9 thiss!1486 (buf!618 (_2!702 lt!16725)) nBits!460 (BitStream!519 (buf!618 (_2!702 lt!16725)) (currentByte!1684 thiss!1486) (currentBit!1679 thiss!1486))))))

(assert (=> d!3432 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!618 (_2!702 lt!16725)) nBits!460) lt!17489)))

(declare-fun bs!1008 () Bool)

(assert (= bs!1008 d!3432))

(assert (=> bs!1008 m!15627))

(declare-fun m!16105 () Bool)

(assert (=> bs!1008 m!16105))

(assert (=> b!10702 d!3432))

(declare-fun b!10991 () Bool)

(declare-fun e!6704 () Bool)

(declare-fun lt!17502 () List!155)

(declare-fun isEmpty!36 (List!155) Bool)

(assert (=> b!10991 (= e!6704 (isEmpty!36 lt!17502))))

(declare-fun b!10990 () Bool)

(declare-datatypes ((tuple2!1332 0))(
  ( (tuple2!1333 (_1!712 List!155) (_2!712 BitStream!518)) )
))
(declare-fun e!6705 () tuple2!1332)

(declare-fun lt!17504 () (_ BitVec 64))

(declare-datatypes ((tuple2!1334 0))(
  ( (tuple2!1335 (_1!713 Bool) (_2!713 BitStream!518)) )
))
(declare-fun lt!17503 () tuple2!1334)

(assert (=> b!10990 (= e!6705 (tuple2!1333 (Cons!151 (_1!713 lt!17503) (bitStreamReadBitsIntoList!0 (_2!702 lt!16725) (_2!713 lt!17503) (bvsub nBits!460 lt!17504))) (_2!713 lt!17503)))))

(declare-fun readBit!0 (BitStream!518) tuple2!1334)

(assert (=> b!10990 (= lt!17503 (readBit!0 (_1!704 lt!16726)))))

(assert (=> b!10990 (= lt!17504 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!10989 () Bool)

(assert (=> b!10989 (= e!6705 (tuple2!1333 Nil!152 (_1!704 lt!16726)))))

(declare-fun b!10992 () Bool)

(declare-fun length!31 (List!155) Int)

(assert (=> b!10992 (= e!6704 (> (length!31 lt!17502) 0))))

(declare-fun d!3436 () Bool)

(assert (=> d!3436 e!6704))

(declare-fun c!766 () Bool)

(assert (=> d!3436 (= c!766 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3436 (= lt!17502 (_1!712 e!6705))))

(declare-fun c!767 () Bool)

(assert (=> d!3436 (= c!767 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3436 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3436 (= (bitStreamReadBitsIntoList!0 (_2!702 lt!16725) (_1!704 lt!16726) nBits!460) lt!17502)))

(assert (= (and d!3436 c!767) b!10989))

(assert (= (and d!3436 (not c!767)) b!10990))

(assert (= (and d!3436 c!766) b!10991))

(assert (= (and d!3436 (not c!766)) b!10992))

(declare-fun m!16117 () Bool)

(assert (=> b!10991 m!16117))

(declare-fun m!16119 () Bool)

(assert (=> b!10990 m!16119))

(declare-fun m!16121 () Bool)

(assert (=> b!10990 m!16121))

(declare-fun m!16123 () Bool)

(assert (=> b!10992 m!16123))

(assert (=> b!10702 d!3436))

(push 1)

