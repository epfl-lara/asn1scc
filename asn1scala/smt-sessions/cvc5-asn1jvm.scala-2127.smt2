; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53844 () Bool)

(assert start!53844)

(declare-fun b!250622 () Bool)

(declare-fun e!173701 () Bool)

(declare-datatypes ((array!13660 0))(
  ( (array!13661 (arr!6979 (Array (_ BitVec 32) (_ BitVec 8))) (size!5992 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10906 0))(
  ( (BitStream!10907 (buf!6488 array!13660) (currentByte!11928 (_ BitVec 32)) (currentBit!11923 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21510 0))(
  ( (tuple2!21511 (_1!11680 BitStream!10906) (_2!11680 Bool)) )
))
(declare-fun lt!389402 () tuple2!21510)

(declare-fun lt!389403 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!250622 (= e!173701 (= (bitIndex!0 (size!5992 (buf!6488 (_1!11680 lt!389402))) (currentByte!11928 (_1!11680 lt!389402)) (currentBit!11923 (_1!11680 lt!389402))) lt!389403))))

(declare-fun b!250623 () Bool)

(declare-fun e!173697 () Bool)

(declare-fun e!173700 () Bool)

(assert (=> b!250623 (= e!173697 e!173700)))

(declare-fun res!209836 () Bool)

(assert (=> b!250623 (=> (not res!209836) (not e!173700))))

(declare-fun lt!389409 () (_ BitVec 64))

(declare-datatypes ((Unit!18123 0))(
  ( (Unit!18124) )
))
(declare-datatypes ((tuple2!21512 0))(
  ( (tuple2!21513 (_1!11681 Unit!18123) (_2!11681 BitStream!10906)) )
))
(declare-fun lt!389400 () tuple2!21512)

(declare-fun lt!389407 () tuple2!21512)

(assert (=> b!250623 (= res!209836 (= (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389400))) (currentByte!11928 (_2!11681 lt!389400)) (currentBit!11923 (_2!11681 lt!389400))) (bvadd (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))) lt!389409)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!250623 (= lt!389409 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!250624 () Bool)

(declare-fun e!173696 () Bool)

(declare-fun thiss!1005 () BitStream!10906)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250624 (= e!173696 (invariant!0 (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(declare-fun b!250626 () Bool)

(declare-fun res!209837 () Bool)

(assert (=> b!250626 (=> (not res!209837) (not e!173700))))

(declare-fun isPrefixOf!0 (BitStream!10906 BitStream!10906) Bool)

(assert (=> b!250626 (= res!209837 (isPrefixOf!0 (_2!11681 lt!389407) (_2!11681 lt!389400)))))

(declare-fun b!250627 () Bool)

(declare-fun res!209834 () Bool)

(declare-fun e!173702 () Bool)

(assert (=> b!250627 (=> (not res!209834) (not e!173702))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250627 (= res!209834 (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 thiss!1005))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!250628 () Bool)

(declare-fun e!173694 () Bool)

(assert (=> b!250628 (= e!173694 e!173701)))

(declare-fun res!209830 () Bool)

(assert (=> b!250628 (=> (not res!209830) (not e!173701))))

(declare-fun bit!26 () Bool)

(assert (=> b!250628 (= res!209830 (and (= (_2!11680 lt!389402) bit!26) (= (_1!11680 lt!389402) (_2!11681 lt!389407))))))

(declare-fun readBitPure!0 (BitStream!10906) tuple2!21510)

(declare-fun readerFrom!0 (BitStream!10906 (_ BitVec 32) (_ BitVec 32)) BitStream!10906)

(assert (=> b!250628 (= lt!389402 (readBitPure!0 (readerFrom!0 (_2!11681 lt!389407) (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005))))))

(declare-fun b!250629 () Bool)

(declare-fun lt!389405 () tuple2!21510)

(declare-datatypes ((tuple2!21514 0))(
  ( (tuple2!21515 (_1!11682 BitStream!10906) (_2!11682 BitStream!10906)) )
))
(declare-fun lt!389406 () tuple2!21514)

(assert (=> b!250629 (= e!173700 (not (or (not (_2!11680 lt!389405)) (not (= (_1!11680 lt!389405) (_2!11682 lt!389406))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10906 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21510)

(assert (=> b!250629 (= lt!389405 (checkBitsLoopPure!0 (_1!11682 lt!389406) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250629 (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389400)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) lt!389409)))

(declare-fun lt!389404 () Unit!18123)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10906 array!13660 (_ BitVec 64)) Unit!18123)

(assert (=> b!250629 (= lt!389404 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11681 lt!389407) (buf!6488 (_2!11681 lt!389400)) lt!389409))))

(declare-fun reader!0 (BitStream!10906 BitStream!10906) tuple2!21514)

(assert (=> b!250629 (= lt!389406 (reader!0 (_2!11681 lt!389407) (_2!11681 lt!389400)))))

(declare-fun b!250630 () Bool)

(declare-fun e!173698 () Bool)

(assert (=> b!250630 (= e!173702 (not e!173698))))

(declare-fun res!209827 () Bool)

(assert (=> b!250630 (=> res!209827 e!173698)))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250630 (= res!209827 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005)))))))

(assert (=> b!250630 e!173696))

(declare-fun res!209838 () Bool)

(assert (=> b!250630 (=> (not res!209838) (not e!173696))))

(assert (=> b!250630 (= res!209838 (isPrefixOf!0 thiss!1005 (_2!11681 lt!389400)))))

(declare-fun lt!389399 () Unit!18123)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10906 BitStream!10906 BitStream!10906) Unit!18123)

(assert (=> b!250630 (= lt!389399 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11681 lt!389407) (_2!11681 lt!389400)))))

(assert (=> b!250630 e!173697))

(declare-fun res!209829 () Bool)

(assert (=> b!250630 (=> (not res!209829) (not e!173697))))

