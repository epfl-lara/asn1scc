; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54096 () Bool)

(assert start!54096)

(declare-fun b!252292 () Bool)

(declare-fun e!174822 () Bool)

(declare-datatypes ((array!13720 0))(
  ( (array!13721 (arr!7006 (Array (_ BitVec 32) (_ BitVec 8))) (size!6019 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10960 0))(
  ( (BitStream!10961 (buf!6521 array!13720) (currentByte!11976 (_ BitVec 32)) (currentBit!11971 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10960)

(declare-fun array_inv!5760 (array!13720) Bool)

(assert (=> b!252292 (= e!174822 (array_inv!5760 (buf!6521 thiss!1005)))))

(declare-fun b!252293 () Bool)

(declare-fun res!211365 () Bool)

(declare-fun e!174825 () Bool)

(assert (=> b!252293 (=> (not res!211365) (not e!174825))))

(declare-datatypes ((Unit!18186 0))(
  ( (Unit!18187) )
))
(declare-datatypes ((tuple2!21684 0))(
  ( (tuple2!21685 (_1!11770 Unit!18186) (_2!11770 BitStream!10960)) )
))
(declare-fun lt!391894 () tuple2!21684)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252293 (= res!211365 (invariant!0 (currentBit!11971 thiss!1005) (currentByte!11976 thiss!1005) (size!6019 (buf!6521 (_2!11770 lt!391894)))))))

(declare-fun b!252294 () Bool)

(declare-fun res!211367 () Bool)

(declare-fun e!174828 () Bool)

(assert (=> b!252294 (=> (not res!211367) (not e!174828))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!252294 (= res!211367 (bvslt from!289 nBits!297))))

(declare-fun b!252295 () Bool)

(declare-fun e!174823 () Bool)

(declare-datatypes ((tuple2!21686 0))(
  ( (tuple2!21687 (_1!11771 BitStream!10960) (_2!11771 Bool)) )
))
(declare-fun lt!391884 () tuple2!21686)

(declare-fun lt!391885 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252295 (= e!174823 (= (bitIndex!0 (size!6019 (buf!6521 (_1!11771 lt!391884))) (currentByte!11976 (_1!11771 lt!391884)) (currentBit!11971 (_1!11771 lt!391884))) lt!391885))))

(declare-fun b!252296 () Bool)

(declare-fun e!174824 () Bool)

(assert (=> b!252296 (= e!174824 e!174823)))

(declare-fun res!211368 () Bool)

(assert (=> b!252296 (=> (not res!211368) (not e!174823))))

(declare-fun bit!26 () Bool)

(assert (=> b!252296 (= res!211368 (and (= (_2!11771 lt!391884) bit!26) (= (_1!11771 lt!391884) (_2!11770 lt!391894))))))

(declare-fun readBitPure!0 (BitStream!10960) tuple2!21686)

(declare-fun readerFrom!0 (BitStream!10960 (_ BitVec 32) (_ BitVec 32)) BitStream!10960)

(assert (=> b!252296 (= lt!391884 (readBitPure!0 (readerFrom!0 (_2!11770 lt!391894) (currentBit!11971 thiss!1005) (currentByte!11976 thiss!1005))))))

(declare-fun b!252297 () Bool)

(declare-fun res!211358 () Bool)

(declare-fun e!174829 () Bool)

(assert (=> b!252297 (=> (not res!211358) (not e!174829))))

(declare-fun lt!391887 () tuple2!21684)

(declare-fun isPrefixOf!0 (BitStream!10960 BitStream!10960) Bool)

(assert (=> b!252297 (= res!211358 (isPrefixOf!0 (_2!11770 lt!391894) (_2!11770 lt!391887)))))

(declare-fun res!211363 () Bool)

(assert (=> start!54096 (=> (not res!211363) (not e!174828))))

(assert (=> start!54096 (= res!211363 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54096 e!174828))

(assert (=> start!54096 true))

(declare-fun inv!12 (BitStream!10960) Bool)

(assert (=> start!54096 (and (inv!12 thiss!1005) e!174822)))

(declare-fun b!252298 () Bool)

(declare-fun lt!391891 () tuple2!21686)

(declare-datatypes ((tuple2!21688 0))(
  ( (tuple2!21689 (_1!11772 BitStream!10960) (_2!11772 BitStream!10960)) )
))
(declare-fun lt!391896 () tuple2!21688)

(assert (=> b!252298 (= e!174829 (not (or (not (_2!11771 lt!391891)) (not (= (_1!11771 lt!391891) (_2!11772 lt!391896))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10960 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21686)

(assert (=> b!252298 (= lt!391891 (checkBitsLoopPure!0 (_1!11772 lt!391896) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!391883 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252298 (validate_offset_bits!1 ((_ sign_extend 32) (size!6019 (buf!6521 (_2!11770 lt!391887)))) ((_ sign_extend 32) (currentByte!11976 (_2!11770 lt!391894))) ((_ sign_extend 32) (currentBit!11971 (_2!11770 lt!391894))) lt!391883)))

(declare-fun lt!391895 () Unit!18186)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10960 array!13720 (_ BitVec 64)) Unit!18186)

(assert (=> b!252298 (= lt!391895 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11770 lt!391894) (buf!6521 (_2!11770 lt!391887)) lt!391883))))

(declare-fun reader!0 (BitStream!10960 BitStream!10960) tuple2!21688)

(assert (=> b!252298 (= lt!391896 (reader!0 (_2!11770 lt!391894) (_2!11770 lt!391887)))))

(declare-fun b!252299 () Bool)

(declare-fun res!211357 () Bool)

(assert (=> b!252299 (=> (not res!211357) (not e!174824))))

(assert (=> b!252299 (= res!211357 (isPrefixOf!0 thiss!1005 (_2!11770 lt!391894)))))

(declare-fun b!252300 () Bool)

(declare-fun e!174821 () Bool)

(declare-fun lt!391880 () tuple2!21686)

(declare-fun lt!391886 () tuple2!21686)

(assert (=> b!252300 (= e!174821 (= (_2!11771 lt!391880) (_2!11771 lt!391886)))))

(declare-fun b!252301 () Bool)

(assert (=> b!252301 (= e!174825 (invariant!0 (currentBit!11971 thiss!1005) (currentByte!11976 thiss!1005) (size!6019 (buf!6521 (_2!11770 lt!391887)))))))

(declare-fun b!252302 () Bool)

(assert (=> b!252302 (= e!174828 (not true))))

(declare-fun lt!391893 () tuple2!21686)

(declare-fun lt!391889 () tuple2!21688)

(assert (=> b!252302 (= lt!391893 (checkBitsLoopPure!0 (_1!11772 lt!391889) nBits!297 bit!26 from!289))))

(assert (=> b!252302 (validate_offset_bits!1 ((_ sign_extend 32) (size!6019 (buf!6521 (_2!11770 lt!391887)))) ((_ sign_extend 32) (currentByte!11976 thiss!1005)) ((_ sign_extend 32) (currentBit!11971 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!391882 () Unit!18186)

(assert (=> b!252302 (= lt!391882 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6521 (_2!11770 lt!391887)) (bvsub nBits!297 from!289)))))

(assert (=> b!252302 (= (_2!11771 (readBitPure!0 (_1!11772 lt!391889))) bit!26)))

(declare-fun lt!391881 () tuple2!21688)

(assert (=> b!252302 (= lt!391881 (reader!0 (_2!11770 lt!391894) (_2!11770 lt!391887)))))

(assert (=> b!252302 (= lt!391889 (reader!0 thiss!1005 (_2!11770 lt!391887)))))

(assert (=> b!252302 e!174821))

(declare-fun res!211361 () Bool)

(assert (=> b!252302 (=> (not res!211361) (not e!174821))))

(assert (=> b!252302 (= res!211361 (= (bitIndex!0 (size!6019 (buf!6521 (_1!11771 lt!391880))) (currentByte!11976 (_1!11771 lt!391880)) (currentBit!11971 (_1!11771 lt!391880))) (bitIndex!0 (size!6019 (buf!6521 (_1!11771 lt!391886))) (currentByte!11976 (_1!11771 lt!391886)) (currentBit!11971 (_1!11771 lt!391886)))))))

(declare-fun lt!391879 () Unit!18186)

(declare-fun lt!391878 () BitStream!10960)

(declare-fun readBitPrefixLemma!0 (BitStream!10960 BitStream!10960) Unit!18186)

(assert (=> b!252302 (= lt!391879 (readBitPrefixLemma!0 lt!391878 (_2!11770 lt!391887)))))

(assert (=> b!252302 (= lt!391886 (readBitPure!0 (BitStream!10961 (buf!6521 (_2!11770 lt!391887)) (currentByte!11976 thiss!1005) (currentBit!11971 thiss!1005))))))

(assert (=> b!252302 (= lt!391880 (readBitPure!0 lt!391878))))

(assert (=> b!252302 (= lt!391878 (BitStream!10961 (buf!6521 (_2!11770 lt!391894)) (currentByte!11976 thiss!1005) (currentBit!11971 thiss!1005)))))

(assert (=> b!252302 e!174825))

(declare-fun res!211366 () Bool)

(assert (=> b!252302 (=> (not res!211366) (not e!174825))))

(assert (=> b!252302 (= res!211366 (isPrefixOf!0 thiss!1005 (_2!11770 lt!391887)))))

(declare-fun lt!391892 () Unit!18186)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10960 BitStream!10960 BitStream!10960) Unit!18186)

(assert (=> b!252302 (= lt!391892 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11770 lt!391894) (_2!11770 lt!391887)))))

(declare-fun e!174826 () Bool)

(assert (=> b!252302 e!174826))

(declare-fun res!211356 () Bool)

(assert (=> b!252302 (=> (not res!211356) (not e!174826))))

(assert (=> b!252302 (= res!211356 (= (size!6019 (buf!6521 (_2!11770 lt!391894))) (size!6019 (buf!6521 (_2!11770 lt!391887)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10960 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21684)

(assert (=> b!252302 (= lt!391887 (appendNBitsLoop!0 (_2!11770 lt!391894) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252302 (validate_offset_bits!1 ((_ sign_extend 32) (size!6019 (buf!6521 (_2!11770 lt!391894)))) ((_ sign_extend 32) (currentByte!11976 (_2!11770 lt!391894))) ((_ sign_extend 32) (currentBit!11971 (_2!11770 lt!391894))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391888 () Unit!18186)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10960 BitStream!10960 (_ BitVec 64) (_ BitVec 64)) Unit!18186)

(assert (=> b!252302 (= lt!391888 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11770 lt!391894) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174827 () Bool)

(assert (=> b!252302 e!174827))

(declare-fun res!211359 () Bool)

(assert (=> b!252302 (=> (not res!211359) (not e!174827))))

(assert (=> b!252302 (= res!211359 (= (size!6019 (buf!6521 thiss!1005)) (size!6019 (buf!6521 (_2!11770 lt!391894)))))))

(declare-fun appendBit!0 (BitStream!10960 Bool) tuple2!21684)

(assert (=> b!252302 (= lt!391894 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252303 () Bool)

(assert (=> b!252303 (= e!174826 e!174829)))

(declare-fun res!211364 () Bool)

(assert (=> b!252303 (=> (not res!211364) (not e!174829))))

(assert (=> b!252303 (= res!211364 (= (bitIndex!0 (size!6019 (buf!6521 (_2!11770 lt!391887))) (currentByte!11976 (_2!11770 lt!391887)) (currentBit!11971 (_2!11770 lt!391887))) (bvadd (bitIndex!0 (size!6019 (buf!6521 (_2!11770 lt!391894))) (currentByte!11976 (_2!11770 lt!391894)) (currentBit!11971 (_2!11770 lt!391894))) lt!391883)))))

(assert (=> b!252303 (= lt!391883 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252304 () Bool)

(declare-fun res!211362 () Bool)

(assert (=> b!252304 (=> (not res!211362) (not e!174828))))

(assert (=> b!252304 (= res!211362 (validate_offset_bits!1 ((_ sign_extend 32) (size!6019 (buf!6521 thiss!1005))) ((_ sign_extend 32) (currentByte!11976 thiss!1005)) ((_ sign_extend 32) (currentBit!11971 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252305 () Bool)

(assert (=> b!252305 (= e!174827 e!174824)))

(declare-fun res!211360 () Bool)

(assert (=> b!252305 (=> (not res!211360) (not e!174824))))

(declare-fun lt!391890 () (_ BitVec 64))

(assert (=> b!252305 (= res!211360 (= lt!391885 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391890)))))

(assert (=> b!252305 (= lt!391885 (bitIndex!0 (size!6019 (buf!6521 (_2!11770 lt!391894))) (currentByte!11976 (_2!11770 lt!391894)) (currentBit!11971 (_2!11770 lt!391894))))))

(assert (=> b!252305 (= lt!391890 (bitIndex!0 (size!6019 (buf!6521 thiss!1005)) (currentByte!11976 thiss!1005) (currentBit!11971 thiss!1005)))))

(assert (= (and start!54096 res!211363) b!252304))

(assert (= (and b!252304 res!211362) b!252294))

(assert (= (and b!252294 res!211367) b!252302))

(assert (= (and b!252302 res!211359) b!252305))

(assert (= (and b!252305 res!211360) b!252299))

(assert (= (and b!252299 res!211357) b!252296))

(assert (= (and b!252296 res!211368) b!252295))

(assert (= (and b!252302 res!211356) b!252303))

(assert (= (and b!252303 res!211364) b!252297))

(assert (= (and b!252297 res!211358) b!252298))

(assert (= (and b!252302 res!211366) b!252293))

(assert (= (and b!252293 res!211365) b!252301))

(assert (= (and b!252302 res!211361) b!252300))

(assert (= start!54096 b!252292))

(declare-fun m!379581 () Bool)

(assert (=> start!54096 m!379581))

(declare-fun m!379583 () Bool)

(assert (=> b!252297 m!379583))

(declare-fun m!379585 () Bool)

(assert (=> b!252299 m!379585))

(declare-fun m!379587 () Bool)

(assert (=> b!252304 m!379587))

(declare-fun m!379589 () Bool)

(assert (=> b!252301 m!379589))

(declare-fun m!379591 () Bool)

(assert (=> b!252295 m!379591))

(declare-fun m!379593 () Bool)

(assert (=> b!252293 m!379593))

(declare-fun m!379595 () Bool)

(assert (=> b!252303 m!379595))

(declare-fun m!379597 () Bool)

(assert (=> b!252303 m!379597))

(assert (=> b!252305 m!379597))

(declare-fun m!379599 () Bool)

(assert (=> b!252305 m!379599))

(declare-fun m!379601 () Bool)

(assert (=> b!252298 m!379601))

(declare-fun m!379603 () Bool)

(assert (=> b!252298 m!379603))

(declare-fun m!379605 () Bool)

(assert (=> b!252298 m!379605))

(declare-fun m!379607 () Bool)

(assert (=> b!252298 m!379607))

(declare-fun m!379609 () Bool)

(assert (=> b!252302 m!379609))

(declare-fun m!379611 () Bool)

(assert (=> b!252302 m!379611))

(declare-fun m!379613 () Bool)

(assert (=> b!252302 m!379613))

(declare-fun m!379615 () Bool)

(assert (=> b!252302 m!379615))

(declare-fun m!379617 () Bool)

(assert (=> b!252302 m!379617))

(assert (=> b!252302 m!379607))

(declare-fun m!379619 () Bool)

(assert (=> b!252302 m!379619))

(declare-fun m!379621 () Bool)

(assert (=> b!252302 m!379621))

(declare-fun m!379623 () Bool)

(assert (=> b!252302 m!379623))

(declare-fun m!379625 () Bool)

(assert (=> b!252302 m!379625))

(declare-fun m!379627 () Bool)

(assert (=> b!252302 m!379627))

(declare-fun m!379629 () Bool)

(assert (=> b!252302 m!379629))

(declare-fun m!379631 () Bool)

(assert (=> b!252302 m!379631))

(declare-fun m!379633 () Bool)

(assert (=> b!252302 m!379633))

(declare-fun m!379635 () Bool)

(assert (=> b!252302 m!379635))

(declare-fun m!379637 () Bool)

(assert (=> b!252302 m!379637))

(declare-fun m!379639 () Bool)

(assert (=> b!252302 m!379639))

(declare-fun m!379641 () Bool)

(assert (=> b!252292 m!379641))

(declare-fun m!379643 () Bool)

(assert (=> b!252296 m!379643))

(assert (=> b!252296 m!379643))

(declare-fun m!379645 () Bool)

(assert (=> b!252296 m!379645))

(push 1)

(assert (not b!252296))

(assert (not b!252299))

(assert (not b!252305))

(assert (not start!54096))

(assert (not b!252293))

(assert (not b!252298))

(assert (not b!252304))

(assert (not b!252301))

(assert (not b!252297))

(assert (not b!252303))

(assert (not b!252302))

(assert (not b!252295))

(assert (not b!252292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

