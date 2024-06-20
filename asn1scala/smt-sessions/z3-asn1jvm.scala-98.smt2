; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!2266 () Bool)

(assert start!2266)

(declare-fun b!10665 () Bool)

(declare-fun e!6547 () Bool)

(declare-datatypes ((array!638 0))(
  ( (array!639 (arr!692 (Array (_ BitVec 32) (_ BitVec 8))) (size!275 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!516 0))(
  ( (BitStream!517 (buf!617 array!638) (currentByte!1683 (_ BitVec 32)) (currentBit!1678 (_ BitVec 32))) )
))
(declare-fun thiss!1486 () BitStream!516)

(declare-fun array_inv!267 (array!638) Bool)

(assert (=> b!10665 (= e!6547 (array_inv!267 (buf!617 thiss!1486)))))

(declare-fun b!10666 () Bool)

(declare-fun res!10615 () Bool)

(declare-fun e!6544 () Bool)

(assert (=> b!10666 (=> (not res!10615) (not e!6544))))

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10666 (= res!10615 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 thiss!1486))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) nBits!460))))

(declare-fun b!10667 () Bool)

(declare-fun res!10616 () Bool)

(declare-fun e!6549 () Bool)

(assert (=> b!10667 (=> res!10616 e!6549)))

(declare-fun from!367 () (_ BitVec 64))

(declare-datatypes ((Unit!922 0))(
  ( (Unit!923) )
))
(declare-datatypes ((tuple2!1312 0))(
  ( (tuple2!1313 (_1!699 Unit!922) (_2!699 BitStream!516)) )
))
(declare-fun lt!16701 () tuple2!1312)

(declare-fun srcBuffer!6 () array!638)

(declare-datatypes ((List!154 0))(
  ( (Nil!151) (Cons!150 (h!269 Bool) (t!904 List!154)) )
))
(declare-fun lt!16695 () List!154)

(declare-fun byteArrayBitContentToList!0 (BitStream!516 array!638 (_ BitVec 64) (_ BitVec 64)) List!154)

(assert (=> b!10667 (= res!10616 (not (= lt!16695 (byteArrayBitContentToList!0 (_2!699 lt!16701) srcBuffer!6 from!367 nBits!460))))))

(declare-fun b!10668 () Bool)

(declare-fun e!6546 () Bool)

(declare-fun e!6548 () Bool)

(assert (=> b!10668 (= e!6546 e!6548)))

(declare-fun res!10618 () Bool)

(assert (=> b!10668 (=> (not res!10618) (not e!6548))))

(declare-fun lt!16698 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!10668 (= res!10618 (= (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16701))) (currentByte!1683 (_2!699 lt!16701)) (currentBit!1678 (_2!699 lt!16701))) lt!16698))))

(declare-fun lt!16702 () (_ BitVec 64))

(assert (=> b!10668 (= lt!16698 (bvadd lt!16702 nBits!460))))

(assert (=> b!10668 (= lt!16702 (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)))))

(declare-fun e!6551 () Bool)

(declare-fun lt!16697 () (_ BitVec 64))

(declare-fun b!10669 () Bool)

(assert (=> b!10669 (= e!6551 (or (not (= lt!16697 (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!16697 (bvand lt!16698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!10669 (= lt!16697 (bvand lt!16702 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!10670 () Bool)

(assert (=> b!10670 (= e!6544 e!6546)))

(declare-fun res!10611 () Bool)

(assert (=> b!10670 (=> (not res!10611) (not e!6546))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!10670 (= res!10611 (invariant!0 (currentBit!1678 (_2!699 lt!16701)) (currentByte!1683 (_2!699 lt!16701)) (size!275 (buf!617 (_2!699 lt!16701)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!516 array!638 (_ BitVec 64) (_ BitVec 64)) tuple2!1312)

(assert (=> b!10670 (= lt!16701 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun res!10614 () Bool)

(assert (=> start!2266 (=> (not res!10614) (not e!6544))))

(assert (=> start!2266 (= res!10614 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!275 srcBuffer!6))))))))

(assert (=> start!2266 e!6544))

(assert (=> start!2266 true))

(assert (=> start!2266 (array_inv!267 srcBuffer!6)))

(declare-fun inv!12 (BitStream!516) Bool)

(assert (=> start!2266 (and (inv!12 thiss!1486) e!6547)))

(declare-fun b!10671 () Bool)

(declare-fun res!10612 () Bool)

(assert (=> b!10671 (=> (not res!10612) (not e!6548))))

(declare-fun isPrefixOf!0 (BitStream!516 BitStream!516) Bool)

(assert (=> b!10671 (= res!10612 (isPrefixOf!0 thiss!1486 (_2!699 lt!16701)))))

(declare-fun b!10672 () Bool)

(declare-fun res!10610 () Bool)

(assert (=> b!10672 (=> (not res!10610) (not e!6546))))

(assert (=> b!10672 (= res!10610 (= (size!275 (buf!617 thiss!1486)) (size!275 (buf!617 (_2!699 lt!16701)))))))

(declare-fun b!10673 () Bool)

(assert (=> b!10673 (= e!6548 (not e!6549))))

(declare-fun res!10617 () Bool)

(assert (=> b!10673 (=> res!10617 e!6549)))

(declare-datatypes ((tuple2!1314 0))(
  ( (tuple2!1315 (_1!700 array!638) (_2!700 BitStream!516)) )
))
(declare-fun lt!16703 () tuple2!1314)

(assert (=> b!10673 (= res!10617 (not (= (byteArrayBitContentToList!0 (_2!699 lt!16701) (_1!700 lt!16703) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!16695)))))

(declare-datatypes ((tuple2!1316 0))(
  ( (tuple2!1317 (_1!701 BitStream!516) (_2!701 BitStream!516)) )
))
(declare-fun lt!16696 () tuple2!1316)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!516 BitStream!516 (_ BitVec 64)) List!154)

(assert (=> b!10673 (= lt!16695 (bitStreamReadBitsIntoList!0 (_2!699 lt!16701) (_1!701 lt!16696) nBits!460))))

(declare-fun readBits!0 (BitStream!516 (_ BitVec 64)) tuple2!1314)

(assert (=> b!10673 (= lt!16703 (readBits!0 (_1!701 lt!16696) nBits!460))))

(assert (=> b!10673 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16701)))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) nBits!460)))

(declare-fun lt!16699 () Unit!922)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!516 array!638 (_ BitVec 64)) Unit!922)

(assert (=> b!10673 (= lt!16699 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!617 (_2!699 lt!16701)) nBits!460))))

(declare-fun reader!0 (BitStream!516 BitStream!516) tuple2!1316)

(assert (=> b!10673 (= lt!16696 (reader!0 thiss!1486 (_2!699 lt!16701)))))

(declare-fun b!10674 () Bool)

(assert (=> b!10674 (= e!6549 e!6551)))

(declare-fun res!10613 () Bool)

(assert (=> b!10674 (=> res!10613 e!6551)))