(assert (=> b!250630 (= res!209829 (= (size!5992 (buf!6488 (_2!11681 lt!389407))) (size!5992 (buf!6488 (_2!11681 lt!389400)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10906 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21512)

(assert (=> b!250630 (= lt!389400 (appendNBitsLoop!0 (_2!11681 lt!389407) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250630 (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!389401 () Unit!18123)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10906 BitStream!10906 (_ BitVec 64) (_ BitVec 64)) Unit!18123)

(assert (=> b!250630 (= lt!389401 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11681 lt!389407) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!173699 () Bool)

(assert (=> b!250630 e!173699))

(declare-fun res!209833 () Bool)

(assert (=> b!250630 (=> (not res!209833) (not e!173699))))

(assert (=> b!250630 (= res!209833 (= (size!5992 (buf!6488 thiss!1005)) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(declare-fun appendBit!0 (BitStream!10906 Bool) tuple2!21512)

(assert (=> b!250630 (= lt!389407 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!250631 () Bool)

(declare-fun res!209835 () Bool)

(assert (=> b!250631 (=> (not res!209835) (not e!173694))))

(assert (=> b!250631 (= res!209835 (isPrefixOf!0 thiss!1005 (_2!11681 lt!389407)))))

(declare-fun b!250632 () Bool)

(assert (=> b!250632 (= e!173699 e!173694)))

(declare-fun res!209828 () Bool)

(assert (=> b!250632 (=> (not res!209828) (not e!173694))))

(declare-fun lt!389408 () (_ BitVec 64))

(assert (=> b!250632 (= res!209828 (= lt!389403 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!389408)))))

(assert (=> b!250632 (= lt!389403 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))))))

(assert (=> b!250632 (= lt!389408 (bitIndex!0 (size!5992 (buf!6488 thiss!1005)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)))))

(declare-fun res!209831 () Bool)

(assert (=> start!53844 (=> (not res!209831) (not e!173702))))

(assert (=> start!53844 (= res!209831 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53844 e!173702))

(assert (=> start!53844 true))

(declare-fun e!173693 () Bool)

(declare-fun inv!12 (BitStream!10906) Bool)

(assert (=> start!53844 (and (inv!12 thiss!1005) e!173693)))

(declare-fun b!250625 () Bool)

(declare-fun array_inv!5733 (array!13660) Bool)

(assert (=> b!250625 (= e!173693 (array_inv!5733 (buf!6488 thiss!1005)))))

(declare-fun b!250633 () Bool)

(declare-fun res!209832 () Bool)

(assert (=> b!250633 (=> (not res!209832) (not e!173702))))

(assert (=> b!250633 (= res!209832 (bvslt from!289 nBits!297))))

(declare-fun b!250634 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13660 array!13660 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!250634 (= e!173698 (arrayBitRangesEq!0 (buf!6488 (_2!11681 lt!389407)) (buf!6488 (_2!11681 lt!389400)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)))))))

(assert (= (and start!53844 res!209831) b!250627))

(assert (= (and b!250627 res!209834) b!250633))

(assert (= (and b!250633 res!209832) b!250630))

(assert (= (and b!250630 res!209833) b!250632))

(assert (= (and b!250632 res!209828) b!250631))

(assert (= (and b!250631 res!209835) b!250628))

(assert (= (and b!250628 res!209830) b!250622))

(assert (= (and b!250630 res!209829) b!250623))

(assert (= (and b!250623 res!209836) b!250626))

(assert (= (and b!250626 res!209837) b!250629))

(assert (= (and b!250630 res!209838) b!250624))

(assert (= (and b!250630 (not res!209827)) b!250634))

(assert (= start!53844 b!250625))

(declare-fun m!377169 () Bool)

(assert (=> b!250624 m!377169))

(declare-fun m!377171 () Bool)

(assert (=> b!250629 m!377171))

(declare-fun m!377173 () Bool)

(assert (=> b!250629 m!377173))

(declare-fun m!377175 () Bool)

(assert (=> b!250629 m!377175))

(declare-fun m!377177 () Bool)

(assert (=> b!250629 m!377177))

(declare-fun m!377179 () Bool)

(assert (=> start!53844 m!377179))

(declare-fun m!377181 () Bool)

(assert (=> b!250630 m!377181))

(declare-fun m!377183 () Bool)

(assert (=> b!250630 m!377183))

(declare-fun m!377185 () Bool)

(assert (=> b!250630 m!377185))

(declare-fun m!377187 () Bool)

(assert (=> b!250630 m!377187))

(declare-fun m!377189 () Bool)

(assert (=> b!250630 m!377189))

(declare-fun m!377191 () Bool)

(assert (=> b!250630 m!377191))

(declare-fun m!377193 () Bool)

(assert (=> b!250630 m!377193))

(declare-fun m!377195 () Bool)

(assert (=> b!250625 m!377195))

(declare-fun m!377197 () Bool)

(assert (=> b!250631 m!377197))

(declare-fun m!377199 () Bool)

(assert (=> b!250628 m!377199))

(assert (=> b!250628 m!377199))

(declare-fun m!377201 () Bool)

(assert (=> b!250628 m!377201))

(declare-fun m!377203 () Bool)

(assert (=> b!250623 m!377203))

(declare-fun m!377205 () Bool)

(assert (=> b!250623 m!377205))

(assert (=> b!250632 m!377205))

(declare-fun m!377207 () Bool)

(assert (=> b!250632 m!377207))

(declare-fun m!377209 () Bool)

(assert (=> b!250622 m!377209))

(declare-fun m!377211 () Bool)

(assert (=> b!250634 m!377211))

(declare-fun m!377213 () Bool)

(assert (=> b!250634 m!377213))

(declare-fun m!377215 () Bool)

(assert (=> b!250627 m!377215))

(declare-fun m!377217 () Bool)

(assert (=> b!250626 m!377217))

(push 1)

(assert (not b!250626))

(assert (not b!250625))

(assert (not b!250627))

(assert (not b!250631))

(assert (not b!250623))

(assert (not b!250632))

(assert (not b!250634))

(assert (not b!250630))

(assert (not b!250629))

(assert (not b!250624))

(assert (not start!53844))

(assert (not b!250622))

(assert (not b!250628))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!83934 () Bool)

(assert (=> d!83934 (= (array_inv!5733 (buf!6488 thiss!1005)) (bvsge (size!5992 (buf!6488 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!250625 d!83934))

(declare-fun b!250794 () Bool)

(declare-fun e!173816 () Bool)

(declare-datatypes ((tuple4!292 0))(
  ( (tuple4!293 (_1!11691 (_ BitVec 32)) (_2!11691 (_ BitVec 32)) (_3!926 (_ BitVec 32)) (_4!146 (_ BitVec 32))) )
))
(declare-fun lt!389602 () tuple4!292)

(declare-fun arrayRangesEq!923 (array!13660 array!13660 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250794 (= e!173816 (arrayRangesEq!923 (buf!6488 (_2!11681 lt!389407)) (buf!6488 (_2!11681 lt!389400)) (_1!11691 lt!389602) (_2!11691 lt!389602)))))

(declare-fun b!250795 () Bool)

(declare-fun e!173812 () Bool)

(declare-fun e!173814 () Bool)

(assert (=> b!250795 (= e!173812 e!173814)))

(declare-fun lt!389603 () (_ BitVec 32))

(declare-fun res!209983 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!250795 (= res!209983 (byteRangesEq!0 (select (arr!6979 (buf!6488 (_2!11681 lt!389407))) (_3!926 lt!389602)) (select (arr!6979 (buf!6488 (_2!11681 lt!389400))) (_3!926 lt!389602)) lt!389603 #b00000000000000000000000000001000))))

(assert (=> b!250795 (=> (not res!209983) (not e!173814))))

(declare-fun call!3960 () Bool)

(declare-fun c!11602 () Bool)

(declare-fun lt!389604 () (_ BitVec 32))

(declare-fun bm!3957 () Bool)

(assert (=> bm!3957 (= call!3960 (byteRangesEq!0 (ite c!11602 (select (arr!6979 (buf!6488 (_2!11681 lt!389407))) (_3!926 lt!389602)) (select (arr!6979 (buf!6488 (_2!11681 lt!389407))) (_4!146 lt!389602))) (ite c!11602 (select (arr!6979 (buf!6488 (_2!11681 lt!389400))) (_3!926 lt!389602)) (select (arr!6979 (buf!6488 (_2!11681 lt!389400))) (_4!146 lt!389602))) (ite c!11602 lt!389603 #b00000000000000000000000000000000) lt!389604))))

(declare-fun b!250796 () Bool)

(assert (=> b!250796 (= e!173812 call!3960)))

(declare-fun d!83938 () Bool)

(declare-fun res!209981 () Bool)

(declare-fun e!173815 () Bool)

(assert (=> d!83938 (=> res!209981 e!173815)))

(assert (=> d!83938 (= res!209981 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)))))))

(assert (=> d!83938 (= (arrayBitRangesEq!0 (buf!6488 (_2!11681 lt!389407)) (buf!6488 (_2!11681 lt!389400)) #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)))) e!173815)))

(declare-fun b!250797 () Bool)

(declare-fun e!173813 () Bool)

(assert (=> b!250797 (= e!173813 call!3960)))

(declare-fun b!250798 () Bool)

(declare-fun e!173817 () Bool)

(assert (=> b!250798 (= e!173817 e!173812)))

(assert (=> b!250798 (= c!11602 (= (_3!926 lt!389602) (_4!146 lt!389602)))))

(declare-fun b!250799 () Bool)

(declare-fun res!209985 () Bool)

(assert (=> b!250799 (= res!209985 (= lt!389604 #b00000000000000000000000000000000))))

(assert (=> b!250799 (=> res!209985 e!173813)))

(assert (=> b!250799 (= e!173814 e!173813)))

(declare-fun b!250800 () Bool)

(assert (=> b!250800 (= e!173815 e!173817)))

(declare-fun res!209984 () Bool)

(assert (=> b!250800 (=> (not res!209984) (not e!173817))))

(assert (=> b!250800 (= res!209984 e!173816)))

(declare-fun res!209982 () Bool)

(assert (=> b!250800 (=> res!209982 e!173816)))

(assert (=> b!250800 (= res!209982 (bvsge (_1!11691 lt!389602) (_2!11691 lt!389602)))))

(assert (=> b!250800 (= lt!389604 ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250800 (= lt!389603 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!292)

(assert (=> b!250800 (= lt!389602 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)))))))

(assert (= (and d!83938 (not res!209981)) b!250800))

(assert (= (and b!250800 (not res!209982)) b!250794))

(assert (= (and b!250800 res!209984) b!250798))

(assert (= (and b!250798 c!11602) b!250796))

(assert (= (and b!250798 (not c!11602)) b!250795))

(assert (= (and b!250795 res!209983) b!250799))

(assert (= (and b!250799 (not res!209985)) b!250797))

(assert (= (or b!250796 b!250797) bm!3957))

(declare-fun m!377391 () Bool)

(assert (=> b!250794 m!377391))

(declare-fun m!377393 () Bool)

(assert (=> b!250795 m!377393))

(declare-fun m!377395 () Bool)

(assert (=> b!250795 m!377395))

(assert (=> b!250795 m!377393))

(assert (=> b!250795 m!377395))

(declare-fun m!377397 () Bool)

(assert (=> b!250795 m!377397))

(declare-fun m!377401 () Bool)

(assert (=> bm!3957 m!377401))

(assert (=> bm!3957 m!377395))

(assert (=> bm!3957 m!377393))

(declare-fun m!377405 () Bool)

(assert (=> bm!3957 m!377405))

(declare-fun m!377407 () Bool)

(assert (=> bm!3957 m!377407))

(declare-fun m!377409 () Bool)

(assert (=> b!250800 m!377409))

(assert (=> b!250634 d!83938))

(declare-fun d!83944 () Bool)

(declare-fun e!173834 () Bool)

(assert (=> d!83944 e!173834))

(declare-fun res!210016 () Bool)

(assert (=> d!83944 (=> (not res!210016) (not e!173834))))

(declare-fun lt!389667 () (_ BitVec 64))

(declare-fun lt!389662 () (_ BitVec 64))

(declare-fun lt!389665 () (_ BitVec 64))

(assert (=> d!83944 (= res!210016 (= lt!389665 (bvsub lt!389667 lt!389662)))))

(assert (=> d!83944 (or (= (bvand lt!389667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389662 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389667 lt!389662) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!83944 (= lt!389662 (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005))))))

(declare-fun lt!389664 () (_ BitVec 64))

(declare-fun lt!389666 () (_ BitVec 64))

(assert (=> d!83944 (= lt!389667 (bvmul lt!389664 lt!389666))))

(assert (=> d!83944 (or (= lt!389664 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389666 (bvsdiv (bvmul lt!389664 lt!389666) lt!389664)))))

(assert (=> d!83944 (= lt!389666 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83944 (= lt!389664 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(assert (=> d!83944 (= lt!389665 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11928 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11923 thiss!1005))))))

(assert (=> d!83944 (invariant!0 (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005) (size!5992 (buf!6488 (_2!11681 lt!389407))))))

(assert (=> d!83944 (= (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)) lt!389665)))

(declare-fun b!250829 () Bool)

(declare-fun res!210015 () Bool)

(assert (=> b!250829 (=> (not res!210015) (not e!173834))))

(assert (=> b!250829 (= res!210015 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389665))))

(declare-fun b!250830 () Bool)

(declare-fun lt!389663 () (_ BitVec 64))

(assert (=> b!250830 (= e!173834 (bvsle lt!389665 (bvmul lt!389663 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250830 (or (= lt!389663 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389663 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389663)))))

(assert (=> b!250830 (= lt!389663 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(assert (= (and d!83944 res!210016) b!250829))

(assert (= (and b!250829 res!210015) b!250830))

(declare-fun m!377439 () Bool)

(assert (=> d!83944 m!377439))

(assert (=> d!83944 m!377169))

(assert (=> b!250634 d!83944))

(declare-fun d!83966 () Bool)

(declare-fun e!173835 () Bool)

(assert (=> d!83966 e!173835))

(declare-fun res!210018 () Bool)

(assert (=> d!83966 (=> (not res!210018) (not e!173835))))

(declare-fun lt!389668 () (_ BitVec 64))

(declare-fun lt!389673 () (_ BitVec 64))

(declare-fun lt!389671 () (_ BitVec 64))

(assert (=> d!83966 (= res!210018 (= lt!389671 (bvsub lt!389673 lt!389668)))))

(assert (=> d!83966 (or (= (bvand lt!389673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389668 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389673 lt!389668) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83966 (= lt!389668 (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389400)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389400))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389400)))))))

(declare-fun lt!389670 () (_ BitVec 64))

(declare-fun lt!389672 () (_ BitVec 64))

(assert (=> d!83966 (= lt!389673 (bvmul lt!389670 lt!389672))))

(assert (=> d!83966 (or (= lt!389670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389672 (bvsdiv (bvmul lt!389670 lt!389672) lt!389670)))))

(assert (=> d!83966 (= lt!389672 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83966 (= lt!389670 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389400)))))))

(assert (=> d!83966 (= lt!389671 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389400))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389400)))))))

(assert (=> d!83966 (invariant!0 (currentBit!11923 (_2!11681 lt!389400)) (currentByte!11928 (_2!11681 lt!389400)) (size!5992 (buf!6488 (_2!11681 lt!389400))))))

(assert (=> d!83966 (= (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389400))) (currentByte!11928 (_2!11681 lt!389400)) (currentBit!11923 (_2!11681 lt!389400))) lt!389671)))

(declare-fun b!250831 () Bool)

(declare-fun res!210017 () Bool)

(assert (=> b!250831 (=> (not res!210017) (not e!173835))))

(assert (=> b!250831 (= res!210017 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389671))))

(declare-fun b!250832 () Bool)

(declare-fun lt!389669 () (_ BitVec 64))

(assert (=> b!250832 (= e!173835 (bvsle lt!389671 (bvmul lt!389669 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250832 (or (= lt!389669 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389669 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389669)))))

(assert (=> b!250832 (= lt!389669 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389400)))))))

(assert (= (and d!83966 res!210018) b!250831))

(assert (= (and b!250831 res!210017) b!250832))

(declare-fun m!377441 () Bool)

(assert (=> d!83966 m!377441))

(declare-fun m!377443 () Bool)

(assert (=> d!83966 m!377443))

(assert (=> b!250623 d!83966))

(declare-fun d!83968 () Bool)

(declare-fun e!173836 () Bool)

(assert (=> d!83968 e!173836))

(declare-fun res!210020 () Bool)

(assert (=> d!83968 (=> (not res!210020) (not e!173836))))

(declare-fun lt!389679 () (_ BitVec 64))

(declare-fun lt!389677 () (_ BitVec 64))

(declare-fun lt!389674 () (_ BitVec 64))

(assert (=> d!83968 (= res!210020 (= lt!389677 (bvsub lt!389679 lt!389674)))))

(assert (=> d!83968 (or (= (bvand lt!389679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389674 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389679 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389679 lt!389674) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!83968 (= lt!389674 (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407)))))))

(declare-fun lt!389676 () (_ BitVec 64))

(declare-fun lt!389678 () (_ BitVec 64))

(assert (=> d!83968 (= lt!389679 (bvmul lt!389676 lt!389678))))

(assert (=> d!83968 (or (= lt!389676 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389678 (bvsdiv (bvmul lt!389676 lt!389678) lt!389676)))))

(assert (=> d!83968 (= lt!389678 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!83968 (= lt!389676 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(assert (=> d!83968 (= lt!389677 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407)))))))

(assert (=> d!83968 (invariant!0 (currentBit!11923 (_2!11681 lt!389407)) (currentByte!11928 (_2!11681 lt!389407)) (size!5992 (buf!6488 (_2!11681 lt!389407))))))

(assert (=> d!83968 (= (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))) lt!389677)))

(declare-fun b!250833 () Bool)

(declare-fun res!210019 () Bool)

(assert (=> b!250833 (=> (not res!210019) (not e!173836))))

(assert (=> b!250833 (= res!210019 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389677))))

(declare-fun b!250834 () Bool)

(declare-fun lt!389675 () (_ BitVec 64))

(assert (=> b!250834 (= e!173836 (bvsle lt!389677 (bvmul lt!389675 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250834 (or (= lt!389675 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389675 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389675)))))

(assert (=> b!250834 (= lt!389675 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(assert (= (and d!83968 res!210020) b!250833))

(assert (= (and b!250833 res!210019) b!250834))

(declare-fun m!377445 () Bool)

(assert (=> d!83968 m!377445))

(declare-fun m!377447 () Bool)

(assert (=> d!83968 m!377447))

(assert (=> b!250623 d!83968))

(declare-fun d!83970 () Bool)

(assert (=> d!83970 (= (invariant!0 (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005) (size!5992 (buf!6488 (_2!11681 lt!389407)))) (and (bvsge (currentBit!11923 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11923 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11928 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11928 thiss!1005) (size!5992 (buf!6488 (_2!11681 lt!389407)))) (and (= (currentBit!11923 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11928 thiss!1005) (size!5992 (buf!6488 (_2!11681 lt!389407))))))))))

(assert (=> b!250624 d!83970))

(declare-fun d!83974 () Bool)

(assert (=> d!83974 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005) (size!5992 (buf!6488 thiss!1005))))))

(declare-fun bs!21277 () Bool)

(assert (= bs!21277 d!83974))

(declare-fun m!377455 () Bool)

(assert (=> bs!21277 m!377455))

(assert (=> start!53844 d!83974))

(declare-fun d!83980 () Bool)

(assert (=> d!83980 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 thiss!1005))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 thiss!1005))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!21278 () Bool)

(assert (= bs!21278 d!83980))

(declare-fun m!377457 () Bool)

(assert (=> bs!21278 m!377457))

(assert (=> b!250627 d!83980))

(declare-fun d!83982 () Bool)

(declare-datatypes ((tuple2!21530 0))(
  ( (tuple2!21531 (_1!11692 Bool) (_2!11692 BitStream!10906)) )
))
(declare-fun lt!389697 () tuple2!21530)

(declare-fun readBit!0 (BitStream!10906) tuple2!21530)

(assert (=> d!83982 (= lt!389697 (readBit!0 (readerFrom!0 (_2!11681 lt!389407) (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005))))))

(assert (=> d!83982 (= (readBitPure!0 (readerFrom!0 (_2!11681 lt!389407) (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005))) (tuple2!21511 (_2!11692 lt!389697) (_1!11692 lt!389697)))))

(declare-fun bs!21280 () Bool)

(assert (= bs!21280 d!83982))

(assert (=> bs!21280 m!377199))

(declare-fun m!377465 () Bool)

(assert (=> bs!21280 m!377465))

(assert (=> b!250628 d!83982))

(declare-fun d!83992 () Bool)

(declare-fun e!173844 () Bool)

(assert (=> d!83992 e!173844))

(declare-fun res!210032 () Bool)

(assert (=> d!83992 (=> (not res!210032) (not e!173844))))

(assert (=> d!83992 (= res!210032 (invariant!0 (currentBit!11923 (_2!11681 lt!389407)) (currentByte!11928 (_2!11681 lt!389407)) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(assert (=> d!83992 (= (readerFrom!0 (_2!11681 lt!389407) (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005)) (BitStream!10907 (buf!6488 (_2!11681 lt!389407)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)))))

(declare-fun b!250844 () Bool)

(assert (=> b!250844 (= e!173844 (invariant!0 (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(assert (= (and d!83992 res!210032) b!250844))

(assert (=> d!83992 m!377447))

(assert (=> b!250844 m!377169))

(assert (=> b!250628 d!83992))

(declare-fun d!83998 () Bool)

(declare-fun res!210040 () Bool)

(declare-fun e!173849 () Bool)

(assert (=> d!83998 (=> (not res!210040) (not e!173849))))

(assert (=> d!83998 (= res!210040 (= (size!5992 (buf!6488 (_2!11681 lt!389407))) (size!5992 (buf!6488 (_2!11681 lt!389400)))))))

(assert (=> d!83998 (= (isPrefixOf!0 (_2!11681 lt!389407) (_2!11681 lt!389400)) e!173849)))

(declare-fun b!250851 () Bool)

(declare-fun res!210039 () Bool)

(assert (=> b!250851 (=> (not res!210039) (not e!173849))))

(assert (=> b!250851 (= res!210039 (bvsle (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))) (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389400))) (currentByte!11928 (_2!11681 lt!389400)) (currentBit!11923 (_2!11681 lt!389400)))))))

(declare-fun b!250852 () Bool)

(declare-fun e!173850 () Bool)

(assert (=> b!250852 (= e!173849 e!173850)))

(declare-fun res!210041 () Bool)

(assert (=> b!250852 (=> res!210041 e!173850)))

(assert (=> b!250852 (= res!210041 (= (size!5992 (buf!6488 (_2!11681 lt!389407))) #b00000000000000000000000000000000))))

(declare-fun b!250853 () Bool)

(assert (=> b!250853 (= e!173850 (arrayBitRangesEq!0 (buf!6488 (_2!11681 lt!389407)) (buf!6488 (_2!11681 lt!389400)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407)))))))

(assert (= (and d!83998 res!210040) b!250851))

(assert (= (and b!250851 res!210039) b!250852))

(assert (= (and b!250852 (not res!210041)) b!250853))

(assert (=> b!250851 m!377205))

(assert (=> b!250851 m!377203))

(assert (=> b!250853 m!377205))

(assert (=> b!250853 m!377205))

(declare-fun m!377471 () Bool)

(assert (=> b!250853 m!377471))

(assert (=> b!250626 d!83998))

(declare-fun b!250891 () Bool)

(declare-fun res!210069 () Bool)

(declare-fun e!173876 () Bool)

(assert (=> b!250891 (=> (not res!210069) (not e!173876))))

(declare-fun lt!389756 () tuple2!21512)

(assert (=> b!250891 (= res!210069 (isPrefixOf!0 thiss!1005 (_2!11681 lt!389756)))))

(declare-fun b!250890 () Bool)

(declare-fun res!210068 () Bool)

(assert (=> b!250890 (=> (not res!210068) (not e!173876))))

(declare-fun lt!389757 () (_ BitVec 64))

(declare-fun lt!389755 () (_ BitVec 64))

(assert (=> b!250890 (= res!210068 (= (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389756))) (currentByte!11928 (_2!11681 lt!389756)) (currentBit!11923 (_2!11681 lt!389756))) (bvadd lt!389755 lt!389757)))))

(assert (=> b!250890 (or (not (= (bvand lt!389755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389757 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389755 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389755 lt!389757) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250890 (= lt!389757 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!250890 (= lt!389755 (bitIndex!0 (size!5992 (buf!6488 thiss!1005)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)))))

(declare-fun b!250892 () Bool)

(declare-fun e!173877 () Bool)

(assert (=> b!250892 (= e!173876 e!173877)))

(declare-fun res!210070 () Bool)

(assert (=> b!250892 (=> (not res!210070) (not e!173877))))

(declare-fun lt!389758 () tuple2!21510)

(assert (=> b!250892 (= res!210070 (and (= (_2!11680 lt!389758) bit!26) (= (_1!11680 lt!389758) (_2!11681 lt!389756))))))

(assert (=> b!250892 (= lt!389758 (readBitPure!0 (readerFrom!0 (_2!11681 lt!389756) (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005))))))

(declare-fun d!84000 () Bool)

(assert (=> d!84000 e!173876))

(declare-fun res!210067 () Bool)

(assert (=> d!84000 (=> (not res!210067) (not e!173876))))

(assert (=> d!84000 (= res!210067 (= (size!5992 (buf!6488 thiss!1005)) (size!5992 (buf!6488 (_2!11681 lt!389756)))))))

(declare-fun choose!16 (BitStream!10906 Bool) tuple2!21512)

(assert (=> d!84000 (= lt!389756 (choose!16 thiss!1005 bit!26))))

(assert (=> d!84000 (validate_offset_bit!0 ((_ sign_extend 32) (size!5992 (buf!6488 thiss!1005))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005)))))

(assert (=> d!84000 (= (appendBit!0 thiss!1005 bit!26) lt!389756)))

(declare-fun b!250893 () Bool)

(assert (=> b!250893 (= e!173877 (= (bitIndex!0 (size!5992 (buf!6488 (_1!11680 lt!389758))) (currentByte!11928 (_1!11680 lt!389758)) (currentBit!11923 (_1!11680 lt!389758))) (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389756))) (currentByte!11928 (_2!11681 lt!389756)) (currentBit!11923 (_2!11681 lt!389756)))))))

(assert (= (and d!84000 res!210067) b!250890))

(assert (= (and b!250890 res!210068) b!250891))

(assert (= (and b!250891 res!210069) b!250892))

(assert (= (and b!250892 res!210070) b!250893))

(declare-fun m!377489 () Bool)

(assert (=> b!250892 m!377489))

(assert (=> b!250892 m!377489))

(declare-fun m!377491 () Bool)

(assert (=> b!250892 m!377491))

(declare-fun m!377493 () Bool)

(assert (=> b!250893 m!377493))

(declare-fun m!377495 () Bool)

(assert (=> b!250893 m!377495))

(declare-fun m!377497 () Bool)

(assert (=> b!250891 m!377497))

(assert (=> b!250890 m!377495))

(assert (=> b!250890 m!377207))

(declare-fun m!377499 () Bool)

(assert (=> d!84000 m!377499))

(declare-fun m!377501 () Bool)

(assert (=> d!84000 m!377501))

(assert (=> b!250630 d!84000))

(declare-fun b!250916 () Bool)

(declare-fun e!173887 () Bool)

(declare-fun lt!389810 () (_ BitVec 64))

(assert (=> b!250916 (= e!173887 (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) lt!389810))))

(declare-fun b!250913 () Bool)

(declare-fun res!210089 () Bool)

(declare-fun e!173886 () Bool)

(assert (=> b!250913 (=> (not res!210089) (not e!173886))))

(declare-fun lt!389813 () tuple2!21512)

(declare-fun lt!389807 () (_ BitVec 64))

(declare-fun lt!389808 () (_ BitVec 64))

(assert (=> b!250913 (= res!210089 (= (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389813))) (currentByte!11928 (_2!11681 lt!389813)) (currentBit!11923 (_2!11681 lt!389813))) (bvadd lt!389808 lt!389807)))))

