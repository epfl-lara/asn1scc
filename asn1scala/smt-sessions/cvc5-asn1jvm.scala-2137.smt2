; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54102 () Bool)

(assert start!54102)

(declare-fun b!252418 () Bool)

(declare-fun res!211485 () Bool)

(declare-fun e!174914 () Bool)

(assert (=> b!252418 (=> (not res!211485) (not e!174914))))

(declare-datatypes ((array!13726 0))(
  ( (array!13727 (arr!7009 (Array (_ BitVec 32) (_ BitVec 8))) (size!6022 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10966 0))(
  ( (BitStream!10967 (buf!6524 array!13726) (currentByte!11979 (_ BitVec 32)) (currentBit!11974 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10966)

(declare-datatypes ((Unit!18192 0))(
  ( (Unit!18193) )
))
(declare-datatypes ((tuple2!21702 0))(
  ( (tuple2!21703 (_1!11779 Unit!18192) (_2!11779 BitStream!10966)) )
))
(declare-fun lt!392050 () tuple2!21702)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252418 (= res!211485 (invariant!0 (currentBit!11974 thiss!1005) (currentByte!11979 thiss!1005) (size!6022 (buf!6524 (_2!11779 lt!392050)))))))

(declare-fun b!252419 () Bool)

(declare-fun res!211480 () Bool)

(declare-fun e!174911 () Bool)

(assert (=> b!252419 (=> (not res!211480) (not e!174911))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252419 (= res!211480 (validate_offset_bits!1 ((_ sign_extend 32) (size!6022 (buf!6524 thiss!1005))) ((_ sign_extend 32) (currentByte!11979 thiss!1005)) ((_ sign_extend 32) (currentBit!11974 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252420 () Bool)

(declare-fun e!174913 () Bool)

(declare-fun array_inv!5763 (array!13726) Bool)

(assert (=> b!252420 (= e!174913 (array_inv!5763 (buf!6524 thiss!1005)))))

(declare-fun b!252421 () Bool)

(declare-fun e!174915 () Bool)

(declare-fun e!174918 () Bool)

(assert (=> b!252421 (= e!174915 e!174918)))

(declare-fun res!211474 () Bool)

(assert (=> b!252421 (=> (not res!211474) (not e!174918))))

(declare-fun lt!392062 () tuple2!21702)

(declare-fun lt!392064 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252421 (= res!211474 (= (bitIndex!0 (size!6022 (buf!6524 (_2!11779 lt!392062))) (currentByte!11979 (_2!11779 lt!392062)) (currentBit!11974 (_2!11779 lt!392062))) (bvadd (bitIndex!0 (size!6022 (buf!6524 (_2!11779 lt!392050))) (currentByte!11979 (_2!11779 lt!392050)) (currentBit!11974 (_2!11779 lt!392050))) lt!392064)))))

(assert (=> b!252421 (= lt!392064 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252422 () Bool)

(declare-fun res!211482 () Bool)

(assert (=> b!252422 (=> (not res!211482) (not e!174918))))

(declare-fun isPrefixOf!0 (BitStream!10966 BitStream!10966) Bool)

(assert (=> b!252422 (= res!211482 (isPrefixOf!0 (_2!11779 lt!392050) (_2!11779 lt!392062)))))

(declare-fun b!252423 () Bool)

(declare-fun e!174917 () Bool)

(declare-fun e!174920 () Bool)

(assert (=> b!252423 (= e!174917 e!174920)))

(declare-fun res!211481 () Bool)

(assert (=> b!252423 (=> (not res!211481) (not e!174920))))

(declare-datatypes ((tuple2!21704 0))(
  ( (tuple2!21705 (_1!11780 BitStream!10966) (_2!11780 Bool)) )
))
(declare-fun lt!392049 () tuple2!21704)

(declare-fun bit!26 () Bool)

(assert (=> b!252423 (= res!211481 (and (= (_2!11780 lt!392049) bit!26) (= (_1!11780 lt!392049) (_2!11779 lt!392050))))))

(declare-fun readBitPure!0 (BitStream!10966) tuple2!21704)

(declare-fun readerFrom!0 (BitStream!10966 (_ BitVec 32) (_ BitVec 32)) BitStream!10966)

(assert (=> b!252423 (= lt!392049 (readBitPure!0 (readerFrom!0 (_2!11779 lt!392050) (currentBit!11974 thiss!1005) (currentByte!11979 thiss!1005))))))

(declare-fun b!252424 () Bool)

(declare-fun e!174912 () Bool)

(assert (=> b!252424 (= e!174912 e!174917)))

(declare-fun res!211479 () Bool)

(assert (=> b!252424 (=> (not res!211479) (not e!174917))))

(declare-fun lt!392065 () (_ BitVec 64))

(declare-fun lt!392066 () (_ BitVec 64))

(assert (=> b!252424 (= res!211479 (= lt!392065 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392066)))))

(assert (=> b!252424 (= lt!392065 (bitIndex!0 (size!6022 (buf!6524 (_2!11779 lt!392050))) (currentByte!11979 (_2!11779 lt!392050)) (currentBit!11974 (_2!11779 lt!392050))))))

(assert (=> b!252424 (= lt!392066 (bitIndex!0 (size!6022 (buf!6524 thiss!1005)) (currentByte!11979 thiss!1005) (currentBit!11974 thiss!1005)))))

(declare-fun b!252425 () Bool)

(assert (=> b!252425 (= e!174914 (invariant!0 (currentBit!11974 thiss!1005) (currentByte!11979 thiss!1005) (size!6022 (buf!6524 (_2!11779 lt!392062)))))))

(declare-fun res!211477 () Bool)

(assert (=> start!54102 (=> (not res!211477) (not e!174911))))

(assert (=> start!54102 (= res!211477 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54102 e!174911))

(assert (=> start!54102 true))

(declare-fun inv!12 (BitStream!10966) Bool)

(assert (=> start!54102 (and (inv!12 thiss!1005) e!174913)))

(declare-fun b!252426 () Bool)

(declare-fun res!211478 () Bool)

(assert (=> b!252426 (=> (not res!211478) (not e!174911))))

(assert (=> b!252426 (= res!211478 (bvslt from!289 nBits!297))))

(declare-fun b!252427 () Bool)

(declare-fun e!174916 () Bool)

(declare-fun lt!392056 () tuple2!21704)

(declare-fun lt!392063 () tuple2!21704)

(assert (=> b!252427 (= e!174916 (= (_2!11780 lt!392056) (_2!11780 lt!392063)))))

(declare-fun b!252428 () Bool)

(assert (=> b!252428 (= e!174911 (not true))))

(declare-fun lt!392059 () tuple2!21704)

(declare-datatypes ((tuple2!21706 0))(
  ( (tuple2!21707 (_1!11781 BitStream!10966) (_2!11781 BitStream!10966)) )
))
(declare-fun lt!392053 () tuple2!21706)

(declare-fun checkBitsLoopPure!0 (BitStream!10966 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21704)

(assert (=> b!252428 (= lt!392059 (checkBitsLoopPure!0 (_1!11781 lt!392053) nBits!297 bit!26 from!289))))

(assert (=> b!252428 (validate_offset_bits!1 ((_ sign_extend 32) (size!6022 (buf!6524 (_2!11779 lt!392062)))) ((_ sign_extend 32) (currentByte!11979 thiss!1005)) ((_ sign_extend 32) (currentBit!11974 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392052 () Unit!18192)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10966 array!13726 (_ BitVec 64)) Unit!18192)

(assert (=> b!252428 (= lt!392052 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6524 (_2!11779 lt!392062)) (bvsub nBits!297 from!289)))))

(assert (=> b!252428 (= (_2!11780 (readBitPure!0 (_1!11781 lt!392053))) bit!26)))

(declare-fun lt!392067 () tuple2!21706)

(declare-fun reader!0 (BitStream!10966 BitStream!10966) tuple2!21706)

(assert (=> b!252428 (= lt!392067 (reader!0 (_2!11779 lt!392050) (_2!11779 lt!392062)))))

(assert (=> b!252428 (= lt!392053 (reader!0 thiss!1005 (_2!11779 lt!392062)))))

(assert (=> b!252428 e!174916))

(declare-fun res!211473 () Bool)

(assert (=> b!252428 (=> (not res!211473) (not e!174916))))

(assert (=> b!252428 (= res!211473 (= (bitIndex!0 (size!6022 (buf!6524 (_1!11780 lt!392056))) (currentByte!11979 (_1!11780 lt!392056)) (currentBit!11974 (_1!11780 lt!392056))) (bitIndex!0 (size!6022 (buf!6524 (_1!11780 lt!392063))) (currentByte!11979 (_1!11780 lt!392063)) (currentBit!11974 (_1!11780 lt!392063)))))))

(declare-fun lt!392058 () Unit!18192)

(declare-fun lt!392051 () BitStream!10966)

(declare-fun readBitPrefixLemma!0 (BitStream!10966 BitStream!10966) Unit!18192)

(assert (=> b!252428 (= lt!392058 (readBitPrefixLemma!0 lt!392051 (_2!11779 lt!392062)))))

(assert (=> b!252428 (= lt!392063 (readBitPure!0 (BitStream!10967 (buf!6524 (_2!11779 lt!392062)) (currentByte!11979 thiss!1005) (currentBit!11974 thiss!1005))))))

(assert (=> b!252428 (= lt!392056 (readBitPure!0 lt!392051))))

(assert (=> b!252428 (= lt!392051 (BitStream!10967 (buf!6524 (_2!11779 lt!392050)) (currentByte!11979 thiss!1005) (currentBit!11974 thiss!1005)))))

(assert (=> b!252428 e!174914))

(declare-fun res!211475 () Bool)

(assert (=> b!252428 (=> (not res!211475) (not e!174914))))

(assert (=> b!252428 (= res!211475 (isPrefixOf!0 thiss!1005 (_2!11779 lt!392062)))))

(declare-fun lt!392057 () Unit!18192)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10966 BitStream!10966 BitStream!10966) Unit!18192)

(assert (=> b!252428 (= lt!392057 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11779 lt!392050) (_2!11779 lt!392062)))))

(assert (=> b!252428 e!174915))

(declare-fun res!211483 () Bool)

(assert (=> b!252428 (=> (not res!211483) (not e!174915))))

(assert (=> b!252428 (= res!211483 (= (size!6022 (buf!6524 (_2!11779 lt!392050))) (size!6022 (buf!6524 (_2!11779 lt!392062)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10966 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21702)

(assert (=> b!252428 (= lt!392062 (appendNBitsLoop!0 (_2!11779 lt!392050) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252428 (validate_offset_bits!1 ((_ sign_extend 32) (size!6022 (buf!6524 (_2!11779 lt!392050)))) ((_ sign_extend 32) (currentByte!11979 (_2!11779 lt!392050))) ((_ sign_extend 32) (currentBit!11974 (_2!11779 lt!392050))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392061 () Unit!18192)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10966 BitStream!10966 (_ BitVec 64) (_ BitVec 64)) Unit!18192)

(assert (=> b!252428 (= lt!392061 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11779 lt!392050) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!252428 e!174912))

(declare-fun res!211484 () Bool)

(assert (=> b!252428 (=> (not res!211484) (not e!174912))))

(assert (=> b!252428 (= res!211484 (= (size!6022 (buf!6524 thiss!1005)) (size!6022 (buf!6524 (_2!11779 lt!392050)))))))

(declare-fun appendBit!0 (BitStream!10966 Bool) tuple2!21702)

(assert (=> b!252428 (= lt!392050 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252429 () Bool)

(declare-fun res!211476 () Bool)

(assert (=> b!252429 (=> (not res!211476) (not e!174917))))

(assert (=> b!252429 (= res!211476 (isPrefixOf!0 thiss!1005 (_2!11779 lt!392050)))))

(declare-fun b!252430 () Bool)

(assert (=> b!252430 (= e!174920 (= (bitIndex!0 (size!6022 (buf!6524 (_1!11780 lt!392049))) (currentByte!11979 (_1!11780 lt!392049)) (currentBit!11974 (_1!11780 lt!392049))) lt!392065))))

(declare-fun b!252431 () Bool)

(declare-fun lt!392060 () tuple2!21704)

(declare-fun lt!392054 () tuple2!21706)

(assert (=> b!252431 (= e!174918 (not (or (not (_2!11780 lt!392060)) (not (= (_1!11780 lt!392060) (_2!11781 lt!392054))))))))

(assert (=> b!252431 (= lt!392060 (checkBitsLoopPure!0 (_1!11781 lt!392054) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252431 (validate_offset_bits!1 ((_ sign_extend 32) (size!6022 (buf!6524 (_2!11779 lt!392062)))) ((_ sign_extend 32) (currentByte!11979 (_2!11779 lt!392050))) ((_ sign_extend 32) (currentBit!11974 (_2!11779 lt!392050))) lt!392064)))

(declare-fun lt!392055 () Unit!18192)

(assert (=> b!252431 (= lt!392055 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11779 lt!392050) (buf!6524 (_2!11779 lt!392062)) lt!392064))))

(assert (=> b!252431 (= lt!392054 (reader!0 (_2!11779 lt!392050) (_2!11779 lt!392062)))))

(assert (= (and start!54102 res!211477) b!252419))

(assert (= (and b!252419 res!211480) b!252426))

(assert (= (and b!252426 res!211478) b!252428))

(assert (= (and b!252428 res!211484) b!252424))

(assert (= (and b!252424 res!211479) b!252429))

(assert (= (and b!252429 res!211476) b!252423))

(assert (= (and b!252423 res!211481) b!252430))

(assert (= (and b!252428 res!211483) b!252421))

(assert (= (and b!252421 res!211474) b!252422))

(assert (= (and b!252422 res!211482) b!252431))

(assert (= (and b!252428 res!211475) b!252418))

(assert (= (and b!252418 res!211485) b!252425))

(assert (= (and b!252428 res!211473) b!252427))

(assert (= start!54102 b!252420))

(declare-fun m!379779 () Bool)

(assert (=> b!252429 m!379779))

(declare-fun m!379781 () Bool)

(assert (=> b!252419 m!379781))

(declare-fun m!379783 () Bool)

(assert (=> b!252420 m!379783))

(declare-fun m!379785 () Bool)

(assert (=> b!252424 m!379785))

(declare-fun m!379787 () Bool)

(assert (=> b!252424 m!379787))

(declare-fun m!379789 () Bool)

(assert (=> b!252425 m!379789))

(declare-fun m!379791 () Bool)

(assert (=> b!252423 m!379791))

(assert (=> b!252423 m!379791))

(declare-fun m!379793 () Bool)

(assert (=> b!252423 m!379793))

(declare-fun m!379795 () Bool)

(assert (=> start!54102 m!379795))

(declare-fun m!379797 () Bool)

(assert (=> b!252431 m!379797))

(declare-fun m!379799 () Bool)

(assert (=> b!252431 m!379799))

(declare-fun m!379801 () Bool)

(assert (=> b!252431 m!379801))

(declare-fun m!379803 () Bool)

(assert (=> b!252431 m!379803))

(declare-fun m!379805 () Bool)

(assert (=> b!252428 m!379805))

(declare-fun m!379807 () Bool)

(assert (=> b!252428 m!379807))

(declare-fun m!379809 () Bool)

(assert (=> b!252428 m!379809))

(declare-fun m!379811 () Bool)

(assert (=> b!252428 m!379811))

(declare-fun m!379813 () Bool)

(assert (=> b!252428 m!379813))

(assert (=> b!252428 m!379803))

(declare-fun m!379815 () Bool)

(assert (=> b!252428 m!379815))

(declare-fun m!379817 () Bool)

(assert (=> b!252428 m!379817))

(declare-fun m!379819 () Bool)

(assert (=> b!252428 m!379819))

(declare-fun m!379821 () Bool)

(assert (=> b!252428 m!379821))

(declare-fun m!379823 () Bool)

(assert (=> b!252428 m!379823))

(declare-fun m!379825 () Bool)

(assert (=> b!252428 m!379825))

(declare-fun m!379827 () Bool)

(assert (=> b!252428 m!379827))

(declare-fun m!379829 () Bool)

(assert (=> b!252428 m!379829))

(declare-fun m!379831 () Bool)

(assert (=> b!252428 m!379831))

(declare-fun m!379833 () Bool)

(assert (=> b!252428 m!379833))

(declare-fun m!379835 () Bool)

(assert (=> b!252428 m!379835))

(declare-fun m!379837 () Bool)

(assert (=> b!252422 m!379837))

(declare-fun m!379839 () Bool)

(assert (=> b!252430 m!379839))

(declare-fun m!379841 () Bool)

(assert (=> b!252418 m!379841))

(declare-fun m!379843 () Bool)

(assert (=> b!252421 m!379843))

(assert (=> b!252421 m!379785))

(push 1)

(assert (not b!252430))

(assert (not b!252429))

(assert (not b!252418))

(assert (not b!252420))

(assert (not b!252419))

(assert (not start!54102))

(assert (not b!252428))

(assert (not b!252422))

(assert (not b!252421))

(assert (not b!252424))

(assert (not b!252431))

(assert (not b!252423))

(assert (not b!252425))

(check-sat)