(declare-fun checkByteArrayBitContent!0 (BitStream!516 array!638 array!638 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10674 (= res!10613 (not (checkByteArrayBitContent!0 (_2!699 lt!16701) srcBuffer!6 (_1!700 lt!16703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))))

(declare-fun lt!16700 () Unit!922)

(declare-fun lemmaSameBitContentListThenCheckByteArrayBitContent!0 (BitStream!516 array!638 array!638 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!922)

(assert (=> b!10674 (= lt!16700 (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!699 lt!16701) srcBuffer!6 (_1!700 lt!16703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (= (and start!2266 res!10614) b!10666))

(assert (= (and b!10666 res!10615) b!10670))

(assert (= (and b!10670 res!10611) b!10672))

(assert (= (and b!10672 res!10610) b!10668))

(assert (= (and b!10668 res!10618) b!10671))

(assert (= (and b!10671 res!10612) b!10673))

(assert (= (and b!10673 (not res!10617)) b!10667))

(assert (= (and b!10667 (not res!10616)) b!10674))

(assert (= (and b!10674 (not res!10613)) b!10669))

(assert (= start!2266 b!10665))

(declare-fun m!15569 () Bool)

(assert (=> b!10666 m!15569))

(declare-fun m!15571 () Bool)

(assert (=> b!10673 m!15571))

(declare-fun m!15573 () Bool)

(assert (=> b!10673 m!15573))

(declare-fun m!15575 () Bool)

(assert (=> b!10673 m!15575))

(declare-fun m!15577 () Bool)

(assert (=> b!10673 m!15577))

(declare-fun m!15579 () Bool)

(assert (=> b!10673 m!15579))

(declare-fun m!15581 () Bool)

(assert (=> b!10673 m!15581))

(declare-fun m!15583 () Bool)

(assert (=> b!10668 m!15583))

(declare-fun m!15585 () Bool)

(assert (=> b!10668 m!15585))

(declare-fun m!15587 () Bool)

(assert (=> start!2266 m!15587))

(declare-fun m!15589 () Bool)

(assert (=> start!2266 m!15589))

(declare-fun m!15591 () Bool)

(assert (=> b!10674 m!15591))

(declare-fun m!15593 () Bool)

(assert (=> b!10674 m!15593))

(declare-fun m!15595 () Bool)

(assert (=> b!10667 m!15595))

(declare-fun m!15597 () Bool)

(assert (=> b!10665 m!15597))

(declare-fun m!15599 () Bool)

(assert (=> b!10671 m!15599))

(declare-fun m!15601 () Bool)

(assert (=> b!10670 m!15601))

(declare-fun m!15603 () Bool)

(assert (=> b!10670 m!15603))

(check-sat (not b!10673) (not b!10671) (not b!10670) (not b!10666) (not b!10665) (not start!2266) (not b!10674) (not b!10667) (not b!10668))
(check-sat)
(get-model)

(declare-fun d!3348 () Bool)

(assert (=> d!3348 (= (invariant!0 (currentBit!1678 (_2!699 lt!16701)) (currentByte!1683 (_2!699 lt!16701)) (size!275 (buf!617 (_2!699 lt!16701)))) (and (bvsge (currentBit!1678 (_2!699 lt!16701)) #b00000000000000000000000000000000) (bvslt (currentBit!1678 (_2!699 lt!16701)) #b00000000000000000000000000001000) (bvsge (currentByte!1683 (_2!699 lt!16701)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1683 (_2!699 lt!16701)) (size!275 (buf!617 (_2!699 lt!16701)))) (and (= (currentBit!1678 (_2!699 lt!16701)) #b00000000000000000000000000000000) (= (currentByte!1683 (_2!699 lt!16701)) (size!275 (buf!617 (_2!699 lt!16701))))))))))

(assert (=> b!10670 d!3348))

(declare-fun call!203 () tuple2!1316)

(declare-fun lt!16987 () tuple2!1312)

(declare-fun c!725 () Bool)

(declare-fun bm!200 () Bool)

(assert (=> bm!200 (= call!203 (reader!0 thiss!1486 (ite c!725 (_2!699 lt!16987) thiss!1486)))))

(declare-fun b!10769 () Bool)

(declare-fun res!10703 () Bool)

(declare-fun e!6609 () Bool)

(assert (=> b!10769 (=> (not res!10703) (not e!6609))))

(declare-fun lt!17019 () tuple2!1312)

(assert (=> b!10769 (= res!10703 (invariant!0 (currentBit!1678 (_2!699 lt!17019)) (currentByte!1683 (_2!699 lt!17019)) (size!275 (buf!617 (_2!699 lt!17019)))))))

(declare-fun b!10770 () Bool)

(declare-fun res!10699 () Bool)

(assert (=> b!10770 (=> (not res!10699) (not e!6609))))

(assert (=> b!10770 (= res!10699 (= (size!275 (buf!617 thiss!1486)) (size!275 (buf!617 (_2!699 lt!17019)))))))

(declare-fun lt!17001 () tuple2!1316)

(declare-fun b!10771 () Bool)

(assert (=> b!10771 (= e!6609 (= (bitStreamReadBitsIntoList!0 (_2!699 lt!17019) (_1!701 lt!17001) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!699 lt!17019) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!10771 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10771 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!16986 () Unit!922)

(declare-fun lt!17010 () Unit!922)

(assert (=> b!10771 (= lt!16986 lt!17010)))

(declare-fun lt!16992 () (_ BitVec 64))

(assert (=> b!10771 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!17019)))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) lt!16992)))

(assert (=> b!10771 (= lt!17010 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!617 (_2!699 lt!17019)) lt!16992))))

(declare-fun e!6608 () Bool)

(assert (=> b!10771 e!6608))

(declare-fun res!10704 () Bool)

(assert (=> b!10771 (=> (not res!10704) (not e!6608))))

(assert (=> b!10771 (= res!10704 (and (= (size!275 (buf!617 thiss!1486)) (size!275 (buf!617 (_2!699 lt!17019)))) (bvsge lt!16992 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10771 (= lt!16992 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!10771 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10771 (= lt!17001 (reader!0 thiss!1486 (_2!699 lt!17019)))))

(declare-fun b!10772 () Bool)

(declare-fun e!6607 () tuple2!1312)

(declare-fun lt!16991 () tuple2!1312)

(declare-fun Unit!931 () Unit!922)

(assert (=> b!10772 (= e!6607 (tuple2!1313 Unit!931 (_2!699 lt!16991)))))

(declare-fun appendBitFromByte!0 (BitStream!516 (_ BitVec 8) (_ BitVec 32)) tuple2!1312)

(assert (=> b!10772 (= lt!16987 (appendBitFromByte!0 thiss!1486 (select (arr!692 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!16985 () (_ BitVec 64))

(assert (=> b!10772 (= lt!16985 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17011 () (_ BitVec 64))

(assert (=> b!10772 (= lt!17011 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17012 () Unit!922)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!516 BitStream!516 (_ BitVec 64) (_ BitVec 64)) Unit!922)

(assert (=> b!10772 (= lt!17012 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!699 lt!16987) lt!16985 lt!17011))))

(assert (=> b!10772 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16987)))) ((_ sign_extend 32) (currentByte!1683 (_2!699 lt!16987))) ((_ sign_extend 32) (currentBit!1678 (_2!699 lt!16987))) (bvsub lt!16985 lt!17011))))

(declare-fun lt!17013 () Unit!922)

(assert (=> b!10772 (= lt!17013 lt!17012)))

(declare-fun lt!17015 () tuple2!1316)

(assert (=> b!10772 (= lt!17015 call!203)))

(declare-fun lt!16995 () (_ BitVec 64))

(assert (=> b!10772 (= lt!16995 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!16982 () Unit!922)

(assert (=> b!10772 (= lt!16982 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!617 (_2!699 lt!16987)) lt!16995))))

(assert (=> b!10772 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16987)))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) lt!16995)))

(declare-fun lt!16997 () Unit!922)

(assert (=> b!10772 (= lt!16997 lt!16982)))

(declare-fun head!60 (List!154) Bool)

(assert (=> b!10772 (= (head!60 (byteArrayBitContentToList!0 (_2!699 lt!16987) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!60 (bitStreamReadBitsIntoList!0 (_2!699 lt!16987) (_1!701 lt!17015) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17004 () Unit!922)

(declare-fun Unit!933 () Unit!922)

(assert (=> b!10772 (= lt!17004 Unit!933)))

(assert (=> b!10772 (= lt!16991 (appendBitsMSBFirstLoop!0 (_2!699 lt!16987) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!16993 () Unit!922)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!516 BitStream!516 BitStream!516) Unit!922)

(assert (=> b!10772 (= lt!16993 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!699 lt!16987) (_2!699 lt!16991)))))

(assert (=> b!10772 (isPrefixOf!0 thiss!1486 (_2!699 lt!16991))))

(declare-fun lt!17005 () Unit!922)

(assert (=> b!10772 (= lt!17005 lt!16993)))

(assert (=> b!10772 (= (size!275 (buf!617 (_2!699 lt!16991))) (size!275 (buf!617 thiss!1486)))))

(declare-fun lt!17006 () Unit!922)

(declare-fun Unit!935 () Unit!922)

(assert (=> b!10772 (= lt!17006 Unit!935)))

(assert (=> b!10772 (= (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16991))) (currentByte!1683 (_2!699 lt!16991)) (currentBit!1678 (_2!699 lt!16991))) (bvsub (bvadd (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!16999 () Unit!922)

(declare-fun Unit!936 () Unit!922)

(assert (=> b!10772 (= lt!16999 Unit!936)))

(assert (=> b!10772 (= (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16991))) (currentByte!1683 (_2!699 lt!16991)) (currentBit!1678 (_2!699 lt!16991))) (bvsub (bvsub (bvadd (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16987))) (currentByte!1683 (_2!699 lt!16987)) (currentBit!1678 (_2!699 lt!16987))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!17007 () Unit!922)

(declare-fun Unit!937 () Unit!922)

(assert (=> b!10772 (= lt!17007 Unit!937)))

(declare-fun lt!16981 () tuple2!1316)

(assert (=> b!10772 (= lt!16981 (reader!0 thiss!1486 (_2!699 lt!16991)))))

(declare-fun lt!16994 () (_ BitVec 64))

(assert (=> b!10772 (= lt!16994 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17000 () Unit!922)

(assert (=> b!10772 (= lt!17000 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!617 (_2!699 lt!16991)) lt!16994))))

(assert (=> b!10772 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16991)))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) lt!16994)))

(declare-fun lt!16989 () Unit!922)

(assert (=> b!10772 (= lt!16989 lt!17000)))

(declare-fun lt!16996 () tuple2!1316)

(assert (=> b!10772 (= lt!16996 (reader!0 (_2!699 lt!16987) (_2!699 lt!16991)))))

(declare-fun lt!16998 () (_ BitVec 64))

(assert (=> b!10772 (= lt!16998 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!16979 () Unit!922)

(assert (=> b!10772 (= lt!16979 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!699 lt!16987) (buf!617 (_2!699 lt!16991)) lt!16998))))

(assert (=> b!10772 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16991)))) ((_ sign_extend 32) (currentByte!1683 (_2!699 lt!16987))) ((_ sign_extend 32) (currentBit!1678 (_2!699 lt!16987))) lt!16998)))

(declare-fun lt!16978 () Unit!922)

(assert (=> b!10772 (= lt!16978 lt!16979)))

(declare-fun lt!17009 () List!154)

(assert (=> b!10772 (= lt!17009 (byteArrayBitContentToList!0 (_2!699 lt!16991) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!16983 () List!154)

(assert (=> b!10772 (= lt!16983 (byteArrayBitContentToList!0 (_2!699 lt!16991) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!17020 () List!154)

(assert (=> b!10772 (= lt!17020 (bitStreamReadBitsIntoList!0 (_2!699 lt!16991) (_1!701 lt!16981) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!17002 () List!154)

(assert (=> b!10772 (= lt!17002 (bitStreamReadBitsIntoList!0 (_2!699 lt!16991) (_1!701 lt!16996) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!16984 () (_ BitVec 64))

(assert (=> b!10772 (= lt!16984 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!17016 () Unit!922)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!516 BitStream!516 BitStream!516 BitStream!516 (_ BitVec 64) List!154) Unit!922)

(assert (=> b!10772 (= lt!17016 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!699 lt!16991) (_2!699 lt!16991) (_1!701 lt!16981) (_1!701 lt!16996) lt!16984 lt!17020))))

(declare-fun tail!68 (List!154) List!154)

(assert (=> b!10772 (= (bitStreamReadBitsIntoList!0 (_2!699 lt!16991) (_1!701 lt!16996) (bvsub lt!16984 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!68 lt!17020))))

(declare-fun lt!16988 () Unit!922)

(assert (=> b!10772 (= lt!16988 lt!17016)))

(declare-fun lt!17021 () (_ BitVec 64))

(declare-fun lt!17003 () Unit!922)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!638 array!638 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!922)

(assert (=> b!10772 (= lt!17003 (arrayBitRangesEqImpliesEq!0 (buf!617 (_2!699 lt!16987)) (buf!617 (_2!699 lt!16991)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!17021 (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16987))) (currentByte!1683 (_2!699 lt!16987)) (currentBit!1678 (_2!699 lt!16987)))))))

(declare-fun bitAt!0 (array!638 (_ BitVec 64)) Bool)

(assert (=> b!10772 (= (bitAt!0 (buf!617 (_2!699 lt!16987)) lt!17021) (bitAt!0 (buf!617 (_2!699 lt!16991)) lt!17021))))

(declare-fun lt!17017 () Unit!922)

(assert (=> b!10772 (= lt!17017 lt!17003)))

(declare-fun b!10773 () Bool)

(declare-fun res!10701 () Bool)

(assert (=> b!10773 (=> (not res!10701) (not e!6609))))

(assert (=> b!10773 (= res!10701 (isPrefixOf!0 thiss!1486 (_2!699 lt!17019)))))

(declare-fun b!10774 () Bool)

(assert (=> b!10774 (= e!6608 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 thiss!1486))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) lt!16992))))

(declare-fun b!10775 () Bool)

(declare-fun res!10700 () Bool)

(assert (=> b!10775 (=> (not res!10700) (not e!6609))))

(assert (=> b!10775 (= res!10700 (= (size!275 (buf!617 (_2!699 lt!17019))) (size!275 (buf!617 thiss!1486))))))

(declare-fun b!10768 () Bool)

(declare-fun Unit!938 () Unit!922)

(assert (=> b!10768 (= e!6607 (tuple2!1313 Unit!938 thiss!1486))))

(assert (=> b!10768 (= (size!275 (buf!617 thiss!1486)) (size!275 (buf!617 thiss!1486)))))

(declare-fun lt!17018 () Unit!922)

(declare-fun Unit!939 () Unit!922)

(assert (=> b!10768 (= lt!17018 Unit!939)))

(assert (=> b!10768 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!700 (readBits!0 (_1!701 call!203) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun d!3350 () Bool)

(assert (=> d!3350 e!6609))

(declare-fun res!10702 () Bool)

(assert (=> d!3350 (=> (not res!10702) (not e!6609))))

(declare-fun lt!17008 () (_ BitVec 64))

(assert (=> d!3350 (= res!10702 (= (bitIndex!0 (size!275 (buf!617 (_2!699 lt!17019))) (currentByte!1683 (_2!699 lt!17019)) (currentBit!1678 (_2!699 lt!17019))) (bvsub lt!17008 from!367)))))

(assert (=> d!3350 (or (= (bvand lt!17008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17008 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17008 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!17014 () (_ BitVec 64))

(assert (=> d!3350 (= lt!17008 (bvadd lt!17014 from!367 nBits!460))))

(assert (=> d!3350 (or (not (= (bvand lt!17014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!17014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!17014 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3350 (= lt!17014 (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)))))

(assert (=> d!3350 (= lt!17019 e!6607)))

(assert (=> d!3350 (= c!725 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!16990 () Unit!922)

(declare-fun lt!16980 () Unit!922)

(assert (=> d!3350 (= lt!16990 lt!16980)))

(assert (=> d!3350 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!516) Unit!922)

(assert (=> d!3350 (= lt!16980 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3350 (= lt!17021 (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)))))

(assert (=> d!3350 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3350 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!17019)))

(assert (= (and d!3350 c!725) b!10772))

(assert (= (and d!3350 (not c!725)) b!10768))

(assert (= (or b!10772 b!10768) bm!200))

(assert (= (and d!3350 res!10702) b!10769))

(assert (= (and b!10769 res!10703) b!10770))

(assert (= (and b!10770 res!10699) b!10773))

(assert (= (and b!10773 res!10701) b!10775))

(assert (= (and b!10775 res!10700) b!10771))

(assert (= (and b!10771 res!10704) b!10774))

(declare-fun m!15751 () Bool)

(assert (=> b!10774 m!15751))

(declare-fun m!15753 () Bool)

(assert (=> d!3350 m!15753))

(assert (=> d!3350 m!15585))

(declare-fun m!15755 () Bool)

(assert (=> d!3350 m!15755))

(declare-fun m!15757 () Bool)

(assert (=> d!3350 m!15757))

(declare-fun m!15759 () Bool)

(assert (=> b!10773 m!15759))

(declare-fun m!15761 () Bool)

(assert (=> b!10768 m!15761))

(declare-fun m!15763 () Bool)

(assert (=> b!10768 m!15763))

(declare-fun m!15765 () Bool)

(assert (=> b!10769 m!15765))

(assert (=> b!10772 m!15585))

(declare-fun m!15767 () Bool)

(assert (=> b!10772 m!15767))

(declare-fun m!15769 () Bool)

(assert (=> b!10772 m!15769))

(declare-fun m!15771 () Bool)

(assert (=> b!10772 m!15771))

(declare-fun m!15773 () Bool)

(assert (=> b!10772 m!15773))

(declare-fun m!15775 () Bool)

(assert (=> b!10772 m!15775))

(declare-fun m!15777 () Bool)

(assert (=> b!10772 m!15777))

(declare-fun m!15779 () Bool)

(assert (=> b!10772 m!15779))

(declare-fun m!15781 () Bool)

(assert (=> b!10772 m!15781))

(declare-fun m!15783 () Bool)

(assert (=> b!10772 m!15783))

(declare-fun m!15785 () Bool)

(assert (=> b!10772 m!15785))

(declare-fun m!15787 () Bool)

(assert (=> b!10772 m!15787))

(declare-fun m!15789 () Bool)

(assert (=> b!10772 m!15789))

(declare-fun m!15791 () Bool)

(assert (=> b!10772 m!15791))

(declare-fun m!15793 () Bool)

(assert (=> b!10772 m!15793))

(declare-fun m!15795 () Bool)

(assert (=> b!10772 m!15795))

(declare-fun m!15797 () Bool)

(assert (=> b!10772 m!15797))

(declare-fun m!15799 () Bool)

(assert (=> b!10772 m!15799))

(declare-fun m!15801 () Bool)

(assert (=> b!10772 m!15801))

(declare-fun m!15803 () Bool)

(assert (=> b!10772 m!15803))

(declare-fun m!15805 () Bool)

(assert (=> b!10772 m!15805))

(declare-fun m!15807 () Bool)

(assert (=> b!10772 m!15807))

(declare-fun m!15809 () Bool)

(assert (=> b!10772 m!15809))

(declare-fun m!15811 () Bool)

(assert (=> b!10772 m!15811))

(declare-fun m!15813 () Bool)

(assert (=> b!10772 m!15813))

(assert (=> b!10772 m!15775))

(declare-fun m!15815 () Bool)

(assert (=> b!10772 m!15815))

(declare-fun m!15817 () Bool)

(assert (=> b!10772 m!15817))

(assert (=> b!10772 m!15773))

(declare-fun m!15819 () Bool)

(assert (=> b!10772 m!15819))

(declare-fun m!15821 () Bool)

(assert (=> b!10772 m!15821))

(assert (=> b!10772 m!15767))

(declare-fun m!15823 () Bool)

(assert (=> b!10772 m!15823))

(assert (=> b!10772 m!15789))

(declare-fun m!15825 () Bool)

(assert (=> b!10772 m!15825))

(declare-fun m!15827 () Bool)

(assert (=> b!10772 m!15827))

(declare-fun m!15829 () Bool)

(assert (=> bm!200 m!15829))

(declare-fun m!15831 () Bool)

(assert (=> b!10771 m!15831))

(declare-fun m!15833 () Bool)

(assert (=> b!10771 m!15833))

(declare-fun m!15835 () Bool)

(assert (=> b!10771 m!15835))

(declare-fun m!15837 () Bool)

(assert (=> b!10771 m!15837))

(declare-fun m!15839 () Bool)

(assert (=> b!10771 m!15839))

(assert (=> b!10670 d!3350))

(declare-fun d!3368 () Bool)

(assert (=> d!3368 (= (array_inv!267 (buf!617 thiss!1486)) (bvsge (size!275 (buf!617 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!10665 d!3368))

(declare-fun d!3370 () Bool)

(declare-fun res!10730 () Bool)

(declare-fun e!6626 () Bool)

(assert (=> d!3370 (=> res!10730 e!6626)))

(assert (=> d!3370 (= res!10730 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3370 (= (checkByteArrayBitContent!0 (_2!699 lt!16701) srcBuffer!6 (_1!700 lt!16703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6626)))

(declare-fun b!10805 () Bool)

(declare-fun e!6627 () Bool)

(assert (=> b!10805 (= e!6626 e!6627)))

(declare-fun res!10731 () Bool)

(assert (=> b!10805 (=> (not res!10731) (not e!6627))))

(assert (=> b!10805 (= res!10731 (not (not (= (not (= (bvand ((_ sign_extend 24) (select (arr!692 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (not (= (bvand ((_ sign_extend 24) (select (arr!692 (_1!700 lt!16703)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000))))))))

(declare-fun b!10806 () Bool)

(assert (=> b!10806 (= e!6627 (checkByteArrayBitContent!0 (_2!699 lt!16701) srcBuffer!6 (_1!700 lt!16703) (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!3370 (not res!10730)) b!10805))

(assert (= (and b!10805 res!10731) b!10806))

(assert (=> b!10805 m!15789))

(declare-fun m!15843 () Bool)

(assert (=> b!10805 m!15843))

(declare-fun m!15845 () Bool)

(assert (=> b!10805 m!15845))

(declare-fun m!15847 () Bool)

(assert (=> b!10805 m!15847))

(declare-fun m!15849 () Bool)

(assert (=> b!10806 m!15849))

(assert (=> b!10674 d!3370))

(declare-fun d!3374 () Bool)

(assert (=> d!3374 (checkByteArrayBitContent!0 (_2!699 lt!16701) srcBuffer!6 (_1!700 lt!16703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460)))

(declare-fun lt!17136 () Unit!922)

(declare-fun choose!65 (BitStream!516 array!638 array!638 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!922)

(assert (=> d!3374 (= lt!17136 (choose!65 (_2!699 lt!16701) srcBuffer!6 (_1!700 lt!16703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3374 (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3374 (= (lemmaSameBitContentListThenCheckByteArrayBitContent!0 (_2!699 lt!16701) srcBuffer!6 (_1!700 lt!16703) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!17136)))

(declare-fun bs!999 () Bool)

(assert (= bs!999 d!3374))

(assert (=> bs!999 m!15591))

(declare-fun m!15853 () Bool)

(assert (=> bs!999 m!15853))

(assert (=> b!10674 d!3374))

(declare-fun d!3378 () Bool)

(declare-fun e!6641 () Bool)

(assert (=> d!3378 e!6641))

(declare-fun res!10751 () Bool)

(assert (=> d!3378 (=> (not res!10751) (not e!6641))))

(declare-fun lt!17193 () (_ BitVec 64))

(declare-fun lt!17194 () (_ BitVec 64))

(declare-fun lt!17195 () (_ BitVec 64))

(assert (=> d!3378 (= res!10751 (= lt!17193 (bvsub lt!17195 lt!17194)))))

(assert (=> d!3378 (or (= (bvand lt!17195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17194 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17195 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17195 lt!17194) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3378 (= lt!17194 (remainingBits!0 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16701)))) ((_ sign_extend 32) (currentByte!1683 (_2!699 lt!16701))) ((_ sign_extend 32) (currentBit!1678 (_2!699 lt!16701)))))))

(declare-fun lt!17196 () (_ BitVec 64))

(declare-fun lt!17197 () (_ BitVec 64))

(assert (=> d!3378 (= lt!17195 (bvmul lt!17196 lt!17197))))

(assert (=> d!3378 (or (= lt!17196 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!17197 (bvsdiv (bvmul lt!17196 lt!17197) lt!17196)))))

(assert (=> d!3378 (= lt!17197 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3378 (= lt!17196 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16701)))))))

(assert (=> d!3378 (= lt!17193 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1683 (_2!699 lt!16701))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1678 (_2!699 lt!16701)))))))

(assert (=> d!3378 (invariant!0 (currentBit!1678 (_2!699 lt!16701)) (currentByte!1683 (_2!699 lt!16701)) (size!275 (buf!617 (_2!699 lt!16701))))))

(assert (=> d!3378 (= (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16701))) (currentByte!1683 (_2!699 lt!16701)) (currentBit!1678 (_2!699 lt!16701))) lt!17193)))

(declare-fun b!10835 () Bool)

(declare-fun res!10750 () Bool)

(assert (=> b!10835 (=> (not res!10750) (not e!6641))))

(assert (=> b!10835 (= res!10750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17193))))

(declare-fun b!10836 () Bool)

(declare-fun lt!17198 () (_ BitVec 64))

(assert (=> b!10836 (= e!6641 (bvsle lt!17193 (bvmul lt!17198 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10836 (or (= lt!17198 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!17198 #b0000000000000000000000000000000000000000000000000000000000001000) lt!17198)))))

(assert (=> b!10836 (= lt!17198 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16701)))))))

(assert (= (and d!3378 res!10751) b!10835))

(assert (= (and b!10835 res!10750) b!10836))

(declare-fun m!15883 () Bool)

(assert (=> d!3378 m!15883))

(assert (=> d!3378 m!15601))

(assert (=> b!10668 d!3378))

(declare-fun d!3390 () Bool)

(declare-fun e!6642 () Bool)

(assert (=> d!3390 e!6642))

(declare-fun res!10753 () Bool)

(assert (=> d!3390 (=> (not res!10753) (not e!6642))))

(declare-fun lt!17199 () (_ BitVec 64))

(declare-fun lt!17201 () (_ BitVec 64))

(declare-fun lt!17200 () (_ BitVec 64))

(assert (=> d!3390 (= res!10753 (= lt!17199 (bvsub lt!17201 lt!17200)))))

(assert (=> d!3390 (or (= (bvand lt!17201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17200 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17201 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17201 lt!17200) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3390 (= lt!17200 (remainingBits!0 ((_ sign_extend 32) (size!275 (buf!617 thiss!1486))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486))))))

(declare-fun lt!17202 () (_ BitVec 64))

(declare-fun lt!17203 () (_ BitVec 64))

(assert (=> d!3390 (= lt!17201 (bvmul lt!17202 lt!17203))))

(assert (=> d!3390 (or (= lt!17202 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!17203 (bvsdiv (bvmul lt!17202 lt!17203) lt!17202)))))

(assert (=> d!3390 (= lt!17203 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3390 (= lt!17202 ((_ sign_extend 32) (size!275 (buf!617 thiss!1486))))))

(assert (=> d!3390 (= lt!17199 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1683 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1678 thiss!1486))))))

(assert (=> d!3390 (invariant!0 (currentBit!1678 thiss!1486) (currentByte!1683 thiss!1486) (size!275 (buf!617 thiss!1486)))))

(assert (=> d!3390 (= (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)) lt!17199)))

(declare-fun b!10837 () Bool)

(declare-fun res!10752 () Bool)

(assert (=> b!10837 (=> (not res!10752) (not e!6642))))

(assert (=> b!10837 (= res!10752 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!17199))))

(declare-fun b!10838 () Bool)

(declare-fun lt!17204 () (_ BitVec 64))

(assert (=> b!10838 (= e!6642 (bvsle lt!17199 (bvmul lt!17204 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!10838 (or (= lt!17204 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!17204 #b0000000000000000000000000000000000000000000000000000000000001000) lt!17204)))))

(assert (=> b!10838 (= lt!17204 ((_ sign_extend 32) (size!275 (buf!617 thiss!1486))))))

(assert (= (and d!3390 res!10753) b!10837))

(assert (= (and b!10837 res!10752) b!10838))

(declare-fun m!15913 () Bool)

(assert (=> d!3390 m!15913))

(declare-fun m!15917 () Bool)

(assert (=> d!3390 m!15917))

(assert (=> b!10668 d!3390))

(declare-fun d!3392 () Bool)

(assert (=> d!3392 (= (array_inv!267 srcBuffer!6) (bvsge (size!275 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2266 d!3392))

(declare-fun d!3394 () Bool)

(assert (=> d!3394 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1678 thiss!1486) (currentByte!1683 thiss!1486) (size!275 (buf!617 thiss!1486))))))

(declare-fun bs!1001 () Bool)

(assert (= bs!1001 d!3394))

(assert (=> bs!1001 m!15917))

(assert (=> start!2266 d!3394))

(declare-fun d!3396 () Bool)

(assert (=> d!3396 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16701)))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16701)))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486))) nBits!460))))

(declare-fun bs!1002 () Bool)

(assert (= bs!1002 d!3396))

(declare-fun m!15963 () Bool)

(assert (=> bs!1002 m!15963))

(assert (=> b!10673 d!3396))

(declare-fun b!10858 () Bool)

(declare-fun e!6651 () Bool)

(declare-fun lt!17212 () List!154)

(declare-fun length!29 (List!154) Int)

(assert (=> b!10858 (= e!6651 (> (length!29 lt!17212) 0))))

(declare-fun b!10857 () Bool)

(declare-fun isEmpty!34 (List!154) Bool)

(assert (=> b!10857 (= e!6651 (isEmpty!34 lt!17212))))

(declare-fun d!3400 () Bool)

(assert (=> d!3400 e!6651))

(declare-fun c!741 () Bool)

(assert (=> d!3400 (= c!741 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!1324 0))(
  ( (tuple2!1325 (_1!706 List!154) (_2!706 BitStream!516)) )
))
(declare-fun e!6652 () tuple2!1324)

(assert (=> d!3400 (= lt!17212 (_1!706 e!6652))))

(declare-fun c!742 () Bool)

(assert (=> d!3400 (= c!742 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3400 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3400 (= (bitStreamReadBitsIntoList!0 (_2!699 lt!16701) (_1!701 lt!16696) nBits!460) lt!17212)))

(declare-datatypes ((tuple2!1326 0))(
  ( (tuple2!1327 (_1!707 Bool) (_2!707 BitStream!516)) )
))
(declare-fun lt!17213 () tuple2!1326)

(declare-fun lt!17211 () (_ BitVec 64))

(declare-fun b!10856 () Bool)

(assert (=> b!10856 (= e!6652 (tuple2!1325 (Cons!150 (_1!707 lt!17213) (bitStreamReadBitsIntoList!0 (_2!699 lt!16701) (_2!707 lt!17213) (bvsub nBits!460 lt!17211))) (_2!707 lt!17213)))))

(declare-fun readBit!0 (BitStream!516) tuple2!1326)

(assert (=> b!10856 (= lt!17213 (readBit!0 (_1!701 lt!16696)))))

(assert (=> b!10856 (= lt!17211 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!10855 () Bool)

(assert (=> b!10855 (= e!6652 (tuple2!1325 Nil!151 (_1!701 lt!16696)))))

(assert (= (and d!3400 c!742) b!10855))

(assert (= (and d!3400 (not c!742)) b!10856))

(assert (= (and d!3400 c!741) b!10857))

(assert (= (and d!3400 (not c!741)) b!10858))

(declare-fun m!15969 () Bool)

(assert (=> b!10858 m!15969))

(declare-fun m!15971 () Bool)

(assert (=> b!10857 m!15971))

(declare-fun m!15973 () Bool)

(assert (=> b!10856 m!15973))

(declare-fun m!15975 () Bool)

(assert (=> b!10856 m!15975))

(assert (=> b!10673 d!3400))

(declare-fun b!10899 () Bool)

(declare-fun res!10789 () Bool)

(declare-fun e!6664 () Bool)

(assert (=> b!10899 (=> (not res!10789) (not e!6664))))

(declare-fun lt!17328 () tuple2!1314)

(declare-fun lt!17327 () (_ BitVec 64))

(assert (=> b!10899 (= res!10789 (= (size!275 (_1!700 lt!17328)) ((_ extract 31 0) lt!17327)))))

(assert (=> b!10899 (and (bvslt lt!17327 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!17327 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!17324 () (_ BitVec 64))

(declare-fun lt!17323 () (_ BitVec 64))

(assert (=> b!10899 (= lt!17327 (bvsdiv lt!17324 lt!17323))))

(assert (=> b!10899 (and (not (= lt!17323 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!17324 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!17323 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!10899 (= lt!17323 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!17329 () (_ BitVec 64))

(declare-fun lt!17326 () (_ BitVec 64))

(assert (=> b!10899 (= lt!17324 (bvsub lt!17329 lt!17326))))

(assert (=> b!10899 (or (= (bvand lt!17329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17326 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17329 lt!17326) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10899 (= lt!17326 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!17330 () (_ BitVec 64))

(assert (=> b!10899 (= lt!17329 (bvadd nBits!460 lt!17330))))

(assert (=> b!10899 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17330 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!17330) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10899 (= lt!17330 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!10900 () Bool)

(declare-fun res!10792 () Bool)

(assert (=> b!10900 (=> (not res!10792) (not e!6664))))

(assert (=> b!10900 (= res!10792 (invariant!0 (currentBit!1678 (_2!700 lt!17328)) (currentByte!1683 (_2!700 lt!17328)) (size!275 (buf!617 (_2!700 lt!17328)))))))

(declare-fun d!3414 () Bool)

(assert (=> d!3414 e!6664))

(declare-fun res!10788 () Bool)

(assert (=> d!3414 (=> (not res!10788) (not e!6664))))

(assert (=> d!3414 (= res!10788 (= (buf!617 (_2!700 lt!17328)) (buf!617 (_1!701 lt!16696))))))

(declare-datatypes ((tuple3!82 0))(
  ( (tuple3!83 (_1!708 Unit!922) (_2!708 BitStream!516) (_3!44 array!638)) )
))
(declare-fun lt!17325 () tuple3!82)

(assert (=> d!3414 (= lt!17328 (tuple2!1315 (_3!44 lt!17325) (_2!708 lt!17325)))))

(declare-fun readBitsLoop!0 (BitStream!516 (_ BitVec 64) array!638 (_ BitVec 64) (_ BitVec 64)) tuple3!82)

(assert (=> d!3414 (= lt!17325 (readBitsLoop!0 (_1!701 lt!16696) nBits!460 (array!639 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3414 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3414 (= (readBits!0 (_1!701 lt!16696) nBits!460) lt!17328)))

(declare-fun b!10901 () Bool)

(declare-fun res!10791 () Bool)

(assert (=> b!10901 (=> (not res!10791) (not e!6664))))

(assert (=> b!10901 (= res!10791 (bvsle (currentByte!1683 (_1!701 lt!16696)) (currentByte!1683 (_2!700 lt!17328))))))

(declare-fun b!10902 () Bool)

(declare-fun res!10790 () Bool)

(assert (=> b!10902 (=> (not res!10790) (not e!6664))))

(declare-fun lt!17322 () (_ BitVec 64))

(assert (=> b!10902 (= res!10790 (= (bvadd lt!17322 nBits!460) (bitIndex!0 (size!275 (buf!617 (_2!700 lt!17328))) (currentByte!1683 (_2!700 lt!17328)) (currentBit!1678 (_2!700 lt!17328)))))))

(assert (=> b!10902 (or (not (= (bvand lt!17322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!17322 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!17322 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10902 (= lt!17322 (bitIndex!0 (size!275 (buf!617 (_1!701 lt!16696))) (currentByte!1683 (_1!701 lt!16696)) (currentBit!1678 (_1!701 lt!16696))))))

(declare-fun b!10903 () Bool)

(assert (=> b!10903 (= e!6664 (= (byteArrayBitContentToList!0 (_2!700 lt!17328) (_1!700 lt!17328) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!700 lt!17328) (_1!701 lt!16696) nBits!460)))))

(assert (= (and d!3414 res!10788) b!10902))

(assert (= (and b!10902 res!10790) b!10900))

(assert (= (and b!10900 res!10792) b!10899))

(assert (= (and b!10899 res!10789) b!10901))

(assert (= (and b!10901 res!10791) b!10903))

(declare-fun m!16017 () Bool)

(assert (=> b!10900 m!16017))

(declare-fun m!16019 () Bool)

(assert (=> d!3414 m!16019))

(declare-fun m!16021 () Bool)

(assert (=> b!10902 m!16021))

(declare-fun m!16023 () Bool)

(assert (=> b!10902 m!16023))

(declare-fun m!16025 () Bool)

(assert (=> b!10903 m!16025))

(declare-fun m!16027 () Bool)

(assert (=> b!10903 m!16027))

(assert (=> b!10673 d!3414))

(declare-fun b!10957 () Bool)

(declare-fun res!10823 () Bool)

(declare-fun e!6684 () Bool)

(assert (=> b!10957 (=> (not res!10823) (not e!6684))))

(declare-fun lt!17476 () tuple2!1316)

(assert (=> b!10957 (= res!10823 (isPrefixOf!0 (_2!701 lt!17476) (_2!699 lt!16701)))))

(declare-fun b!10958 () Bool)

(declare-fun res!10825 () Bool)

(assert (=> b!10958 (=> (not res!10825) (not e!6684))))

(assert (=> b!10958 (= res!10825 (isPrefixOf!0 (_1!701 lt!17476) thiss!1486))))

(declare-fun lt!17480 () (_ BitVec 64))

(declare-fun b!10959 () Bool)

(declare-fun lt!17483 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!516 (_ BitVec 64)) BitStream!516)

(assert (=> b!10959 (= e!6684 (= (_1!701 lt!17476) (withMovedBitIndex!0 (_2!701 lt!17476) (bvsub lt!17483 lt!17480))))))

(assert (=> b!10959 (or (= (bvand lt!17483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!17480 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!17483 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!17483 lt!17480) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!10959 (= lt!17480 (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16701))) (currentByte!1683 (_2!699 lt!16701)) (currentBit!1678 (_2!699 lt!16701))))))

(assert (=> b!10959 (= lt!17483 (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)))))

(declare-fun b!10960 () Bool)

(declare-fun e!6685 () Unit!922)

(declare-fun lt!17467 () Unit!922)

(assert (=> b!10960 (= e!6685 lt!17467)))

(declare-fun lt!17486 () (_ BitVec 64))

(assert (=> b!10960 (= lt!17486 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!17471 () (_ BitVec 64))

(assert (=> b!10960 (= lt!17471 (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!638 array!638 (_ BitVec 64) (_ BitVec 64)) Unit!922)

(assert (=> b!10960 (= lt!17467 (arrayBitRangesEqSymmetric!0 (buf!617 thiss!1486) (buf!617 (_2!699 lt!16701)) lt!17486 lt!17471))))

(declare-fun arrayBitRangesEq!0 (array!638 array!638 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!10960 (arrayBitRangesEq!0 (buf!617 (_2!699 lt!16701)) (buf!617 thiss!1486) lt!17486 lt!17471)))

(declare-fun b!10956 () Bool)

(declare-fun Unit!948 () Unit!922)

(assert (=> b!10956 (= e!6685 Unit!948)))

(declare-fun d!3422 () Bool)

(assert (=> d!3422 e!6684))

(declare-fun res!10824 () Bool)

(assert (=> d!3422 (=> (not res!10824) (not e!6684))))

(assert (=> d!3422 (= res!10824 (isPrefixOf!0 (_1!701 lt!17476) (_2!701 lt!17476)))))

(declare-fun lt!17481 () BitStream!516)

(assert (=> d!3422 (= lt!17476 (tuple2!1317 lt!17481 (_2!699 lt!16701)))))

(declare-fun lt!17474 () Unit!922)

(declare-fun lt!17485 () Unit!922)

(assert (=> d!3422 (= lt!17474 lt!17485)))

(assert (=> d!3422 (isPrefixOf!0 lt!17481 (_2!699 lt!16701))))

(assert (=> d!3422 (= lt!17485 (lemmaIsPrefixTransitive!0 lt!17481 (_2!699 lt!16701) (_2!699 lt!16701)))))

(declare-fun lt!17468 () Unit!922)

(declare-fun lt!17472 () Unit!922)

(assert (=> d!3422 (= lt!17468 lt!17472)))

(assert (=> d!3422 (isPrefixOf!0 lt!17481 (_2!699 lt!16701))))

(assert (=> d!3422 (= lt!17472 (lemmaIsPrefixTransitive!0 lt!17481 thiss!1486 (_2!699 lt!16701)))))

(declare-fun lt!17477 () Unit!922)

(assert (=> d!3422 (= lt!17477 e!6685)))

(declare-fun c!757 () Bool)

(assert (=> d!3422 (= c!757 (not (= (size!275 (buf!617 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!17484 () Unit!922)

(declare-fun lt!17475 () Unit!922)

(assert (=> d!3422 (= lt!17484 lt!17475)))

(assert (=> d!3422 (isPrefixOf!0 (_2!699 lt!16701) (_2!699 lt!16701))))

(assert (=> d!3422 (= lt!17475 (lemmaIsPrefixRefl!0 (_2!699 lt!16701)))))

(declare-fun lt!17479 () Unit!922)

(declare-fun lt!17469 () Unit!922)

(assert (=> d!3422 (= lt!17479 lt!17469)))

(assert (=> d!3422 (= lt!17469 (lemmaIsPrefixRefl!0 (_2!699 lt!16701)))))

(declare-fun lt!17478 () Unit!922)

(declare-fun lt!17473 () Unit!922)

(assert (=> d!3422 (= lt!17478 lt!17473)))

(assert (=> d!3422 (isPrefixOf!0 lt!17481 lt!17481)))

(assert (=> d!3422 (= lt!17473 (lemmaIsPrefixRefl!0 lt!17481))))

(declare-fun lt!17482 () Unit!922)

(declare-fun lt!17470 () Unit!922)

(assert (=> d!3422 (= lt!17482 lt!17470)))

(assert (=> d!3422 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3422 (= lt!17470 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3422 (= lt!17481 (BitStream!517 (buf!617 (_2!699 lt!16701)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)))))

(assert (=> d!3422 (isPrefixOf!0 thiss!1486 (_2!699 lt!16701))))

(assert (=> d!3422 (= (reader!0 thiss!1486 (_2!699 lt!16701)) lt!17476)))

(assert (= (and d!3422 c!757) b!10960))

(assert (= (and d!3422 (not c!757)) b!10956))

(assert (= (and d!3422 res!10824) b!10958))

(assert (= (and b!10958 res!10825) b!10957))

(assert (= (and b!10957 res!10823) b!10959))

(declare-fun m!16077 () Bool)

(assert (=> b!10959 m!16077))

(assert (=> b!10959 m!15583))

(assert (=> b!10959 m!15585))

(assert (=> b!10960 m!15585))

(declare-fun m!16079 () Bool)

(assert (=> b!10960 m!16079))

(declare-fun m!16081 () Bool)

(assert (=> b!10960 m!16081))

(declare-fun m!16085 () Bool)

(assert (=> b!10957 m!16085))

(declare-fun m!16087 () Bool)

(assert (=> b!10958 m!16087))

(declare-fun m!16089 () Bool)

(assert (=> d!3422 m!16089))

(declare-fun m!16091 () Bool)

(assert (=> d!3422 m!16091))

(assert (=> d!3422 m!15755))

(declare-fun m!16093 () Bool)

(assert (=> d!3422 m!16093))

(declare-fun m!16095 () Bool)

(assert (=> d!3422 m!16095))

(declare-fun m!16097 () Bool)

(assert (=> d!3422 m!16097))

(declare-fun m!16099 () Bool)

(assert (=> d!3422 m!16099))

(assert (=> d!3422 m!15757))

(declare-fun m!16101 () Bool)

(assert (=> d!3422 m!16101))

(declare-fun m!16103 () Bool)

(assert (=> d!3422 m!16103))

(assert (=> d!3422 m!15599))

(assert (=> b!10673 d!3422))

(declare-fun d!3434 () Bool)

(declare-fun c!760 () Bool)

(assert (=> d!3434 (= c!760 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6688 () List!154)

(assert (=> d!3434 (= (byteArrayBitContentToList!0 (_2!699 lt!16701) (_1!700 lt!16703) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6688)))

(declare-fun b!10965 () Bool)

(assert (=> b!10965 (= e!6688 Nil!151)))

(declare-fun b!10966 () Bool)

(assert (=> b!10966 (= e!6688 (Cons!150 (not (= (bvand ((_ sign_extend 24) (select (arr!692 (_1!700 lt!16703)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!699 lt!16701) (_1!700 lt!16703) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3434 c!760) b!10965))

(assert (= (and d!3434 (not c!760)) b!10966))

(assert (=> b!10966 m!15845))

(assert (=> b!10966 m!15847))

(declare-fun m!16107 () Bool)

(assert (=> b!10966 m!16107))

(assert (=> b!10673 d!3434))

(declare-fun d!3438 () Bool)

(assert (=> d!3438 (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 (_2!699 lt!16701)))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) nBits!460)))

(declare-fun lt!17492 () Unit!922)

(declare-fun choose!9 (BitStream!516 array!638 (_ BitVec 64) BitStream!516) Unit!922)

(assert (=> d!3438 (= lt!17492 (choose!9 thiss!1486 (buf!617 (_2!699 lt!16701)) nBits!460 (BitStream!517 (buf!617 (_2!699 lt!16701)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486))))))

(assert (=> d!3438 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!617 (_2!699 lt!16701)) nBits!460) lt!17492)))

(declare-fun bs!1009 () Bool)

(assert (= bs!1009 d!3438))

(assert (=> bs!1009 m!15573))

(declare-fun m!16111 () Bool)

(assert (=> bs!1009 m!16111))

(assert (=> b!10673 d!3438))

(declare-fun d!3442 () Bool)

(declare-fun c!761 () Bool)

(assert (=> d!3442 (= c!761 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6695 () List!154)

(assert (=> d!3442 (= (byteArrayBitContentToList!0 (_2!699 lt!16701) srcBuffer!6 from!367 nBits!460) e!6695)))

(declare-fun b!10973 () Bool)

(assert (=> b!10973 (= e!6695 Nil!151)))

(declare-fun b!10974 () Bool)

(assert (=> b!10974 (= e!6695 (Cons!150 (not (= (bvand ((_ sign_extend 24) (select (arr!692 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!699 lt!16701) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3442 c!761) b!10973))

(assert (= (and d!3442 (not c!761)) b!10974))

(assert (=> b!10974 m!15789))

(assert (=> b!10974 m!15843))

(declare-fun m!16113 () Bool)

(assert (=> b!10974 m!16113))

(assert (=> b!10667 d!3442))

(declare-fun d!3444 () Bool)

(assert (=> d!3444 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!275 (buf!617 thiss!1486))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!275 (buf!617 thiss!1486))) ((_ sign_extend 32) (currentByte!1683 thiss!1486)) ((_ sign_extend 32) (currentBit!1678 thiss!1486))) nBits!460))))

(declare-fun bs!1010 () Bool)

(assert (= bs!1010 d!3444))

(assert (=> bs!1010 m!15913))

(assert (=> b!10666 d!3444))

(declare-fun d!3446 () Bool)

(declare-fun res!10839 () Bool)

(declare-fun e!6707 () Bool)

(assert (=> d!3446 (=> (not res!10839) (not e!6707))))

(assert (=> d!3446 (= res!10839 (= (size!275 (buf!617 thiss!1486)) (size!275 (buf!617 (_2!699 lt!16701)))))))

(assert (=> d!3446 (= (isPrefixOf!0 thiss!1486 (_2!699 lt!16701)) e!6707)))

(declare-fun b!10993 () Bool)

(declare-fun res!10840 () Bool)

(assert (=> b!10993 (=> (not res!10840) (not e!6707))))

(assert (=> b!10993 (= res!10840 (bvsle (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486)) (bitIndex!0 (size!275 (buf!617 (_2!699 lt!16701))) (currentByte!1683 (_2!699 lt!16701)) (currentBit!1678 (_2!699 lt!16701)))))))

(declare-fun b!10994 () Bool)

(declare-fun e!6706 () Bool)

(assert (=> b!10994 (= e!6707 e!6706)))

(declare-fun res!10838 () Bool)

(assert (=> b!10994 (=> res!10838 e!6706)))

(assert (=> b!10994 (= res!10838 (= (size!275 (buf!617 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!10995 () Bool)

(assert (=> b!10995 (= e!6706 (arrayBitRangesEq!0 (buf!617 thiss!1486) (buf!617 (_2!699 lt!16701)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!275 (buf!617 thiss!1486)) (currentByte!1683 thiss!1486) (currentBit!1678 thiss!1486))))))

(assert (= (and d!3446 res!10839) b!10993))

(assert (= (and b!10993 res!10840) b!10994))

(assert (= (and b!10994 (not res!10838)) b!10995))

(assert (=> b!10993 m!15585))

(assert (=> b!10993 m!15583))

(assert (=> b!10995 m!15585))

(assert (=> b!10995 m!15585))

(declare-fun m!16125 () Bool)

(assert (=> b!10995 m!16125))

(assert (=> b!10671 d!3446))

(check-sat (not b!10959) (not b!10774) (not d!3378) (not d!3350) (not d!3394) (not bm!200) (not b!10974) (not b!10858) (not b!10806) (not b!10773) (not d!3374) (not b!10995) (not b!10857) (not b!10958) (not b!10903) (not b!10966) (not b!10957) (not d!3422) (not d!3396) (not d!3444) (not d!3390) (not b!10771) (not b!10900) (not b!10856) (not b!10993) (not b!10772) (not b!10769) (not d!3414) (not b!10768) (not b!10960) (not d!3438) (not b!10902))