(assert (=> b!250913 (or (not (= (bvand lt!389808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389807 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!389808 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!389808 lt!389807) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250913 (= lt!389807 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250913 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250913 (= lt!389808 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))))))

(declare-fun b!250914 () Bool)

(declare-fun res!210090 () Bool)

(assert (=> b!250914 (=> (not res!210090) (not e!173886))))

(assert (=> b!250914 (= res!210090 (isPrefixOf!0 (_2!11681 lt!389407) (_2!11681 lt!389813)))))

(declare-fun d!84004 () Bool)

(assert (=> d!84004 e!173886))

(declare-fun res!210091 () Bool)

(assert (=> d!84004 (=> (not res!210091) (not e!173886))))

(assert (=> d!84004 (= res!210091 (= (size!5992 (buf!6488 (_2!11681 lt!389407))) (size!5992 (buf!6488 (_2!11681 lt!389813)))))))

(declare-fun choose!51 (BitStream!10906 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21512)

(assert (=> d!84004 (= lt!389813 (choose!51 (_2!11681 lt!389407) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84004 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!84004 (= (appendNBitsLoop!0 (_2!11681 lt!389407) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!389813)))

(declare-fun b!250915 () Bool)

(declare-fun lt!389811 () tuple2!21510)

(declare-fun lt!389814 () tuple2!21514)

(assert (=> b!250915 (= e!173886 (and (_2!11680 lt!389811) (= (_1!11680 lt!389811) (_2!11682 lt!389814))))))

(assert (=> b!250915 (= lt!389811 (checkBitsLoopPure!0 (_1!11682 lt!389814) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!389812 () Unit!18123)

(declare-fun lt!389809 () Unit!18123)

(assert (=> b!250915 (= lt!389812 lt!389809)))

(assert (=> b!250915 (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389813)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) lt!389810)))

(assert (=> b!250915 (= lt!389809 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11681 lt!389407) (buf!6488 (_2!11681 lt!389813)) lt!389810))))

(assert (=> b!250915 e!173887))

(declare-fun res!210088 () Bool)

(assert (=> b!250915 (=> (not res!210088) (not e!173887))))

(assert (=> b!250915 (= res!210088 (and (= (size!5992 (buf!6488 (_2!11681 lt!389407))) (size!5992 (buf!6488 (_2!11681 lt!389813)))) (bvsge lt!389810 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250915 (= lt!389810 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!250915 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250915 (= lt!389814 (reader!0 (_2!11681 lt!389407) (_2!11681 lt!389813)))))

(assert (= (and d!84004 res!210091) b!250913))

(assert (= (and b!250913 res!210089) b!250914))

(assert (= (and b!250914 res!210090) b!250915))

(assert (= (and b!250915 res!210088) b!250916))

(declare-fun m!377535 () Bool)

(assert (=> b!250915 m!377535))

(declare-fun m!377537 () Bool)

(assert (=> b!250915 m!377537))

(declare-fun m!377539 () Bool)

(assert (=> b!250915 m!377539))

(declare-fun m!377541 () Bool)

(assert (=> b!250915 m!377541))

(declare-fun m!377543 () Bool)

(assert (=> d!84004 m!377543))

(declare-fun m!377545 () Bool)

(assert (=> b!250914 m!377545))

(declare-fun m!377547 () Bool)

(assert (=> b!250916 m!377547))

(declare-fun m!377549 () Bool)

(assert (=> b!250913 m!377549))

(assert (=> b!250913 m!377205))

(assert (=> b!250630 d!84004))

(declare-fun d!84010 () Bool)

(declare-fun e!173896 () Bool)

(assert (=> d!84010 e!173896))

(declare-fun res!210106 () Bool)

(assert (=> d!84010 (=> (not res!210106) (not e!173896))))

(assert (=> d!84010 (= res!210106 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!389841 () Unit!18123)

(declare-fun choose!27 (BitStream!10906 BitStream!10906 (_ BitVec 64) (_ BitVec 64)) Unit!18123)

(assert (=> d!84010 (= lt!389841 (choose!27 thiss!1005 (_2!11681 lt!389407) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!84010 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!84010 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11681 lt!389407) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!389841)))

(declare-fun b!250931 () Bool)

(assert (=> b!250931 (= e!173896 (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!84010 res!210106) b!250931))

(declare-fun m!377551 () Bool)

(assert (=> d!84010 m!377551))

(assert (=> b!250931 m!377193))

(assert (=> b!250630 d!84010))

(declare-fun d!84012 () Bool)

(declare-fun res!210108 () Bool)

(declare-fun e!173897 () Bool)

(assert (=> d!84012 (=> (not res!210108) (not e!173897))))

(assert (=> d!84012 (= res!210108 (= (size!5992 (buf!6488 thiss!1005)) (size!5992 (buf!6488 (_2!11681 lt!389400)))))))

(assert (=> d!84012 (= (isPrefixOf!0 thiss!1005 (_2!11681 lt!389400)) e!173897)))

(declare-fun b!250932 () Bool)

(declare-fun res!210107 () Bool)

(assert (=> b!250932 (=> (not res!210107) (not e!173897))))

(assert (=> b!250932 (= res!210107 (bvsle (bitIndex!0 (size!5992 (buf!6488 thiss!1005)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)) (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389400))) (currentByte!11928 (_2!11681 lt!389400)) (currentBit!11923 (_2!11681 lt!389400)))))))

(declare-fun b!250933 () Bool)

(declare-fun e!173898 () Bool)

(assert (=> b!250933 (= e!173897 e!173898)))

(declare-fun res!210109 () Bool)

(assert (=> b!250933 (=> res!210109 e!173898)))

(assert (=> b!250933 (= res!210109 (= (size!5992 (buf!6488 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250934 () Bool)

(assert (=> b!250934 (= e!173898 (arrayBitRangesEq!0 (buf!6488 thiss!1005) (buf!6488 (_2!11681 lt!389400)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5992 (buf!6488 thiss!1005)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005))))))

(assert (= (and d!84012 res!210108) b!250932))

(assert (= (and b!250932 res!210107) b!250933))

(assert (= (and b!250933 (not res!210109)) b!250934))

(assert (=> b!250932 m!377207))

(assert (=> b!250932 m!377203))

(assert (=> b!250934 m!377207))

(assert (=> b!250934 m!377207))

(declare-fun m!377565 () Bool)

(assert (=> b!250934 m!377565))

(assert (=> b!250630 d!84012))

(declare-fun d!84014 () Bool)

(assert (=> d!84014 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!21282 () Bool)

(assert (= bs!21282 d!84014))

(assert (=> bs!21282 m!377445))

(assert (=> b!250630 d!84014))

(declare-fun d!84018 () Bool)

(assert (=> d!84018 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389407)))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!21284 () Bool)

(assert (= bs!21284 d!84018))

(assert (=> bs!21284 m!377439))

(assert (=> b!250630 d!84018))

(declare-fun d!84024 () Bool)

(assert (=> d!84024 (isPrefixOf!0 thiss!1005 (_2!11681 lt!389400))))

(declare-fun lt!389847 () Unit!18123)

(declare-fun choose!30 (BitStream!10906 BitStream!10906 BitStream!10906) Unit!18123)

(assert (=> d!84024 (= lt!389847 (choose!30 thiss!1005 (_2!11681 lt!389407) (_2!11681 lt!389400)))))

(assert (=> d!84024 (isPrefixOf!0 thiss!1005 (_2!11681 lt!389407))))

(assert (=> d!84024 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11681 lt!389407) (_2!11681 lt!389400)) lt!389847)))

(declare-fun bs!21286 () Bool)

(assert (= bs!21286 d!84024))

(assert (=> bs!21286 m!377191))

(declare-fun m!377575 () Bool)

(assert (=> bs!21286 m!377575))

(assert (=> bs!21286 m!377197))

(assert (=> b!250630 d!84024))

(declare-fun lt!389850 () tuple2!21530)

(declare-fun d!84028 () Bool)

(declare-fun checkBitsLoop!0 (BitStream!10906 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21530)

(assert (=> d!84028 (= lt!389850 (checkBitsLoop!0 (_1!11682 lt!389406) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!84028 (= (checkBitsLoopPure!0 (_1!11682 lt!389406) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!21511 (_2!11692 lt!389850) (_1!11692 lt!389850)))))

(declare-fun bs!21287 () Bool)

(assert (= bs!21287 d!84028))

(declare-fun m!377577 () Bool)

(assert (=> bs!21287 m!377577))

(assert (=> b!250629 d!84028))

(declare-fun d!84030 () Bool)

(assert (=> d!84030 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389400)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) lt!389409) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389400)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407)))) lt!389409))))

(declare-fun bs!21288 () Bool)

(assert (= bs!21288 d!84030))

(declare-fun m!377579 () Bool)

(assert (=> bs!21288 m!377579))

(assert (=> b!250629 d!84030))

(declare-fun d!84032 () Bool)

(assert (=> d!84032 (validate_offset_bits!1 ((_ sign_extend 32) (size!5992 (buf!6488 (_2!11681 lt!389400)))) ((_ sign_extend 32) (currentByte!11928 (_2!11681 lt!389407))) ((_ sign_extend 32) (currentBit!11923 (_2!11681 lt!389407))) lt!389409)))

(declare-fun lt!389853 () Unit!18123)

(declare-fun choose!9 (BitStream!10906 array!13660 (_ BitVec 64) BitStream!10906) Unit!18123)

(assert (=> d!84032 (= lt!389853 (choose!9 (_2!11681 lt!389407) (buf!6488 (_2!11681 lt!389400)) lt!389409 (BitStream!10907 (buf!6488 (_2!11681 lt!389400)) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407)))))))

