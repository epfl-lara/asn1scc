; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!54110 () Bool)

(assert start!54110)

(declare-fun b!252586 () Bool)

(declare-fun res!211637 () Bool)

(declare-fun e!175037 () Bool)

(assert (=> b!252586 (=> (not res!211637) (not e!175037))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13734 0))(
  ( (array!13735 (arr!7013 (Array (_ BitVec 32) (_ BitVec 8))) (size!6026 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10974 0))(
  ( (BitStream!10975 (buf!6528 array!13734) (currentByte!11983 (_ BitVec 32)) (currentBit!11978 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10974)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252586 (= res!211637 (validate_offset_bits!1 ((_ sign_extend 32) (size!6026 (buf!6528 thiss!1005))) ((_ sign_extend 32) (currentByte!11983 thiss!1005)) ((_ sign_extend 32) (currentBit!11978 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252587 () Bool)

(declare-fun e!175040 () Bool)

(declare-datatypes ((tuple2!21726 0))(
  ( (tuple2!21727 (_1!11791 BitStream!10974) (_2!11791 Bool)) )
))
(declare-fun lt!392300 () tuple2!21726)

(declare-fun lt!392291 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252587 (= e!175040 (= (bitIndex!0 (size!6026 (buf!6528 (_1!11791 lt!392300))) (currentByte!11983 (_1!11791 lt!392300)) (currentBit!11978 (_1!11791 lt!392300))) lt!392291))))

(declare-fun b!252588 () Bool)

(declare-fun res!211629 () Bool)

(declare-fun e!175036 () Bool)

(assert (=> b!252588 (=> (not res!211629) (not e!175036))))

(declare-datatypes ((Unit!18200 0))(
  ( (Unit!18201) )
))
(declare-datatypes ((tuple2!21728 0))(
  ( (tuple2!21729 (_1!11792 Unit!18200) (_2!11792 BitStream!10974)) )
))
(declare-fun lt!392288 () tuple2!21728)

(declare-fun isPrefixOf!0 (BitStream!10974 BitStream!10974) Bool)

(assert (=> b!252588 (= res!211629 (isPrefixOf!0 thiss!1005 (_2!11792 lt!392288)))))

(declare-fun b!252589 () Bool)

(declare-fun e!175032 () Bool)

(declare-fun lt!392296 () tuple2!21726)

(declare-datatypes ((tuple2!21730 0))(
  ( (tuple2!21731 (_1!11793 BitStream!10974) (_2!11793 BitStream!10974)) )
))
(declare-fun lt!392307 () tuple2!21730)

(assert (=> b!252589 (= e!175032 (not (or (not (_2!11791 lt!392296)) (not (= (_1!11791 lt!392296) (_2!11793 lt!392307))))))))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10974 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21726)

(assert (=> b!252589 (= lt!392296 (checkBitsLoopPure!0 (_1!11793 lt!392307) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!392294 () tuple2!21728)

(declare-fun lt!392306 () (_ BitVec 64))

(assert (=> b!252589 (validate_offset_bits!1 ((_ sign_extend 32) (size!6026 (buf!6528 (_2!11792 lt!392294)))) ((_ sign_extend 32) (currentByte!11983 (_2!11792 lt!392288))) ((_ sign_extend 32) (currentBit!11978 (_2!11792 lt!392288))) lt!392306)))

(declare-fun lt!392305 () Unit!18200)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10974 array!13734 (_ BitVec 64)) Unit!18200)

(assert (=> b!252589 (= lt!392305 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11792 lt!392288) (buf!6528 (_2!11792 lt!392294)) lt!392306))))

(declare-fun reader!0 (BitStream!10974 BitStream!10974) tuple2!21730)

(assert (=> b!252589 (= lt!392307 (reader!0 (_2!11792 lt!392288) (_2!11792 lt!392294)))))

(declare-fun b!252590 () Bool)

(assert (=> b!252590 (= e!175036 e!175040)))

(declare-fun res!211632 () Bool)

(assert (=> b!252590 (=> (not res!211632) (not e!175040))))

(assert (=> b!252590 (= res!211632 (and (= (_2!11791 lt!392300) bit!26) (= (_1!11791 lt!392300) (_2!11792 lt!392288))))))

(declare-fun readBitPure!0 (BitStream!10974) tuple2!21726)

(declare-fun readerFrom!0 (BitStream!10974 (_ BitVec 32) (_ BitVec 32)) BitStream!10974)

(assert (=> b!252590 (= lt!392300 (readBitPure!0 (readerFrom!0 (_2!11792 lt!392288) (currentBit!11978 thiss!1005) (currentByte!11983 thiss!1005))))))

(declare-fun b!252591 () Bool)

(declare-fun e!175035 () Bool)

(declare-fun lt!392299 () tuple2!21726)

(declare-fun lt!392289 () tuple2!21726)

(assert (=> b!252591 (= e!175035 (= (_2!11791 lt!392299) (_2!11791 lt!392289)))))

(declare-fun b!252592 () Bool)

(declare-fun res!211638 () Bool)

(declare-fun e!175039 () Bool)

(assert (=> b!252592 (=> (not res!211638) (not e!175039))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252592 (= res!211638 (invariant!0 (currentBit!11978 thiss!1005) (currentByte!11983 thiss!1005) (size!6026 (buf!6528 (_2!11792 lt!392288)))))))

(declare-fun b!252593 () Bool)

(assert (=> b!252593 (= e!175037 (not (or (not (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (bvand from!289 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!392303 () (_ BitVec 64))

(assert (=> b!252593 (validate_offset_bits!1 ((_ sign_extend 32) (size!6026 (buf!6528 (_2!11792 lt!392294)))) ((_ sign_extend 32) (currentByte!11983 (_2!11792 lt!392288))) ((_ sign_extend 32) (currentBit!11978 (_2!11792 lt!392288))) lt!392303)))

(declare-fun lt!392287 () Unit!18200)

(assert (=> b!252593 (= lt!392287 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11792 lt!392288) (buf!6528 (_2!11792 lt!392294)) lt!392303))))

(declare-fun lt!392295 () tuple2!21730)

(declare-fun lt!392293 () tuple2!21726)

(assert (=> b!252593 (= lt!392293 (checkBitsLoopPure!0 (_1!11793 lt!392295) nBits!297 bit!26 from!289))))

(assert (=> b!252593 (validate_offset_bits!1 ((_ sign_extend 32) (size!6026 (buf!6528 (_2!11792 lt!392294)))) ((_ sign_extend 32) (currentByte!11983 thiss!1005)) ((_ sign_extend 32) (currentBit!11978 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392298 () Unit!18200)

(assert (=> b!252593 (= lt!392298 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6528 (_2!11792 lt!392294)) (bvsub nBits!297 from!289)))))

(assert (=> b!252593 (= (_2!11791 (readBitPure!0 (_1!11793 lt!392295))) bit!26)))

(declare-fun lt!392302 () tuple2!21730)

(assert (=> b!252593 (= lt!392302 (reader!0 (_2!11792 lt!392288) (_2!11792 lt!392294)))))

(assert (=> b!252593 (= lt!392295 (reader!0 thiss!1005 (_2!11792 lt!392294)))))

(assert (=> b!252593 e!175035))

(declare-fun res!211636 () Bool)

(assert (=> b!252593 (=> (not res!211636) (not e!175035))))

(assert (=> b!252593 (= res!211636 (= (bitIndex!0 (size!6026 (buf!6528 (_1!11791 lt!392299))) (currentByte!11983 (_1!11791 lt!392299)) (currentBit!11978 (_1!11791 lt!392299))) (bitIndex!0 (size!6026 (buf!6528 (_1!11791 lt!392289))) (currentByte!11983 (_1!11791 lt!392289)) (currentBit!11978 (_1!11791 lt!392289)))))))

(declare-fun lt!392290 () Unit!18200)

(declare-fun lt!392301 () BitStream!10974)

(declare-fun readBitPrefixLemma!0 (BitStream!10974 BitStream!10974) Unit!18200)

(assert (=> b!252593 (= lt!392290 (readBitPrefixLemma!0 lt!392301 (_2!11792 lt!392294)))))

(assert (=> b!252593 (= lt!392289 (readBitPure!0 (BitStream!10975 (buf!6528 (_2!11792 lt!392294)) (currentByte!11983 thiss!1005) (currentBit!11978 thiss!1005))))))

(assert (=> b!252593 (= lt!392299 (readBitPure!0 lt!392301))))

(assert (=> b!252593 (= lt!392301 (BitStream!10975 (buf!6528 (_2!11792 lt!392288)) (currentByte!11983 thiss!1005) (currentBit!11978 thiss!1005)))))

(assert (=> b!252593 e!175039))

(declare-fun res!211633 () Bool)

(assert (=> b!252593 (=> (not res!211633) (not e!175039))))

(assert (=> b!252593 (= res!211633 (isPrefixOf!0 thiss!1005 (_2!11792 lt!392294)))))

(declare-fun lt!392292 () Unit!18200)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10974 BitStream!10974 BitStream!10974) Unit!18200)

(assert (=> b!252593 (= lt!392292 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11792 lt!392288) (_2!11792 lt!392294)))))

(declare-fun e!175038 () Bool)

(assert (=> b!252593 e!175038))

(declare-fun res!211634 () Bool)

(assert (=> b!252593 (=> (not res!211634) (not e!175038))))

(assert (=> b!252593 (= res!211634 (= (size!6026 (buf!6528 (_2!11792 lt!392288))) (size!6026 (buf!6528 (_2!11792 lt!392294)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10974 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21728)

(assert (=> b!252593 (= lt!392294 (appendNBitsLoop!0 (_2!11792 lt!392288) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252593 (validate_offset_bits!1 ((_ sign_extend 32) (size!6026 (buf!6528 (_2!11792 lt!392288)))) ((_ sign_extend 32) (currentByte!11983 (_2!11792 lt!392288))) ((_ sign_extend 32) (currentBit!11978 (_2!11792 lt!392288))) lt!392303)))

(assert (=> b!252593 (= lt!392303 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392297 () Unit!18200)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10974 BitStream!10974 (_ BitVec 64) (_ BitVec 64)) Unit!18200)

(assert (=> b!252593 (= lt!392297 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11792 lt!392288) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!175033 () Bool)

(assert (=> b!252593 e!175033))

(declare-fun res!211635 () Bool)

(assert (=> b!252593 (=> (not res!211635) (not e!175033))))

(assert (=> b!252593 (= res!211635 (= (size!6026 (buf!6528 thiss!1005)) (size!6026 (buf!6528 (_2!11792 lt!392288)))))))

(declare-fun appendBit!0 (BitStream!10974 Bool) tuple2!21728)

(assert (=> b!252593 (= lt!392288 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252594 () Bool)

(assert (=> b!252594 (= e!175039 (invariant!0 (currentBit!11978 thiss!1005) (currentByte!11983 thiss!1005) (size!6026 (buf!6528 (_2!11792 lt!392294)))))))

(declare-fun b!252595 () Bool)

(declare-fun e!175031 () Bool)

(declare-fun array_inv!5767 (array!13734) Bool)

(assert (=> b!252595 (= e!175031 (array_inv!5767 (buf!6528 thiss!1005)))))

(declare-fun b!252596 () Bool)

(declare-fun res!211639 () Bool)

(assert (=> b!252596 (=> (not res!211639) (not e!175037))))

(assert (=> b!252596 (= res!211639 (bvslt from!289 nBits!297))))

(declare-fun b!252597 () Bool)

(assert (=> b!252597 (= e!175033 e!175036)))

(declare-fun res!211630 () Bool)

(assert (=> b!252597 (=> (not res!211630) (not e!175036))))

(declare-fun lt!392304 () (_ BitVec 64))

(assert (=> b!252597 (= res!211630 (= lt!392291 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392304)))))

(assert (=> b!252597 (= lt!392291 (bitIndex!0 (size!6026 (buf!6528 (_2!11792 lt!392288))) (currentByte!11983 (_2!11792 lt!392288)) (currentBit!11978 (_2!11792 lt!392288))))))

(assert (=> b!252597 (= lt!392304 (bitIndex!0 (size!6026 (buf!6528 thiss!1005)) (currentByte!11983 thiss!1005) (currentBit!11978 thiss!1005)))))

(declare-fun res!211641 () Bool)

(assert (=> start!54110 (=> (not res!211641) (not e!175037))))

(assert (=> start!54110 (= res!211641 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54110 e!175037))

(assert (=> start!54110 true))

(declare-fun inv!12 (BitStream!10974) Bool)

(assert (=> start!54110 (and (inv!12 thiss!1005) e!175031)))

(declare-fun b!252598 () Bool)

(assert (=> b!252598 (= e!175038 e!175032)))

(declare-fun res!211631 () Bool)

(assert (=> b!252598 (=> (not res!211631) (not e!175032))))

(assert (=> b!252598 (= res!211631 (= (bitIndex!0 (size!6026 (buf!6528 (_2!11792 lt!392294))) (currentByte!11983 (_2!11792 lt!392294)) (currentBit!11978 (_2!11792 lt!392294))) (bvadd (bitIndex!0 (size!6026 (buf!6528 (_2!11792 lt!392288))) (currentByte!11983 (_2!11792 lt!392288)) (currentBit!11978 (_2!11792 lt!392288))) lt!392306)))))

(assert (=> b!252598 (= lt!392306 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252599 () Bool)

(declare-fun res!211640 () Bool)

(assert (=> b!252599 (=> (not res!211640) (not e!175032))))

(assert (=> b!252599 (= res!211640 (isPrefixOf!0 (_2!11792 lt!392288) (_2!11792 lt!392294)))))

(assert (= (and start!54110 res!211641) b!252586))

(assert (= (and b!252586 res!211637) b!252596))

(assert (= (and b!252596 res!211639) b!252593))

(assert (= (and b!252593 res!211635) b!252597))

(assert (= (and b!252597 res!211630) b!252588))

(assert (= (and b!252588 res!211629) b!252590))

(assert (= (and b!252590 res!211632) b!252587))

(assert (= (and b!252593 res!211634) b!252598))

(assert (= (and b!252598 res!211631) b!252599))

(assert (= (and b!252599 res!211640) b!252589))

(assert (= (and b!252593 res!211633) b!252592))

(assert (= (and b!252592 res!211638) b!252594))

(assert (= (and b!252593 res!211636) b!252591))

(assert (= start!54110 b!252595))

(declare-fun m!380047 () Bool)

(assert (=> b!252589 m!380047))

(declare-fun m!380049 () Bool)

(assert (=> b!252589 m!380049))

(declare-fun m!380051 () Bool)

(assert (=> b!252589 m!380051))

(declare-fun m!380053 () Bool)

(assert (=> b!252589 m!380053))

(declare-fun m!380055 () Bool)

(assert (=> b!252588 m!380055))

(declare-fun m!380057 () Bool)

(assert (=> b!252592 m!380057))

(declare-fun m!380059 () Bool)

(assert (=> b!252597 m!380059))

(declare-fun m!380061 () Bool)

(assert (=> b!252597 m!380061))

(declare-fun m!380063 () Bool)

(assert (=> start!54110 m!380063))

(declare-fun m!380065 () Bool)

(assert (=> b!252599 m!380065))

(declare-fun m!380067 () Bool)

(assert (=> b!252594 m!380067))

(declare-fun m!380069 () Bool)

(assert (=> b!252593 m!380069))

(declare-fun m!380071 () Bool)

(assert (=> b!252593 m!380071))

(declare-fun m!380073 () Bool)

(assert (=> b!252593 m!380073))

(declare-fun m!380075 () Bool)

(assert (=> b!252593 m!380075))

(declare-fun m!380077 () Bool)

(assert (=> b!252593 m!380077))

(declare-fun m!380079 () Bool)

(assert (=> b!252593 m!380079))

(declare-fun m!380081 () Bool)

(assert (=> b!252593 m!380081))

(declare-fun m!380083 () Bool)

(assert (=> b!252593 m!380083))

(declare-fun m!380085 () Bool)

(assert (=> b!252593 m!380085))

(declare-fun m!380087 () Bool)

(assert (=> b!252593 m!380087))

(declare-fun m!380089 () Bool)

(assert (=> b!252593 m!380089))

(declare-fun m!380091 () Bool)

(assert (=> b!252593 m!380091))

(declare-fun m!380093 () Bool)

(assert (=> b!252593 m!380093))

(declare-fun m!380095 () Bool)

(assert (=> b!252593 m!380095))

(declare-fun m!380097 () Bool)

(assert (=> b!252593 m!380097))

(declare-fun m!380099 () Bool)

(assert (=> b!252593 m!380099))

(declare-fun m!380101 () Bool)

(assert (=> b!252593 m!380101))

(assert (=> b!252593 m!380053))

(declare-fun m!380103 () Bool)

(assert (=> b!252593 m!380103))

(declare-fun m!380105 () Bool)

(assert (=> b!252595 m!380105))

(declare-fun m!380107 () Bool)

(assert (=> b!252598 m!380107))

(assert (=> b!252598 m!380059))

(declare-fun m!380109 () Bool)

(assert (=> b!252586 m!380109))

(declare-fun m!380111 () Bool)

(assert (=> b!252587 m!380111))

(declare-fun m!380113 () Bool)

(assert (=> b!252590 m!380113))

(assert (=> b!252590 m!380113))

(declare-fun m!380115 () Bool)

(assert (=> b!252590 m!380115))

(check-sat (not b!252592) (not b!252599) (not b!252587) (not b!252597) (not b!252586) (not b!252598) (not b!252589) (not b!252590) (not start!54110) (not b!252594) (not b!252593) (not b!252588) (not b!252595))
(check-sat)