(assert (=> d!84032 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11681 lt!389407) (buf!6488 (_2!11681 lt!389400)) lt!389409) lt!389853)))

(declare-fun bs!21289 () Bool)

(assert (= bs!21289 d!84032))

(assert (=> bs!21289 m!377173))

(declare-fun m!377581 () Bool)

(assert (=> bs!21289 m!377581))

(assert (=> b!250629 d!84032))

(declare-fun b!250980 () Bool)

(declare-fun lt!389937 () tuple2!21514)

(declare-fun lt!389939 () (_ BitVec 64))

(declare-fun lt!389931 () (_ BitVec 64))

(declare-fun e!173927 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!10906 (_ BitVec 64)) BitStream!10906)

(assert (=> b!250980 (= e!173927 (= (_1!11682 lt!389937) (withMovedBitIndex!0 (_2!11682 lt!389937) (bvsub lt!389939 lt!389931))))))

(assert (=> b!250980 (or (= (bvand lt!389939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389931 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389939 lt!389931) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!250980 (= lt!389931 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389400))) (currentByte!11928 (_2!11681 lt!389400)) (currentBit!11923 (_2!11681 lt!389400))))))

(assert (=> b!250980 (= lt!389939 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))))))

(declare-fun b!250981 () Bool)

(declare-fun res!210148 () Bool)

(assert (=> b!250981 (=> (not res!210148) (not e!173927))))

(assert (=> b!250981 (= res!210148 (isPrefixOf!0 (_2!11682 lt!389937) (_2!11681 lt!389400)))))

(declare-fun d!84034 () Bool)

(assert (=> d!84034 e!173927))

(declare-fun res!210146 () Bool)

(assert (=> d!84034 (=> (not res!210146) (not e!173927))))

(assert (=> d!84034 (= res!210146 (isPrefixOf!0 (_1!11682 lt!389937) (_2!11682 lt!389937)))))

(declare-fun lt!389925 () BitStream!10906)

(assert (=> d!84034 (= lt!389937 (tuple2!21515 lt!389925 (_2!11681 lt!389400)))))

(declare-fun lt!389923 () Unit!18123)

(declare-fun lt!389938 () Unit!18123)

(assert (=> d!84034 (= lt!389923 lt!389938)))

(assert (=> d!84034 (isPrefixOf!0 lt!389925 (_2!11681 lt!389400))))

(assert (=> d!84034 (= lt!389938 (lemmaIsPrefixTransitive!0 lt!389925 (_2!11681 lt!389400) (_2!11681 lt!389400)))))

(declare-fun lt!389936 () Unit!18123)

(declare-fun lt!389928 () Unit!18123)

(assert (=> d!84034 (= lt!389936 lt!389928)))

(assert (=> d!84034 (isPrefixOf!0 lt!389925 (_2!11681 lt!389400))))

(assert (=> d!84034 (= lt!389928 (lemmaIsPrefixTransitive!0 lt!389925 (_2!11681 lt!389407) (_2!11681 lt!389400)))))

(declare-fun lt!389934 () Unit!18123)

(declare-fun e!173928 () Unit!18123)

(assert (=> d!84034 (= lt!389934 e!173928)))

(declare-fun c!11613 () Bool)

(assert (=> d!84034 (= c!11613 (not (= (size!5992 (buf!6488 (_2!11681 lt!389407))) #b00000000000000000000000000000000)))))

(declare-fun lt!389930 () Unit!18123)

(declare-fun lt!389926 () Unit!18123)

(assert (=> d!84034 (= lt!389930 lt!389926)))

(assert (=> d!84034 (isPrefixOf!0 (_2!11681 lt!389400) (_2!11681 lt!389400))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10906) Unit!18123)

(assert (=> d!84034 (= lt!389926 (lemmaIsPrefixRefl!0 (_2!11681 lt!389400)))))

(declare-fun lt!389922 () Unit!18123)

(declare-fun lt!389940 () Unit!18123)

(assert (=> d!84034 (= lt!389922 lt!389940)))

(assert (=> d!84034 (= lt!389940 (lemmaIsPrefixRefl!0 (_2!11681 lt!389400)))))

(declare-fun lt!389929 () Unit!18123)

(declare-fun lt!389927 () Unit!18123)

(assert (=> d!84034 (= lt!389929 lt!389927)))

(assert (=> d!84034 (isPrefixOf!0 lt!389925 lt!389925)))

(assert (=> d!84034 (= lt!389927 (lemmaIsPrefixRefl!0 lt!389925))))

(declare-fun lt!389924 () Unit!18123)

(declare-fun lt!389921 () Unit!18123)

(assert (=> d!84034 (= lt!389924 lt!389921)))

(assert (=> d!84034 (isPrefixOf!0 (_2!11681 lt!389407) (_2!11681 lt!389407))))

(assert (=> d!84034 (= lt!389921 (lemmaIsPrefixRefl!0 (_2!11681 lt!389407)))))

(assert (=> d!84034 (= lt!389925 (BitStream!10907 (buf!6488 (_2!11681 lt!389400)) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))))))

(assert (=> d!84034 (isPrefixOf!0 (_2!11681 lt!389407) (_2!11681 lt!389400))))

(assert (=> d!84034 (= (reader!0 (_2!11681 lt!389407) (_2!11681 lt!389400)) lt!389937)))

(declare-fun b!250982 () Bool)

(declare-fun res!210147 () Bool)

(assert (=> b!250982 (=> (not res!210147) (not e!173927))))

(assert (=> b!250982 (= res!210147 (isPrefixOf!0 (_1!11682 lt!389937) (_2!11681 lt!389407)))))

(declare-fun b!250983 () Bool)

(declare-fun Unit!18131 () Unit!18123)

(assert (=> b!250983 (= e!173928 Unit!18131)))

(declare-fun b!250984 () Bool)

(declare-fun lt!389933 () Unit!18123)

(assert (=> b!250984 (= e!173928 lt!389933)))

(declare-fun lt!389935 () (_ BitVec 64))

(assert (=> b!250984 (= lt!389935 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!389932 () (_ BitVec 64))

(assert (=> b!250984 (= lt!389932 (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13660 array!13660 (_ BitVec 64) (_ BitVec 64)) Unit!18123)

(assert (=> b!250984 (= lt!389933 (arrayBitRangesEqSymmetric!0 (buf!6488 (_2!11681 lt!389407)) (buf!6488 (_2!11681 lt!389400)) lt!389935 lt!389932))))

(assert (=> b!250984 (arrayBitRangesEq!0 (buf!6488 (_2!11681 lt!389400)) (buf!6488 (_2!11681 lt!389407)) lt!389935 lt!389932)))

(assert (= (and d!84034 c!11613) b!250984))

(assert (= (and d!84034 (not c!11613)) b!250983))

(assert (= (and d!84034 res!210146) b!250982))

(assert (= (and b!250982 res!210147) b!250981))

(assert (= (and b!250981 res!210148) b!250980))

(declare-fun m!377603 () Bool)

(assert (=> b!250980 m!377603))

(assert (=> b!250980 m!377203))

(assert (=> b!250980 m!377205))

(declare-fun m!377605 () Bool)

(assert (=> b!250982 m!377605))

(declare-fun m!377607 () Bool)

(assert (=> b!250981 m!377607))

(assert (=> b!250984 m!377205))

(declare-fun m!377609 () Bool)

(assert (=> b!250984 m!377609))

(declare-fun m!377611 () Bool)

(assert (=> b!250984 m!377611))

(declare-fun m!377613 () Bool)

(assert (=> d!84034 m!377613))

(declare-fun m!377615 () Bool)

(assert (=> d!84034 m!377615))

(declare-fun m!377617 () Bool)

(assert (=> d!84034 m!377617))

(declare-fun m!377619 () Bool)

(assert (=> d!84034 m!377619))

(declare-fun m!377621 () Bool)

(assert (=> d!84034 m!377621))

(declare-fun m!377623 () Bool)

(assert (=> d!84034 m!377623))

(declare-fun m!377625 () Bool)

(assert (=> d!84034 m!377625))

(declare-fun m!377627 () Bool)

(assert (=> d!84034 m!377627))

(declare-fun m!377629 () Bool)

(assert (=> d!84034 m!377629))

(assert (=> d!84034 m!377217))

(declare-fun m!377631 () Bool)

(assert (=> d!84034 m!377631))

(assert (=> b!250629 d!84034))

(declare-fun d!84042 () Bool)

(declare-fun e!173935 () Bool)

(assert (=> d!84042 e!173935))

(declare-fun res!210155 () Bool)

(assert (=> d!84042 (=> (not res!210155) (not e!173935))))

(declare-fun lt!389944 () (_ BitVec 64))

(declare-fun lt!389949 () (_ BitVec 64))

(declare-fun lt!389947 () (_ BitVec 64))

(assert (=> d!84042 (= res!210155 (= lt!389947 (bvsub lt!389949 lt!389944)))))

(assert (=> d!84042 (or (= (bvand lt!389949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389949 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389949 lt!389944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84042 (= lt!389944 (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 (_1!11680 lt!389402)))) ((_ sign_extend 32) (currentByte!11928 (_1!11680 lt!389402))) ((_ sign_extend 32) (currentBit!11923 (_1!11680 lt!389402)))))))

(declare-fun lt!389946 () (_ BitVec 64))

(declare-fun lt!389948 () (_ BitVec 64))

(assert (=> d!84042 (= lt!389949 (bvmul lt!389946 lt!389948))))

(assert (=> d!84042 (or (= lt!389946 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389948 (bvsdiv (bvmul lt!389946 lt!389948) lt!389946)))))

(assert (=> d!84042 (= lt!389948 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84042 (= lt!389946 ((_ sign_extend 32) (size!5992 (buf!6488 (_1!11680 lt!389402)))))))

(assert (=> d!84042 (= lt!389947 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11928 (_1!11680 lt!389402))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11923 (_1!11680 lt!389402)))))))

(assert (=> d!84042 (invariant!0 (currentBit!11923 (_1!11680 lt!389402)) (currentByte!11928 (_1!11680 lt!389402)) (size!5992 (buf!6488 (_1!11680 lt!389402))))))

(assert (=> d!84042 (= (bitIndex!0 (size!5992 (buf!6488 (_1!11680 lt!389402))) (currentByte!11928 (_1!11680 lt!389402)) (currentBit!11923 (_1!11680 lt!389402))) lt!389947)))

(declare-fun b!250992 () Bool)

(declare-fun res!210154 () Bool)

(assert (=> b!250992 (=> (not res!210154) (not e!173935))))

(assert (=> b!250992 (= res!210154 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389947))))

(declare-fun b!250993 () Bool)

(declare-fun lt!389945 () (_ BitVec 64))

(assert (=> b!250993 (= e!173935 (bvsle lt!389947 (bvmul lt!389945 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!250993 (or (= lt!389945 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389945 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389945)))))

(assert (=> b!250993 (= lt!389945 ((_ sign_extend 32) (size!5992 (buf!6488 (_1!11680 lt!389402)))))))

(assert (= (and d!84042 res!210155) b!250992))

(assert (= (and b!250992 res!210154) b!250993))

(declare-fun m!377639 () Bool)

(assert (=> d!84042 m!377639))

(declare-fun m!377641 () Bool)

(assert (=> d!84042 m!377641))

(assert (=> b!250622 d!84042))

(declare-fun d!84044 () Bool)

(declare-fun res!210157 () Bool)

(declare-fun e!173936 () Bool)

(assert (=> d!84044 (=> (not res!210157) (not e!173936))))

(assert (=> d!84044 (= res!210157 (= (size!5992 (buf!6488 thiss!1005)) (size!5992 (buf!6488 (_2!11681 lt!389407)))))))

(assert (=> d!84044 (= (isPrefixOf!0 thiss!1005 (_2!11681 lt!389407)) e!173936)))

(declare-fun b!250994 () Bool)

(declare-fun res!210156 () Bool)

(assert (=> b!250994 (=> (not res!210156) (not e!173936))))

(assert (=> b!250994 (= res!210156 (bvsle (bitIndex!0 (size!5992 (buf!6488 thiss!1005)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)) (bitIndex!0 (size!5992 (buf!6488 (_2!11681 lt!389407))) (currentByte!11928 (_2!11681 lt!389407)) (currentBit!11923 (_2!11681 lt!389407)))))))

(declare-fun b!250995 () Bool)

(declare-fun e!173937 () Bool)

(assert (=> b!250995 (= e!173936 e!173937)))

(declare-fun res!210158 () Bool)

(assert (=> b!250995 (=> res!210158 e!173937)))

(assert (=> b!250995 (= res!210158 (= (size!5992 (buf!6488 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!250996 () Bool)

(assert (=> b!250996 (= e!173937 (arrayBitRangesEq!0 (buf!6488 thiss!1005) (buf!6488 (_2!11681 lt!389407)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5992 (buf!6488 thiss!1005)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005))))))

(assert (= (and d!84044 res!210157) b!250994))

(assert (= (and b!250994 res!210156) b!250995))

(assert (= (and b!250995 (not res!210158)) b!250996))

(assert (=> b!250994 m!377207))

(assert (=> b!250994 m!377205))

(assert (=> b!250996 m!377207))

(assert (=> b!250996 m!377207))

(declare-fun m!377653 () Bool)

(assert (=> b!250996 m!377653))

(assert (=> b!250631 d!84044))

(assert (=> b!250632 d!83968))

(declare-fun d!84048 () Bool)

(declare-fun e!173939 () Bool)

(assert (=> d!84048 e!173939))

(declare-fun res!210162 () Bool)

(assert (=> d!84048 (=> (not res!210162) (not e!173939))))

(declare-fun lt!389961 () (_ BitVec 64))

(declare-fun lt!389956 () (_ BitVec 64))

(declare-fun lt!389959 () (_ BitVec 64))

(assert (=> d!84048 (= res!210162 (= lt!389959 (bvsub lt!389961 lt!389956)))))

(assert (=> d!84048 (or (= (bvand lt!389961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!389956 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!389961 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!389961 lt!389956) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!84048 (= lt!389956 (remainingBits!0 ((_ sign_extend 32) (size!5992 (buf!6488 thiss!1005))) ((_ sign_extend 32) (currentByte!11928 thiss!1005)) ((_ sign_extend 32) (currentBit!11923 thiss!1005))))))

(declare-fun lt!389958 () (_ BitVec 64))

(declare-fun lt!389960 () (_ BitVec 64))

(assert (=> d!84048 (= lt!389961 (bvmul lt!389958 lt!389960))))

(assert (=> d!84048 (or (= lt!389958 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!389960 (bvsdiv (bvmul lt!389958 lt!389960) lt!389958)))))

(assert (=> d!84048 (= lt!389960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!84048 (= lt!389958 ((_ sign_extend 32) (size!5992 (buf!6488 thiss!1005))))))

(assert (=> d!84048 (= lt!389959 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11928 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11923 thiss!1005))))))

(assert (=> d!84048 (invariant!0 (currentBit!11923 thiss!1005) (currentByte!11928 thiss!1005) (size!5992 (buf!6488 thiss!1005)))))

(assert (=> d!84048 (= (bitIndex!0 (size!5992 (buf!6488 thiss!1005)) (currentByte!11928 thiss!1005) (currentBit!11923 thiss!1005)) lt!389959)))

(declare-fun b!250999 () Bool)

(declare-fun res!210161 () Bool)

(assert (=> b!250999 (=> (not res!210161) (not e!173939))))

(assert (=> b!250999 (= res!210161 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!389959))))

(declare-fun b!251000 () Bool)

(declare-fun lt!389957 () (_ BitVec 64))

(assert (=> b!251000 (= e!173939 (bvsle lt!389959 (bvmul lt!389957 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!251000 (or (= lt!389957 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!389957 #b0000000000000000000000000000000000000000000000000000000000001000) lt!389957)))))

(assert (=> b!251000 (= lt!389957 ((_ sign_extend 32) (size!5992 (buf!6488 thiss!1005))))))

(assert (= (and d!84048 res!210162) b!250999))

(assert (= (and b!250999 res!210161) b!251000))

(assert (=> d!84048 m!377457))

(assert (=> d!84048 m!377455))

(assert (=> b!250632 d!84048))

(push 1)

(assert (not b!250981))

(assert (not d!84014))

(assert (not d!84018))

(assert (not b!250891))

(assert (not b!250934))

(assert (not d!83992))

(assert (not b!250853))

(assert (not d!84000))

(assert (not b!250996))

(assert (not d!84024))

(assert (not b!250932))

(assert (not b!250980))

(assert (not b!250893))

(assert (not b!250984))

(assert (not d!84004))

(assert (not d!83944))

(assert (not b!250916))

(assert (not b!250915))

(assert (not d!84030))

(assert (not d!84042))

(assert (not b!250800))

(assert (not d!84048))

(assert (not b!250982))

(assert (not b!250892))

(assert (not d!83982))

(assert (not b!250794))

(assert (not d!83966))

(assert (not b!250913))

(assert (not d!84010))

(assert (not b!250914))

(assert (not d!84032))

(assert (not bm!3957))

(assert (not b!250851))

(assert (not d!83980))

(assert (not d!84034))

(assert (not b!250931))

(assert (not d!84028))

(assert (not b!250994))

(assert (not b!250795))

(assert (not b!250890))

(assert (not d!83974))

(assert (not b!250844))

(assert (not d!83968))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

